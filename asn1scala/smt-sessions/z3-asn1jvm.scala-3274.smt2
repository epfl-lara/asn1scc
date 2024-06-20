; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74132 () Bool)

(assert start!74132)

(declare-fun res!268504 () Bool)

(declare-fun e!236265 () Bool)

(assert (=> start!74132 (=> (not res!268504) (not e!236265))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66803 0))(
  ( (T!66804 (val!568 Int)) )
))
(declare-datatypes ((array!21360 0))(
  ( (array!21361 (arr!10364 (Array (_ BitVec 32) T!66803)) (size!9272 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21360)

(assert (=> start!74132 (= res!268504 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9272 a!407))))))

(assert (=> start!74132 e!236265))

(assert (=> start!74132 true))

(declare-fun e!236266 () Bool)

(declare-fun array_inv!8814 (array!21360) Bool)

(assert (=> start!74132 (and (array_inv!8814 a!407) e!236266)))

(declare-fun b!327076 () Bool)

(declare-fun tp_is_empty!1137 () Bool)

(declare-fun mapRes!3433 () Bool)

(assert (=> b!327076 (= e!236266 (and tp_is_empty!1137 mapRes!3433))))

(declare-fun condMapEmpty!3433 () Bool)

(declare-fun mapDefault!3433 () T!66803)

(assert (=> b!327076 (= condMapEmpty!3433 (= (arr!10364 a!407) ((as const (Array (_ BitVec 32) T!66803)) mapDefault!3433)))))

(declare-fun b!327077 () Bool)

(assert (=> b!327077 (= e!236265 (and (not (= i!907 #b00000000000000000000000000000000)) (not (= (bvand i!907 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!907 #b10000000000000000000000000000000) (bvand (bvsub i!907 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!3433 () Bool)

(declare-fun tp!3433 () Bool)

(assert (=> mapNonEmpty!3433 (= mapRes!3433 (and tp!3433 tp_is_empty!1137))))

(declare-fun mapRest!3433 () (Array (_ BitVec 32) T!66803))

(declare-fun mapValue!3433 () T!66803)

(declare-fun mapKey!3433 () (_ BitVec 32))

(assert (=> mapNonEmpty!3433 (= (arr!10364 a!407) (store mapRest!3433 mapKey!3433 mapValue!3433))))

(declare-fun b!327078 () Bool)

(declare-fun res!268505 () Bool)

(assert (=> b!327078 (=> (not res!268505) (not e!236265))))

(declare-fun arrayRangesEq!1878 (array!21360 array!21360 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327078 (= res!268505 (arrayRangesEq!1878 a!407 a!407 i!907 (size!9272 a!407)))))

(declare-fun mapIsEmpty!3433 () Bool)

(assert (=> mapIsEmpty!3433 mapRes!3433))

(assert (= (and start!74132 res!268504) b!327078))

(assert (= (and b!327078 res!268505) b!327077))

(assert (= (and b!327076 condMapEmpty!3433) mapIsEmpty!3433))

(assert (= (and b!327076 (not condMapEmpty!3433)) mapNonEmpty!3433))

(assert (= start!74132 b!327076))

(declare-fun m!464867 () Bool)

(assert (=> start!74132 m!464867))

(declare-fun m!464869 () Bool)

(assert (=> mapNonEmpty!3433 m!464869))

(declare-fun m!464871 () Bool)

(assert (=> b!327078 m!464871))

(check-sat (not start!74132) (not b!327078) (not mapNonEmpty!3433) tp_is_empty!1137)
(check-sat)
