; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68498 () Bool)

(assert start!68498)

(declare-fun b!307698 () Bool)

(declare-fun res!252480 () Bool)

(declare-fun e!221689 () Bool)

(assert (=> b!307698 (=> (not res!252480) (not e!221689))))

(declare-fun from!632 () (_ BitVec 32))

(declare-datatypes ((T!57589 0))(
  ( (T!57590 (val!391 Int)) )
))
(declare-datatypes ((array!18646 0))(
  ( (array!18647 (arr!9161 (Array (_ BitVec 32) T!57589)) (size!8078 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18646)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18646)

(declare-fun arrayRangesEq!1703 (array!18646 array!18646 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307698 (= res!252480 (arrayRangesEq!1703 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307699 () Bool)

(declare-fun e!221687 () Bool)

(declare-fun tp_is_empty!783 () Bool)

(declare-fun mapRes!2509 () Bool)

(assert (=> b!307699 (= e!221687 (and tp_is_empty!783 mapRes!2509))))

(declare-fun condMapEmpty!2510 () Bool)

(declare-fun mapDefault!2509 () T!57589)

(assert (=> b!307699 (= condMapEmpty!2510 (= (arr!9161 a1!506) ((as const (Array (_ BitVec 32) T!57589)) mapDefault!2509)))))

(declare-fun res!252479 () Bool)

(assert (=> start!68498 (=> (not res!252479) (not e!221689))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun toSlice!41 () (_ BitVec 32))

(assert (=> start!68498 (= res!252479 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8078 a1!506) (size!8078 a2!506)) (bvsle to!599 (size!8078 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68498 e!221689))

(assert (=> start!68498 true))

(declare-fun array_inv!7684 (array!18646) Bool)

(assert (=> start!68498 (and (array_inv!7684 a1!506) e!221687)))

(declare-fun e!221688 () Bool)

(assert (=> start!68498 (and (array_inv!7684 a2!506) e!221688)))

(declare-fun mapIsEmpty!2509 () Bool)

(declare-fun mapRes!2510 () Bool)

(assert (=> mapIsEmpty!2509 mapRes!2510))

(declare-fun mapNonEmpty!2509 () Bool)

(declare-fun tp!2509 () Bool)

(assert (=> mapNonEmpty!2509 (= mapRes!2509 (and tp!2509 tp_is_empty!783))))

(declare-fun mapValue!2509 () T!57589)

(declare-fun mapRest!2509 () (Array (_ BitVec 32) T!57589))

(declare-fun mapKey!2509 () (_ BitVec 32))

(assert (=> mapNonEmpty!2509 (= (arr!9161 a1!506) (store mapRest!2509 mapKey!2509 mapValue!2509))))

(declare-fun mapIsEmpty!2510 () Bool)

(assert (=> mapIsEmpty!2510 mapRes!2509))

(declare-fun mapNonEmpty!2510 () Bool)

(declare-fun tp!2510 () Bool)

(assert (=> mapNonEmpty!2510 (= mapRes!2510 (and tp!2510 tp_is_empty!783))))

(declare-fun mapRest!2510 () (Array (_ BitVec 32) T!57589))

(declare-fun mapKey!2510 () (_ BitVec 32))

(declare-fun mapValue!2510 () T!57589)

(assert (=> mapNonEmpty!2510 (= (arr!9161 a2!506) (store mapRest!2510 mapKey!2510 mapValue!2510))))

(declare-fun b!307700 () Bool)

(declare-fun res!252478 () Bool)

(assert (=> b!307700 (=> (not res!252478) (not e!221689))))

(assert (=> b!307700 (= res!252478 (bvsle fromSlice!41 to!599))))

(declare-fun b!307701 () Bool)

(assert (=> b!307701 (= e!221689 (not (arrayRangesEq!1703 a1!506 a2!506 to!599 to!599)))))

(declare-fun b!307702 () Bool)

(assert (=> b!307702 (= e!221688 (and tp_is_empty!783 mapRes!2510))))

(declare-fun condMapEmpty!2509 () Bool)

(declare-fun mapDefault!2510 () T!57589)

(assert (=> b!307702 (= condMapEmpty!2509 (= (arr!9161 a2!506) ((as const (Array (_ BitVec 32) T!57589)) mapDefault!2510)))))

(assert (= (and start!68498 res!252479) b!307698))

(assert (= (and b!307698 res!252480) b!307700))

(assert (= (and b!307700 res!252478) b!307701))

(assert (= (and b!307699 condMapEmpty!2510) mapIsEmpty!2510))

(assert (= (and b!307699 (not condMapEmpty!2510)) mapNonEmpty!2509))

(assert (= start!68498 b!307699))

(assert (= (and b!307702 condMapEmpty!2509) mapIsEmpty!2509))

(assert (= (and b!307702 (not condMapEmpty!2509)) mapNonEmpty!2510))

(assert (= start!68498 b!307702))

(declare-fun m!446219 () Bool)

(assert (=> b!307701 m!446219))

(declare-fun m!446221 () Bool)

(assert (=> mapNonEmpty!2510 m!446221))

(declare-fun m!446223 () Bool)

(assert (=> b!307698 m!446223))

(declare-fun m!446225 () Bool)

(assert (=> start!68498 m!446225))

(declare-fun m!446227 () Bool)

(assert (=> start!68498 m!446227))

(declare-fun m!446229 () Bool)

(assert (=> mapNonEmpty!2509 m!446229))

(check-sat (not mapNonEmpty!2509) (not b!307701) tp_is_empty!783 (not mapNonEmpty!2510) (not start!68498) (not b!307698))
(check-sat)
(get-model)

(declare-fun d!102640 () Bool)

(declare-fun res!252494 () Bool)

(declare-fun e!221703 () Bool)

(assert (=> d!102640 (=> res!252494 e!221703)))

(assert (=> d!102640 (= res!252494 (= to!599 to!599))))

(assert (=> d!102640 (= (arrayRangesEq!1703 a1!506 a2!506 to!599 to!599) e!221703)))

(declare-fun b!307722 () Bool)

(declare-fun e!221704 () Bool)

(assert (=> b!307722 (= e!221703 e!221704)))

(declare-fun res!252495 () Bool)

(assert (=> b!307722 (=> (not res!252495) (not e!221704))))

(assert (=> b!307722 (= res!252495 (= (select (arr!9161 a1!506) to!599) (select (arr!9161 a2!506) to!599)))))

(declare-fun b!307723 () Bool)

(assert (=> b!307723 (= e!221704 (arrayRangesEq!1703 a1!506 a2!506 (bvadd to!599 #b00000000000000000000000000000001) to!599))))

(assert (= (and d!102640 (not res!252494)) b!307722))

(assert (= (and b!307722 res!252495) b!307723))

(declare-fun m!446243 () Bool)

(assert (=> b!307722 m!446243))

(declare-fun m!446245 () Bool)

(assert (=> b!307722 m!446245))

(declare-fun m!446247 () Bool)

(assert (=> b!307723 m!446247))

(assert (=> b!307701 d!102640))

(declare-fun d!102642 () Bool)

(assert (=> d!102642 (= (array_inv!7684 a1!506) (bvsge (size!8078 a1!506) #b00000000000000000000000000000000))))

(assert (=> start!68498 d!102642))

(declare-fun d!102644 () Bool)

(assert (=> d!102644 (= (array_inv!7684 a2!506) (bvsge (size!8078 a2!506) #b00000000000000000000000000000000))))

(assert (=> start!68498 d!102644))

(declare-fun d!102646 () Bool)

(declare-fun res!252496 () Bool)

(declare-fun e!221705 () Bool)

(assert (=> d!102646 (=> res!252496 e!221705)))

(assert (=> d!102646 (= res!252496 (= from!632 to!599))))

(assert (=> d!102646 (= (arrayRangesEq!1703 a1!506 a2!506 from!632 to!599) e!221705)))

(declare-fun b!307724 () Bool)

(declare-fun e!221706 () Bool)

(assert (=> b!307724 (= e!221705 e!221706)))

(declare-fun res!252497 () Bool)

(assert (=> b!307724 (=> (not res!252497) (not e!221706))))

(assert (=> b!307724 (= res!252497 (= (select (arr!9161 a1!506) from!632) (select (arr!9161 a2!506) from!632)))))

(declare-fun b!307725 () Bool)

(assert (=> b!307725 (= e!221706 (arrayRangesEq!1703 a1!506 a2!506 (bvadd from!632 #b00000000000000000000000000000001) to!599))))

(assert (= (and d!102646 (not res!252496)) b!307724))

(assert (= (and b!307724 res!252497) b!307725))

(declare-fun m!446249 () Bool)

(assert (=> b!307724 m!446249))

(declare-fun m!446251 () Bool)

(assert (=> b!307724 m!446251))

(declare-fun m!446253 () Bool)

(assert (=> b!307725 m!446253))

(assert (=> b!307698 d!102646))

(declare-fun condMapEmpty!2519 () Bool)

(declare-fun mapDefault!2519 () T!57589)

(assert (=> mapNonEmpty!2509 (= condMapEmpty!2519 (= mapRest!2509 ((as const (Array (_ BitVec 32) T!57589)) mapDefault!2519)))))

(declare-fun mapRes!2519 () Bool)

(assert (=> mapNonEmpty!2509 (= tp!2509 (and tp_is_empty!783 mapRes!2519))))

(declare-fun mapIsEmpty!2519 () Bool)

(assert (=> mapIsEmpty!2519 mapRes!2519))

(declare-fun mapNonEmpty!2519 () Bool)

(declare-fun tp!2519 () Bool)

(assert (=> mapNonEmpty!2519 (= mapRes!2519 (and tp!2519 tp_is_empty!783))))

(declare-fun mapRest!2519 () (Array (_ BitVec 32) T!57589))

(declare-fun mapValue!2519 () T!57589)

(declare-fun mapKey!2519 () (_ BitVec 32))

(assert (=> mapNonEmpty!2519 (= mapRest!2509 (store mapRest!2519 mapKey!2519 mapValue!2519))))

(assert (= (and mapNonEmpty!2509 condMapEmpty!2519) mapIsEmpty!2519))

(assert (= (and mapNonEmpty!2509 (not condMapEmpty!2519)) mapNonEmpty!2519))

(declare-fun m!446255 () Bool)

(assert (=> mapNonEmpty!2519 m!446255))

(declare-fun condMapEmpty!2520 () Bool)

(declare-fun mapDefault!2520 () T!57589)

(assert (=> mapNonEmpty!2510 (= condMapEmpty!2520 (= mapRest!2510 ((as const (Array (_ BitVec 32) T!57589)) mapDefault!2520)))))

(declare-fun mapRes!2520 () Bool)

(assert (=> mapNonEmpty!2510 (= tp!2510 (and tp_is_empty!783 mapRes!2520))))

(declare-fun mapIsEmpty!2520 () Bool)

(assert (=> mapIsEmpty!2520 mapRes!2520))

(declare-fun mapNonEmpty!2520 () Bool)

(declare-fun tp!2520 () Bool)

(assert (=> mapNonEmpty!2520 (= mapRes!2520 (and tp!2520 tp_is_empty!783))))

(declare-fun mapKey!2520 () (_ BitVec 32))

(declare-fun mapRest!2520 () (Array (_ BitVec 32) T!57589))

(declare-fun mapValue!2520 () T!57589)

(assert (=> mapNonEmpty!2520 (= mapRest!2510 (store mapRest!2520 mapKey!2520 mapValue!2520))))

(assert (= (and mapNonEmpty!2510 condMapEmpty!2520) mapIsEmpty!2520))

(assert (= (and mapNonEmpty!2510 (not condMapEmpty!2520)) mapNonEmpty!2520))

(declare-fun m!446257 () Bool)

(assert (=> mapNonEmpty!2520 m!446257))

(check-sat (not b!307723) (not mapNonEmpty!2519) tp_is_empty!783 (not mapNonEmpty!2520) (not b!307725))
(check-sat)
