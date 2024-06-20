; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64096 () Bool)

(assert start!64096)

(declare-fun mapIsEmpty!1679 () Bool)

(declare-fun mapRes!1679 () Bool)

(assert (=> mapIsEmpty!1679 mapRes!1679))

(declare-fun mapNonEmpty!1679 () Bool)

(declare-fun mapRes!1681 () Bool)

(declare-fun tp!1680 () Bool)

(declare-fun tp_is_empty!537 () Bool)

(assert (=> mapNonEmpty!1679 (= mapRes!1681 (and tp!1680 tp_is_empty!537))))

(declare-fun mapKey!1679 () (_ BitVec 32))

(declare-datatypes ((T!51803 0))(
  ( (T!51804 (val!268 Int)) )
))
(declare-fun mapRest!1681 () (Array (_ BitVec 32) T!51803))

(declare-fun mapValue!1679 () T!51803)

(declare-datatypes ((array!16815 0))(
  ( (array!16816 (arr!8255 (Array (_ BitVec 32) T!51803)) (size!7259 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16815)

(assert (=> mapNonEmpty!1679 (= (arr!8255 a3!68) (store mapRest!1681 mapKey!1679 mapValue!1679))))

(declare-fun b!286293 () Bool)

(declare-fun e!204109 () Bool)

(assert (=> b!286293 (= e!204109 (and tp_is_empty!537 mapRes!1681))))

(declare-fun condMapEmpty!1679 () Bool)

(declare-fun mapDefault!1681 () T!51803)

(assert (=> b!286293 (= condMapEmpty!1679 (= (arr!8255 a3!68) ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1681)))))

(declare-fun b!286294 () Bool)

(declare-fun res!236876 () Bool)

(declare-fun e!204110 () Bool)

(assert (=> b!286294 (=> (not res!236876) (not e!204110))))

(declare-fun a2!647 () array!16815)

(declare-fun a1!647 () array!16815)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun arrayRangesEq!1398 (array!16815 array!16815 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286294 (= res!236876 (arrayRangesEq!1398 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!286295 () Bool)

(declare-fun e!204112 () Bool)

(assert (=> b!286295 (= e!204112 (and tp_is_empty!537 mapRes!1679))))

(declare-fun condMapEmpty!1680 () Bool)

(declare-fun mapDefault!1679 () T!51803)

(assert (=> b!286295 (= condMapEmpty!1680 (= (arr!8255 a1!647) ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1679)))))

(declare-fun b!286296 () Bool)

(declare-fun e!204111 () Bool)

(declare-fun mapRes!1680 () Bool)

(assert (=> b!286296 (= e!204111 (and tp_is_empty!537 mapRes!1680))))

(declare-fun condMapEmpty!1681 () Bool)

(declare-fun mapDefault!1680 () T!51803)

(assert (=> b!286296 (= condMapEmpty!1681 (= (arr!8255 a2!647) ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1680)))))

(declare-fun res!236877 () Bool)

(assert (=> start!64096 (=> (not res!236877) (not e!204110))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64096 (= res!236877 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7259 a1!647) (size!7259 a2!647)) (bvsle (size!7259 a2!647) (size!7259 a3!68)) (bvsle mid!71 (size!7259 a1!647)) (bvsle to!740 (size!7259 a2!647))))))

(assert (=> start!64096 e!204110))

(declare-fun array_inv!6916 (array!16815) Bool)

(assert (=> start!64096 (and (array_inv!6916 a2!647) e!204111)))

(assert (=> start!64096 true))

(assert (=> start!64096 (and (array_inv!6916 a1!647) e!204112)))

(assert (=> start!64096 (and (array_inv!6916 a3!68) e!204109)))

(declare-fun mapIsEmpty!1680 () Bool)

(assert (=> mapIsEmpty!1680 mapRes!1681))

(declare-fun b!286297 () Bool)

(declare-fun res!236879 () Bool)

(assert (=> b!286297 (=> (not res!236879) (not e!204110))))

(assert (=> b!286297 (= res!236879 (arrayRangesEq!1398 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286298 () Bool)

(assert (=> b!286298 (= e!204110 (and (not (= i!964 mid!71)) (bvsle (size!7259 a1!647) (size!7259 a3!68)) (bvslt i!964 (size!7259 a1!647)) (not (= (select (arr!8255 a1!647) i!964) (select (arr!8255 a3!68) i!964)))))))

(declare-fun b!286299 () Bool)

(declare-fun res!236880 () Bool)

(assert (=> b!286299 (=> (not res!236880) (not e!204110))))

(assert (=> b!286299 (= res!236880 (arrayRangesEq!1398 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1680 () Bool)

(declare-fun tp!1681 () Bool)

(assert (=> mapNonEmpty!1680 (= mapRes!1679 (and tp!1681 tp_is_empty!537))))

(declare-fun mapKey!1681 () (_ BitVec 32))

(declare-fun mapRest!1679 () (Array (_ BitVec 32) T!51803))

(declare-fun mapValue!1680 () T!51803)

(assert (=> mapNonEmpty!1680 (= (arr!8255 a1!647) (store mapRest!1679 mapKey!1681 mapValue!1680))))

(declare-fun b!286300 () Bool)

(declare-fun res!236874 () Bool)

(assert (=> b!286300 (=> (not res!236874) (not e!204110))))

(assert (=> b!286300 (= res!236874 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286301 () Bool)

(declare-fun res!236875 () Bool)

(assert (=> b!286301 (=> (not res!236875) (not e!204110))))

(assert (=> b!286301 (= res!236875 (arrayRangesEq!1398 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1681 () Bool)

(assert (=> mapIsEmpty!1681 mapRes!1680))

(declare-fun mapNonEmpty!1681 () Bool)

(declare-fun tp!1679 () Bool)

(assert (=> mapNonEmpty!1681 (= mapRes!1680 (and tp!1679 tp_is_empty!537))))

(declare-fun mapKey!1680 () (_ BitVec 32))

(declare-fun mapValue!1681 () T!51803)

(declare-fun mapRest!1680 () (Array (_ BitVec 32) T!51803))

(assert (=> mapNonEmpty!1681 (= (arr!8255 a2!647) (store mapRest!1680 mapKey!1680 mapValue!1681))))

(declare-fun b!286302 () Bool)

(declare-fun res!236878 () Bool)

(assert (=> b!286302 (=> (not res!236878) (not e!204110))))

(assert (=> b!286302 (= res!236878 (arrayRangesEq!1398 a1!647 a2!647 from!773 mid!71))))

(assert (= (and start!64096 res!236877) b!286302))

(assert (= (and b!286302 res!236878) b!286299))

(assert (= (and b!286299 res!236880) b!286300))

(assert (= (and b!286300 res!236874) b!286294))

(assert (= (and b!286294 res!236876) b!286297))

(assert (= (and b!286297 res!236879) b!286301))

(assert (= (and b!286301 res!236875) b!286298))

(assert (= (and b!286296 condMapEmpty!1681) mapIsEmpty!1681))

(assert (= (and b!286296 (not condMapEmpty!1681)) mapNonEmpty!1681))

(assert (= start!64096 b!286296))

(assert (= (and b!286295 condMapEmpty!1680) mapIsEmpty!1679))

(assert (= (and b!286295 (not condMapEmpty!1680)) mapNonEmpty!1680))

(assert (= start!64096 b!286295))

(assert (= (and b!286293 condMapEmpty!1679) mapIsEmpty!1680))

(assert (= (and b!286293 (not condMapEmpty!1679)) mapNonEmpty!1679))

(assert (= start!64096 b!286293))

(declare-fun m!419081 () Bool)

(assert (=> mapNonEmpty!1681 m!419081))

(declare-fun m!419083 () Bool)

(assert (=> start!64096 m!419083))

(declare-fun m!419085 () Bool)

(assert (=> start!64096 m!419085))

(declare-fun m!419087 () Bool)

(assert (=> start!64096 m!419087))

(declare-fun m!419089 () Bool)

(assert (=> b!286302 m!419089))

(declare-fun m!419091 () Bool)

(assert (=> b!286294 m!419091))

(declare-fun m!419093 () Bool)

(assert (=> b!286298 m!419093))

(declare-fun m!419095 () Bool)

(assert (=> b!286298 m!419095))

(declare-fun m!419097 () Bool)

(assert (=> b!286297 m!419097))

(declare-fun m!419099 () Bool)

(assert (=> b!286301 m!419099))

(declare-fun m!419101 () Bool)

(assert (=> mapNonEmpty!1679 m!419101))

(declare-fun m!419103 () Bool)

(assert (=> mapNonEmpty!1680 m!419103))

(declare-fun m!419105 () Bool)

(assert (=> b!286299 m!419105))

(check-sat (not b!286301) (not mapNonEmpty!1679) (not mapNonEmpty!1680) (not b!286294) (not start!64096) (not mapNonEmpty!1681) (not b!286297) (not b!286302) tp_is_empty!537 (not b!286299))
(check-sat)
(get-model)

(declare-fun d!97970 () Bool)

(declare-fun res!236906 () Bool)

(declare-fun e!204129 () Bool)

(assert (=> d!97970 (=> res!236906 e!204129)))

(assert (=> d!97970 (= res!236906 (= from!773 to!740))))

(assert (=> d!97970 (= (arrayRangesEq!1398 a2!647 a3!68 from!773 to!740) e!204129)))

(declare-fun b!286337 () Bool)

(declare-fun e!204130 () Bool)

(assert (=> b!286337 (= e!204129 e!204130)))

(declare-fun res!236907 () Bool)

(assert (=> b!286337 (=> (not res!236907) (not e!204130))))

(assert (=> b!286337 (= res!236907 (= (select (arr!8255 a2!647) from!773) (select (arr!8255 a3!68) from!773)))))

(declare-fun b!286338 () Bool)

(assert (=> b!286338 (= e!204130 (arrayRangesEq!1398 a2!647 a3!68 (bvadd from!773 #b00000000000000000000000000000001) to!740))))

(assert (= (and d!97970 (not res!236906)) b!286337))

(assert (= (and b!286337 res!236907) b!286338))

(declare-fun m!419133 () Bool)

(assert (=> b!286337 m!419133))

(declare-fun m!419135 () Bool)

(assert (=> b!286337 m!419135))

(declare-fun m!419137 () Bool)

(assert (=> b!286338 m!419137))

(assert (=> b!286299 d!97970))

(declare-fun d!97972 () Bool)

(declare-fun res!236908 () Bool)

(declare-fun e!204131 () Bool)

(assert (=> d!97972 (=> res!236908 e!204131)))

(assert (=> d!97972 (= res!236908 (= i!964 mid!71))))

(assert (=> d!97972 (= (arrayRangesEq!1398 a1!647 a2!647 i!964 mid!71) e!204131)))

(declare-fun b!286339 () Bool)

(declare-fun e!204132 () Bool)

(assert (=> b!286339 (= e!204131 e!204132)))

(declare-fun res!236909 () Bool)

(assert (=> b!286339 (=> (not res!236909) (not e!204132))))

(assert (=> b!286339 (= res!236909 (= (select (arr!8255 a1!647) i!964) (select (arr!8255 a2!647) i!964)))))

(declare-fun b!286340 () Bool)

(assert (=> b!286340 (= e!204132 (arrayRangesEq!1398 a1!647 a2!647 (bvadd i!964 #b00000000000000000000000000000001) mid!71))))

(assert (= (and d!97972 (not res!236908)) b!286339))

(assert (= (and b!286339 res!236909) b!286340))

(assert (=> b!286339 m!419093))

(declare-fun m!419139 () Bool)

(assert (=> b!286339 m!419139))

(declare-fun m!419141 () Bool)

(assert (=> b!286340 m!419141))

(assert (=> b!286294 d!97972))

(declare-fun d!97974 () Bool)

(declare-fun res!236910 () Bool)

(declare-fun e!204133 () Bool)

(assert (=> d!97974 (=> res!236910 e!204133)))

(assert (=> d!97974 (= res!236910 (= from!773 mid!71))))

(assert (=> d!97974 (= (arrayRangesEq!1398 a1!647 a2!647 from!773 mid!71) e!204133)))

(declare-fun b!286341 () Bool)

(declare-fun e!204134 () Bool)

(assert (=> b!286341 (= e!204133 e!204134)))

(declare-fun res!236911 () Bool)

(assert (=> b!286341 (=> (not res!236911) (not e!204134))))

(assert (=> b!286341 (= res!236911 (= (select (arr!8255 a1!647) from!773) (select (arr!8255 a2!647) from!773)))))

(declare-fun b!286342 () Bool)

(assert (=> b!286342 (= e!204134 (arrayRangesEq!1398 a1!647 a2!647 (bvadd from!773 #b00000000000000000000000000000001) mid!71))))

(assert (= (and d!97974 (not res!236910)) b!286341))

(assert (= (and b!286341 res!236911) b!286342))

(declare-fun m!419143 () Bool)

(assert (=> b!286341 m!419143))

(assert (=> b!286341 m!419133))

(declare-fun m!419145 () Bool)

(assert (=> b!286342 m!419145))

(assert (=> b!286302 d!97974))

(declare-fun d!97976 () Bool)

(declare-fun res!236912 () Bool)

(declare-fun e!204135 () Bool)

(assert (=> d!97976 (=> res!236912 e!204135)))

(assert (=> d!97976 (= res!236912 (= from!773 i!964))))

(assert (=> d!97976 (= (arrayRangesEq!1398 a1!647 a3!68 from!773 i!964) e!204135)))

(declare-fun b!286343 () Bool)

(declare-fun e!204136 () Bool)

(assert (=> b!286343 (= e!204135 e!204136)))

(declare-fun res!236913 () Bool)

(assert (=> b!286343 (=> (not res!236913) (not e!204136))))

(assert (=> b!286343 (= res!236913 (= (select (arr!8255 a1!647) from!773) (select (arr!8255 a3!68) from!773)))))

(declare-fun b!286344 () Bool)

(assert (=> b!286344 (= e!204136 (arrayRangesEq!1398 a1!647 a3!68 (bvadd from!773 #b00000000000000000000000000000001) i!964))))

(assert (= (and d!97976 (not res!236912)) b!286343))

(assert (= (and b!286343 res!236913) b!286344))

(assert (=> b!286343 m!419143))

(assert (=> b!286343 m!419135))

(declare-fun m!419147 () Bool)

(assert (=> b!286344 m!419147))

(assert (=> b!286301 d!97976))

(declare-fun d!97978 () Bool)

(assert (=> d!97978 (= (array_inv!6916 a2!647) (bvsge (size!7259 a2!647) #b00000000000000000000000000000000))))

(assert (=> start!64096 d!97978))

(declare-fun d!97980 () Bool)

(assert (=> d!97980 (= (array_inv!6916 a1!647) (bvsge (size!7259 a1!647) #b00000000000000000000000000000000))))

(assert (=> start!64096 d!97980))

(declare-fun d!97982 () Bool)

(assert (=> d!97982 (= (array_inv!6916 a3!68) (bvsge (size!7259 a3!68) #b00000000000000000000000000000000))))

(assert (=> start!64096 d!97982))

(declare-fun d!97984 () Bool)

(declare-fun res!236914 () Bool)

(declare-fun e!204137 () Bool)

(assert (=> d!97984 (=> res!236914 e!204137)))

(assert (=> d!97984 (= res!236914 (= i!964 to!740))))

(assert (=> d!97984 (= (arrayRangesEq!1398 a2!647 a3!68 i!964 to!740) e!204137)))

(declare-fun b!286345 () Bool)

(declare-fun e!204138 () Bool)

(assert (=> b!286345 (= e!204137 e!204138)))

(declare-fun res!236915 () Bool)

(assert (=> b!286345 (=> (not res!236915) (not e!204138))))

(assert (=> b!286345 (= res!236915 (= (select (arr!8255 a2!647) i!964) (select (arr!8255 a3!68) i!964)))))

(declare-fun b!286346 () Bool)

(assert (=> b!286346 (= e!204138 (arrayRangesEq!1398 a2!647 a3!68 (bvadd i!964 #b00000000000000000000000000000001) to!740))))

(assert (= (and d!97984 (not res!236914)) b!286345))

(assert (= (and b!286345 res!236915) b!286346))

(assert (=> b!286345 m!419139))

(assert (=> b!286345 m!419095))

(declare-fun m!419149 () Bool)

(assert (=> b!286346 m!419149))

(assert (=> b!286297 d!97984))

(declare-fun condMapEmpty!1693 () Bool)

(declare-fun mapDefault!1693 () T!51803)

(assert (=> mapNonEmpty!1681 (= condMapEmpty!1693 (= mapRest!1680 ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1693)))))

(declare-fun mapRes!1693 () Bool)

(assert (=> mapNonEmpty!1681 (= tp!1679 (and tp_is_empty!537 mapRes!1693))))

(declare-fun mapIsEmpty!1693 () Bool)

(assert (=> mapIsEmpty!1693 mapRes!1693))

(declare-fun mapNonEmpty!1693 () Bool)

(declare-fun tp!1693 () Bool)

(assert (=> mapNonEmpty!1693 (= mapRes!1693 (and tp!1693 tp_is_empty!537))))

(declare-fun mapKey!1693 () (_ BitVec 32))

(declare-fun mapValue!1693 () T!51803)

(declare-fun mapRest!1693 () (Array (_ BitVec 32) T!51803))

(assert (=> mapNonEmpty!1693 (= mapRest!1680 (store mapRest!1693 mapKey!1693 mapValue!1693))))

(assert (= (and mapNonEmpty!1681 condMapEmpty!1693) mapIsEmpty!1693))

(assert (= (and mapNonEmpty!1681 (not condMapEmpty!1693)) mapNonEmpty!1693))

(declare-fun m!419151 () Bool)

(assert (=> mapNonEmpty!1693 m!419151))

(declare-fun condMapEmpty!1694 () Bool)

(declare-fun mapDefault!1694 () T!51803)

(assert (=> mapNonEmpty!1680 (= condMapEmpty!1694 (= mapRest!1679 ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1694)))))

(declare-fun mapRes!1694 () Bool)

(assert (=> mapNonEmpty!1680 (= tp!1681 (and tp_is_empty!537 mapRes!1694))))

(declare-fun mapIsEmpty!1694 () Bool)

(assert (=> mapIsEmpty!1694 mapRes!1694))

(declare-fun mapNonEmpty!1694 () Bool)

(declare-fun tp!1694 () Bool)

(assert (=> mapNonEmpty!1694 (= mapRes!1694 (and tp!1694 tp_is_empty!537))))

(declare-fun mapValue!1694 () T!51803)

(declare-fun mapRest!1694 () (Array (_ BitVec 32) T!51803))

(declare-fun mapKey!1694 () (_ BitVec 32))

(assert (=> mapNonEmpty!1694 (= mapRest!1679 (store mapRest!1694 mapKey!1694 mapValue!1694))))

(assert (= (and mapNonEmpty!1680 condMapEmpty!1694) mapIsEmpty!1694))

(assert (= (and mapNonEmpty!1680 (not condMapEmpty!1694)) mapNonEmpty!1694))

(declare-fun m!419153 () Bool)

(assert (=> mapNonEmpty!1694 m!419153))

(declare-fun condMapEmpty!1695 () Bool)

(declare-fun mapDefault!1695 () T!51803)

(assert (=> mapNonEmpty!1679 (= condMapEmpty!1695 (= mapRest!1681 ((as const (Array (_ BitVec 32) T!51803)) mapDefault!1695)))))

(declare-fun mapRes!1695 () Bool)

(assert (=> mapNonEmpty!1679 (= tp!1680 (and tp_is_empty!537 mapRes!1695))))

(declare-fun mapIsEmpty!1695 () Bool)

(assert (=> mapIsEmpty!1695 mapRes!1695))

(declare-fun mapNonEmpty!1695 () Bool)

(declare-fun tp!1695 () Bool)

(assert (=> mapNonEmpty!1695 (= mapRes!1695 (and tp!1695 tp_is_empty!537))))

(declare-fun mapValue!1695 () T!51803)

(declare-fun mapKey!1695 () (_ BitVec 32))

(declare-fun mapRest!1695 () (Array (_ BitVec 32) T!51803))

(assert (=> mapNonEmpty!1695 (= mapRest!1681 (store mapRest!1695 mapKey!1695 mapValue!1695))))

(assert (= (and mapNonEmpty!1679 condMapEmpty!1695) mapIsEmpty!1695))

(assert (= (and mapNonEmpty!1679 (not condMapEmpty!1695)) mapNonEmpty!1695))

(declare-fun m!419155 () Bool)

(assert (=> mapNonEmpty!1695 m!419155))

(check-sat (not b!286344) (not mapNonEmpty!1695) (not b!286338) tp_is_empty!537 (not b!286340) (not b!286346) (not b!286342) (not mapNonEmpty!1694) (not mapNonEmpty!1693))
(check-sat)
