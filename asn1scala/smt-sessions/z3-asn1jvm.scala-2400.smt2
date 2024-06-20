; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61156 () Bool)

(assert start!61156)

(declare-fun b!275351 () Bool)

(declare-fun res!228928 () Bool)

(declare-fun e!195322 () Bool)

(assert (=> b!275351 (=> (not res!228928) (not e!195322))))

(declare-datatypes ((array!15717 0))(
  ( (array!15718 (arr!7793 (Array (_ BitVec 32) (_ BitVec 8))) (size!6806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12426 0))(
  ( (BitStream!12427 (buf!7274 array!15717) (currentByte!13447 (_ BitVec 32)) (currentBit!13442 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12426)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275351 (= res!228928 (validate_offset_bit!0 ((_ sign_extend 32) (size!6806 (buf!7274 bs1!11))) ((_ sign_extend 32) (currentByte!13447 bs1!11)) ((_ sign_extend 32) (currentBit!13442 bs1!11))))))

(declare-fun b!275352 () Bool)

(declare-fun e!195321 () Bool)

(declare-fun bs2!19 () BitStream!12426)

(declare-fun array_inv!6530 (array!15717) Bool)

(assert (=> b!275352 (= e!195321 (array_inv!6530 (buf!7274 bs2!19)))))

(declare-fun b!275353 () Bool)

(declare-fun res!228927 () Bool)

(assert (=> b!275353 (=> (not res!228927) (not e!195322))))

(declare-fun arrayBitRangesEq!0 (array!15717 array!15717 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275353 (= res!228927 (arrayBitRangesEq!0 (buf!7274 bs1!11) (buf!7274 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6806 (buf!7274 bs1!11)) (currentByte!13447 bs1!11) (currentBit!13442 bs1!11)))))))

(declare-fun res!228926 () Bool)

(assert (=> start!61156 (=> (not res!228926) (not e!195322))))

(assert (=> start!61156 (= res!228926 (= (size!6806 (buf!7274 bs1!11)) (size!6806 (buf!7274 bs2!19))))))

(assert (=> start!61156 e!195322))

(declare-fun e!195324 () Bool)

(declare-fun inv!12 (BitStream!12426) Bool)

(assert (=> start!61156 (and (inv!12 bs1!11) e!195324)))

(assert (=> start!61156 (and (inv!12 bs2!19) e!195321)))

(declare-fun b!275354 () Bool)

(assert (=> b!275354 (= e!195322 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6806 (buf!7274 bs2!19))) ((_ sign_extend 32) (currentByte!13447 bs1!11)) ((_ sign_extend 32) (currentBit!13442 bs1!11)))))))

(declare-datatypes ((tuple2!22432 0))(
  ( (tuple2!22433 (_1!12248 BitStream!12426) (_2!12248 Bool)) )
))
(declare-fun lt!413543 () tuple2!22432)

(declare-fun readBitPure!0 (BitStream!12426) tuple2!22432)

(assert (=> b!275354 (= lt!413543 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275354 (invariant!0 (currentBit!13442 bs1!11) (currentByte!13447 bs1!11) (size!6806 (buf!7274 bs2!19)))))

(declare-fun b!275355 () Bool)

(assert (=> b!275355 (= e!195324 (array_inv!6530 (buf!7274 bs1!11)))))

(assert (= (and start!61156 res!228926) b!275351))

(assert (= (and b!275351 res!228928) b!275353))

(assert (= (and b!275353 res!228927) b!275354))

(assert (= start!61156 b!275355))

(assert (= start!61156 b!275352))

(declare-fun m!407943 () Bool)

(assert (=> b!275353 m!407943))

(declare-fun m!407945 () Bool)

(assert (=> b!275353 m!407945))

(declare-fun m!407947 () Bool)

(assert (=> start!61156 m!407947))

(declare-fun m!407949 () Bool)

(assert (=> start!61156 m!407949))

(declare-fun m!407951 () Bool)

(assert (=> b!275354 m!407951))

(declare-fun m!407953 () Bool)

(assert (=> b!275354 m!407953))

(declare-fun m!407955 () Bool)

(assert (=> b!275354 m!407955))

(declare-fun m!407957 () Bool)

(assert (=> b!275355 m!407957))

(declare-fun m!407959 () Bool)

(assert (=> b!275352 m!407959))

(declare-fun m!407961 () Bool)

(assert (=> b!275351 m!407961))

(check-sat (not b!275354) (not b!275351) (not b!275352) (not b!275355) (not start!61156) (not b!275353))
