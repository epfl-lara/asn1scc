; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23108 () Bool)

(assert start!23108)

(declare-fun b!117268 () Bool)

(declare-fun e!76872 () Bool)

(declare-datatypes ((array!5279 0))(
  ( (array!5280 (arr!2988 (Array (_ BitVec 32) (_ BitVec 8))) (size!2395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4264 0))(
  ( (BitStream!4265 (buf!2808 array!5279) (currentByte!5451 (_ BitVec 32)) (currentBit!5446 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4264)

(declare-fun array_inv!2197 (array!5279) Bool)

(assert (=> b!117268 (= e!76872 (array_inv!2197 (buf!2808 thiss!1305)))))

(declare-fun b!117269 () Bool)

(declare-fun res!97008 () Bool)

(declare-fun e!76879 () Bool)

(assert (=> b!117269 (=> (not res!97008) (not e!76879))))

(declare-datatypes ((Unit!7213 0))(
  ( (Unit!7214) )
))
(declare-datatypes ((tuple2!9772 0))(
  ( (tuple2!9773 (_1!5151 Unit!7213) (_2!5151 BitStream!4264)) )
))
(declare-fun lt!179549 () tuple2!9772)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117269 (= res!97008 (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(declare-fun b!117270 () Bool)

(declare-fun res!97006 () Bool)

(declare-fun e!76874 () Bool)

(assert (=> b!117270 (=> (not res!97006) (not e!76874))))

(declare-fun isPrefixOf!0 (BitStream!4264 BitStream!4264) Bool)

(assert (=> b!117270 (= res!97006 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179549)))))

(declare-fun b!117271 () Bool)

(declare-fun res!97007 () Bool)

(declare-fun e!76881 () Bool)

(assert (=> b!117271 (=> (not res!97007) (not e!76881))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117271 (= res!97007 (bvslt i!615 nBits!396))))

(declare-fun b!117272 () Bool)

(declare-fun e!76877 () Bool)

(assert (=> b!117272 (= e!76877 e!76874)))

(declare-fun res!97005 () Bool)

(assert (=> b!117272 (=> (not res!97005) (not e!76874))))

(declare-fun lt!179537 () (_ BitVec 64))

(declare-fun lt!179538 () (_ BitVec 64))

(assert (=> b!117272 (= res!97005 (= lt!179537 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179538)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117272 (= lt!179537 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(assert (=> b!117272 (= lt!179538 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(declare-fun b!117273 () Bool)

(declare-fun e!76876 () Bool)

(assert (=> b!117273 (= e!76874 e!76876)))

(declare-fun res!96998 () Bool)

(assert (=> b!117273 (=> (not res!96998) (not e!76876))))

(declare-datatypes ((tuple2!9774 0))(
  ( (tuple2!9775 (_1!5152 BitStream!4264) (_2!5152 Bool)) )
))
(declare-fun lt!179551 () tuple2!9774)

(declare-fun lt!179545 () Bool)

(assert (=> b!117273 (= res!96998 (and (= (_2!5152 lt!179551) lt!179545) (= (_1!5152 lt!179551) (_2!5151 lt!179549))))))

(declare-fun readBitPure!0 (BitStream!4264) tuple2!9774)

(declare-fun readerFrom!0 (BitStream!4264 (_ BitVec 32) (_ BitVec 32)) BitStream!4264)

(assert (=> b!117273 (= lt!179551 (readBitPure!0 (readerFrom!0 (_2!5151 lt!179549) (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305))))))

(declare-fun b!117274 () Bool)

(assert (=> b!117274 (= e!76876 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179551))) (currentByte!5451 (_1!5152 lt!179551)) (currentBit!5446 (_1!5152 lt!179551))) lt!179537))))

(declare-fun b!117276 () Bool)

(declare-fun e!76873 () Bool)

(declare-fun lt!179550 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117276 (= e!76873 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549))) lt!179550))))

(declare-fun b!117277 () Bool)

(declare-fun res!97001 () Bool)

(assert (=> b!117277 (=> (not res!97001) (not e!76881))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117277 (= res!97001 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117278 () Bool)

(declare-fun e!76875 () Bool)

(assert (=> b!117278 (= e!76875 e!76881)))

(declare-fun res!97002 () Bool)

(assert (=> b!117278 (=> (not res!97002) (not e!76881))))

(declare-fun lt!179547 () (_ BitVec 64))

(assert (=> b!117278 (= res!97002 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)) lt!179547))))

(assert (=> b!117278 (= lt!179547 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117279 () Bool)

(assert (=> b!117279 (= e!76881 (not e!76873))))

(declare-fun res!97000 () Bool)

(assert (=> b!117279 (=> res!97000 e!76873)))

(declare-fun lt!179548 () tuple2!9772)

(assert (=> b!117279 (= res!97000 (or (not (= (size!2395 (buf!2808 (_2!5151 lt!179549))) (size!2395 (buf!2808 (_2!5151 lt!179548))))) (bvslt lt!179550 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117279 (= lt!179550 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9776 0))(
  ( (tuple2!9777 (_1!5153 BitStream!4264) (_2!5153 (_ BitVec 64))) )
))
(declare-fun lt!179540 () tuple2!9776)

(declare-datatypes ((tuple2!9778 0))(
  ( (tuple2!9779 (_1!5154 BitStream!4264) (_2!5154 BitStream!4264)) )
))
(declare-fun lt!179542 () tuple2!9778)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9776)

(assert (=> b!117279 (= lt!179540 (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!179542) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!117279 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179548)))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)) lt!179547)))

(declare-fun lt!179544 () Unit!7213)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4264 array!5279 (_ BitVec 64)) Unit!7213)

(assert (=> b!117279 (= lt!179544 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2808 (_2!5151 lt!179548)) lt!179547))))

(assert (=> b!117279 (= (_2!5152 (readBitPure!0 (_1!5154 lt!179542))) lt!179545)))

(declare-fun lt!179552 () tuple2!9778)

(declare-fun reader!0 (BitStream!4264 BitStream!4264) tuple2!9778)

(assert (=> b!117279 (= lt!179552 (reader!0 (_2!5151 lt!179549) (_2!5151 lt!179548)))))

(assert (=> b!117279 (= lt!179542 (reader!0 thiss!1305 (_2!5151 lt!179548)))))

(declare-fun e!76878 () Bool)

(assert (=> b!117279 e!76878))

(declare-fun res!96997 () Bool)

(assert (=> b!117279 (=> (not res!96997) (not e!76878))))

(declare-fun lt!179539 () tuple2!9774)

(declare-fun lt!179546 () tuple2!9774)

(assert (=> b!117279 (= res!96997 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179539))) (currentByte!5451 (_1!5152 lt!179539)) (currentBit!5446 (_1!5152 lt!179539))) (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179546))) (currentByte!5451 (_1!5152 lt!179546)) (currentBit!5446 (_1!5152 lt!179546)))))))

(declare-fun lt!179541 () Unit!7213)

(declare-fun lt!179543 () BitStream!4264)

(declare-fun readBitPrefixLemma!0 (BitStream!4264 BitStream!4264) Unit!7213)

(assert (=> b!117279 (= lt!179541 (readBitPrefixLemma!0 lt!179543 (_2!5151 lt!179548)))))

(assert (=> b!117279 (= lt!179546 (readBitPure!0 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))))))

(assert (=> b!117279 (= lt!179539 (readBitPure!0 lt!179543))))

(assert (=> b!117279 (= lt!179543 (BitStream!4265 (buf!2808 (_2!5151 lt!179549)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(assert (=> b!117279 e!76879))

(declare-fun res!96999 () Bool)

(assert (=> b!117279 (=> (not res!96999) (not e!76879))))

(assert (=> b!117279 (= res!96999 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179548)))))

(declare-fun lt!179553 () Unit!7213)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4264 BitStream!4264 BitStream!4264) Unit!7213)

(assert (=> b!117279 (= lt!179553 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5151 lt!179549) (_2!5151 lt!179548)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9772)

(assert (=> b!117279 (= lt!179548 (appendNLeastSignificantBitsLoop!0 (_2!5151 lt!179549) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117279 e!76877))

(declare-fun res!97004 () Bool)

(assert (=> b!117279 (=> (not res!97004) (not e!76877))))

(assert (=> b!117279 (= res!97004 (= (size!2395 (buf!2808 thiss!1305)) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(declare-fun appendBit!0 (BitStream!4264 Bool) tuple2!9772)

(assert (=> b!117279 (= lt!179549 (appendBit!0 thiss!1305 lt!179545))))

(assert (=> b!117279 (= lt!179545 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117280 () Bool)

(assert (=> b!117280 (= e!76878 (= (_2!5152 lt!179539) (_2!5152 lt!179546)))))

(declare-fun b!117275 () Bool)

(assert (=> b!117275 (= e!76879 (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179548)))))))

(declare-fun res!97003 () Bool)

(assert (=> start!23108 (=> (not res!97003) (not e!76875))))

(assert (=> start!23108 (= res!97003 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23108 e!76875))

(assert (=> start!23108 true))

(declare-fun inv!12 (BitStream!4264) Bool)

(assert (=> start!23108 (and (inv!12 thiss!1305) e!76872)))

(assert (= (and start!23108 res!97003) b!117278))

(assert (= (and b!117278 res!97002) b!117277))

(assert (= (and b!117277 res!97001) b!117271))

(assert (= (and b!117271 res!97007) b!117279))

(assert (= (and b!117279 res!97004) b!117272))

(assert (= (and b!117272 res!97005) b!117270))

(assert (= (and b!117270 res!97006) b!117273))

(assert (= (and b!117273 res!96998) b!117274))

(assert (= (and b!117279 res!96999) b!117269))

(assert (= (and b!117269 res!97008) b!117275))

(assert (= (and b!117279 res!96997) b!117280))

(assert (= (and b!117279 (not res!97000)) b!117276))

(assert (= start!23108 b!117268))

(declare-fun m!175781 () Bool)

(assert (=> start!23108 m!175781))

(declare-fun m!175783 () Bool)

(assert (=> b!117274 m!175783))

(declare-fun m!175785 () Bool)

(assert (=> b!117275 m!175785))

(declare-fun m!175787 () Bool)

(assert (=> b!117277 m!175787))

(declare-fun m!175789 () Bool)

(assert (=> b!117269 m!175789))

(declare-fun m!175791 () Bool)

(assert (=> b!117276 m!175791))

(declare-fun m!175793 () Bool)

(assert (=> b!117279 m!175793))

(declare-fun m!175795 () Bool)

(assert (=> b!117279 m!175795))

(declare-fun m!175797 () Bool)

(assert (=> b!117279 m!175797))

(declare-fun m!175799 () Bool)

(assert (=> b!117279 m!175799))

(declare-fun m!175801 () Bool)

(assert (=> b!117279 m!175801))

(declare-fun m!175803 () Bool)

(assert (=> b!117279 m!175803))

(declare-fun m!175805 () Bool)

(assert (=> b!117279 m!175805))

(declare-fun m!175807 () Bool)

(assert (=> b!117279 m!175807))

(declare-fun m!175809 () Bool)

(assert (=> b!117279 m!175809))

(declare-fun m!175811 () Bool)

(assert (=> b!117279 m!175811))

(declare-fun m!175813 () Bool)

(assert (=> b!117279 m!175813))

(declare-fun m!175815 () Bool)

(assert (=> b!117279 m!175815))

(declare-fun m!175817 () Bool)

(assert (=> b!117279 m!175817))

(declare-fun m!175819 () Bool)

(assert (=> b!117279 m!175819))

(declare-fun m!175821 () Bool)

(assert (=> b!117279 m!175821))

(declare-fun m!175823 () Bool)

(assert (=> b!117279 m!175823))

(declare-fun m!175825 () Bool)

(assert (=> b!117268 m!175825))

(declare-fun m!175827 () Bool)

(assert (=> b!117270 m!175827))

(declare-fun m!175829 () Bool)

(assert (=> b!117272 m!175829))

(declare-fun m!175831 () Bool)

(assert (=> b!117272 m!175831))

(declare-fun m!175833 () Bool)

(assert (=> b!117278 m!175833))

(declare-fun m!175835 () Bool)

(assert (=> b!117273 m!175835))

(assert (=> b!117273 m!175835))

(declare-fun m!175837 () Bool)

(assert (=> b!117273 m!175837))

(push 1)

(assert (not b!117276))

(assert (not b!117268))

(assert (not b!117269))

(assert (not b!117270))

(assert (not b!117275))

(assert (not b!117277))

(assert (not b!117279))

(assert (not b!117272))

(assert (not b!117278))

(assert (not b!117274))

(assert (not start!23108))

(assert (not b!117273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37542 () Bool)

(declare-datatypes ((tuple2!9800 0))(
  ( (tuple2!9801 (_1!5165 Bool) (_2!5165 BitStream!4264)) )
))
(declare-fun lt!179757 () tuple2!9800)

(declare-fun readBit!0 (BitStream!4264) tuple2!9800)

(assert (=> d!37542 (= lt!179757 (readBit!0 (readerFrom!0 (_2!5151 lt!179549) (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305))))))

(assert (=> d!37542 (= (readBitPure!0 (readerFrom!0 (_2!5151 lt!179549) (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305))) (tuple2!9775 (_2!5165 lt!179757) (_1!5165 lt!179757)))))

(declare-fun bs!9085 () Bool)

(assert (= bs!9085 d!37542))

(assert (=> bs!9085 m!175835))

(declare-fun m!176013 () Bool)

(assert (=> bs!9085 m!176013))

(assert (=> b!117273 d!37542))

(declare-fun d!37544 () Bool)

(declare-fun e!76960 () Bool)

(assert (=> d!37544 e!76960))

(declare-fun res!97113 () Bool)

(assert (=> d!37544 (=> (not res!97113) (not e!76960))))

(assert (=> d!37544 (= res!97113 (invariant!0 (currentBit!5446 (_2!5151 lt!179549)) (currentByte!5451 (_2!5151 lt!179549)) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(assert (=> d!37544 (= (readerFrom!0 (_2!5151 lt!179549) (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305)) (BitStream!4265 (buf!2808 (_2!5151 lt!179549)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(declare-fun b!117397 () Bool)

(assert (=> b!117397 (= e!76960 (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(assert (= (and d!37544 res!97113) b!117397))

(declare-fun m!176015 () Bool)

(assert (=> d!37544 m!176015))

(assert (=> b!117397 m!175789))

(assert (=> b!117273 d!37544))

(declare-fun d!37546 () Bool)

(declare-fun e!76963 () Bool)

(assert (=> d!37546 e!76963))

(declare-fun res!97118 () Bool)

(assert (=> d!37546 (=> (not res!97118) (not e!76963))))

(declare-fun lt!179771 () (_ BitVec 64))

(declare-fun lt!179774 () (_ BitVec 64))

(declare-fun lt!179773 () (_ BitVec 64))

(assert (=> d!37546 (= res!97118 (= lt!179773 (bvsub lt!179771 lt!179774)))))

(assert (=> d!37546 (or (= (bvand lt!179771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179774 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179771 lt!179774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37546 (= lt!179774 (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179551)))) ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179551))) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179551)))))))

(declare-fun lt!179775 () (_ BitVec 64))

(declare-fun lt!179772 () (_ BitVec 64))

(assert (=> d!37546 (= lt!179771 (bvmul lt!179775 lt!179772))))

(assert (=> d!37546 (or (= lt!179775 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179772 (bvsdiv (bvmul lt!179775 lt!179772) lt!179775)))))

(assert (=> d!37546 (= lt!179772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37546 (= lt!179775 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179551)))))))

(assert (=> d!37546 (= lt!179773 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179551))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179551)))))))

(assert (=> d!37546 (invariant!0 (currentBit!5446 (_1!5152 lt!179551)) (currentByte!5451 (_1!5152 lt!179551)) (size!2395 (buf!2808 (_1!5152 lt!179551))))))

(assert (=> d!37546 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179551))) (currentByte!5451 (_1!5152 lt!179551)) (currentBit!5446 (_1!5152 lt!179551))) lt!179773)))

(declare-fun b!117402 () Bool)

(declare-fun res!97119 () Bool)

(assert (=> b!117402 (=> (not res!97119) (not e!76963))))

(assert (=> b!117402 (= res!97119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179773))))

(declare-fun b!117403 () Bool)

(declare-fun lt!179770 () (_ BitVec 64))

(assert (=> b!117403 (= e!76963 (bvsle lt!179773 (bvmul lt!179770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117403 (or (= lt!179770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179770)))))

(assert (=> b!117403 (= lt!179770 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179551)))))))

(assert (= (and d!37546 res!97118) b!117402))

(assert (= (and b!117402 res!97119) b!117403))

(declare-fun m!176017 () Bool)

(assert (=> d!37546 m!176017))

(declare-fun m!176019 () Bool)

(assert (=> d!37546 m!176019))

(assert (=> b!117274 d!37546))

(declare-fun d!37548 () Bool)

(assert (=> d!37548 (= (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179548)))) (and (bvsge (currentBit!5446 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5446 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5451 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179548)))) (and (= (currentBit!5446 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179548))))))))))

(assert (=> b!117275 d!37548))

(declare-fun d!37550 () Bool)

(declare-fun e!76964 () Bool)

(assert (=> d!37550 e!76964))

(declare-fun res!97120 () Bool)

(assert (=> d!37550 (=> (not res!97120) (not e!76964))))

(declare-fun lt!179779 () (_ BitVec 64))

(declare-fun lt!179780 () (_ BitVec 64))

(declare-fun lt!179777 () (_ BitVec 64))

(assert (=> d!37550 (= res!97120 (= lt!179779 (bvsub lt!179777 lt!179780)))))

(assert (=> d!37550 (or (= (bvand lt!179777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179777 lt!179780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37550 (= lt!179780 (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549)))))))

(declare-fun lt!179781 () (_ BitVec 64))

(declare-fun lt!179778 () (_ BitVec 64))

(assert (=> d!37550 (= lt!179777 (bvmul lt!179781 lt!179778))))

(assert (=> d!37550 (or (= lt!179781 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179778 (bvsdiv (bvmul lt!179781 lt!179778) lt!179781)))))

(assert (=> d!37550 (= lt!179778 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37550 (= lt!179781 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(assert (=> d!37550 (= lt!179779 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549)))))))

(assert (=> d!37550 (invariant!0 (currentBit!5446 (_2!5151 lt!179549)) (currentByte!5451 (_2!5151 lt!179549)) (size!2395 (buf!2808 (_2!5151 lt!179549))))))

(assert (=> d!37550 (= (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))) lt!179779)))

(declare-fun b!117404 () Bool)

(declare-fun res!97121 () Bool)

(assert (=> b!117404 (=> (not res!97121) (not e!76964))))

(assert (=> b!117404 (= res!97121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179779))))

(declare-fun b!117405 () Bool)

(declare-fun lt!179776 () (_ BitVec 64))

(assert (=> b!117405 (= e!76964 (bvsle lt!179779 (bvmul lt!179776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117405 (or (= lt!179776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179776)))))

(assert (=> b!117405 (= lt!179776 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(assert (= (and d!37550 res!97120) b!117404))

(assert (= (and b!117404 res!97121) b!117405))

(declare-fun m!176021 () Bool)

(assert (=> d!37550 m!176021))

(assert (=> d!37550 m!176015))

(assert (=> b!117272 d!37550))

(declare-fun d!37552 () Bool)

(declare-fun e!76965 () Bool)

(assert (=> d!37552 e!76965))

(declare-fun res!97122 () Bool)

(assert (=> d!37552 (=> (not res!97122) (not e!76965))))

(declare-fun lt!179785 () (_ BitVec 64))

(declare-fun lt!179783 () (_ BitVec 64))

(declare-fun lt!179786 () (_ BitVec 64))

(assert (=> d!37552 (= res!97122 (= lt!179785 (bvsub lt!179783 lt!179786)))))

(assert (=> d!37552 (or (= (bvand lt!179783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179783 lt!179786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37552 (= lt!179786 (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305))))))

(declare-fun lt!179787 () (_ BitVec 64))

(declare-fun lt!179784 () (_ BitVec 64))

(assert (=> d!37552 (= lt!179783 (bvmul lt!179787 lt!179784))))

(assert (=> d!37552 (or (= lt!179787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179784 (bvsdiv (bvmul lt!179787 lt!179784) lt!179787)))))

(assert (=> d!37552 (= lt!179784 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37552 (= lt!179787 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))))))

(assert (=> d!37552 (= lt!179785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5451 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5446 thiss!1305))))))

(assert (=> d!37552 (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 thiss!1305)))))

(assert (=> d!37552 (= (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)) lt!179785)))

(declare-fun b!117406 () Bool)

(declare-fun res!97123 () Bool)

(assert (=> b!117406 (=> (not res!97123) (not e!76965))))

(assert (=> b!117406 (= res!97123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179785))))

(declare-fun b!117407 () Bool)

(declare-fun lt!179782 () (_ BitVec 64))

(assert (=> b!117407 (= e!76965 (bvsle lt!179785 (bvmul lt!179782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117407 (or (= lt!179782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179782)))))

(assert (=> b!117407 (= lt!179782 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))))))

(assert (= (and d!37552 res!97122) b!117406))

(assert (= (and b!117406 res!97123) b!117407))

(declare-fun m!176023 () Bool)

(assert (=> d!37552 m!176023))

(declare-fun m!176025 () Bool)

(assert (=> d!37552 m!176025))

(assert (=> b!117272 d!37552))

(declare-fun d!37554 () Bool)

(assert (=> d!37554 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 thiss!1305))))))

(declare-fun bs!9086 () Bool)

(assert (= bs!9086 d!37554))

(assert (=> bs!9086 m!176025))

(assert (=> start!23108 d!37554))

(declare-fun d!37556 () Bool)

(assert (=> d!37556 (= (array_inv!2197 (buf!2808 thiss!1305)) (bvsge (size!2395 (buf!2808 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117268 d!37556))

(declare-fun b!117418 () Bool)

(declare-fun res!97133 () Bool)

(declare-fun e!76970 () Bool)

(assert (=> b!117418 (=> (not res!97133) (not e!76970))))

(declare-fun lt!179799 () tuple2!9772)

(assert (=> b!117418 (= res!97133 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179799)))))

(declare-fun d!37558 () Bool)

(assert (=> d!37558 e!76970))

(declare-fun res!97132 () Bool)

(assert (=> d!37558 (=> (not res!97132) (not e!76970))))

(assert (=> d!37558 (= res!97132 (= (size!2395 (buf!2808 thiss!1305)) (size!2395 (buf!2808 (_2!5151 lt!179799)))))))

(declare-fun choose!16 (BitStream!4264 Bool) tuple2!9772)

(assert (=> d!37558 (= lt!179799 (choose!16 thiss!1305 lt!179545))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37558 (validate_offset_bit!0 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)))))

(assert (=> d!37558 (= (appendBit!0 thiss!1305 lt!179545) lt!179799)))

(declare-fun b!117419 () Bool)

(declare-fun e!76971 () Bool)

(assert (=> b!117419 (= e!76970 e!76971)))

(declare-fun res!97135 () Bool)

(assert (=> b!117419 (=> (not res!97135) (not e!76971))))

(declare-fun lt!179797 () tuple2!9774)

(assert (=> b!117419 (= res!97135 (and (= (_2!5152 lt!179797) lt!179545) (= (_1!5152 lt!179797) (_2!5151 lt!179799))))))

(assert (=> b!117419 (= lt!179797 (readBitPure!0 (readerFrom!0 (_2!5151 lt!179799) (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305))))))

(declare-fun b!117420 () Bool)

(assert (=> b!117420 (= e!76971 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179797))) (currentByte!5451 (_1!5152 lt!179797)) (currentBit!5446 (_1!5152 lt!179797))) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179799))) (currentByte!5451 (_2!5151 lt!179799)) (currentBit!5446 (_2!5151 lt!179799)))))))

(declare-fun b!117417 () Bool)

(declare-fun res!97134 () Bool)

(assert (=> b!117417 (=> (not res!97134) (not e!76970))))

(declare-fun lt!179798 () (_ BitVec 64))

(declare-fun lt!179796 () (_ BitVec 64))

(assert (=> b!117417 (= res!97134 (= (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179799))) (currentByte!5451 (_2!5151 lt!179799)) (currentBit!5446 (_2!5151 lt!179799))) (bvadd lt!179798 lt!179796)))))

(assert (=> b!117417 (or (not (= (bvand lt!179798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179796 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!179798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!179798 lt!179796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117417 (= lt!179796 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!117417 (= lt!179798 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(assert (= (and d!37558 res!97132) b!117417))

(assert (= (and b!117417 res!97134) b!117418))

(assert (= (and b!117418 res!97133) b!117419))

(assert (= (and b!117419 res!97135) b!117420))

(declare-fun m!176027 () Bool)

(assert (=> b!117418 m!176027))

(declare-fun m!176029 () Bool)

(assert (=> b!117419 m!176029))

(assert (=> b!117419 m!176029))

(declare-fun m!176031 () Bool)

(assert (=> b!117419 m!176031))

(declare-fun m!176033 () Bool)

(assert (=> b!117420 m!176033))

(declare-fun m!176035 () Bool)

(assert (=> b!117420 m!176035))

(declare-fun m!176037 () Bool)

(assert (=> d!37558 m!176037))

(declare-fun m!176039 () Bool)

(assert (=> d!37558 m!176039))

(assert (=> b!117417 m!176035))

(assert (=> b!117417 m!175831))

(assert (=> b!117279 d!37558))

(declare-fun d!37562 () Bool)

(declare-fun lt!179800 () tuple2!9800)

(assert (=> d!37562 (= lt!179800 (readBit!0 (_1!5154 lt!179542)))))

(assert (=> d!37562 (= (readBitPure!0 (_1!5154 lt!179542)) (tuple2!9775 (_2!5165 lt!179800) (_1!5165 lt!179800)))))

(declare-fun bs!9087 () Bool)

(assert (= bs!9087 d!37562))

(declare-fun m!176041 () Bool)

(assert (=> bs!9087 m!176041))

(assert (=> b!117279 d!37562))

(declare-fun d!37564 () Bool)

(declare-fun e!76981 () Bool)

(assert (=> d!37564 e!76981))

(declare-fun res!97152 () Bool)

(assert (=> d!37564 (=> (not res!97152) (not e!76981))))

(declare-fun lt!179887 () tuple2!9778)

(assert (=> d!37564 (= res!97152 (isPrefixOf!0 (_1!5154 lt!179887) (_2!5154 lt!179887)))))

(declare-fun lt!179877 () BitStream!4264)

(assert (=> d!37564 (= lt!179887 (tuple2!9779 lt!179877 (_2!5151 lt!179548)))))

(declare-fun lt!179886 () Unit!7213)

(declare-fun lt!179883 () Unit!7213)

(assert (=> d!37564 (= lt!179886 lt!179883)))

(assert (=> d!37564 (isPrefixOf!0 lt!179877 (_2!5151 lt!179548))))

(assert (=> d!37564 (= lt!179883 (lemmaIsPrefixTransitive!0 lt!179877 (_2!5151 lt!179548) (_2!5151 lt!179548)))))

(declare-fun lt!179878 () Unit!7213)

(declare-fun lt!179880 () Unit!7213)

(assert (=> d!37564 (= lt!179878 lt!179880)))

(assert (=> d!37564 (isPrefixOf!0 lt!179877 (_2!5151 lt!179548))))

(assert (=> d!37564 (= lt!179880 (lemmaIsPrefixTransitive!0 lt!179877 (_2!5151 lt!179549) (_2!5151 lt!179548)))))

(declare-fun lt!179879 () Unit!7213)

(declare-fun e!76980 () Unit!7213)

(assert (=> d!37564 (= lt!179879 e!76980)))

(declare-fun c!7066 () Bool)

(assert (=> d!37564 (= c!7066 (not (= (size!2395 (buf!2808 (_2!5151 lt!179549))) #b00000000000000000000000000000000)))))

(declare-fun lt!179876 () Unit!7213)

(declare-fun lt!179872 () Unit!7213)

(assert (=> d!37564 (= lt!179876 lt!179872)))

(assert (=> d!37564 (isPrefixOf!0 (_2!5151 lt!179548) (_2!5151 lt!179548))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4264) Unit!7213)

(assert (=> d!37564 (= lt!179872 (lemmaIsPrefixRefl!0 (_2!5151 lt!179548)))))

(declare-fun lt!179870 () Unit!7213)

(declare-fun lt!179875 () Unit!7213)

(assert (=> d!37564 (= lt!179870 lt!179875)))

(assert (=> d!37564 (= lt!179875 (lemmaIsPrefixRefl!0 (_2!5151 lt!179548)))))

(declare-fun lt!179885 () Unit!7213)

(declare-fun lt!179873 () Unit!7213)

(assert (=> d!37564 (= lt!179885 lt!179873)))

(assert (=> d!37564 (isPrefixOf!0 lt!179877 lt!179877)))

(assert (=> d!37564 (= lt!179873 (lemmaIsPrefixRefl!0 lt!179877))))

(declare-fun lt!179882 () Unit!7213)

(declare-fun lt!179874 () Unit!7213)

(assert (=> d!37564 (= lt!179882 lt!179874)))

(assert (=> d!37564 (isPrefixOf!0 (_2!5151 lt!179549) (_2!5151 lt!179549))))

(assert (=> d!37564 (= lt!179874 (lemmaIsPrefixRefl!0 (_2!5151 lt!179549)))))

(assert (=> d!37564 (= lt!179877 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(assert (=> d!37564 (isPrefixOf!0 (_2!5151 lt!179549) (_2!5151 lt!179548))))

(assert (=> d!37564 (= (reader!0 (_2!5151 lt!179549) (_2!5151 lt!179548)) lt!179887)))

(declare-fun b!117439 () Bool)

(declare-fun lt!179871 () Unit!7213)

(assert (=> b!117439 (= e!76980 lt!179871)))

(declare-fun lt!179868 () (_ BitVec 64))

(assert (=> b!117439 (= lt!179868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!179884 () (_ BitVec 64))

(assert (=> b!117439 (= lt!179884 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5279 array!5279 (_ BitVec 64) (_ BitVec 64)) Unit!7213)

(assert (=> b!117439 (= lt!179871 (arrayBitRangesEqSymmetric!0 (buf!2808 (_2!5151 lt!179549)) (buf!2808 (_2!5151 lt!179548)) lt!179868 lt!179884))))

(declare-fun arrayBitRangesEq!0 (array!5279 array!5279 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117439 (arrayBitRangesEq!0 (buf!2808 (_2!5151 lt!179548)) (buf!2808 (_2!5151 lt!179549)) lt!179868 lt!179884)))

(declare-fun lt!179881 () (_ BitVec 64))

(declare-fun b!117440 () Bool)

(declare-fun lt!179869 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4264 (_ BitVec 64)) BitStream!4264)

(assert (=> b!117440 (= e!76981 (= (_1!5154 lt!179887) (withMovedBitIndex!0 (_2!5154 lt!179887) (bvsub lt!179881 lt!179869))))))

(assert (=> b!117440 (or (= (bvand lt!179881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179881 lt!179869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117440 (= lt!179869 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179548))) (currentByte!5451 (_2!5151 lt!179548)) (currentBit!5446 (_2!5151 lt!179548))))))

(assert (=> b!117440 (= lt!179881 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(declare-fun b!117441 () Bool)

(declare-fun res!97151 () Bool)

(assert (=> b!117441 (=> (not res!97151) (not e!76981))))

(assert (=> b!117441 (= res!97151 (isPrefixOf!0 (_1!5154 lt!179887) (_2!5151 lt!179549)))))

(declare-fun b!117442 () Bool)

(declare-fun res!97150 () Bool)

(assert (=> b!117442 (=> (not res!97150) (not e!76981))))

(assert (=> b!117442 (= res!97150 (isPrefixOf!0 (_2!5154 lt!179887) (_2!5151 lt!179548)))))

(declare-fun b!117443 () Bool)

(declare-fun Unit!7228 () Unit!7213)

(assert (=> b!117443 (= e!76980 Unit!7228)))

(assert (= (and d!37564 c!7066) b!117439))

(assert (= (and d!37564 (not c!7066)) b!117443))

(assert (= (and d!37564 res!97152) b!117441))

(assert (= (and b!117441 res!97151) b!117442))

(assert (= (and b!117442 res!97150) b!117440))

(assert (=> b!117439 m!175829))

(declare-fun m!176053 () Bool)

(assert (=> b!117439 m!176053))

(declare-fun m!176055 () Bool)

(assert (=> b!117439 m!176055))

(declare-fun m!176057 () Bool)

(assert (=> d!37564 m!176057))

(declare-fun m!176059 () Bool)

(assert (=> d!37564 m!176059))

(declare-fun m!176061 () Bool)

(assert (=> d!37564 m!176061))

(declare-fun m!176063 () Bool)

(assert (=> d!37564 m!176063))

(declare-fun m!176065 () Bool)

(assert (=> d!37564 m!176065))

(declare-fun m!176067 () Bool)

(assert (=> d!37564 m!176067))

(declare-fun m!176069 () Bool)

(assert (=> d!37564 m!176069))

(declare-fun m!176071 () Bool)

(assert (=> d!37564 m!176071))

(declare-fun m!176073 () Bool)

(assert (=> d!37564 m!176073))

(declare-fun m!176075 () Bool)

(assert (=> d!37564 m!176075))

(declare-fun m!176077 () Bool)

(assert (=> d!37564 m!176077))

(declare-fun m!176079 () Bool)

(assert (=> b!117440 m!176079))

(declare-fun m!176081 () Bool)

(assert (=> b!117440 m!176081))

(assert (=> b!117440 m!175829))

(declare-fun m!176083 () Bool)

(assert (=> b!117441 m!176083))

(declare-fun m!176085 () Bool)

(assert (=> b!117442 m!176085))

(assert (=> b!117279 d!37564))

(declare-fun d!37582 () Bool)

(declare-fun e!76988 () Bool)

(assert (=> d!37582 e!76988))

(declare-fun res!97161 () Bool)

(assert (=> d!37582 (=> (not res!97161) (not e!76988))))

(declare-fun lt!179937 () tuple2!9774)

(declare-fun lt!179936 () tuple2!9774)

(assert (=> d!37582 (= res!97161 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179937))) (currentByte!5451 (_1!5152 lt!179937)) (currentBit!5446 (_1!5152 lt!179937))) (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179936))) (currentByte!5451 (_1!5152 lt!179936)) (currentBit!5446 (_1!5152 lt!179936)))))))

(declare-fun lt!179938 () BitStream!4264)

(declare-fun lt!179939 () Unit!7213)

(declare-fun choose!50 (BitStream!4264 BitStream!4264 BitStream!4264 tuple2!9774 tuple2!9774 BitStream!4264 Bool tuple2!9774 tuple2!9774 BitStream!4264 Bool) Unit!7213)

(assert (=> d!37582 (= lt!179939 (choose!50 lt!179543 (_2!5151 lt!179548) lt!179938 lt!179937 (tuple2!9775 (_1!5152 lt!179937) (_2!5152 lt!179937)) (_1!5152 lt!179937) (_2!5152 lt!179937) lt!179936 (tuple2!9775 (_1!5152 lt!179936) (_2!5152 lt!179936)) (_1!5152 lt!179936) (_2!5152 lt!179936)))))

(assert (=> d!37582 (= lt!179936 (readBitPure!0 lt!179938))))

(assert (=> d!37582 (= lt!179937 (readBitPure!0 lt!179543))))

(assert (=> d!37582 (= lt!179938 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 lt!179543) (currentBit!5446 lt!179543)))))

(assert (=> d!37582 (invariant!0 (currentBit!5446 lt!179543) (currentByte!5451 lt!179543) (size!2395 (buf!2808 (_2!5151 lt!179548))))))

(assert (=> d!37582 (= (readBitPrefixLemma!0 lt!179543 (_2!5151 lt!179548)) lt!179939)))

(declare-fun b!117456 () Bool)

(assert (=> b!117456 (= e!76988 (= (_2!5152 lt!179937) (_2!5152 lt!179936)))))

(assert (= (and d!37582 res!97161) b!117456))

(declare-fun m!176087 () Bool)

(assert (=> d!37582 m!176087))

(declare-fun m!176089 () Bool)

(assert (=> d!37582 m!176089))

(assert (=> d!37582 m!175797))

(declare-fun m!176091 () Bool)

(assert (=> d!37582 m!176091))

(declare-fun m!176093 () Bool)

(assert (=> d!37582 m!176093))

(declare-fun m!176095 () Bool)

(assert (=> d!37582 m!176095))

(assert (=> b!117279 d!37582))

(declare-fun d!37584 () Bool)

(declare-fun e!76990 () Bool)

(assert (=> d!37584 e!76990))

(declare-fun res!97164 () Bool)

(assert (=> d!37584 (=> (not res!97164) (not e!76990))))

(declare-fun lt!179959 () tuple2!9778)

(assert (=> d!37584 (= res!97164 (isPrefixOf!0 (_1!5154 lt!179959) (_2!5154 lt!179959)))))

(declare-fun lt!179949 () BitStream!4264)

(assert (=> d!37584 (= lt!179959 (tuple2!9779 lt!179949 (_2!5151 lt!179548)))))

(declare-fun lt!179958 () Unit!7213)

(declare-fun lt!179955 () Unit!7213)

(assert (=> d!37584 (= lt!179958 lt!179955)))

(assert (=> d!37584 (isPrefixOf!0 lt!179949 (_2!5151 lt!179548))))

(assert (=> d!37584 (= lt!179955 (lemmaIsPrefixTransitive!0 lt!179949 (_2!5151 lt!179548) (_2!5151 lt!179548)))))

(declare-fun lt!179950 () Unit!7213)

(declare-fun lt!179952 () Unit!7213)

(assert (=> d!37584 (= lt!179950 lt!179952)))

(assert (=> d!37584 (isPrefixOf!0 lt!179949 (_2!5151 lt!179548))))

(assert (=> d!37584 (= lt!179952 (lemmaIsPrefixTransitive!0 lt!179949 thiss!1305 (_2!5151 lt!179548)))))

(declare-fun lt!179951 () Unit!7213)

(declare-fun e!76989 () Unit!7213)

(assert (=> d!37584 (= lt!179951 e!76989)))

(declare-fun c!7069 () Bool)

(assert (=> d!37584 (= c!7069 (not (= (size!2395 (buf!2808 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!179948 () Unit!7213)

(declare-fun lt!179944 () Unit!7213)

(assert (=> d!37584 (= lt!179948 lt!179944)))

(assert (=> d!37584 (isPrefixOf!0 (_2!5151 lt!179548) (_2!5151 lt!179548))))

(assert (=> d!37584 (= lt!179944 (lemmaIsPrefixRefl!0 (_2!5151 lt!179548)))))

(declare-fun lt!179942 () Unit!7213)

(declare-fun lt!179947 () Unit!7213)

(assert (=> d!37584 (= lt!179942 lt!179947)))

(assert (=> d!37584 (= lt!179947 (lemmaIsPrefixRefl!0 (_2!5151 lt!179548)))))

(declare-fun lt!179957 () Unit!7213)

(declare-fun lt!179945 () Unit!7213)

(assert (=> d!37584 (= lt!179957 lt!179945)))

(assert (=> d!37584 (isPrefixOf!0 lt!179949 lt!179949)))

(assert (=> d!37584 (= lt!179945 (lemmaIsPrefixRefl!0 lt!179949))))

(declare-fun lt!179954 () Unit!7213)

(declare-fun lt!179946 () Unit!7213)

(assert (=> d!37584 (= lt!179954 lt!179946)))

(assert (=> d!37584 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37584 (= lt!179946 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37584 (= lt!179949 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(assert (=> d!37584 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179548))))

(assert (=> d!37584 (= (reader!0 thiss!1305 (_2!5151 lt!179548)) lt!179959)))

(declare-fun b!117457 () Bool)

(declare-fun lt!179943 () Unit!7213)

(assert (=> b!117457 (= e!76989 lt!179943)))

(declare-fun lt!179940 () (_ BitVec 64))

(assert (=> b!117457 (= lt!179940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!179956 () (_ BitVec 64))

(assert (=> b!117457 (= lt!179956 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(assert (=> b!117457 (= lt!179943 (arrayBitRangesEqSymmetric!0 (buf!2808 thiss!1305) (buf!2808 (_2!5151 lt!179548)) lt!179940 lt!179956))))

(assert (=> b!117457 (arrayBitRangesEq!0 (buf!2808 (_2!5151 lt!179548)) (buf!2808 thiss!1305) lt!179940 lt!179956)))

(declare-fun lt!179941 () (_ BitVec 64))

(declare-fun b!117458 () Bool)

(declare-fun lt!179953 () (_ BitVec 64))

(assert (=> b!117458 (= e!76990 (= (_1!5154 lt!179959) (withMovedBitIndex!0 (_2!5154 lt!179959) (bvsub lt!179953 lt!179941))))))

(assert (=> b!117458 (or (= (bvand lt!179953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179953 lt!179941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117458 (= lt!179941 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179548))) (currentByte!5451 (_2!5151 lt!179548)) (currentBit!5446 (_2!5151 lt!179548))))))

(assert (=> b!117458 (= lt!179953 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)))))

(declare-fun b!117459 () Bool)

(declare-fun res!97163 () Bool)

(assert (=> b!117459 (=> (not res!97163) (not e!76990))))

(assert (=> b!117459 (= res!97163 (isPrefixOf!0 (_1!5154 lt!179959) thiss!1305))))

(declare-fun b!117460 () Bool)

(declare-fun res!97162 () Bool)

(assert (=> b!117460 (=> (not res!97162) (not e!76990))))

(assert (=> b!117460 (= res!97162 (isPrefixOf!0 (_2!5154 lt!179959) (_2!5151 lt!179548)))))

(declare-fun b!117461 () Bool)

(declare-fun Unit!7229 () Unit!7213)

(assert (=> b!117461 (= e!76989 Unit!7229)))

(assert (= (and d!37584 c!7069) b!117457))

(assert (= (and d!37584 (not c!7069)) b!117461))

(assert (= (and d!37584 res!97164) b!117459))

(assert (= (and b!117459 res!97163) b!117460))

(assert (= (and b!117460 res!97162) b!117458))

(assert (=> b!117457 m!175831))

(declare-fun m!176097 () Bool)

(assert (=> b!117457 m!176097))

(declare-fun m!176099 () Bool)

(assert (=> b!117457 m!176099))

(declare-fun m!176101 () Bool)

(assert (=> d!37584 m!176101))

(declare-fun m!176103 () Bool)

(assert (=> d!37584 m!176103))

(assert (=> d!37584 m!176061))

(assert (=> d!37584 m!175815))

(declare-fun m!176105 () Bool)

(assert (=> d!37584 m!176105))

(declare-fun m!176107 () Bool)

(assert (=> d!37584 m!176107))

(assert (=> d!37584 m!176069))

(declare-fun m!176109 () Bool)

(assert (=> d!37584 m!176109))

(declare-fun m!176111 () Bool)

(assert (=> d!37584 m!176111))

(declare-fun m!176113 () Bool)

(assert (=> d!37584 m!176113))

(declare-fun m!176115 () Bool)

(assert (=> d!37584 m!176115))

(declare-fun m!176117 () Bool)

(assert (=> b!117458 m!176117))

(assert (=> b!117458 m!176081))

(assert (=> b!117458 m!175831))

(declare-fun m!176119 () Bool)

(assert (=> b!117459 m!176119))

(declare-fun m!176121 () Bool)

(assert (=> b!117460 m!176121))

(assert (=> b!117279 d!37584))

(declare-fun d!37586 () Bool)

(declare-fun e!76993 () Bool)

(assert (=> d!37586 e!76993))

(declare-fun res!97168 () Bool)

(assert (=> d!37586 (=> (not res!97168) (not e!76993))))

(declare-fun lt!179984 () (_ BitVec 64))

(declare-fun lt!179981 () (_ BitVec 64))

(declare-fun lt!179983 () (_ BitVec 64))

(assert (=> d!37586 (= res!97168 (= lt!179983 (bvsub lt!179981 lt!179984)))))

(assert (=> d!37586 (or (= (bvand lt!179981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179981 lt!179984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37586 (= lt!179984 (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179546)))) ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179546))) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179546)))))))

(declare-fun lt!179985 () (_ BitVec 64))

(declare-fun lt!179982 () (_ BitVec 64))

(assert (=> d!37586 (= lt!179981 (bvmul lt!179985 lt!179982))))

(assert (=> d!37586 (or (= lt!179985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179982 (bvsdiv (bvmul lt!179985 lt!179982) lt!179985)))))

(assert (=> d!37586 (= lt!179982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37586 (= lt!179985 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179546)))))))

(assert (=> d!37586 (= lt!179983 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179546)))))))

(assert (=> d!37586 (invariant!0 (currentBit!5446 (_1!5152 lt!179546)) (currentByte!5451 (_1!5152 lt!179546)) (size!2395 (buf!2808 (_1!5152 lt!179546))))))

(assert (=> d!37586 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179546))) (currentByte!5451 (_1!5152 lt!179546)) (currentBit!5446 (_1!5152 lt!179546))) lt!179983)))

(declare-fun b!117467 () Bool)

(declare-fun res!97169 () Bool)

(assert (=> b!117467 (=> (not res!97169) (not e!76993))))

(assert (=> b!117467 (= res!97169 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179983))))

(declare-fun b!117468 () Bool)

(declare-fun lt!179980 () (_ BitVec 64))

(assert (=> b!117468 (= e!76993 (bvsle lt!179983 (bvmul lt!179980 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117468 (or (= lt!179980 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179980 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179980)))))

(assert (=> b!117468 (= lt!179980 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179546)))))))

(assert (= (and d!37586 res!97168) b!117467))

(assert (= (and b!117467 res!97169) b!117468))

(declare-fun m!176137 () Bool)

(assert (=> d!37586 m!176137))

(declare-fun m!176141 () Bool)

(assert (=> d!37586 m!176141))

(assert (=> b!117279 d!37586))

(declare-fun d!37588 () Bool)

(declare-fun e!76994 () Bool)

(assert (=> d!37588 e!76994))

(declare-fun res!97170 () Bool)

(assert (=> d!37588 (=> (not res!97170) (not e!76994))))

(declare-fun lt!179990 () (_ BitVec 64))

(declare-fun lt!179989 () (_ BitVec 64))

(declare-fun lt!179987 () (_ BitVec 64))

(assert (=> d!37588 (= res!97170 (= lt!179989 (bvsub lt!179987 lt!179990)))))

(assert (=> d!37588 (or (= (bvand lt!179987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179987 lt!179990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37588 (= lt!179990 (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179539)))) ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179539))) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179539)))))))

(declare-fun lt!179991 () (_ BitVec 64))

(declare-fun lt!179988 () (_ BitVec 64))

(assert (=> d!37588 (= lt!179987 (bvmul lt!179991 lt!179988))))

(assert (=> d!37588 (or (= lt!179991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179988 (bvsdiv (bvmul lt!179991 lt!179988) lt!179991)))))

(assert (=> d!37588 (= lt!179988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37588 (= lt!179991 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179539)))))))

(assert (=> d!37588 (= lt!179989 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5451 (_1!5152 lt!179539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5446 (_1!5152 lt!179539)))))))

(assert (=> d!37588 (invariant!0 (currentBit!5446 (_1!5152 lt!179539)) (currentByte!5451 (_1!5152 lt!179539)) (size!2395 (buf!2808 (_1!5152 lt!179539))))))

(assert (=> d!37588 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!179539))) (currentByte!5451 (_1!5152 lt!179539)) (currentBit!5446 (_1!5152 lt!179539))) lt!179989)))

(declare-fun b!117469 () Bool)

(declare-fun res!97171 () Bool)

(assert (=> b!117469 (=> (not res!97171) (not e!76994))))

(assert (=> b!117469 (= res!97171 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179989))))

(declare-fun b!117470 () Bool)

(declare-fun lt!179986 () (_ BitVec 64))

(assert (=> b!117470 (= e!76994 (bvsle lt!179989 (bvmul lt!179986 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117470 (or (= lt!179986 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179986 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179986)))))

(assert (=> b!117470 (= lt!179986 ((_ sign_extend 32) (size!2395 (buf!2808 (_1!5152 lt!179539)))))))

(assert (= (and d!37588 res!97170) b!117469))

(assert (= (and b!117469 res!97171) b!117470))

(declare-fun m!176159 () Bool)

(assert (=> d!37588 m!176159))

(declare-fun m!176161 () Bool)

(assert (=> d!37588 m!176161))

(assert (=> b!117279 d!37588))

(declare-datatypes ((tuple2!9804 0))(
  ( (tuple2!9805 (_1!5167 (_ BitVec 64)) (_2!5167 BitStream!4264)) )
))
(declare-fun lt!179994 () tuple2!9804)

(declare-fun d!37592 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9804)

(assert (=> d!37592 (= lt!179994 (readNLeastSignificantBitsLoop!0 (_1!5154 lt!179542) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37592 (= (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!179542) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9777 (_2!5167 lt!179994) (_1!5167 lt!179994)))))

(declare-fun bs!9091 () Bool)

(assert (= bs!9091 d!37592))

(declare-fun m!176163 () Bool)

(assert (=> bs!9091 m!176163))

(assert (=> b!117279 d!37592))

(declare-fun d!37594 () Bool)

(declare-fun lt!179995 () tuple2!9800)

(assert (=> d!37594 (= lt!179995 (readBit!0 lt!179543))))

(assert (=> d!37594 (= (readBitPure!0 lt!179543) (tuple2!9775 (_2!5165 lt!179995) (_1!5165 lt!179995)))))

(declare-fun bs!9092 () Bool)

(assert (= bs!9092 d!37594))

(declare-fun m!176165 () Bool)

(assert (=> bs!9092 m!176165))

(assert (=> b!117279 d!37594))

(declare-fun d!37596 () Bool)

(assert (=> d!37596 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179548)))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)) lt!179547)))

(declare-fun lt!179998 () Unit!7213)

(declare-fun choose!9 (BitStream!4264 array!5279 (_ BitVec 64) BitStream!4264) Unit!7213)

(assert (=> d!37596 (= lt!179998 (choose!9 thiss!1305 (buf!2808 (_2!5151 lt!179548)) lt!179547 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))))))

(assert (=> d!37596 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2808 (_2!5151 lt!179548)) lt!179547) lt!179998)))

(declare-fun bs!9093 () Bool)

(assert (= bs!9093 d!37596))

(assert (=> bs!9093 m!175805))

(declare-fun m!176167 () Bool)

(assert (=> bs!9093 m!176167))

(assert (=> b!117279 d!37596))

(declare-fun d!37598 () Bool)

(assert (=> d!37598 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179548))))

(declare-fun lt!180013 () Unit!7213)

(declare-fun choose!30 (BitStream!4264 BitStream!4264 BitStream!4264) Unit!7213)

(assert (=> d!37598 (= lt!180013 (choose!30 thiss!1305 (_2!5151 lt!179549) (_2!5151 lt!179548)))))

(assert (=> d!37598 (isPrefixOf!0 thiss!1305 (_2!5151 lt!179549))))

(assert (=> d!37598 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5151 lt!179549) (_2!5151 lt!179548)) lt!180013)))

(declare-fun bs!9094 () Bool)

(assert (= bs!9094 d!37598))

(assert (=> bs!9094 m!175815))

(declare-fun m!176169 () Bool)

(assert (=> bs!9094 m!176169))

(assert (=> bs!9094 m!175827))

(assert (=> b!117279 d!37598))

(declare-fun d!37600 () Bool)

(declare-fun res!97183 () Bool)

(declare-fun e!77004 () Bool)

(assert (=> d!37600 (=> (not res!97183) (not e!77004))))

(assert (=> d!37600 (= res!97183 (= (size!2395 (buf!2808 thiss!1305)) (size!2395 (buf!2808 (_2!5151 lt!179548)))))))

(assert (=> d!37600 (= (isPrefixOf!0 thiss!1305 (_2!5151 lt!179548)) e!77004)))

(declare-fun b!117482 () Bool)

(declare-fun res!97184 () Bool)

(assert (=> b!117482 (=> (not res!97184) (not e!77004))))

(assert (=> b!117482 (= res!97184 (bvsle (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179548))) (currentByte!5451 (_2!5151 lt!179548)) (currentBit!5446 (_2!5151 lt!179548)))))))

(declare-fun b!117483 () Bool)

(declare-fun e!77003 () Bool)

(assert (=> b!117483 (= e!77004 e!77003)))

(declare-fun res!97185 () Bool)

(assert (=> b!117483 (=> res!97185 e!77003)))

(assert (=> b!117483 (= res!97185 (= (size!2395 (buf!2808 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117484 () Bool)

(assert (=> b!117484 (= e!77003 (arrayBitRangesEq!0 (buf!2808 thiss!1305) (buf!2808 (_2!5151 lt!179548)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))))))

(assert (= (and d!37600 res!97183) b!117482))

(assert (= (and b!117482 res!97184) b!117483))

(assert (= (and b!117483 (not res!97185)) b!117484))

(assert (=> b!117482 m!175831))

(assert (=> b!117482 m!176081))

(assert (=> b!117484 m!175831))

(assert (=> b!117484 m!175831))

(declare-fun m!176189 () Bool)

(assert (=> b!117484 m!176189))

(assert (=> b!117279 d!37600))

(declare-fun d!37610 () Bool)

(assert (=> d!37610 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117279 d!37610))

(declare-fun d!37612 () Bool)

(declare-fun lt!180023 () tuple2!9800)

(assert (=> d!37612 (= lt!180023 (readBit!0 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))))))

(assert (=> d!37612 (= (readBitPure!0 (BitStream!4265 (buf!2808 (_2!5151 lt!179548)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))) (tuple2!9775 (_2!5165 lt!180023) (_1!5165 lt!180023)))))

(declare-fun bs!9097 () Bool)

(assert (= bs!9097 d!37612))

(declare-fun m!176191 () Bool)

(assert (=> bs!9097 m!176191))

(assert (=> b!117279 d!37612))

(declare-fun d!37614 () Bool)

(assert (=> d!37614 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179548)))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)) lt!179547) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179548)))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305))) lt!179547))))

(declare-fun bs!9098 () Bool)

(assert (= bs!9098 d!37614))

(declare-fun m!176193 () Bool)

(assert (=> bs!9098 m!176193))

(assert (=> b!117279 d!37614))

(declare-fun b!117633 () Bool)

(declare-fun e!77093 () (_ BitVec 64))

(assert (=> b!117633 (= e!77093 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!117634 () Bool)

(declare-fun e!77087 () tuple2!9772)

(declare-fun lt!180504 () Unit!7213)

(assert (=> b!117634 (= e!77087 (tuple2!9773 lt!180504 (_2!5151 lt!179549)))))

(declare-fun lt!180498 () BitStream!4264)

(assert (=> b!117634 (= lt!180498 (_2!5151 lt!179549))))

(assert (=> b!117634 (= lt!180504 (lemmaIsPrefixRefl!0 lt!180498))))

(declare-fun call!1526 () Bool)

(assert (=> b!117634 call!1526))

(declare-fun b!117635 () Bool)

(declare-fun res!97302 () Bool)

(declare-fun lt!180489 () tuple2!9772)

(assert (=> b!117635 (= res!97302 (= (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180489))) (currentByte!5451 (_2!5151 lt!180489)) (currentBit!5446 (_2!5151 lt!180489))) (bvadd (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!77090 () Bool)

(assert (=> b!117635 (=> (not res!97302) (not e!77090))))

(declare-fun d!37616 () Bool)

(declare-fun e!77092 () Bool)

(assert (=> d!37616 e!77092))

(declare-fun res!97301 () Bool)

(assert (=> d!37616 (=> (not res!97301) (not e!77092))))

(declare-fun lt!180470 () tuple2!9772)

(assert (=> d!37616 (= res!97301 (= (size!2395 (buf!2808 (_2!5151 lt!179549))) (size!2395 (buf!2808 (_2!5151 lt!180470)))))))

(assert (=> d!37616 (= lt!180470 e!77087)))

(declare-fun c!7089 () Bool)

(assert (=> d!37616 (= c!7089 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37616 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37616 (= (appendNLeastSignificantBitsLoop!0 (_2!5151 lt!179549) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!180470)))

(declare-fun b!117636 () Bool)

(declare-fun res!97300 () Bool)

(assert (=> b!117636 (= res!97300 call!1526)))

(assert (=> b!117636 (=> (not res!97300) (not e!77090))))

(declare-fun b!117637 () Bool)

(declare-fun e!77091 () Bool)

(declare-fun lt!180476 () (_ BitVec 64))

(assert (=> b!117637 (= e!77091 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549))) lt!180476))))

(declare-fun b!117638 () Bool)

(declare-fun e!77088 () Bool)

(declare-fun lt!180482 () tuple2!9774)

(assert (=> b!117638 (= e!77088 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!180482))) (currentByte!5451 (_1!5152 lt!180482)) (currentBit!5446 (_1!5152 lt!180482))) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180489))) (currentByte!5451 (_2!5151 lt!180489)) (currentBit!5446 (_2!5151 lt!180489)))))))

(declare-fun b!117639 () Bool)

(declare-fun e!77089 () Bool)

(declare-fun lt!180507 () tuple2!9774)

(declare-fun lt!180501 () tuple2!9774)

(assert (=> b!117639 (= e!77089 (= (_2!5152 lt!180507) (_2!5152 lt!180501)))))

(declare-fun b!117640 () Bool)

(assert (=> b!117640 (= lt!180482 (readBitPure!0 (readerFrom!0 (_2!5151 lt!180489) (currentBit!5446 (_2!5151 lt!179549)) (currentByte!5451 (_2!5151 lt!179549)))))))

(declare-fun lt!180484 () Bool)

(declare-fun res!97307 () Bool)

(assert (=> b!117640 (= res!97307 (and (= (_2!5152 lt!180482) lt!180484) (= (_1!5152 lt!180482) (_2!5151 lt!180489))))))

(assert (=> b!117640 (=> (not res!97307) (not e!77088))))

(assert (=> b!117640 (= e!77090 e!77088)))

(declare-fun b!117641 () Bool)

(declare-fun lt!180478 () tuple2!9772)

(declare-fun Unit!7231 () Unit!7213)

(assert (=> b!117641 (= e!77087 (tuple2!9773 Unit!7231 (_2!5151 lt!180478)))))

(assert (=> b!117641 (= lt!180484 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117641 (= lt!180489 (appendBit!0 (_2!5151 lt!179549) lt!180484))))

(declare-fun res!97308 () Bool)

(assert (=> b!117641 (= res!97308 (= (size!2395 (buf!2808 (_2!5151 lt!179549))) (size!2395 (buf!2808 (_2!5151 lt!180489)))))))

(assert (=> b!117641 (=> (not res!97308) (not e!77090))))

(assert (=> b!117641 e!77090))

(declare-fun lt!180464 () tuple2!9772)

(assert (=> b!117641 (= lt!180464 lt!180489)))

(assert (=> b!117641 (= lt!180478 (appendNLeastSignificantBitsLoop!0 (_2!5151 lt!180464) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!180479 () Unit!7213)

(assert (=> b!117641 (= lt!180479 (lemmaIsPrefixTransitive!0 (_2!5151 lt!179549) (_2!5151 lt!180464) (_2!5151 lt!180478)))))

(assert (=> b!117641 (isPrefixOf!0 (_2!5151 lt!179549) (_2!5151 lt!180478))))

(declare-fun lt!180488 () Unit!7213)

(assert (=> b!117641 (= lt!180488 lt!180479)))

(assert (=> b!117641 (invariant!0 (currentBit!5446 (_2!5151 lt!179549)) (currentByte!5451 (_2!5151 lt!179549)) (size!2395 (buf!2808 (_2!5151 lt!180464))))))

(declare-fun lt!180483 () BitStream!4264)

(assert (=> b!117641 (= lt!180483 (BitStream!4265 (buf!2808 (_2!5151 lt!180464)) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(assert (=> b!117641 (invariant!0 (currentBit!5446 lt!180483) (currentByte!5451 lt!180483) (size!2395 (buf!2808 (_2!5151 lt!180478))))))

(declare-fun lt!180492 () BitStream!4264)

(assert (=> b!117641 (= lt!180492 (BitStream!4265 (buf!2808 (_2!5151 lt!180478)) (currentByte!5451 lt!180483) (currentBit!5446 lt!180483)))))

(assert (=> b!117641 (= lt!180507 (readBitPure!0 lt!180483))))

(assert (=> b!117641 (= lt!180501 (readBitPure!0 lt!180492))))

(declare-fun lt!180500 () Unit!7213)

(assert (=> b!117641 (= lt!180500 (readBitPrefixLemma!0 lt!180483 (_2!5151 lt!180478)))))

(declare-fun res!97304 () Bool)

(assert (=> b!117641 (= res!97304 (= (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!180507))) (currentByte!5451 (_1!5152 lt!180507)) (currentBit!5446 (_1!5152 lt!180507))) (bitIndex!0 (size!2395 (buf!2808 (_1!5152 lt!180501))) (currentByte!5451 (_1!5152 lt!180501)) (currentBit!5446 (_1!5152 lt!180501)))))))

(assert (=> b!117641 (=> (not res!97304) (not e!77089))))

(assert (=> b!117641 e!77089))

(declare-fun lt!180477 () Unit!7213)

(assert (=> b!117641 (= lt!180477 lt!180500)))

(declare-fun lt!180480 () tuple2!9778)

(assert (=> b!117641 (= lt!180480 (reader!0 (_2!5151 lt!179549) (_2!5151 lt!180478)))))

(declare-fun lt!180485 () tuple2!9778)

(assert (=> b!117641 (= lt!180485 (reader!0 (_2!5151 lt!180464) (_2!5151 lt!180478)))))

(declare-fun lt!180475 () tuple2!9774)

(assert (=> b!117641 (= lt!180475 (readBitPure!0 (_1!5154 lt!180480)))))

(assert (=> b!117641 (= (_2!5152 lt!180475) lt!180484)))

(declare-fun lt!180466 () Unit!7213)

(declare-fun Unit!7233 () Unit!7213)

(assert (=> b!117641 (= lt!180466 Unit!7233)))

(declare-fun lt!180486 () (_ BitVec 64))

(assert (=> b!117641 (= lt!180486 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!180505 () (_ BitVec 64))

(assert (=> b!117641 (= lt!180505 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!180499 () Unit!7213)

(assert (=> b!117641 (= lt!180499 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5151 lt!179549) (buf!2808 (_2!5151 lt!180478)) lt!180505))))

(assert (=> b!117641 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!180478)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549))) lt!180505)))

(declare-fun lt!180503 () Unit!7213)

(assert (=> b!117641 (= lt!180503 lt!180499)))

(declare-fun lt!180495 () tuple2!9776)

(assert (=> b!117641 (= lt!180495 (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!180480) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180486))))

(declare-fun lt!180465 () (_ BitVec 64))

(assert (=> b!117641 (= lt!180465 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!180497 () Unit!7213)

(assert (=> b!117641 (= lt!180497 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5151 lt!180464) (buf!2808 (_2!5151 lt!180478)) lt!180465))))

(assert (=> b!117641 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!180478)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!180464))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!180464))) lt!180465)))

(declare-fun lt!180493 () Unit!7213)

(assert (=> b!117641 (= lt!180493 lt!180497)))

(declare-fun lt!180467 () tuple2!9776)

(assert (=> b!117641 (= lt!180467 (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!180485) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180486 (ite (_2!5152 lt!180475) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180491 () tuple2!9776)

(assert (=> b!117641 (= lt!180491 (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!180480) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180486))))

(declare-fun c!7088 () Bool)

(assert (=> b!117641 (= c!7088 (_2!5152 (readBitPure!0 (_1!5154 lt!180480))))))

(declare-fun lt!180502 () tuple2!9776)

(assert (=> b!117641 (= lt!180502 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5154 lt!180480) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180486 e!77093)))))

(declare-fun lt!180481 () Unit!7213)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7213)

(assert (=> b!117641 (= lt!180481 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5154 lt!180480) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180486))))

(assert (=> b!117641 (and (= (_2!5153 lt!180491) (_2!5153 lt!180502)) (= (_1!5153 lt!180491) (_1!5153 lt!180502)))))

(declare-fun lt!180506 () Unit!7213)

(assert (=> b!117641 (= lt!180506 lt!180481)))

(assert (=> b!117641 (= (_1!5154 lt!180480) (withMovedBitIndex!0 (_2!5154 lt!180480) (bvsub (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180478))) (currentByte!5451 (_2!5151 lt!180478)) (currentBit!5446 (_2!5151 lt!180478))))))))

(declare-fun lt!180473 () Unit!7213)

(declare-fun Unit!7236 () Unit!7213)

(assert (=> b!117641 (= lt!180473 Unit!7236)))

(assert (=> b!117641 (= (_1!5154 lt!180485) (withMovedBitIndex!0 (_2!5154 lt!180485) (bvsub (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180464))) (currentByte!5451 (_2!5151 lt!180464)) (currentBit!5446 (_2!5151 lt!180464))) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180478))) (currentByte!5451 (_2!5151 lt!180478)) (currentBit!5446 (_2!5151 lt!180478))))))))

(declare-fun lt!180487 () Unit!7213)

(declare-fun Unit!7237 () Unit!7213)

(assert (=> b!117641 (= lt!180487 Unit!7237)))

(assert (=> b!117641 (= (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))) (bvsub (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180464))) (currentByte!5451 (_2!5151 lt!180464)) (currentBit!5446 (_2!5151 lt!180464))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!180494 () Unit!7213)

(declare-fun Unit!7239 () Unit!7213)

(assert (=> b!117641 (= lt!180494 Unit!7239)))

(assert (=> b!117641 (= (_2!5153 lt!180495) (_2!5153 lt!180467))))

(declare-fun lt!180468 () Unit!7213)

(declare-fun Unit!7241 () Unit!7213)

(assert (=> b!117641 (= lt!180468 Unit!7241)))

(assert (=> b!117641 (= (_1!5153 lt!180495) (_2!5154 lt!180480))))

(declare-fun b!117642 () Bool)

(assert (=> b!117642 (= e!77093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!117643 () Bool)

(declare-fun res!97303 () Bool)

(assert (=> b!117643 (=> (not res!97303) (not e!77092))))

(declare-fun lt!180490 () (_ BitVec 64))

(declare-fun lt!180508 () (_ BitVec 64))

(assert (=> b!117643 (= res!97303 (= (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!180470))) (currentByte!5451 (_2!5151 lt!180470)) (currentBit!5446 (_2!5151 lt!180470))) (bvadd lt!180490 lt!180508)))))

(assert (=> b!117643 (or (not (= (bvand lt!180490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180508 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!180490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!180490 lt!180508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117643 (= lt!180508 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117643 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117643 (= lt!180490 (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549))))))

(declare-fun lt!180472 () tuple2!9776)

(declare-fun b!117644 () Bool)

(declare-fun lt!180496 () tuple2!9778)

(assert (=> b!117644 (= e!77092 (and (= (_2!5153 lt!180472) v!199) (= (_1!5153 lt!180472) (_2!5154 lt!180496))))))

(declare-fun lt!180474 () (_ BitVec 64))

(assert (=> b!117644 (= lt!180472 (readNLeastSignificantBitsLoopPure!0 (_1!5154 lt!180496) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180474))))

(declare-fun lt!180471 () Unit!7213)

(declare-fun lt!180469 () Unit!7213)

(assert (=> b!117644 (= lt!180471 lt!180469)))

(assert (=> b!117644 (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!180470)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549))) lt!180476)))

(assert (=> b!117644 (= lt!180469 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5151 lt!179549) (buf!2808 (_2!5151 lt!180470)) lt!180476))))

(assert (=> b!117644 e!77091))

(declare-fun res!97306 () Bool)

(assert (=> b!117644 (=> (not res!97306) (not e!77091))))

(assert (=> b!117644 (= res!97306 (and (= (size!2395 (buf!2808 (_2!5151 lt!179549))) (size!2395 (buf!2808 (_2!5151 lt!180470)))) (bvsge lt!180476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117644 (= lt!180476 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117644 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117644 (= lt!180474 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117644 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117644 (= lt!180496 (reader!0 (_2!5151 lt!179549) (_2!5151 lt!180470)))))

(declare-fun bm!1523 () Bool)

(assert (=> bm!1523 (= call!1526 (isPrefixOf!0 (ite c!7089 (_2!5151 lt!179549) lt!180498) (ite c!7089 (_2!5151 lt!180489) lt!180498)))))

(declare-fun b!117645 () Bool)

(declare-fun res!97305 () Bool)

(assert (=> b!117645 (=> (not res!97305) (not e!77092))))

(assert (=> b!117645 (= res!97305 (isPrefixOf!0 (_2!5151 lt!179549) (_2!5151 lt!180470)))))

(assert (= (and d!37616 c!7089) b!117641))

(assert (= (and d!37616 (not c!7089)) b!117634))

(assert (= (and b!117641 res!97308) b!117635))

(assert (= (and b!117635 res!97302) b!117636))

(assert (= (and b!117636 res!97300) b!117640))

(assert (= (and b!117640 res!97307) b!117638))

(assert (= (and b!117641 res!97304) b!117639))

(assert (= (and b!117641 c!7088) b!117633))

(assert (= (and b!117641 (not c!7088)) b!117642))

(assert (= (or b!117636 b!117634) bm!1523))

(assert (= (and d!37616 res!97301) b!117643))

(assert (= (and b!117643 res!97303) b!117645))

(assert (= (and b!117645 res!97305) b!117644))

(assert (= (and b!117644 res!97306) b!117637))

(declare-fun m!176445 () Bool)

(assert (=> b!117635 m!176445))

(assert (=> b!117635 m!175829))

(declare-fun m!176447 () Bool)

(assert (=> b!117643 m!176447))

(assert (=> b!117643 m!175829))

(declare-fun m!176449 () Bool)

(assert (=> b!117638 m!176449))

(assert (=> b!117638 m!176445))

(declare-fun m!176451 () Bool)

(assert (=> b!117641 m!176451))

(declare-fun m!176453 () Bool)

(assert (=> b!117641 m!176453))

(declare-fun m!176455 () Bool)

(assert (=> b!117641 m!176455))

(declare-fun m!176457 () Bool)

(assert (=> b!117641 m!176457))

(declare-fun m!176459 () Bool)

(assert (=> b!117641 m!176459))

(declare-fun m!176461 () Bool)

(assert (=> b!117641 m!176461))

(declare-fun m!176463 () Bool)

(assert (=> b!117641 m!176463))

(declare-fun m!176465 () Bool)

(assert (=> b!117641 m!176465))

(declare-fun m!176467 () Bool)

(assert (=> b!117641 m!176467))

(declare-fun m!176469 () Bool)

(assert (=> b!117641 m!176469))

(declare-fun m!176471 () Bool)

(assert (=> b!117641 m!176471))

(assert (=> b!117641 m!175829))

(declare-fun m!176473 () Bool)

(assert (=> b!117641 m!176473))

(declare-fun m!176475 () Bool)

(assert (=> b!117641 m!176475))

(declare-fun m!176479 () Bool)

(assert (=> b!117641 m!176479))

(declare-fun m!176481 () Bool)

(assert (=> b!117641 m!176481))

(declare-fun m!176483 () Bool)

(assert (=> b!117641 m!176483))

(assert (=> b!117641 m!176479))

(declare-fun m!176485 () Bool)

(assert (=> b!117641 m!176485))

(declare-fun m!176487 () Bool)

(assert (=> b!117641 m!176487))

(declare-fun m!176489 () Bool)

(assert (=> b!117641 m!176489))

(declare-fun m!176491 () Bool)

(assert (=> b!117641 m!176491))

(declare-fun m!176493 () Bool)

(assert (=> b!117641 m!176493))

(declare-fun m!176495 () Bool)

(assert (=> b!117641 m!176495))

(declare-fun m!176497 () Bool)

(assert (=> b!117641 m!176497))

(declare-fun m!176499 () Bool)

(assert (=> b!117641 m!176499))

(declare-fun m!176501 () Bool)

(assert (=> b!117641 m!176501))

(declare-fun m!176503 () Bool)

(assert (=> b!117641 m!176503))

(declare-fun m!176505 () Bool)

(assert (=> b!117641 m!176505))

(declare-fun m!176507 () Bool)

(assert (=> b!117641 m!176507))

(declare-fun m!176509 () Bool)

(assert (=> b!117645 m!176509))

(declare-fun m!176511 () Bool)

(assert (=> b!117637 m!176511))

(declare-fun m!176513 () Bool)

(assert (=> bm!1523 m!176513))

(declare-fun m!176515 () Bool)

(assert (=> b!117644 m!176515))

(declare-fun m!176517 () Bool)

(assert (=> b!117644 m!176517))

(declare-fun m!176519 () Bool)

(assert (=> b!117644 m!176519))

(assert (=> b!117644 m!176495))

(declare-fun m!176521 () Bool)

(assert (=> b!117644 m!176521))

(declare-fun m!176523 () Bool)

(assert (=> b!117640 m!176523))

(assert (=> b!117640 m!176523))

(declare-fun m!176525 () Bool)

(assert (=> b!117640 m!176525))

(declare-fun m!176527 () Bool)

(assert (=> b!117634 m!176527))

(assert (=> b!117279 d!37616))

(declare-fun d!37668 () Bool)

(assert (=> d!37668 (= (invariant!0 (currentBit!5446 thiss!1305) (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179549)))) (and (bvsge (currentBit!5446 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5446 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5451 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179549)))) (and (= (currentBit!5446 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5451 thiss!1305) (size!2395 (buf!2808 (_2!5151 lt!179549))))))))))

(assert (=> b!117269 d!37668))

(declare-fun d!37670 () Bool)

(declare-fun res!97312 () Bool)

(declare-fun e!77097 () Bool)

(assert (=> d!37670 (=> (not res!97312) (not e!77097))))

(assert (=> d!37670 (= res!97312 (= (size!2395 (buf!2808 thiss!1305)) (size!2395 (buf!2808 (_2!5151 lt!179549)))))))

(assert (=> d!37670 (= (isPrefixOf!0 thiss!1305 (_2!5151 lt!179549)) e!77097)))

(declare-fun b!117651 () Bool)

(declare-fun res!97313 () Bool)

(assert (=> b!117651 (=> (not res!97313) (not e!77097))))

(assert (=> b!117651 (= res!97313 (bvsle (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305)) (bitIndex!0 (size!2395 (buf!2808 (_2!5151 lt!179549))) (currentByte!5451 (_2!5151 lt!179549)) (currentBit!5446 (_2!5151 lt!179549)))))))

(declare-fun b!117652 () Bool)

(declare-fun e!77096 () Bool)

(assert (=> b!117652 (= e!77097 e!77096)))

(declare-fun res!97314 () Bool)

(assert (=> b!117652 (=> res!97314 e!77096)))

(assert (=> b!117652 (= res!97314 (= (size!2395 (buf!2808 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117653 () Bool)

(assert (=> b!117653 (= e!77096 (arrayBitRangesEq!0 (buf!2808 thiss!1305) (buf!2808 (_2!5151 lt!179549)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2395 (buf!2808 thiss!1305)) (currentByte!5451 thiss!1305) (currentBit!5446 thiss!1305))))))

(assert (= (and d!37670 res!97312) b!117651))

(assert (= (and b!117651 res!97313) b!117652))

(assert (= (and b!117652 (not res!97314)) b!117653))

(assert (=> b!117651 m!175831))

(assert (=> b!117651 m!175829))

(assert (=> b!117653 m!175831))

(assert (=> b!117653 m!175831))

(declare-fun m!176557 () Bool)

(assert (=> b!117653 m!176557))

(assert (=> b!117270 d!37670))

(declare-fun d!37674 () Bool)

(assert (=> d!37674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549))) lt!179550) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 (_2!5151 lt!179549)))) ((_ sign_extend 32) (currentByte!5451 (_2!5151 lt!179549))) ((_ sign_extend 32) (currentBit!5446 (_2!5151 lt!179549)))) lt!179550))))

(declare-fun bs!9110 () Bool)

(assert (= bs!9110 d!37674))

(assert (=> bs!9110 m!176021))

(assert (=> b!117276 d!37674))

(declare-fun d!37676 () Bool)

(assert (=> d!37676 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117277 d!37676))

(declare-fun d!37678 () Bool)

(assert (=> d!37678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305)) lt!179547) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2395 (buf!2808 thiss!1305))) ((_ sign_extend 32) (currentByte!5451 thiss!1305)) ((_ sign_extend 32) (currentBit!5446 thiss!1305))) lt!179547))))

(declare-fun bs!9111 () Bool)

(assert (= bs!9111 d!37678))

(assert (=> bs!9111 m!176023))

(assert (=> b!117278 d!37678))

(push 1)

(assert (not d!37558))

(assert (not d!37612))

(assert (not d!37614))

(assert (not b!117397))

(assert (not d!37586))

(assert (not d!37546))

(assert (not d!37584))

(assert (not d!37554))

(assert (not b!117459))

(assert (not b!117418))

(assert (not b!117457))

(assert (not b!117420))

(assert (not b!117419))

(assert (not d!37564))

(assert (not d!37542))

(assert (not d!37562))

(assert (not b!117644))

(assert (not d!37592))

(assert (not d!37596))

(assert (not b!117460))

(assert (not b!117634))

(assert (not d!37550))

(assert (not b!117635))

(assert (not d!37582))

(assert (not b!117637))

(assert (not d!37678))

(assert (not b!117441))

(assert (not d!37674))

(assert (not d!37594))

(assert (not d!37544))

(assert (not b!117439))

(assert (not d!37598))

(assert (not b!117643))

(assert (not b!117651))

(assert (not b!117645))

(assert (not b!117440))

(assert (not b!117653))

(assert (not b!117640))

(assert (not bm!1523))

(assert (not b!117417))

(assert (not d!37588))

(assert (not b!117641))

(assert (not b!117458))

(assert (not b!117442))

(assert (not b!117484))

(assert (not b!117482))

(assert (not b!117638))

(assert (not d!37552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

