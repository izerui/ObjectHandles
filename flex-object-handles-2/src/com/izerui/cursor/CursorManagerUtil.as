package com.izerui.cursor
{
	import com.roguedevelopment.objecthandles.HandleDescription;
	import com.roguedevelopment.objecthandles.IHandle;
	
	import flash.events.MouseEvent;
	
	import mx.managers.CursorManager;

	public class CursorManagerUtil
	{
		/**
		 * 当前鼠标样式
		 */
		protected static var currentCursor:MouseCursorDetails = null;
		
		public static function setCursor(event:MouseEvent):void{
/**		    5 --------9
 			|    1   |
 			|4      8|
 			|        |
 			|    2   |
			6 -------10
*/
			if(event.buttonDown){
				return;
			}
			var objectHandlesMouseCursors:ObjectHandlesMouseCursors = new ObjectHandlesMouseCursors;
			var cursorDetail:MouseCursorDetails;
			if(event.target is IHandle){//缩放组件上面
				var td:HandleDescription = IHandle(event.target).handleDescriptor;
				if(td.role==1||td.role==2){
					cursorDetail = objectHandlesMouseCursors.getCursor("SizeNS");
				}else if(td.role==4||td.role==8){
					cursorDetail = objectHandlesMouseCursors.getCursor("SizeWE");
				}else if(td.role==5||td.role==10){
					cursorDetail = objectHandlesMouseCursors.getCursor("SizeNWSE");
				}else if(td.role==6||td.role==9){
					cursorDetail = objectHandlesMouseCursors.getCursor("SizeNESW");
				}
				if(cursorDetail&&currentCursor!=cursorDetail){
					CursorManager.setCursor(cursorDetail.cursor,2,cursorDetail.offset.x,cursorDetail.offset.y);
					currentCursor = cursorDetail;
				}
				event.preventDefault();
			}else{
				cursorDetail = objectHandlesMouseCursors.getCursor("SizeAll");
				CursorManager.setCursor(cursorDetail.cursor,2,cursorDetail.offset.x,cursorDetail.offset.y);
			}
		}
		public static function removeAllCursors(event:MouseEvent):void{
			if(event.buttonDown){
				return;
			}
			CursorManager.removeAllCursors();
		}
	}
}