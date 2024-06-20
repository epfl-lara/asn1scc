; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37760 () Bool)

(assert start!37760)

(declare-fun res!141867 () Bool)

(declare-fun e!119360 () Bool)

(assert (=> start!37760 (=> (not res!141867) (not e!119360))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37760 (= res!141867 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37760 e!119360))

(assert (=> start!37760 true))

(declare-datatypes ((array!9081 0))(
  ( (array!9082 (arr!4949 (Array (_ BitVec 32) (_ BitVec 8))) (size!4019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7176 0))(
  ( (BitStream!7177 (buf!4462 array!9081) (currentByte!8467 (_ BitVec 32)) (currentBit!8462 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7176)

(declare-fun e!119362 () Bool)

(declare-fun inv!12 (BitStream!7176) Bool)

(assert (=> start!37760 (and (inv!12 bs!64) e!119362)))

(declare-fun b!171007 () Bool)

(declare-fun res!141866 () Bool)

(assert (=> b!171007 (=> (not res!141866) (not e!119360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171007 (= res!141866 (validate_offset_bits!1 ((_ sign_extend 32) (size!4019 (buf!4462 bs!64))) ((_ sign_extend 32) (currentByte!8467 bs!64)) ((_ sign_extend 32) (currentBit!8462 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171008 () Bool)

(assert (=> b!171008 (= e!119360 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun lt!263640 () BitStream!7176)

(declare-fun withMovedBitIndex!0 (BitStream!7176 (_ BitVec 64)) BitStream!7176)

(assert (=> b!171008 (= lt!263640 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14692 0))(
  ( (tuple2!14693 (_1!7979 BitStream!7176) (_2!7979 Bool)) )
))
(declare-fun lt!263642 () tuple2!14692)

(declare-fun readBitPure!0 (BitStream!7176) tuple2!14692)

(assert (=> b!171008 (= lt!263642 (readBitPure!0 bs!64))))

(declare-fun lt!263641 () tuple2!14692)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7176 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14692)

(assert (=> b!171008 (= lt!263641 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171009 () Bool)

(declare-fun array_inv!3760 (array!9081) Bool)

(assert (=> b!171009 (= e!119362 (array_inv!3760 (buf!4462 bs!64)))))

(assert (= (and start!37760 res!141867) b!171007))

(assert (= (and b!171007 res!141866) b!171008))

(assert (= start!37760 b!171009))

(declare-fun m!270139 () Bool)

(assert (=> start!37760 m!270139))

(declare-fun m!270141 () Bool)

(assert (=> b!171007 m!270141))

(declare-fun m!270143 () Bool)

(assert (=> b!171008 m!270143))

(declare-fun m!270145 () Bool)

(assert (=> b!171008 m!270145))

(declare-fun m!270147 () Bool)

(assert (=> b!171008 m!270147))

(declare-fun m!270149 () Bool)

(assert (=> b!171009 m!270149))

(check-sat (not b!171007) (not start!37760) (not b!171008) (not b!171009))
