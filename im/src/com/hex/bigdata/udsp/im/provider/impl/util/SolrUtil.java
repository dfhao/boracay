package com.hex.bigdata.udsp.im.provider.impl.util;

import com.hex.bigdata.udsp.common.provider.model.Datasource;
import com.hex.bigdata.udsp.common.provider.model.Property;
import com.hex.bigdata.udsp.im.provider.model.Metadata;
import com.hex.bigdata.udsp.im.provider.model.MetadataCol;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.zookeeper.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

/**
 * Created by hj on 2017/9/11.
 */
public class SolrUtil {
    private static Logger logger = LogManager.getLogger(SolrUtil.class);
    /**
     * @param metadata
     * @throws KeeperException
     * @throws InterruptedException
     */
    public static void uploadSolrConfig(Metadata metadata) throws Exception {
        Datasource ds = metadata.getDatasource();
        Map<String, Property> propertyMap = ds.getPropertyMap();
        ZooKeeper zkClient = getZkClient(propertyMap.get("solr.url").getValue());
        upload(zkClient, getSolrConfigPath(), "/solr/configs", metadata.getTbName(), metadata.getMetadataCols());
    }

    /**
     * 获取zookeeper链接
     * @param zkConnectString
     * @return
     * @throws IOException
     */
    public static ZooKeeper getZkClient(String zkConnectString){
        ZooKeeper zkClient = null;
        try {
            zkClient = new ZooKeeper(zkConnectString, 20000, new Watcher() {
                @Override
                public void process(WatchedEvent event) {
                    //do nothing
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return zkClient;
    }

    /**
     * 上传配置文件
     * @param zkClient
     * @param filePath 配置文件路径
     * @param solrConfigPath 上传zookeeper的路径
     * @param configName 配置名称 collection1
     * @param  metadataCols
     * @throws KeeperException
     * @throws InterruptedException
     */
    public static void upload(ZooKeeper zkClient, String filePath, String solrConfigPath, String configName,  List<MetadataCol> metadataCols) throws Exception {
        File file = new File(filePath);
        if (file.isFile()) {
            byte[] bytes = "schema.xml".equals(file.getName()) ? setSchemaField(metadataCols) : readFileByBytes(file.getPath());
            String nodeCreated = zkClient.create(solrConfigPath+"/"+file.getName(), bytes, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
            return;
        }else{
            solrConfigPath += "/" + (configName!=null ? configName : file.getName());
            if(zkClient.exists(solrConfigPath, false)!=null){
                throw new Exception("该名称的配置文件已存在！");
            }
            zkClient.create(solrConfigPath, file.getName().getBytes(), ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
            File[] files = file.listFiles();
            for(File e : files){
                if(e.isDirectory()){
                    upload(zkClient, e.getPath(), solrConfigPath, null, metadataCols);
                }else{
                    byte[] bytes = "schema.xml".equals(e.getName()) ? setSchemaField(metadataCols) : readFileByBytes(e.getPath());
                    zkClient.create(solrConfigPath+"/"+e.getName(), bytes, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
                    continue;
                }
            }
        }
    }

    /**
     * 修改schema的
     * @param metadataCols
     * @return
     */
    public static byte[] setSchemaField(List<MetadataCol> metadataCols){
        URL url = ClassLoader.getSystemResource("goframe/im/SolrConfig/schema.xml");
        File file = new File(url.getPath());
        Document document = File2Doc(file);
        Element root = document.getRootElement();
//      Element fields=root.element("fields"); //todo schema  fields ?? 添加到了最后面  主键未作处理
        for(MetadataCol e:metadataCols){
            Element filed= DocumentHelper.createElement("field");
            filed.addAttribute("name", e.getName());
            filed.addAttribute("type", e.getType().getValue().toLowerCase()); //todo
            filed.addAttribute("indexed", e.isIndexed() ? "true" : "false");
            filed.addAttribute("stored", e.isStored() ? "true" : "false");
            root.add(filed);
        }
        return root.asXML().getBytes();
    }

    /**
     * 将给定文件的内容或者给定 URI 的内容解析为一个 XML 文档，并且返回一个新的 DOM Document 对象
     * @param file 文件
     * @return DOM的Document对象
     * @throws Exception
     */
    public static Document File2Doc(File file) {
        Document doc = null;
        try {
            SAXReader reader = new SAXReader();
            doc = reader.read(file);
            return doc;
        } catch (Exception e) {
            return null;
        }
    }

    public static byte[] readFileByBytes(String fileName) {
        InputStream in = null;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            in = new FileInputStream(fileName);
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = in.read(buf)) != -1) {
                out.write(buf, 0, length);
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e1) {
                }
            }
        }
        return out.toByteArray();
    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url 发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url;
            if(StringUtils.isNotEmpty(param))  {
                urlNameString  += "?" + param;
            }
            logger.info("solrUrlApi: "+urlNameString);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            logger.info("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    public static String getSolrConfigPath() {
        URL url = ClassLoader.getSystemResource("goframe/im/SolrConfig");
        return url.getPath();
    }

    /**
     * 删除solr配置
     * @param metadata
     * @throws InterruptedException
     * @throws KeeperException
     */
    public static void deleteZnode(Metadata metadata) throws Exception{
        Datasource ds = metadata.getDatasource();
        Map<String, Property> propertyMap = ds.getPropertyMap();
        ZooKeeper zkClient = getZkClient(propertyMap.get("solr.url").getValue());
        String path = "/solr/configs/"+metadata.getTbName();
        delPath(zkClient, path);
        zkClient.delete(path, -1);
    }


    public static void delPath(ZooKeeper zk,String path) throws Exception{
        List<String> paths=zk.getChildren(path, false);
        for (String p:paths){
            delPath(zk,path+"/"+p);
        }
        for(String p:paths){
            zk.delete(path+"/"+p, -1);
        }
    }
}
