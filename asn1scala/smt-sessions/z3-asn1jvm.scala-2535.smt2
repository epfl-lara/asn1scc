; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63978 () Bool)

(assert start!63978)

(declare-fun mapNonEmpty!1161 () Bool)

(declare-fun mapRes!1163 () Bool)

(declare-fun tp!1162 () Bool)

(declare-fun tp_is_empty!423 () Bool)

(assert (=> mapNonEmpty!1161 (= mapRes!1163 (and tp!1162 tp_is_empty!423))))

(declare-datatypes ((T!51309 0))(
  ( (T!51310 (val!211 Int)) )
))
(declare-datatypes ((array!16700 0))(
  ( (array!16701 (arr!8198 (Array (_ BitVec 32) T!51309)) (size!7202 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16700)

(declare-fun mapValue!1161 () T!51309)

(declare-fun mapRest!1162 () (Array (_ BitVec 32) T!51309))

(declare-fun mapKey!1162 () (_ BitVec 32))

(assert (=> mapNonEmpty!1161 (= (arr!8198 a2!623) (store mapRest!1162 mapKey!1162 mapValue!1161))))

(declare-fun b!284533 () Bool)

(declare-fun a1!623 () array!16700)

(declare-fun e!203389 () Bool)

(declare-fun a3!63 () array!16700)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1353 (array!16700 array!16700 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284533 (= e!203389 (not (arrayRangesEq!1353 a1!623 a3!63 from!749 from!749)))))

(declare-fun b!284534 () Bool)

(declare-fun res!235631 () Bool)

(assert (=> b!284534 (=> (not res!235631) (not e!203389))))

(declare-fun to!716 () (_ BitVec 32))

(assert (=> b!284534 (= res!235631 (arrayRangesEq!1353 a2!623 a3!63 from!749 to!716))))

(declare-fun b!284535 () Bool)

(declare-fun e!203391 () Bool)

(assert (=> b!284535 (= e!203391 (and tp_is_empty!423 mapRes!1163))))

(declare-fun condMapEmpty!1162 () Bool)

(declare-fun mapDefault!1163 () T!51309)

(assert (=> b!284535 (= condMapEmpty!1162 (= (arr!8198 a2!623) ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1163)))))

(declare-fun b!284536 () Bool)

(declare-fun e!203390 () Bool)

(declare-fun mapRes!1162 () Bool)

(assert (=> b!284536 (= e!203390 (and tp_is_empty!423 mapRes!1162))))

(declare-fun condMapEmpty!1163 () Bool)

(declare-fun mapDefault!1162 () T!51309)

(assert (=> b!284536 (= condMapEmpty!1163 (= (arr!8198 a3!63) ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1162)))))

(declare-fun b!284537 () Bool)

(declare-fun e!203388 () Bool)

(declare-fun mapRes!1161 () Bool)

(assert (=> b!284537 (= e!203388 (and tp_is_empty!423 mapRes!1161))))

(declare-fun condMapEmpty!1161 () Bool)

(declare-fun mapDefault!1161 () T!51309)

(assert (=> b!284537 (= condMapEmpty!1161 (= (arr!8198 a1!623) ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1161)))))

(declare-fun res!235630 () Bool)

(assert (=> start!63978 (=> (not res!235630) (not e!203389))))

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> start!63978 (= res!235630 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7202 a1!623) (size!7202 a2!623)) (bvsle (size!7202 a2!623) (size!7202 a3!63)) (bvsle mid!66 (size!7202 a1!623)) (bvsle to!716 (size!7202 a2!623))))))

(assert (=> start!63978 e!203389))

(declare-fun array_inv!6889 (array!16700) Bool)

(assert (=> start!63978 (and (array_inv!6889 a2!623) e!203391)))

(assert (=> start!63978 (and (array_inv!6889 a1!623) e!203388)))

(assert (=> start!63978 true))

(assert (=> start!63978 (and (array_inv!6889 a3!63) e!203390)))

(declare-fun mapIsEmpty!1161 () Bool)

(assert (=> mapIsEmpty!1161 mapRes!1161))

(declare-fun mapNonEmpty!1162 () Bool)

(declare-fun tp!1161 () Bool)

(assert (=> mapNonEmpty!1162 (= mapRes!1161 (and tp!1161 tp_is_empty!423))))

(declare-fun mapValue!1163 () T!51309)

(declare-fun mapRest!1163 () (Array (_ BitVec 32) T!51309))

(declare-fun mapKey!1161 () (_ BitVec 32))

(assert (=> mapNonEmpty!1162 (= (arr!8198 a1!623) (store mapRest!1163 mapKey!1161 mapValue!1163))))

(declare-fun mapIsEmpty!1162 () Bool)

(assert (=> mapIsEmpty!1162 mapRes!1163))

(declare-fun mapIsEmpty!1163 () Bool)

(assert (=> mapIsEmpty!1163 mapRes!1162))

(declare-fun mapNonEmpty!1163 () Bool)

(declare-fun tp!1163 () Bool)

(assert (=> mapNonEmpty!1163 (= mapRes!1162 (and tp!1163 tp_is_empty!423))))

(declare-fun mapRest!1161 () (Array (_ BitVec 32) T!51309))

(declare-fun mapKey!1163 () (_ BitVec 32))

(declare-fun mapValue!1162 () T!51309)

(assert (=> mapNonEmpty!1163 (= (arr!8198 a3!63) (store mapRest!1161 mapKey!1163 mapValue!1162))))

(declare-fun b!284538 () Bool)

(declare-fun res!235629 () Bool)

(assert (=> b!284538 (=> (not res!235629) (not e!203389))))

(assert (=> b!284538 (= res!235629 (arrayRangesEq!1353 a1!623 a2!623 from!749 mid!66))))

(assert (= (and start!63978 res!235630) b!284538))

(assert (= (and b!284538 res!235629) b!284534))

(assert (= (and b!284534 res!235631) b!284533))

(assert (= (and b!284535 condMapEmpty!1162) mapIsEmpty!1162))

(assert (= (and b!284535 (not condMapEmpty!1162)) mapNonEmpty!1161))

(assert (= start!63978 b!284535))

(assert (= (and b!284537 condMapEmpty!1161) mapIsEmpty!1161))

(assert (= (and b!284537 (not condMapEmpty!1161)) mapNonEmpty!1162))

(assert (= start!63978 b!284537))

(assert (= (and b!284536 condMapEmpty!1163) mapIsEmpty!1163))

(assert (= (and b!284536 (not condMapEmpty!1163)) mapNonEmpty!1163))

(assert (= start!63978 b!284536))

(declare-fun m!417693 () Bool)

(assert (=> mapNonEmpty!1162 m!417693))

(declare-fun m!417695 () Bool)

(assert (=> b!284538 m!417695))

(declare-fun m!417697 () Bool)

(assert (=> b!284533 m!417697))

(declare-fun m!417699 () Bool)

(assert (=> mapNonEmpty!1163 m!417699))

(declare-fun m!417701 () Bool)

(assert (=> mapNonEmpty!1161 m!417701))

(declare-fun m!417703 () Bool)

(assert (=> start!63978 m!417703))

(declare-fun m!417705 () Bool)

(assert (=> start!63978 m!417705))

(declare-fun m!417707 () Bool)

(assert (=> start!63978 m!417707))

(declare-fun m!417709 () Bool)

(assert (=> b!284534 m!417709))

(check-sat (not b!284533) tp_is_empty!423 (not b!284538) (not b!284534) (not start!63978) (not mapNonEmpty!1163) (not mapNonEmpty!1162) (not mapNonEmpty!1161))
(check-sat)
(get-model)

(declare-fun d!97920 () Bool)

(declare-fun res!235645 () Bool)

(declare-fun e!203408 () Bool)

(assert (=> d!97920 (=> res!235645 e!203408)))

(assert (=> d!97920 (= res!235645 (= from!749 from!749))))

(assert (=> d!97920 (= (arrayRangesEq!1353 a1!623 a3!63 from!749 from!749) e!203408)))

(declare-fun b!284561 () Bool)

(declare-fun e!203409 () Bool)

(assert (=> b!284561 (= e!203408 e!203409)))

(declare-fun res!235646 () Bool)

(assert (=> b!284561 (=> (not res!235646) (not e!203409))))

(assert (=> b!284561 (= res!235646 (= (select (arr!8198 a1!623) from!749) (select (arr!8198 a3!63) from!749)))))

(declare-fun b!284562 () Bool)

(assert (=> b!284562 (= e!203409 (arrayRangesEq!1353 a1!623 a3!63 (bvadd from!749 #b00000000000000000000000000000001) from!749))))

(assert (= (and d!97920 (not res!235645)) b!284561))

(assert (= (and b!284561 res!235646) b!284562))

(declare-fun m!417729 () Bool)

(assert (=> b!284561 m!417729))

(declare-fun m!417731 () Bool)

(assert (=> b!284561 m!417731))

(declare-fun m!417733 () Bool)

(assert (=> b!284562 m!417733))

(assert (=> b!284533 d!97920))

(declare-fun d!97922 () Bool)

(assert (=> d!97922 (= (array_inv!6889 a2!623) (bvsge (size!7202 a2!623) #b00000000000000000000000000000000))))

(assert (=> start!63978 d!97922))

(declare-fun d!97924 () Bool)

(assert (=> d!97924 (= (array_inv!6889 a1!623) (bvsge (size!7202 a1!623) #b00000000000000000000000000000000))))

(assert (=> start!63978 d!97924))

(declare-fun d!97926 () Bool)

(assert (=> d!97926 (= (array_inv!6889 a3!63) (bvsge (size!7202 a3!63) #b00000000000000000000000000000000))))

(assert (=> start!63978 d!97926))

(declare-fun d!97928 () Bool)

(declare-fun res!235647 () Bool)

(declare-fun e!203410 () Bool)

(assert (=> d!97928 (=> res!235647 e!203410)))

(assert (=> d!97928 (= res!235647 (= from!749 mid!66))))

(assert (=> d!97928 (= (arrayRangesEq!1353 a1!623 a2!623 from!749 mid!66) e!203410)))

(declare-fun b!284563 () Bool)

(declare-fun e!203411 () Bool)

(assert (=> b!284563 (= e!203410 e!203411)))

(declare-fun res!235648 () Bool)

(assert (=> b!284563 (=> (not res!235648) (not e!203411))))

(assert (=> b!284563 (= res!235648 (= (select (arr!8198 a1!623) from!749) (select (arr!8198 a2!623) from!749)))))

(declare-fun b!284564 () Bool)

(assert (=> b!284564 (= e!203411 (arrayRangesEq!1353 a1!623 a2!623 (bvadd from!749 #b00000000000000000000000000000001) mid!66))))

(assert (= (and d!97928 (not res!235647)) b!284563))

(assert (= (and b!284563 res!235648) b!284564))

(assert (=> b!284563 m!417729))

(declare-fun m!417735 () Bool)

(assert (=> b!284563 m!417735))

(declare-fun m!417737 () Bool)

(assert (=> b!284564 m!417737))

(assert (=> b!284538 d!97928))

(declare-fun d!97930 () Bool)

(declare-fun res!235649 () Bool)

(declare-fun e!203412 () Bool)

(assert (=> d!97930 (=> res!235649 e!203412)))

(assert (=> d!97930 (= res!235649 (= from!749 to!716))))

(assert (=> d!97930 (= (arrayRangesEq!1353 a2!623 a3!63 from!749 to!716) e!203412)))

(declare-fun b!284565 () Bool)

(declare-fun e!203413 () Bool)

(assert (=> b!284565 (= e!203412 e!203413)))

(declare-fun res!235650 () Bool)

(assert (=> b!284565 (=> (not res!235650) (not e!203413))))

(assert (=> b!284565 (= res!235650 (= (select (arr!8198 a2!623) from!749) (select (arr!8198 a3!63) from!749)))))

(declare-fun b!284566 () Bool)

(assert (=> b!284566 (= e!203413 (arrayRangesEq!1353 a2!623 a3!63 (bvadd from!749 #b00000000000000000000000000000001) to!716))))

(assert (= (and d!97930 (not res!235649)) b!284565))

(assert (= (and b!284565 res!235650) b!284566))

(assert (=> b!284565 m!417735))

(assert (=> b!284565 m!417731))

(declare-fun m!417739 () Bool)

(assert (=> b!284566 m!417739))

(assert (=> b!284534 d!97930))

(declare-fun condMapEmpty!1175 () Bool)

(declare-fun mapDefault!1175 () T!51309)

(assert (=> mapNonEmpty!1162 (= condMapEmpty!1175 (= mapRest!1163 ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1175)))))

(declare-fun mapRes!1175 () Bool)

(assert (=> mapNonEmpty!1162 (= tp!1161 (and tp_is_empty!423 mapRes!1175))))

(declare-fun mapIsEmpty!1175 () Bool)

(assert (=> mapIsEmpty!1175 mapRes!1175))

(declare-fun mapNonEmpty!1175 () Bool)

(declare-fun tp!1175 () Bool)

(assert (=> mapNonEmpty!1175 (= mapRes!1175 (and tp!1175 tp_is_empty!423))))

(declare-fun mapKey!1175 () (_ BitVec 32))

(declare-fun mapValue!1175 () T!51309)

(declare-fun mapRest!1175 () (Array (_ BitVec 32) T!51309))

(assert (=> mapNonEmpty!1175 (= mapRest!1163 (store mapRest!1175 mapKey!1175 mapValue!1175))))

(assert (= (and mapNonEmpty!1162 condMapEmpty!1175) mapIsEmpty!1175))

(assert (= (and mapNonEmpty!1162 (not condMapEmpty!1175)) mapNonEmpty!1175))

(declare-fun m!417741 () Bool)

(assert (=> mapNonEmpty!1175 m!417741))

(declare-fun condMapEmpty!1176 () Bool)

(declare-fun mapDefault!1176 () T!51309)

(assert (=> mapNonEmpty!1161 (= condMapEmpty!1176 (= mapRest!1162 ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1176)))))

(declare-fun mapRes!1176 () Bool)

(assert (=> mapNonEmpty!1161 (= tp!1162 (and tp_is_empty!423 mapRes!1176))))

(declare-fun mapIsEmpty!1176 () Bool)

(assert (=> mapIsEmpty!1176 mapRes!1176))

(declare-fun mapNonEmpty!1176 () Bool)

(declare-fun tp!1176 () Bool)

(assert (=> mapNonEmpty!1176 (= mapRes!1176 (and tp!1176 tp_is_empty!423))))

(declare-fun mapValue!1176 () T!51309)

(declare-fun mapRest!1176 () (Array (_ BitVec 32) T!51309))

(declare-fun mapKey!1176 () (_ BitVec 32))

(assert (=> mapNonEmpty!1176 (= mapRest!1162 (store mapRest!1176 mapKey!1176 mapValue!1176))))

(assert (= (and mapNonEmpty!1161 condMapEmpty!1176) mapIsEmpty!1176))

(assert (= (and mapNonEmpty!1161 (not condMapEmpty!1176)) mapNonEmpty!1176))

(declare-fun m!417743 () Bool)

(assert (=> mapNonEmpty!1176 m!417743))

(declare-fun condMapEmpty!1177 () Bool)

(declare-fun mapDefault!1177 () T!51309)

(assert (=> mapNonEmpty!1163 (= condMapEmpty!1177 (= mapRest!1161 ((as const (Array (_ BitVec 32) T!51309)) mapDefault!1177)))))

(declare-fun mapRes!1177 () Bool)

(assert (=> mapNonEmpty!1163 (= tp!1163 (and tp_is_empty!423 mapRes!1177))))

(declare-fun mapIsEmpty!1177 () Bool)

(assert (=> mapIsEmpty!1177 mapRes!1177))

(declare-fun mapNonEmpty!1177 () Bool)

(declare-fun tp!1177 () Bool)

(assert (=> mapNonEmpty!1177 (= mapRes!1177 (and tp!1177 tp_is_empty!423))))

(declare-fun mapValue!1177 () T!51309)

(declare-fun mapRest!1177 () (Array (_ BitVec 32) T!51309))

(declare-fun mapKey!1177 () (_ BitVec 32))

(assert (=> mapNonEmpty!1177 (= mapRest!1161 (store mapRest!1177 mapKey!1177 mapValue!1177))))

(assert (= (and mapNonEmpty!1163 condMapEmpty!1177) mapIsEmpty!1177))

(assert (= (and mapNonEmpty!1163 (not condMapEmpty!1177)) mapNonEmpty!1177))

(declare-fun m!417745 () Bool)

(assert (=> mapNonEmpty!1177 m!417745))

(check-sat (not b!284566) (not mapNonEmpty!1175) tp_is_empty!423 (not b!284564) (not mapNonEmpty!1176) (not mapNonEmpty!1177) (not b!284562))
(check-sat)
