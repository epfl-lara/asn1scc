; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74052 () Bool)

(assert start!74052)

(declare-datatypes ((Unit!22130 0))(
  ( (Unit!22131) )
))
(declare-fun lt!448628 () Unit!22130)

(declare-datatypes ((T!66517 0))(
  ( (T!66518 (val!535 Int)) )
))
(declare-datatypes ((array!21291 0))(
  ( (array!21292 (arr!10331 (Array (_ BitVec 32) T!66517)) (size!9239 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21291)

(declare-fun rec!112 (array!21291 (_ BitVec 32)) Unit!22130)

(assert (=> start!74052 (= lt!448628 (rec!112 a!404 (size!9239 a!404)))))

(assert (=> start!74052 (bvsgt #b00000000000000000000000000000000 (size!9239 a!404))))

(declare-fun e!236078 () Bool)

(declare-fun array_inv!8790 (array!21291) Bool)

(assert (=> start!74052 (and (array_inv!8790 a!404) e!236078)))

(declare-fun b!326764 () Bool)

(declare-fun tp_is_empty!1071 () Bool)

(declare-fun mapRes!3325 () Bool)

(assert (=> b!326764 (= e!236078 (and tp_is_empty!1071 mapRes!3325))))

(declare-fun condMapEmpty!3325 () Bool)

(declare-fun mapDefault!3325 () T!66517)

(assert (=> b!326764 (= condMapEmpty!3325 (= (arr!10331 a!404) ((as const (Array (_ BitVec 32) T!66517)) mapDefault!3325)))))

(declare-fun mapIsEmpty!3325 () Bool)

(assert (=> mapIsEmpty!3325 mapRes!3325))

(declare-fun mapNonEmpty!3325 () Bool)

(declare-fun tp!3325 () Bool)

(assert (=> mapNonEmpty!3325 (= mapRes!3325 (and tp!3325 tp_is_empty!1071))))

(declare-fun mapValue!3325 () T!66517)

(declare-fun mapRest!3325 () (Array (_ BitVec 32) T!66517))

(declare-fun mapKey!3325 () (_ BitVec 32))

(assert (=> mapNonEmpty!3325 (= (arr!10331 a!404) (store mapRest!3325 mapKey!3325 mapValue!3325))))

(assert (= (and b!326764 condMapEmpty!3325) mapIsEmpty!3325))

(assert (= (and b!326764 (not condMapEmpty!3325)) mapNonEmpty!3325))

(assert (= start!74052 b!326764))

(declare-fun m!464609 () Bool)

(assert (=> start!74052 m!464609))

(declare-fun m!464611 () Bool)

(assert (=> start!74052 m!464611))

(declare-fun m!464613 () Bool)

(assert (=> mapNonEmpty!3325 m!464613))

(check-sat (not start!74052) (not mapNonEmpty!3325) tp_is_empty!1071)
(check-sat)
(get-model)

(declare-fun d!107826 () Bool)

(declare-fun arrayRangesEq!1858 (array!21291 array!21291 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107826 (arrayRangesEq!1858 a!404 a!404 #b00000000000000000000000000000000 (size!9239 a!404))))

(declare-fun lt!448634 () Unit!22130)

(declare-fun e!236084 () Unit!22130)

(assert (=> d!107826 (= lt!448634 e!236084)))

(declare-fun c!15478 () Bool)

(assert (=> d!107826 (= c!15478 (= (size!9239 a!404) #b00000000000000000000000000000000))))

(assert (=> d!107826 (and (bvsle #b00000000000000000000000000000000 (size!9239 a!404)) (bvsle (size!9239 a!404) (size!9239 a!404)))))

(assert (=> d!107826 (= (rec!112 a!404 (size!9239 a!404)) lt!448634)))

(declare-fun b!326772 () Bool)

(declare-fun Unit!22134 () Unit!22130)

(assert (=> b!326772 (= e!236084 Unit!22134)))

(declare-fun b!326773 () Bool)

(assert (=> b!326773 (= e!236084 (rec!112 a!404 (bvsub (size!9239 a!404) #b00000000000000000000000000000001)))))

(assert (= (and d!107826 c!15478) b!326772))

(assert (= (and d!107826 (not c!15478)) b!326773))

(declare-fun m!464621 () Bool)

(assert (=> d!107826 m!464621))

(declare-fun m!464623 () Bool)

(assert (=> b!326773 m!464623))

(assert (=> start!74052 d!107826))

(declare-fun d!107828 () Bool)

(assert (=> d!107828 (= (array_inv!8790 a!404) (bvsge (size!9239 a!404) #b00000000000000000000000000000000))))

(assert (=> start!74052 d!107828))

(declare-fun condMapEmpty!3331 () Bool)

(declare-fun mapDefault!3331 () T!66517)

(assert (=> mapNonEmpty!3325 (= condMapEmpty!3331 (= mapRest!3325 ((as const (Array (_ BitVec 32) T!66517)) mapDefault!3331)))))

(declare-fun mapRes!3331 () Bool)

(assert (=> mapNonEmpty!3325 (= tp!3325 (and tp_is_empty!1071 mapRes!3331))))

(declare-fun mapIsEmpty!3331 () Bool)

(assert (=> mapIsEmpty!3331 mapRes!3331))

(declare-fun mapNonEmpty!3331 () Bool)

(declare-fun tp!3331 () Bool)

(assert (=> mapNonEmpty!3331 (= mapRes!3331 (and tp!3331 tp_is_empty!1071))))

(declare-fun mapKey!3331 () (_ BitVec 32))

(declare-fun mapValue!3331 () T!66517)

(declare-fun mapRest!3331 () (Array (_ BitVec 32) T!66517))

(assert (=> mapNonEmpty!3331 (= mapRest!3325 (store mapRest!3331 mapKey!3331 mapValue!3331))))

(assert (= (and mapNonEmpty!3325 condMapEmpty!3331) mapIsEmpty!3331))

(assert (= (and mapNonEmpty!3325 (not condMapEmpty!3331)) mapNonEmpty!3331))

(declare-fun m!464625 () Bool)

(assert (=> mapNonEmpty!3331 m!464625))

(check-sat (not d!107826) (not b!326773) (not mapNonEmpty!3331) tp_is_empty!1071)
(check-sat)
