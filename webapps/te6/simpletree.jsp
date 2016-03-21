<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://beehive.apache.org/netui/tags-html-1.0" prefix="netui"%><head>
        <title>SimpleTree</title>
        <netui:base/>
    </head>
    <netui:body>
        <netui:tree dataSource="pageFlow.simpleTree" selectionAction="postback" tagId="tree">
            <netui:treeItem expanded="true">
                <netui:treeLabel>
<netui:html>
    0</netui:treeLabel>
                <netui:treeItem>
                    <netui:treeLabel>0.0</netui:treeLabel>
                </netui:treeItem>
                <netui:treeItem>0.1</netui:treeItem>
                <netui:treeItem>0.2</netui:treeItem>
            </netui:treeItem>
        </netui:tree>
    </netui:body>
</netui:html>

