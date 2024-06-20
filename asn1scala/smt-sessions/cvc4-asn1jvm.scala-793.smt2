; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22980 () Bool)

(assert start!22980)

(declare-fun b!116378 () Bool)

(declare-fun res!96224 () Bool)

(declare-fun e!76275 () Bool)

(assert (=> b!116378 (=> (not res!96224) (not e!76275))))

(declare-datatypes ((array!5244 0))(
  ( (array!5245 (arr!2972 (Array (_ BitVec 32) (_ BitVec 8))) (size!2379 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4232 0))(
  ( (BitStream!4233 (buf!2789 array!5244) (currentByte!5426 (_ BitVec 32)) (currentBit!5421 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4232)

(declare-datatypes ((Unit!7163 0))(
  ( (Unit!7164) )
))
(declare-datatypes ((tuple2!9632 0))(
  ( (tuple2!9633 (_1!5081 Unit!7163) (_2!5081 BitStream!4232)) )
))
(declare-fun lt!177861 () tuple2!9632)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116378 (= res!96224 (invariant!0 (currentBit!5421 thiss!1305) (currentByte!5426 thiss!1305) (size!2379 (buf!2789 (_2!5081 lt!177861)))))))

(declare-fun b!116379 () Bool)

(declare-fun e!76271 () Bool)

(declare-datatypes ((tuple2!9634 0))(
  ( (tuple2!9635 (_1!5082 BitStream!4232) (_2!5082 Bool)) )
))
(declare-fun lt!177866 () tuple2!9634)

(declare-fun lt!177855 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116379 (= e!76271 (= (bitIndex!0 (size!2379 (buf!2789 (_1!5082 lt!177866))) (currentByte!5426 (_1!5082 lt!177866)) (currentBit!5421 (_1!5082 lt!177866))) lt!177855))))

(declare-fun b!116381 () Bool)

(declare-fun res!96220 () Bool)

(declare-fun e!76277 () Bool)

(assert (=> b!116381 (=> (not res!96220) (not e!76277))))

(declare-fun isPrefixOf!0 (BitStream!4232 BitStream!4232) Bool)

(assert (=> b!116381 (= res!96220 (isPrefixOf!0 thiss!1305 (_2!5081 lt!177861)))))

(declare-fun b!116382 () Bool)

(declare-fun lt!177863 () tuple2!9632)

(assert (=> b!116382 (= e!76275 (invariant!0 (currentBit!5421 thiss!1305) (currentByte!5426 thiss!1305) (size!2379 (buf!2789 (_2!5081 lt!177863)))))))

(declare-fun b!116383 () Bool)

(declare-fun e!76270 () Bool)

(declare-fun lt!177850 () tuple2!9634)

(declare-fun lt!177867 () tuple2!9634)

(assert (=> b!116383 (= e!76270 (= (_2!5082 lt!177850) (_2!5082 lt!177867)))))

(declare-fun b!116384 () Bool)

(assert (=> b!116384 (= e!76277 e!76271)))

(declare-fun res!96215 () Bool)

(assert (=> b!116384 (=> (not res!96215) (not e!76271))))

(declare-fun lt!177857 () Bool)

(assert (=> b!116384 (= res!96215 (and (= (_2!5082 lt!177866) lt!177857) (= (_1!5082 lt!177866) (_2!5081 lt!177861))))))

(declare-fun readBitPure!0 (BitStream!4232) tuple2!9634)

(declare-fun readerFrom!0 (BitStream!4232 (_ BitVec 32) (_ BitVec 32)) BitStream!4232)

(assert (=> b!116384 (= lt!177866 (readBitPure!0 (readerFrom!0 (_2!5081 lt!177861) (currentBit!5421 thiss!1305) (currentByte!5426 thiss!1305))))))

(declare-fun b!116385 () Bool)

(declare-fun e!76273 () Bool)

(declare-fun array_inv!2181 (array!5244) Bool)

(assert (=> b!116385 (= e!76273 (array_inv!2181 (buf!2789 thiss!1305)))))

(declare-fun b!116386 () Bool)

(declare-fun e!76272 () Bool)

(declare-fun e!76276 () Bool)

(assert (=> b!116386 (= e!76272 e!76276)))

(declare-fun res!96223 () Bool)

(assert (=> b!116386 (=> (not res!96223) (not e!76276))))

(declare-fun lt!177859 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116386 (= res!96223 (validate_offset_bits!1 ((_ sign_extend 32) (size!2379 (buf!2789 thiss!1305))) ((_ sign_extend 32) (currentByte!5426 thiss!1305)) ((_ sign_extend 32) (currentBit!5421 thiss!1305)) lt!177859))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116386 (= lt!177859 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116387 () Bool)

(declare-fun res!96225 () Bool)

(assert (=> b!116387 (=> (not res!96225) (not e!76276))))

(assert (=> b!116387 (= res!96225 (bvslt i!615 nBits!396))))

(declare-fun res!96218 () Bool)

(assert (=> start!22980 (=> (not res!96218) (not e!76272))))

(assert (=> start!22980 (= res!96218 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22980 e!76272))

(assert (=> start!22980 true))

(declare-fun inv!12 (BitStream!4232) Bool)

(assert (=> start!22980 (and (inv!12 thiss!1305) e!76273)))

(declare-fun b!116380 () Bool)

(declare-fun res!96222 () Bool)

(assert (=> b!116380 (=> (not res!96222) (not e!76276))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116380 (= res!96222 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!177862 () (_ BitVec 32))

(declare-fun lt!177856 () tuple2!9634)

(declare-fun b!116388 () Bool)

(assert (=> b!116388 (= e!76276 (not (or (not (_2!5082 lt!177856)) (let ((bdg!5751 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (or (= bdg!5751 (bvand i!615 #b10000000000000000000000000000000)) (= bdg!5751 (bvand lt!177862 #b10000000000000000000000000000000)))))))))

(declare-datatypes ((tuple2!9636 0))(
  ( (tuple2!9637 (_1!5083 BitStream!4232) (_2!5083 BitStream!4232)) )
))
(declare-fun lt!177851 () tuple2!9636)

(declare-datatypes ((tuple2!9638 0))(
  ( (tuple2!9639 (_1!5084 BitStream!4232) (_2!5084 (_ BitVec 64))) )
))
(declare-fun lt!177864 () tuple2!9638)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9638)

(assert (=> b!116388 (= lt!177864 (readNLeastSignificantBitsLoopPure!0 (_1!5083 lt!177851) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116388 (validate_offset_bits!1 ((_ sign_extend 32) (size!2379 (buf!2789 (_2!5081 lt!177863)))) ((_ sign_extend 32) (currentByte!5426 thiss!1305)) ((_ sign_extend 32) (currentBit!5421 thiss!1305)) lt!177859)))

(declare-fun lt!177854 () Unit!7163)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4232 array!5244 (_ BitVec 64)) Unit!7163)

(assert (=> b!116388 (= lt!177854 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2789 (_2!5081 lt!177863)) lt!177859))))

(assert (=> b!116388 (= (_2!5082 lt!177856) lt!177857)))

(assert (=> b!116388 (= lt!177856 (readBitPure!0 (_1!5083 lt!177851)))))

(declare-fun lt!177865 () tuple2!9636)

(declare-fun reader!0 (BitStream!4232 BitStream!4232) tuple2!9636)

(assert (=> b!116388 (= lt!177865 (reader!0 (_2!5081 lt!177861) (_2!5081 lt!177863)))))

(assert (=> b!116388 (= lt!177851 (reader!0 thiss!1305 (_2!5081 lt!177863)))))

(assert (=> b!116388 e!76270))

(declare-fun res!96221 () Bool)

(assert (=> b!116388 (=> (not res!96221) (not e!76270))))

(assert (=> b!116388 (= res!96221 (= (bitIndex!0 (size!2379 (buf!2789 (_1!5082 lt!177850))) (currentByte!5426 (_1!5082 lt!177850)) (currentBit!5421 (_1!5082 lt!177850))) (bitIndex!0 (size!2379 (buf!2789 (_1!5082 lt!177867))) (currentByte!5426 (_1!5082 lt!177867)) (currentBit!5421 (_1!5082 lt!177867)))))))

(declare-fun lt!177860 () Unit!7163)

(declare-fun lt!177853 () BitStream!4232)

(declare-fun readBitPrefixLemma!0 (BitStream!4232 BitStream!4232) Unit!7163)

(assert (=> b!116388 (= lt!177860 (readBitPrefixLemma!0 lt!177853 (_2!5081 lt!177863)))))

(assert (=> b!116388 (= lt!177867 (readBitPure!0 (BitStream!4233 (buf!2789 (_2!5081 lt!177863)) (currentByte!5426 thiss!1305) (currentBit!5421 thiss!1305))))))

(assert (=> b!116388 (= lt!177850 (readBitPure!0 lt!177853))))

(assert (=> b!116388 (= lt!177853 (BitStream!4233 (buf!2789 (_2!5081 lt!177861)) (currentByte!5426 thiss!1305) (currentBit!5421 thiss!1305)))))

(assert (=> b!116388 e!76275))

(declare-fun res!96219 () Bool)

(assert (=> b!116388 (=> (not res!96219) (not e!76275))))

(assert (=> b!116388 (= res!96219 (isPrefixOf!0 thiss!1305 (_2!5081 lt!177863)))))

(declare-fun lt!177852 () Unit!7163)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4232 BitStream!4232 BitStream!4232) Unit!7163)

(assert (=> b!116388 (= lt!177852 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5081 lt!177861) (_2!5081 lt!177863)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4232 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9632)

(assert (=> b!116388 (= lt!177863 (appendNLeastSignificantBitsLoop!0 (_2!5081 lt!177861) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76274 () Bool)

(assert (=> b!116388 e!76274))

(declare-fun res!96216 () Bool)

(assert (=> b!116388 (=> (not res!96216) (not e!76274))))

(assert (=> b!116388 (= res!96216 (= (size!2379 (buf!2789 thiss!1305)) (size!2379 (buf!2789 (_2!5081 lt!177861)))))))

(declare-fun appendBit!0 (BitStream!4232 Bool) tuple2!9632)

(assert (=> b!116388 (= lt!177861 (appendBit!0 thiss!1305 lt!177857))))

(assert (=> b!116388 (= lt!177857 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) lt!177862))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116388 (= lt!177862 (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))

(declare-fun b!116389 () Bool)

(assert (=> b!116389 (= e!76274 e!76277)))

(declare-fun res!96217 () Bool)

(assert (=> b!116389 (=> (not res!96217) (not e!76277))))

(declare-fun lt!177858 () (_ BitVec 64))

(assert (=> b!116389 (= res!96217 (= lt!177855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177858)))))

(assert (=> b!116389 (= lt!177855 (bitIndex!0 (size!2379 (buf!2789 (_2!5081 lt!177861))) (currentByte!5426 (_2!5081 lt!177861)) (currentBit!5421 (_2!5081 lt!177861))))))

(assert (=> b!116389 (= lt!177858 (bitIndex!0 (size!2379 (buf!2789 thiss!1305)) (currentByte!5426 thiss!1305) (currentBit!5421 thiss!1305)))))

(assert (= (and start!22980 res!96218) b!116386))

(assert (= (and b!116386 res!96223) b!116380))

(assert (= (and b!116380 res!96222) b!116387))

(assert (= (and b!116387 res!96225) b!116388))

(assert (= (and b!116388 res!96216) b!116389))

(assert (= (and b!116389 res!96217) b!116381))

(assert (= (and b!116381 res!96220) b!116384))

(assert (= (and b!116384 res!96215) b!116379))

(assert (= (and b!116388 res!96219) b!116378))

(assert (= (and b!116378 res!96224) b!116382))

(assert (= (and b!116388 res!96221) b!116383))

(assert (= start!22980 b!116385))

(declare-fun m!174267 () Bool)

(assert (=> b!116379 m!174267))

(declare-fun m!174269 () Bool)

(assert (=> b!116384 m!174269))

(assert (=> b!116384 m!174269))

(declare-fun m!174271 () Bool)

(assert (=> b!116384 m!174271))

(declare-fun m!174273 () Bool)

(assert (=> b!116378 m!174273))

(declare-fun m!174275 () Bool)

(assert (=> b!116389 m!174275))

(declare-fun m!174277 () Bool)

(assert (=> b!116389 m!174277))

(declare-fun m!174279 () Bool)

(assert (=> b!116385 m!174279))

(declare-fun m!174281 () Bool)

(assert (=> start!22980 m!174281))

(declare-fun m!174283 () Bool)

(assert (=> b!116388 m!174283))

(declare-fun m!174285 () Bool)

(assert (=> b!116388 m!174285))

(declare-fun m!174287 () Bool)

(assert (=> b!116388 m!174287))

(declare-fun m!174289 () Bool)

(assert (=> b!116388 m!174289))

(declare-fun m!174291 () Bool)

(assert (=> b!116388 m!174291))

(declare-fun m!174293 () Bool)

(assert (=> b!116388 m!174293))

(declare-fun m!174295 () Bool)

(assert (=> b!116388 m!174295))

(declare-fun m!174297 () Bool)

(assert (=> b!116388 m!174297))

(declare-fun m!174299 () Bool)

(assert (=> b!116388 m!174299))

(declare-fun m!174301 () Bool)

(assert (=> b!116388 m!174301))

(declare-fun m!174303 () Bool)

(assert (=> b!116388 m!174303))

(declare-fun m!174305 () Bool)

(assert (=> b!116388 m!174305))

(declare-fun m!174307 () Bool)

(assert (=> b!116388 m!174307))

(declare-fun m!174309 () Bool)

(assert (=> b!116388 m!174309))

(declare-fun m!174311 () Bool)

(assert (=> b!116388 m!174311))

(declare-fun m!174313 () Bool)

(assert (=> b!116388 m!174313))

(declare-fun m!174315 () Bool)

(assert (=> b!116380 m!174315))

(declare-fun m!174317 () Bool)

(assert (=> b!116382 m!174317))

(declare-fun m!174319 () Bool)

(assert (=> b!116386 m!174319))

(declare-fun m!174321 () Bool)

(assert (=> b!116381 m!174321))

(push 1)

(assert (not b!116389))

(assert (not b!116380))

(assert (not b!116378))

(assert (not b!116384))

(assert (not b!116385))

(assert (not b!116379))

(assert (not b!116382))

(assert (not start!22980))

(assert (not b!116381))

(assert (not b!116388))

(assert (not b!116386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

