; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61162 () Bool)

(assert start!61162)

(declare-fun res!228955 () Bool)

(declare-fun e!195368 () Bool)

(assert (=> start!61162 (=> (not res!228955) (not e!195368))))

(declare-datatypes ((array!15723 0))(
  ( (array!15724 (arr!7796 (Array (_ BitVec 32) (_ BitVec 8))) (size!6809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12432 0))(
  ( (BitStream!12433 (buf!7277 array!15723) (currentByte!13450 (_ BitVec 32)) (currentBit!13445 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12432)

(declare-fun bs2!19 () BitStream!12432)

(assert (=> start!61162 (= res!228955 (= (size!6809 (buf!7277 bs1!11)) (size!6809 (buf!7277 bs2!19))))))

(assert (=> start!61162 e!195368))

(declare-fun e!195367 () Bool)

(declare-fun inv!12 (BitStream!12432) Bool)

(assert (=> start!61162 (and (inv!12 bs1!11) e!195367)))

(declare-fun e!195366 () Bool)

(assert (=> start!61162 (and (inv!12 bs2!19) e!195366)))

(declare-fun b!275396 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275396 (= e!195368 (not (invariant!0 (currentBit!13445 bs1!11) (currentByte!13450 bs1!11) (size!6809 (buf!7277 bs1!11)))))))

(declare-datatypes ((tuple2!22438 0))(
  ( (tuple2!22439 (_1!12251 BitStream!12432) (_2!12251 Bool)) )
))
(declare-fun lt!413557 () tuple2!22438)

(declare-fun readBitPure!0 (BitStream!12432) tuple2!22438)

(assert (=> b!275396 (= lt!413557 (readBitPure!0 (BitStream!12433 (buf!7277 bs2!19) (currentByte!13450 bs1!11) (currentBit!13445 bs1!11))))))

(declare-fun lt!413558 () tuple2!22438)

(assert (=> b!275396 (= lt!413558 (readBitPure!0 bs1!11))))

(assert (=> b!275396 (invariant!0 (currentBit!13445 bs1!11) (currentByte!13450 bs1!11) (size!6809 (buf!7277 bs2!19)))))

(declare-fun b!275397 () Bool)

(declare-fun array_inv!6533 (array!15723) Bool)

(assert (=> b!275397 (= e!195366 (array_inv!6533 (buf!7277 bs2!19)))))

(declare-fun b!275398 () Bool)

(assert (=> b!275398 (= e!195367 (array_inv!6533 (buf!7277 bs1!11)))))

(declare-fun b!275399 () Bool)

(declare-fun res!228953 () Bool)

(assert (=> b!275399 (=> (not res!228953) (not e!195368))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275399 (= res!228953 (validate_offset_bit!0 ((_ sign_extend 32) (size!6809 (buf!7277 bs1!11))) ((_ sign_extend 32) (currentByte!13450 bs1!11)) ((_ sign_extend 32) (currentBit!13445 bs1!11))))))

(declare-fun b!275400 () Bool)

(declare-fun res!228954 () Bool)

(assert (=> b!275400 (=> (not res!228954) (not e!195368))))

(declare-fun arrayBitRangesEq!0 (array!15723 array!15723 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275400 (= res!228954 (arrayBitRangesEq!0 (buf!7277 bs1!11) (buf!7277 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6809 (buf!7277 bs1!11)) (currentByte!13450 bs1!11) (currentBit!13445 bs1!11)))))))

(assert (= (and start!61162 res!228955) b!275399))

(assert (= (and b!275399 res!228953) b!275400))

(assert (= (and b!275400 res!228954) b!275396))

(assert (= start!61162 b!275398))

(assert (= start!61162 b!275397))

(declare-fun m!408005 () Bool)

(assert (=> b!275397 m!408005))

(declare-fun m!408007 () Bool)

(assert (=> b!275398 m!408007))

(declare-fun m!408009 () Bool)

(assert (=> b!275399 m!408009))

(declare-fun m!408011 () Bool)

(assert (=> start!61162 m!408011))

(declare-fun m!408013 () Bool)

(assert (=> start!61162 m!408013))

(declare-fun m!408015 () Bool)

(assert (=> b!275400 m!408015))

(declare-fun m!408017 () Bool)

(assert (=> b!275400 m!408017))

(declare-fun m!408019 () Bool)

(assert (=> b!275396 m!408019))

(declare-fun m!408021 () Bool)

(assert (=> b!275396 m!408021))

(declare-fun m!408023 () Bool)

(assert (=> b!275396 m!408023))

(declare-fun m!408025 () Bool)

(assert (=> b!275396 m!408025))

(check-sat (not start!61162) (not b!275400) (not b!275396) (not b!275397) (not b!275398) (not b!275399))
