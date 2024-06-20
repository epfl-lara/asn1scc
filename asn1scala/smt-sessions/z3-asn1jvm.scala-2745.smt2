; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66774 () Bool)

(assert start!66774)

(declare-fun res!246250 () Bool)

(declare-fun e!214050 () Bool)

(assert (=> start!66774 (=> (not res!246250) (not e!214050))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18028 0))(
  ( (array!18029 (arr!8903 (Array (_ BitVec 32) (_ BitVec 8))) (size!7820 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18028)

(assert (=> start!66774 (= res!246250 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7820 a!429))))))))

(assert (=> start!66774 e!214050))

(assert (=> start!66774 true))

(declare-fun array_inv!7432 (array!18028) Bool)

(assert (=> start!66774 (array_inv!7432 a!429)))

(declare-fun b!298466 () Bool)

(declare-fun e!214048 () Bool)

(assert (=> b!298466 (= e!214050 e!214048)))

(declare-fun res!246251 () Bool)

(assert (=> b!298466 (=> (not res!246251) (not e!214048))))

(declare-fun lt!434576 () array!18028)

(declare-fun arrayBitRangesEq!0 (array!18028 array!18028 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298466 (= res!246251 (arrayBitRangesEq!0 a!429 lt!434576 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434575 () (_ BitVec 32))

(declare-fun lt!434577 () (_ BitVec 32))

(assert (=> b!298466 (= lt!434576 (array!18029 (store (arr!8903 a!429) lt!434575 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8903 a!429) lt!434575)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434577)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434577) #b00000000))))) (size!7820 a!429)))))

(assert (=> b!298466 (= lt!434577 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298466 (= lt!434575 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298467 () Bool)

(assert (=> b!298467 (= e!214048 (not (and (bvsge lt!434575 #b00000000000000000000000000000000) (bvslt lt!434575 (size!7820 a!429)))))))

(assert (=> b!298467 (arrayBitRangesEq!0 a!429 lt!434576 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20835 0))(
  ( (Unit!20836) )
))
(declare-fun lt!434574 () Unit!20835)

(declare-fun rec!19 (array!18028 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20835)

(assert (=> b!298467 (= lt!434574 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66774 res!246250) b!298466))

(assert (= (and b!298466 res!246251) b!298467))

(declare-fun m!437589 () Bool)

(assert (=> start!66774 m!437589))

(declare-fun m!437591 () Bool)

(assert (=> b!298466 m!437591))

(declare-fun m!437593 () Bool)

(assert (=> b!298466 m!437593))

(declare-fun m!437595 () Bool)

(assert (=> b!298466 m!437595))

(declare-fun m!437597 () Bool)

(assert (=> b!298466 m!437597))

(declare-fun m!437599 () Bool)

(assert (=> b!298467 m!437599))

(declare-fun m!437601 () Bool)

(assert (=> b!298467 m!437601))

(check-sat (not b!298466) (not start!66774) (not b!298467))
(check-sat)
