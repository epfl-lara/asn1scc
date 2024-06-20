; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63240 () Bool)

(assert start!63240)

(declare-fun b!283485 () Bool)

(declare-fun res!234992 () Bool)

(declare-fun e!202364 () Bool)

(assert (=> b!283485 (=> (not res!234992) (not e!202364))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283485 (= res!234992 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun mapIsEmpty!1026 () Bool)

(declare-fun mapRes!1026 () Bool)

(assert (=> mapIsEmpty!1026 mapRes!1026))

(declare-fun mapIsEmpty!1027 () Bool)

(declare-fun mapRes!1027 () Bool)

(assert (=> mapIsEmpty!1027 mapRes!1027))

(declare-fun mapNonEmpty!1026 () Bool)

(declare-fun tp!1027 () Bool)

(declare-fun tp_is_empty!393 () Bool)

(assert (=> mapNonEmpty!1026 (= mapRes!1027 (and tp!1027 tp_is_empty!393))))

(declare-fun mapKey!1026 () (_ BitVec 32))

(declare-datatypes ((T!50519 0))(
  ( (T!50520 (val!196 Int)) )
))
(declare-fun mapRest!1026 () (Array (_ BitVec 32) T!50519))

(declare-fun mapValue!1026 () T!50519)

(declare-datatypes ((array!16428 0))(
  ( (array!16429 (arr!8093 (Array (_ BitVec 32) T!50519)) (size!7097 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16428)

(assert (=> mapNonEmpty!1026 (= (arr!8093 a2!471) (store mapRest!1026 mapKey!1026 mapValue!1026))))

(declare-fun b!283486 () Bool)

(declare-fun res!234993 () Bool)

(assert (=> b!283486 (=> (not res!234993) (not e!202364))))

(declare-fun a1!471 () array!16428)

(declare-fun arrayRangesEq!1344 (array!16428 array!16428 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283486 (= res!234993 (arrayRangesEq!1344 a2!471 a1!471 i!913 to!564))))

(declare-fun mapNonEmpty!1027 () Bool)

(declare-fun tp!1026 () Bool)

(assert (=> mapNonEmpty!1027 (= mapRes!1026 (and tp!1026 tp_is_empty!393))))

(declare-fun mapRest!1027 () (Array (_ BitVec 32) T!50519))

(declare-fun mapKey!1027 () (_ BitVec 32))

(declare-fun mapValue!1027 () T!50519)

(assert (=> mapNonEmpty!1027 (= (arr!8093 a1!471) (store mapRest!1027 mapKey!1027 mapValue!1027))))

(declare-fun b!283488 () Bool)

(declare-fun res!234990 () Bool)

(assert (=> b!283488 (=> (not res!234990) (not e!202364))))

(assert (=> b!283488 (= res!234990 (not (= i!913 from!597)))))

(declare-fun b!283489 () Bool)

(assert (=> b!283489 (= e!202364 (not (arrayRangesEq!1344 a2!471 a1!471 from!597 to!564)))))

(declare-datatypes ((Unit!19844 0))(
  ( (Unit!19845) )
))
(declare-fun lt!417926 () Unit!19844)

(declare-fun rec!57 (array!16428 array!16428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19844)

(assert (=> b!283489 (= lt!417926 (rec!57 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!283489 (= (select (arr!8093 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8093 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417927 () Unit!19844)

(declare-fun arrayRangesEqImpliesEq!197 (array!16428 array!16428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19844)

(assert (=> b!283489 (= lt!417927 (arrayRangesEqImpliesEq!197 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun b!283490 () Bool)

(declare-fun e!202362 () Bool)

(assert (=> b!283490 (= e!202362 (and tp_is_empty!393 mapRes!1026))))

(declare-fun condMapEmpty!1027 () Bool)

(declare-fun mapDefault!1026 () T!50519)

(assert (=> b!283490 (= condMapEmpty!1027 (= (arr!8093 a1!471) ((as const (Array (_ BitVec 32) T!50519)) mapDefault!1026)))))

(declare-fun b!283491 () Bool)

(declare-fun res!234991 () Bool)

(assert (=> b!283491 (=> (not res!234991) (not e!202364))))

(assert (=> b!283491 (= res!234991 (arrayRangesEq!1344 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283487 () Bool)

(declare-fun e!202363 () Bool)

(assert (=> b!283487 (= e!202363 (and tp_is_empty!393 mapRes!1027))))

(declare-fun condMapEmpty!1026 () Bool)

(declare-fun mapDefault!1027 () T!50519)

(assert (=> b!283487 (= condMapEmpty!1026 (= (arr!8093 a2!471) ((as const (Array (_ BitVec 32) T!50519)) mapDefault!1027)))))

(declare-fun res!234994 () Bool)

(assert (=> start!63240 (=> (not res!234994) (not e!202364))))

(assert (=> start!63240 (= res!234994 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7097 a1!471)) (= (size!7097 a1!471) (size!7097 a2!471))))))

(assert (=> start!63240 e!202364))

(declare-fun array_inv!6791 (array!16428) Bool)

(assert (=> start!63240 (and (array_inv!6791 a1!471) e!202362)))

(assert (=> start!63240 true))

(assert (=> start!63240 (and (array_inv!6791 a2!471) e!202363)))

(assert (= (and start!63240 res!234994) b!283491))

(assert (= (and b!283491 res!234991) b!283485))

(assert (= (and b!283485 res!234992) b!283486))

(assert (= (and b!283486 res!234993) b!283488))

(assert (= (and b!283488 res!234990) b!283489))

(assert (= (and b!283490 condMapEmpty!1027) mapIsEmpty!1026))

(assert (= (and b!283490 (not condMapEmpty!1027)) mapNonEmpty!1027))

(assert (= start!63240 b!283490))

(assert (= (and b!283487 condMapEmpty!1026) mapIsEmpty!1027))

(assert (= (and b!283487 (not condMapEmpty!1026)) mapNonEmpty!1026))

(assert (= start!63240 b!283487))

(declare-fun m!416481 () Bool)

(assert (=> b!283489 m!416481))

(declare-fun m!416483 () Bool)

(assert (=> b!283489 m!416483))

(declare-fun m!416485 () Bool)

(assert (=> b!283489 m!416485))

(declare-fun m!416487 () Bool)

(assert (=> b!283489 m!416487))

(declare-fun m!416489 () Bool)

(assert (=> b!283489 m!416489))

(declare-fun m!416491 () Bool)

(assert (=> b!283486 m!416491))

(declare-fun m!416493 () Bool)

(assert (=> start!63240 m!416493))

(declare-fun m!416495 () Bool)

(assert (=> start!63240 m!416495))

(declare-fun m!416497 () Bool)

(assert (=> mapNonEmpty!1026 m!416497))

(declare-fun m!416499 () Bool)

(assert (=> mapNonEmpty!1027 m!416499))

(declare-fun m!416501 () Bool)

(assert (=> b!283491 m!416501))

(check-sat (not start!63240) (not b!283489) tp_is_empty!393 (not mapNonEmpty!1027) (not mapNonEmpty!1026) (not b!283486) (not b!283491))
(check-sat)
(get-model)

(declare-fun d!97246 () Bool)

(declare-fun res!235014 () Bool)

(declare-fun e!202378 () Bool)

(assert (=> d!97246 (=> res!235014 e!202378)))

(assert (=> d!97246 (= res!235014 (= from!597 to!564))))

(assert (=> d!97246 (= (arrayRangesEq!1344 a1!471 a2!471 from!597 to!564) e!202378)))

(declare-fun b!283517 () Bool)

(declare-fun e!202379 () Bool)

(assert (=> b!283517 (= e!202378 e!202379)))

(declare-fun res!235015 () Bool)

(assert (=> b!283517 (=> (not res!235015) (not e!202379))))

(assert (=> b!283517 (= res!235015 (= (select (arr!8093 a1!471) from!597) (select (arr!8093 a2!471) from!597)))))

(declare-fun b!283518 () Bool)

(assert (=> b!283518 (= e!202379 (arrayRangesEq!1344 a1!471 a2!471 (bvadd from!597 #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97246 (not res!235014)) b!283517))

(assert (= (and b!283517 res!235015) b!283518))

(declare-fun m!416525 () Bool)

(assert (=> b!283517 m!416525))

(declare-fun m!416527 () Bool)

(assert (=> b!283517 m!416527))

(declare-fun m!416529 () Bool)

(assert (=> b!283518 m!416529))

(assert (=> b!283491 d!97246))

(declare-fun d!97248 () Bool)

(assert (=> d!97248 (= (array_inv!6791 a1!471) (bvsge (size!7097 a1!471) #b00000000000000000000000000000000))))

(assert (=> start!63240 d!97248))

(declare-fun d!97250 () Bool)

(assert (=> d!97250 (= (array_inv!6791 a2!471) (bvsge (size!7097 a2!471) #b00000000000000000000000000000000))))

(assert (=> start!63240 d!97250))

(declare-fun d!97252 () Bool)

(declare-fun res!235016 () Bool)

(declare-fun e!202380 () Bool)

(assert (=> d!97252 (=> res!235016 e!202380)))

(assert (=> d!97252 (= res!235016 (= i!913 to!564))))

(assert (=> d!97252 (= (arrayRangesEq!1344 a2!471 a1!471 i!913 to!564) e!202380)))

(declare-fun b!283519 () Bool)

(declare-fun e!202381 () Bool)

(assert (=> b!283519 (= e!202380 e!202381)))

(declare-fun res!235017 () Bool)

(assert (=> b!283519 (=> (not res!235017) (not e!202381))))

(assert (=> b!283519 (= res!235017 (= (select (arr!8093 a2!471) i!913) (select (arr!8093 a1!471) i!913)))))

(declare-fun b!283520 () Bool)

(assert (=> b!283520 (= e!202381 (arrayRangesEq!1344 a2!471 a1!471 (bvadd i!913 #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97252 (not res!235016)) b!283519))

(assert (= (and b!283519 res!235017) b!283520))

(declare-fun m!416531 () Bool)

(assert (=> b!283519 m!416531))

(declare-fun m!416533 () Bool)

(assert (=> b!283519 m!416533))

(declare-fun m!416535 () Bool)

(assert (=> b!283520 m!416535))

(assert (=> b!283486 d!97252))

(declare-fun d!97254 () Bool)

(declare-fun res!235018 () Bool)

(declare-fun e!202382 () Bool)

(assert (=> d!97254 (=> res!235018 e!202382)))

(assert (=> d!97254 (= res!235018 (= from!597 to!564))))

(assert (=> d!97254 (= (arrayRangesEq!1344 a2!471 a1!471 from!597 to!564) e!202382)))

(declare-fun b!283521 () Bool)

(declare-fun e!202383 () Bool)

(assert (=> b!283521 (= e!202382 e!202383)))

(declare-fun res!235019 () Bool)

(assert (=> b!283521 (=> (not res!235019) (not e!202383))))

(assert (=> b!283521 (= res!235019 (= (select (arr!8093 a2!471) from!597) (select (arr!8093 a1!471) from!597)))))

(declare-fun b!283522 () Bool)

(assert (=> b!283522 (= e!202383 (arrayRangesEq!1344 a2!471 a1!471 (bvadd from!597 #b00000000000000000000000000000001) to!564))))

(assert (= (and d!97254 (not res!235018)) b!283521))

(assert (= (and b!283521 res!235019) b!283522))

(assert (=> b!283521 m!416527))

(assert (=> b!283521 m!416525))

(declare-fun m!416537 () Bool)

(assert (=> b!283522 m!416537))

(assert (=> b!283489 d!97254))

(declare-fun d!97256 () Bool)

(assert (=> d!97256 (arrayRangesEq!1344 a2!471 a1!471 from!597 to!564)))

(declare-fun lt!417944 () Unit!19844)

(declare-fun e!202386 () Unit!19844)

(assert (=> d!97256 (= lt!417944 e!202386)))

(declare-fun c!13242 () Bool)

(assert (=> d!97256 (= c!13242 (= (bvsub i!913 #b00000000000000000000000000000001) from!597))))

(assert (=> d!97256 (and (bvsle from!597 (bvsub i!913 #b00000000000000000000000000000001)) (bvsle (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(assert (=> d!97256 (= (rec!57 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)) lt!417944)))

(declare-fun b!283527 () Bool)

(declare-fun Unit!19846 () Unit!19844)

(assert (=> b!283527 (= e!202386 Unit!19846)))

(declare-fun b!283528 () Bool)

(assert (=> b!283528 (= e!202386 (rec!57 a1!471 a2!471 from!597 to!564 (bvsub (bvsub i!913 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!417945 () (_ BitVec 32))

(assert (=> b!283528 (= lt!417945 (bvsub (bvsub i!913 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!417943 () Unit!19844)

(assert (=> b!283528 (= lt!417943 (arrayRangesEqImpliesEq!197 a1!471 a2!471 from!597 lt!417945 to!564))))

(assert (=> b!283528 (= (select (arr!8093 a1!471) lt!417945) (select (arr!8093 a2!471) lt!417945))))

(declare-fun lt!417942 () Unit!19844)

(assert (=> b!283528 (= lt!417942 lt!417943)))

(assert (= (and d!97256 c!13242) b!283527))

(assert (= (and d!97256 (not c!13242)) b!283528))

(assert (=> d!97256 m!416481))

(declare-fun m!416539 () Bool)

(assert (=> b!283528 m!416539))

(declare-fun m!416541 () Bool)

(assert (=> b!283528 m!416541))

(declare-fun m!416543 () Bool)

(assert (=> b!283528 m!416543))

(declare-fun m!416545 () Bool)

(assert (=> b!283528 m!416545))

(assert (=> b!283489 d!97256))

(declare-fun d!97258 () Bool)

(assert (=> d!97258 (and (bvsge (bvsub i!913 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub i!913 #b00000000000000000000000000000001) (size!7097 a1!471)) (bvslt (bvsub i!913 #b00000000000000000000000000000001) (size!7097 a2!471)) (= (select (arr!8093 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8093 a2!471) (bvsub i!913 #b00000000000000000000000000000001))))))

(declare-fun lt!417948 () Unit!19844)

(declare-fun choose!514 (array!16428 array!16428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19844)

(assert (=> d!97258 (= lt!417948 (choose!514 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(assert (=> d!97258 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564))))

(assert (=> d!97258 (= (arrayRangesEqImpliesEq!197 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564) lt!417948)))

(declare-fun bs!24531 () Bool)

(assert (= bs!24531 d!97258))

(assert (=> bs!24531 m!416483))

(assert (=> bs!24531 m!416485))

(declare-fun m!416547 () Bool)

(assert (=> bs!24531 m!416547))

(assert (=> b!283489 d!97258))

(declare-fun condMapEmpty!1036 () Bool)

(declare-fun mapDefault!1036 () T!50519)

(assert (=> mapNonEmpty!1027 (= condMapEmpty!1036 (= mapRest!1027 ((as const (Array (_ BitVec 32) T!50519)) mapDefault!1036)))))

(declare-fun mapRes!1036 () Bool)

(assert (=> mapNonEmpty!1027 (= tp!1026 (and tp_is_empty!393 mapRes!1036))))

(declare-fun mapIsEmpty!1036 () Bool)

(assert (=> mapIsEmpty!1036 mapRes!1036))

(declare-fun mapNonEmpty!1036 () Bool)

(declare-fun tp!1036 () Bool)

(assert (=> mapNonEmpty!1036 (= mapRes!1036 (and tp!1036 tp_is_empty!393))))

(declare-fun mapValue!1036 () T!50519)

(declare-fun mapRest!1036 () (Array (_ BitVec 32) T!50519))

(declare-fun mapKey!1036 () (_ BitVec 32))

(assert (=> mapNonEmpty!1036 (= mapRest!1027 (store mapRest!1036 mapKey!1036 mapValue!1036))))

(assert (= (and mapNonEmpty!1027 condMapEmpty!1036) mapIsEmpty!1036))

(assert (= (and mapNonEmpty!1027 (not condMapEmpty!1036)) mapNonEmpty!1036))

(declare-fun m!416549 () Bool)

(assert (=> mapNonEmpty!1036 m!416549))

(declare-fun condMapEmpty!1037 () Bool)

(declare-fun mapDefault!1037 () T!50519)

(assert (=> mapNonEmpty!1026 (= condMapEmpty!1037 (= mapRest!1026 ((as const (Array (_ BitVec 32) T!50519)) mapDefault!1037)))))

(declare-fun mapRes!1037 () Bool)

(assert (=> mapNonEmpty!1026 (= tp!1027 (and tp_is_empty!393 mapRes!1037))))

(declare-fun mapIsEmpty!1037 () Bool)

(assert (=> mapIsEmpty!1037 mapRes!1037))

(declare-fun mapNonEmpty!1037 () Bool)

(declare-fun tp!1037 () Bool)

(assert (=> mapNonEmpty!1037 (= mapRes!1037 (and tp!1037 tp_is_empty!393))))

(declare-fun mapValue!1037 () T!50519)

(declare-fun mapRest!1037 () (Array (_ BitVec 32) T!50519))

(declare-fun mapKey!1037 () (_ BitVec 32))

(assert (=> mapNonEmpty!1037 (= mapRest!1026 (store mapRest!1037 mapKey!1037 mapValue!1037))))

(assert (= (and mapNonEmpty!1026 condMapEmpty!1037) mapIsEmpty!1037))

(assert (= (and mapNonEmpty!1026 (not condMapEmpty!1037)) mapNonEmpty!1037))

(declare-fun m!416551 () Bool)

(assert (=> mapNonEmpty!1037 m!416551))

(check-sat (not mapNonEmpty!1036) (not b!283528) (not b!283520) (not b!283518) (not b!283522) (not d!97258) tp_is_empty!393 (not d!97256) (not mapNonEmpty!1037))
(check-sat)
