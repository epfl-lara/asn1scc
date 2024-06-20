; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61150 () Bool)

(assert start!61150)

(declare-fun b!275306 () Bool)

(declare-fun res!228899 () Bool)

(declare-fun e!195277 () Bool)

(assert (=> b!275306 (=> (not res!228899) (not e!195277))))

(declare-datatypes ((array!15711 0))(
  ( (array!15712 (arr!7790 (Array (_ BitVec 32) (_ BitVec 8))) (size!6803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12420 0))(
  ( (BitStream!12421 (buf!7271 array!15711) (currentByte!13444 (_ BitVec 32)) (currentBit!13439 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12420)

(declare-fun bs2!19 () BitStream!12420)

(declare-fun arrayBitRangesEq!0 (array!15711 array!15711 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275306 (= res!228899 (arrayBitRangesEq!0 (buf!7271 bs1!11) (buf!7271 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6803 (buf!7271 bs1!11)) (currentByte!13444 bs1!11) (currentBit!13439 bs1!11)))))))

(declare-fun res!228900 () Bool)

(assert (=> start!61150 (=> (not res!228900) (not e!195277))))

(assert (=> start!61150 (= res!228900 (= (size!6803 (buf!7271 bs1!11)) (size!6803 (buf!7271 bs2!19))))))

(assert (=> start!61150 e!195277))

(declare-fun e!195280 () Bool)

(declare-fun inv!12 (BitStream!12420) Bool)

(assert (=> start!61150 (and (inv!12 bs1!11) e!195280)))

(declare-fun e!195276 () Bool)

(assert (=> start!61150 (and (inv!12 bs2!19) e!195276)))

(declare-fun b!275307 () Bool)

(declare-fun res!228901 () Bool)

(assert (=> b!275307 (=> (not res!228901) (not e!195277))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275307 (= res!228901 (validate_offset_bit!0 ((_ sign_extend 32) (size!6803 (buf!7271 bs1!11))) ((_ sign_extend 32) (currentByte!13444 bs1!11)) ((_ sign_extend 32) (currentBit!13439 bs1!11))))))

(declare-fun b!275308 () Bool)

(assert (=> b!275308 (= e!195277 (not true))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275308 (invariant!0 (currentBit!13439 bs1!11) (currentByte!13444 bs1!11) (size!6803 (buf!7271 bs2!19)))))

(declare-fun b!275309 () Bool)

(declare-fun array_inv!6527 (array!15711) Bool)

(assert (=> b!275309 (= e!195276 (array_inv!6527 (buf!7271 bs2!19)))))

(declare-fun b!275310 () Bool)

(assert (=> b!275310 (= e!195280 (array_inv!6527 (buf!7271 bs1!11)))))

(assert (= (and start!61150 res!228900) b!275307))

(assert (= (and b!275307 res!228901) b!275306))

(assert (= (and b!275306 res!228899) b!275308))

(assert (= start!61150 b!275310))

(assert (= start!61150 b!275309))

(declare-fun m!407891 () Bool)

(assert (=> b!275306 m!407891))

(declare-fun m!407893 () Bool)

(assert (=> b!275306 m!407893))

(declare-fun m!407895 () Bool)

(assert (=> b!275307 m!407895))

(declare-fun m!407897 () Bool)

(assert (=> b!275309 m!407897))

(declare-fun m!407899 () Bool)

(assert (=> b!275308 m!407899))

(declare-fun m!407901 () Bool)

(assert (=> b!275310 m!407901))

(declare-fun m!407903 () Bool)

(assert (=> start!61150 m!407903))

(declare-fun m!407905 () Bool)

(assert (=> start!61150 m!407905))

(check-sat (not start!61150) (not b!275309) (not b!275306) (not b!275308) (not b!275310) (not b!275307))
