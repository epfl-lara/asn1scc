; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66780 () Bool)

(assert start!66780)

(declare-fun res!246268 () Bool)

(declare-fun e!214077 () Bool)

(assert (=> start!66780 (=> (not res!246268) (not e!214077))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18034 0))(
  ( (array!18035 (arr!8906 (Array (_ BitVec 32) (_ BitVec 8))) (size!7823 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18034)

(assert (=> start!66780 (= res!246268 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7823 a!429))))))))

(assert (=> start!66780 e!214077))

(assert (=> start!66780 true))

(declare-fun array_inv!7435 (array!18034) Bool)

(assert (=> start!66780 (array_inv!7435 a!429)))

(declare-fun b!298484 () Bool)

(declare-fun e!214076 () Bool)

(assert (=> b!298484 (= e!214077 e!214076)))

(declare-fun res!246269 () Bool)

(assert (=> b!298484 (=> (not res!246269) (not e!214076))))

(declare-fun lt!434610 () array!18034)

(declare-fun arrayBitRangesEq!0 (array!18034 array!18034 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298484 (= res!246269 (arrayBitRangesEq!0 a!429 lt!434610 at!281 at!281))))

(declare-fun lt!434612 () (_ BitVec 32))

(declare-fun lt!434611 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(assert (=> b!298484 (= lt!434610 (array!18035 (store (arr!8906 a!429) lt!434611 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8906 a!429) lt!434611)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434612)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434612) #b00000000))))) (size!7823 a!429)))))

(assert (=> b!298484 (= lt!434612 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298484 (= lt!434611 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298485 () Bool)

(assert (=> b!298485 (= e!214076 (not true))))

(assert (=> b!298485 (arrayBitRangesEq!0 a!429 lt!434610 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20841 0))(
  ( (Unit!20842) )
))
(declare-fun lt!434613 () Unit!20841)

(declare-fun rec!19 (array!18034 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20841)

(assert (=> b!298485 (= lt!434613 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66780 res!246268) b!298484))

(assert (= (and b!298484 res!246269) b!298485))

(declare-fun m!437631 () Bool)

(assert (=> start!66780 m!437631))

(declare-fun m!437633 () Bool)

(assert (=> b!298484 m!437633))

(declare-fun m!437635 () Bool)

(assert (=> b!298484 m!437635))

(declare-fun m!437637 () Bool)

(assert (=> b!298484 m!437637))

(declare-fun m!437639 () Bool)

(assert (=> b!298484 m!437639))

(declare-fun m!437641 () Bool)

(assert (=> b!298485 m!437641))

(declare-fun m!437643 () Bool)

(assert (=> b!298485 m!437643))

(check-sat (not b!298485) (not start!66780) (not b!298484))
