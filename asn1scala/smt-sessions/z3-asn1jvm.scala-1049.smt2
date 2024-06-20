; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30084 () Bool)

(assert start!30084)

(declare-fun b!154323 () Bool)

(declare-fun e!103713 () Bool)

(declare-fun e!103711 () Bool)

(assert (=> b!154323 (= e!103713 e!103711)))

(declare-fun res!129177 () Bool)

(assert (=> b!154323 (=> (not res!129177) (not e!103711))))

(declare-fun lt!240699 () (_ BitVec 64))

(declare-datatypes ((array!6979 0))(
  ( (array!6980 (arr!3966 (Array (_ BitVec 32) (_ BitVec 8))) (size!3143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5544 0))(
  ( (BitStream!5545 (buf!3646 array!6979) (currentByte!6668 (_ BitVec 32)) (currentBit!6663 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5544)

(assert (=> b!154323 (= res!129177 (bvsle lt!240699 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3143 (buf!3646 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154323 (= lt!240699 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3143 (buf!3646 bs1!10)) (currentByte!6668 bs1!10) (currentBit!6663 bs1!10))))))

(declare-fun b!154324 () Bool)

(assert (=> b!154324 (= e!103711 false)))

(declare-datatypes ((tuple2!13668 0))(
  ( (tuple2!13669 (_1!7233 BitStream!5544) (_2!7233 (_ BitVec 8))) )
))
(declare-fun lt!240698 () tuple2!13668)

(declare-fun bs2!18 () BitStream!5544)

(declare-fun readBytePure!0 (BitStream!5544) tuple2!13668)

(assert (=> b!154324 (= lt!240698 (readBytePure!0 (BitStream!5545 (buf!3646 bs2!18) (currentByte!6668 bs1!10) (currentBit!6663 bs1!10))))))

(declare-fun lt!240700 () tuple2!13668)

(assert (=> b!154324 (= lt!240700 (readBytePure!0 bs1!10))))

(declare-fun b!154325 () Bool)

(declare-fun e!103710 () Bool)

(declare-fun array_inv!2932 (array!6979) Bool)

(assert (=> b!154325 (= e!103710 (array_inv!2932 (buf!3646 bs1!10)))))

(declare-fun b!154326 () Bool)

(declare-fun e!103709 () Bool)

(assert (=> b!154326 (= e!103709 (array_inv!2932 (buf!3646 bs2!18)))))

(declare-fun b!154328 () Bool)

(declare-fun res!129176 () Bool)

(assert (=> b!154328 (=> (not res!129176) (not e!103711))))

(declare-fun arrayBitRangesEq!0 (array!6979 array!6979 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154328 (= res!129176 (arrayBitRangesEq!0 (buf!3646 bs1!10) (buf!3646 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240699))))

(declare-fun b!154327 () Bool)

(declare-fun res!129174 () Bool)

(assert (=> b!154327 (=> (not res!129174) (not e!103711))))

(assert (=> b!154327 (= res!129174 (bvsle lt!240699 (bitIndex!0 (size!3143 (buf!3646 bs2!18)) (currentByte!6668 bs2!18) (currentBit!6663 bs2!18))))))

(declare-fun res!129175 () Bool)

(assert (=> start!30084 (=> (not res!129175) (not e!103713))))

(assert (=> start!30084 (= res!129175 (= (size!3143 (buf!3646 bs1!10)) (size!3143 (buf!3646 bs2!18))))))

(assert (=> start!30084 e!103713))

(declare-fun inv!12 (BitStream!5544) Bool)

(assert (=> start!30084 (and (inv!12 bs1!10) e!103710)))

(assert (=> start!30084 (and (inv!12 bs2!18) e!103709)))

(assert (= (and start!30084 res!129175) b!154323))

(assert (= (and b!154323 res!129177) b!154327))

(assert (= (and b!154327 res!129174) b!154328))

(assert (= (and b!154328 res!129176) b!154324))

(assert (= start!30084 b!154325))

(assert (= start!30084 b!154326))

(declare-fun m!240289 () Bool)

(assert (=> b!154323 m!240289))

(declare-fun m!240291 () Bool)

(assert (=> start!30084 m!240291))

(declare-fun m!240293 () Bool)

(assert (=> start!30084 m!240293))

(declare-fun m!240295 () Bool)

(assert (=> b!154325 m!240295))

(declare-fun m!240297 () Bool)

(assert (=> b!154327 m!240297))

(declare-fun m!240299 () Bool)

(assert (=> b!154326 m!240299))

(declare-fun m!240301 () Bool)

(assert (=> b!154324 m!240301))

(declare-fun m!240303 () Bool)

(assert (=> b!154324 m!240303))

(declare-fun m!240305 () Bool)

(assert (=> b!154328 m!240305))

(check-sat (not b!154324) (not b!154326) (not b!154328) (not start!30084) (not b!154323) (not b!154325) (not b!154327))
