; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68634 () Bool)

(assert start!68634)

(declare-fun b!309368 () Bool)

(declare-fun res!253773 () Bool)

(declare-fun e!222495 () Bool)

(assert (=> b!309368 (=> (not res!253773) (not e!222495))))

(declare-datatypes ((T!58135 0))(
  ( (T!58136 (val!454 Int)) )
))
(declare-datatypes ((array!18774 0))(
  ( (array!18775 (arr!9224 (Array (_ BitVec 32) T!58135)) (size!8141 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18774)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun a1!524 () array!18774)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1753 (array!18774 array!18774 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309368 (= res!253773 (arrayRangesEq!1753 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309369 () Bool)

(declare-fun res!253770 () Bool)

(assert (=> b!309369 (=> (not res!253770) (not e!222495))))

(declare-fun e!222493 () Bool)

(assert (=> b!309369 (= res!253770 e!222493)))

(declare-fun res!253768 () Bool)

(assert (=> b!309369 (=> res!253768 e!222493)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309369 (= res!253768 (bvsgt i!932 toSlice!46))))

(declare-fun b!309370 () Bool)

(declare-fun res!253775 () Bool)

(declare-fun e!222492 () Bool)

(assert (=> b!309370 (=> res!253775 e!222492)))

(assert (=> b!309370 (= res!253775 (not (arrayRangesEq!1753 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!309371 () Bool)

(declare-fun res!253769 () Bool)

(assert (=> b!309371 (=> res!253769 e!222492)))

(assert (=> b!309371 (= res!253769 (bvsgt (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!309372 () Bool)

(declare-fun res!253774 () Bool)

(assert (=> b!309372 (=> (not res!253774) (not e!222495))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309372 (= res!253774 (not (= i!932 fromSlice!46)))))

(declare-fun b!309373 () Bool)

(assert (=> b!309373 (= e!222495 (not e!222492))))

(declare-fun res!253771 () Bool)

(assert (=> b!309373 (=> res!253771 e!222492)))

(assert (=> b!309373 (= res!253771 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(assert (=> b!309373 (= (select (arr!9224 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9224 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21485 0))(
  ( (Unit!21486) )
))
(declare-fun lt!440385 () Unit!21485)

(declare-fun arrayRangesEqImpliesEq!313 (array!18774 array!18774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21485)

(assert (=> b!309373 (= lt!440385 (arrayRangesEqImpliesEq!313 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309374 () Bool)

(declare-fun e!222491 () Bool)

(declare-fun tp_is_empty!909 () Bool)

(declare-fun mapRes!2896 () Bool)

(assert (=> b!309374 (= e!222491 (and tp_is_empty!909 mapRes!2896))))

(declare-fun condMapEmpty!2896 () Bool)

(declare-fun mapDefault!2895 () T!58135)

(assert (=> b!309374 (= condMapEmpty!2896 (= (arr!9224 a1!524) ((as const (Array (_ BitVec 32) T!58135)) mapDefault!2895)))))

(declare-fun b!309375 () Bool)

(declare-fun res!253767 () Bool)

(assert (=> b!309375 (=> (not res!253767) (not e!222495))))

(assert (=> b!309375 (= res!253767 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!309376 () Bool)

(assert (=> b!309376 (= e!222493 (arrayRangesEq!1753 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309377 () Bool)

(declare-fun res!253766 () Bool)

(assert (=> b!309377 (=> (not res!253766) (not e!222495))))

(assert (=> b!309377 (= res!253766 (arrayRangesEq!1753 a1!524 a2!524 i!932 to!617))))

(declare-fun mapNonEmpty!2895 () Bool)

(declare-fun mapRes!2895 () Bool)

(declare-fun tp!2895 () Bool)

(assert (=> mapNonEmpty!2895 (= mapRes!2895 (and tp!2895 tp_is_empty!909))))

(declare-fun mapKey!2896 () (_ BitVec 32))

(declare-fun mapRest!2896 () (Array (_ BitVec 32) T!58135))

(declare-fun mapValue!2896 () T!58135)

(assert (=> mapNonEmpty!2895 (= (arr!9224 a2!524) (store mapRest!2896 mapKey!2896 mapValue!2896))))

(declare-fun mapIsEmpty!2895 () Bool)

(assert (=> mapIsEmpty!2895 mapRes!2895))

(declare-fun b!309378 () Bool)

(assert (=> b!309378 (= e!222492 (arrayRangesEq!1753 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun mapNonEmpty!2896 () Bool)

(declare-fun tp!2896 () Bool)

(assert (=> mapNonEmpty!2896 (= mapRes!2896 (and tp!2896 tp_is_empty!909))))

(declare-fun mapKey!2895 () (_ BitVec 32))

(declare-fun mapRest!2895 () (Array (_ BitVec 32) T!58135))

(declare-fun mapValue!2895 () T!58135)

(assert (=> mapNonEmpty!2896 (= (arr!9224 a1!524) (store mapRest!2895 mapKey!2895 mapValue!2895))))

(declare-fun res!253772 () Bool)

(assert (=> start!68634 (=> (not res!253772) (not e!222495))))

(assert (=> start!68634 (= res!253772 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8141 a1!524) (size!8141 a2!524)) (bvsle to!617 (size!8141 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68634 e!222495))

(assert (=> start!68634 true))

(declare-fun e!222494 () Bool)

(declare-fun array_inv!7720 (array!18774) Bool)

(assert (=> start!68634 (and (array_inv!7720 a2!524) e!222494)))

(assert (=> start!68634 (and (array_inv!7720 a1!524) e!222491)))

(declare-fun b!309379 () Bool)

(assert (=> b!309379 (= e!222494 (and tp_is_empty!909 mapRes!2895))))

(declare-fun condMapEmpty!2895 () Bool)

(declare-fun mapDefault!2896 () T!58135)

(assert (=> b!309379 (= condMapEmpty!2895 (= (arr!9224 a2!524) ((as const (Array (_ BitVec 32) T!58135)) mapDefault!2896)))))

(declare-fun mapIsEmpty!2896 () Bool)

(assert (=> mapIsEmpty!2896 mapRes!2896))

(assert (= (and start!68634 res!253772) b!309368))

(assert (= (and b!309368 res!253773) b!309375))

(assert (= (and b!309375 res!253767) b!309377))

(assert (= (and b!309377 res!253766) b!309369))

(assert (= (and b!309369 (not res!253768)) b!309376))

(assert (= (and b!309369 res!253770) b!309372))

(assert (= (and b!309372 res!253774) b!309373))

(assert (= (and b!309373 (not res!253771)) b!309370))

(assert (= (and b!309370 (not res!253775)) b!309371))

(assert (= (and b!309371 (not res!253769)) b!309378))

(assert (= (and b!309379 condMapEmpty!2895) mapIsEmpty!2895))

(assert (= (and b!309379 (not condMapEmpty!2895)) mapNonEmpty!2895))

(assert (= start!68634 b!309379))

(assert (= (and b!309374 condMapEmpty!2896) mapIsEmpty!2896))

(assert (= (and b!309374 (not condMapEmpty!2896)) mapNonEmpty!2896))

(assert (= start!68634 b!309374))

(declare-fun m!447379 () Bool)

(assert (=> b!309368 m!447379))

(declare-fun m!447381 () Bool)

(assert (=> b!309378 m!447381))

(declare-fun m!447383 () Bool)

(assert (=> b!309373 m!447383))

(declare-fun m!447385 () Bool)

(assert (=> b!309373 m!447385))

(declare-fun m!447387 () Bool)

(assert (=> b!309373 m!447387))

(declare-fun m!447389 () Bool)

(assert (=> start!68634 m!447389))

(declare-fun m!447391 () Bool)

(assert (=> start!68634 m!447391))

(declare-fun m!447393 () Bool)

(assert (=> b!309370 m!447393))

(declare-fun m!447395 () Bool)

(assert (=> mapNonEmpty!2896 m!447395))

(declare-fun m!447397 () Bool)

(assert (=> mapNonEmpty!2895 m!447397))

(declare-fun m!447399 () Bool)

(assert (=> b!309377 m!447399))

(declare-fun m!447401 () Bool)

(assert (=> b!309376 m!447401))

(check-sat tp_is_empty!909 (not b!309373) (not b!309378) (not b!309377) (not b!309376) (not b!309368) (not mapNonEmpty!2896) (not b!309370) (not start!68634) (not mapNonEmpty!2895))
(check-sat)
(get-model)

(declare-fun d!102704 () Bool)

(declare-fun res!253810 () Bool)

(declare-fun e!222515 () Bool)

(assert (=> d!102704 (=> res!253810 e!222515)))

(assert (=> d!102704 (= res!253810 (= (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(assert (=> d!102704 (= (arrayRangesEq!1753 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46) e!222515)))

(declare-fun b!309420 () Bool)

(declare-fun e!222516 () Bool)

(assert (=> b!309420 (= e!222515 e!222516)))

(declare-fun res!253811 () Bool)

(assert (=> b!309420 (=> (not res!253811) (not e!222516))))

(assert (=> b!309420 (= res!253811 (= (select (arr!9224 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9224 a2!524) (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun b!309421 () Bool)

(assert (=> b!309421 (= e!222516 (arrayRangesEq!1753 a1!524 a2!524 (bvadd (bvsub i!932 #b00000000000000000000000000000001) #b00000000000000000000000000000001) toSlice!46))))

(assert (= (and d!102704 (not res!253810)) b!309420))

(assert (= (and b!309420 res!253811) b!309421))

(assert (=> b!309420 m!447383))

(assert (=> b!309420 m!447385))

(declare-fun m!447427 () Bool)

(assert (=> b!309421 m!447427))

(assert (=> b!309378 d!102704))

(declare-fun d!102706 () Bool)

(assert (=> d!102706 (and (bvsge (bvsub i!932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub i!932 #b00000000000000000000000000000001) (size!8141 a1!524)) (bvslt (bvsub i!932 #b00000000000000000000000000000001) (size!8141 a2!524)) (= (select (arr!9224 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9224 a2!524) (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun lt!440391 () Unit!21485)

(declare-fun choose!651 (array!18774 array!18774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21485)

(assert (=> d!102706 (= lt!440391 (choose!651 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(assert (=> d!102706 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617))))

(assert (=> d!102706 (= (arrayRangesEqImpliesEq!313 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617) lt!440391)))

(declare-fun bs!26533 () Bool)

(assert (= bs!26533 d!102706))

(assert (=> bs!26533 m!447383))

(assert (=> bs!26533 m!447385))

(declare-fun m!447429 () Bool)

(assert (=> bs!26533 m!447429))

(assert (=> b!309373 d!102706))

(declare-fun d!102708 () Bool)

(declare-fun res!253812 () Bool)

(declare-fun e!222517 () Bool)

(assert (=> d!102708 (=> res!253812 e!222517)))

(assert (=> d!102708 (= res!253812 (= from!650 to!617))))

(assert (=> d!102708 (= (arrayRangesEq!1753 a1!524 a2!524 from!650 to!617) e!222517)))

(declare-fun b!309422 () Bool)

(declare-fun e!222518 () Bool)

(assert (=> b!309422 (= e!222517 e!222518)))

(declare-fun res!253813 () Bool)

(assert (=> b!309422 (=> (not res!253813) (not e!222518))))

(assert (=> b!309422 (= res!253813 (= (select (arr!9224 a1!524) from!650) (select (arr!9224 a2!524) from!650)))))

(declare-fun b!309423 () Bool)

(assert (=> b!309423 (= e!222518 (arrayRangesEq!1753 a1!524 a2!524 (bvadd from!650 #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102708 (not res!253812)) b!309422))

(assert (= (and b!309422 res!253813) b!309423))

(declare-fun m!447431 () Bool)

(assert (=> b!309422 m!447431))

(declare-fun m!447433 () Bool)

(assert (=> b!309422 m!447433))

(declare-fun m!447435 () Bool)

(assert (=> b!309423 m!447435))

(assert (=> b!309368 d!102708))

(declare-fun d!102710 () Bool)

(declare-fun res!253814 () Bool)

(declare-fun e!222519 () Bool)

(assert (=> d!102710 (=> res!253814 e!222519)))

(assert (=> d!102710 (= res!253814 (= i!932 to!617))))

(assert (=> d!102710 (= (arrayRangesEq!1753 a1!524 a2!524 i!932 to!617) e!222519)))

(declare-fun b!309424 () Bool)

(declare-fun e!222520 () Bool)

(assert (=> b!309424 (= e!222519 e!222520)))

(declare-fun res!253815 () Bool)

(assert (=> b!309424 (=> (not res!253815) (not e!222520))))

(assert (=> b!309424 (= res!253815 (= (select (arr!9224 a1!524) i!932) (select (arr!9224 a2!524) i!932)))))

(declare-fun b!309425 () Bool)

(assert (=> b!309425 (= e!222520 (arrayRangesEq!1753 a1!524 a2!524 (bvadd i!932 #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102710 (not res!253814)) b!309424))

(assert (= (and b!309424 res!253815) b!309425))

(declare-fun m!447437 () Bool)

(assert (=> b!309424 m!447437))

(declare-fun m!447439 () Bool)

(assert (=> b!309424 m!447439))

(declare-fun m!447441 () Bool)

(assert (=> b!309425 m!447441))

(assert (=> b!309377 d!102710))

(declare-fun d!102712 () Bool)

(assert (=> d!102712 (= (array_inv!7720 a2!524) (bvsge (size!8141 a2!524) #b00000000000000000000000000000000))))

(assert (=> start!68634 d!102712))

(declare-fun d!102714 () Bool)

(assert (=> d!102714 (= (array_inv!7720 a1!524) (bvsge (size!8141 a1!524) #b00000000000000000000000000000000))))

(assert (=> start!68634 d!102714))

(declare-fun d!102716 () Bool)

(declare-fun res!253816 () Bool)

(declare-fun e!222521 () Bool)

(assert (=> d!102716 (=> res!253816 e!222521)))

(assert (=> d!102716 (= res!253816 (= i!932 toSlice!46))))

(assert (=> d!102716 (= (arrayRangesEq!1753 a1!524 a2!524 i!932 toSlice!46) e!222521)))

(declare-fun b!309426 () Bool)

(declare-fun e!222522 () Bool)

(assert (=> b!309426 (= e!222521 e!222522)))

(declare-fun res!253817 () Bool)

(assert (=> b!309426 (=> (not res!253817) (not e!222522))))

(assert (=> b!309426 (= res!253817 (= (select (arr!9224 a1!524) i!932) (select (arr!9224 a2!524) i!932)))))

(declare-fun b!309427 () Bool)

(assert (=> b!309427 (= e!222522 (arrayRangesEq!1753 a1!524 a2!524 (bvadd i!932 #b00000000000000000000000000000001) toSlice!46))))

(assert (= (and d!102716 (not res!253816)) b!309426))

(assert (= (and b!309426 res!253817) b!309427))

(assert (=> b!309426 m!447437))

(assert (=> b!309426 m!447439))

(declare-fun m!447443 () Bool)

(assert (=> b!309427 m!447443))

(assert (=> b!309376 d!102716))

(declare-fun d!102718 () Bool)

(declare-fun res!253818 () Bool)

(declare-fun e!222523 () Bool)

(assert (=> d!102718 (=> res!253818 e!222523)))

(assert (=> d!102718 (= res!253818 (= (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(assert (=> d!102718 (= (arrayRangesEq!1753 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617) e!222523)))

(declare-fun b!309428 () Bool)

(declare-fun e!222524 () Bool)

(assert (=> b!309428 (= e!222523 e!222524)))

(declare-fun res!253819 () Bool)

(assert (=> b!309428 (=> (not res!253819) (not e!222524))))

(assert (=> b!309428 (= res!253819 (= (select (arr!9224 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9224 a2!524) (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun b!309429 () Bool)

(assert (=> b!309429 (= e!222524 (arrayRangesEq!1753 a1!524 a2!524 (bvadd (bvsub i!932 #b00000000000000000000000000000001) #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102718 (not res!253818)) b!309428))

(assert (= (and b!309428 res!253819) b!309429))

(assert (=> b!309428 m!447383))

(assert (=> b!309428 m!447385))

(declare-fun m!447445 () Bool)

(assert (=> b!309429 m!447445))

(assert (=> b!309370 d!102718))

(declare-fun condMapEmpty!2905 () Bool)

(declare-fun mapDefault!2905 () T!58135)

(assert (=> mapNonEmpty!2895 (= condMapEmpty!2905 (= mapRest!2896 ((as const (Array (_ BitVec 32) T!58135)) mapDefault!2905)))))

(declare-fun mapRes!2905 () Bool)

(assert (=> mapNonEmpty!2895 (= tp!2895 (and tp_is_empty!909 mapRes!2905))))

(declare-fun mapIsEmpty!2905 () Bool)

(assert (=> mapIsEmpty!2905 mapRes!2905))

(declare-fun mapNonEmpty!2905 () Bool)

(declare-fun tp!2905 () Bool)

(assert (=> mapNonEmpty!2905 (= mapRes!2905 (and tp!2905 tp_is_empty!909))))

(declare-fun mapRest!2905 () (Array (_ BitVec 32) T!58135))

(declare-fun mapValue!2905 () T!58135)

(declare-fun mapKey!2905 () (_ BitVec 32))

(assert (=> mapNonEmpty!2905 (= mapRest!2896 (store mapRest!2905 mapKey!2905 mapValue!2905))))

(assert (= (and mapNonEmpty!2895 condMapEmpty!2905) mapIsEmpty!2905))

(assert (= (and mapNonEmpty!2895 (not condMapEmpty!2905)) mapNonEmpty!2905))

(declare-fun m!447447 () Bool)

(assert (=> mapNonEmpty!2905 m!447447))

(declare-fun condMapEmpty!2906 () Bool)

(declare-fun mapDefault!2906 () T!58135)

(assert (=> mapNonEmpty!2896 (= condMapEmpty!2906 (= mapRest!2895 ((as const (Array (_ BitVec 32) T!58135)) mapDefault!2906)))))

(declare-fun mapRes!2906 () Bool)

(assert (=> mapNonEmpty!2896 (= tp!2896 (and tp_is_empty!909 mapRes!2906))))

(declare-fun mapIsEmpty!2906 () Bool)

(assert (=> mapIsEmpty!2906 mapRes!2906))

(declare-fun mapNonEmpty!2906 () Bool)

(declare-fun tp!2906 () Bool)

(assert (=> mapNonEmpty!2906 (= mapRes!2906 (and tp!2906 tp_is_empty!909))))

(declare-fun mapKey!2906 () (_ BitVec 32))

(declare-fun mapRest!2906 () (Array (_ BitVec 32) T!58135))

(declare-fun mapValue!2906 () T!58135)

(assert (=> mapNonEmpty!2906 (= mapRest!2895 (store mapRest!2906 mapKey!2906 mapValue!2906))))

(assert (= (and mapNonEmpty!2896 condMapEmpty!2906) mapIsEmpty!2906))

(assert (= (and mapNonEmpty!2896 (not condMapEmpty!2906)) mapNonEmpty!2906))

(declare-fun m!447449 () Bool)

(assert (=> mapNonEmpty!2906 m!447449))

(check-sat (not d!102706) tp_is_empty!909 (not b!309427) (not b!309429) (not b!309425) (not mapNonEmpty!2906) (not mapNonEmpty!2905) (not b!309423) (not b!309421))
(check-sat)
