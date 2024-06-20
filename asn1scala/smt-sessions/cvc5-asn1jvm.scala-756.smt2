; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21622 () Bool)

(assert start!21622)

(declare-fun b!109298 () Bool)

(declare-fun e!71624 () Bool)

(declare-datatypes ((array!4985 0))(
  ( (array!4986 (arr!2862 (Array (_ BitVec 32) (_ BitVec 8))) (size!2269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4012 0))(
  ( (BitStream!4013 (buf!2660 array!4985) (currentByte!5196 (_ BitVec 32)) (currentBit!5191 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9084 0))(
  ( (tuple2!9085 (_1!4799 BitStream!4012) (_2!4799 Bool)) )
))
(declare-fun lt!165185 () tuple2!9084)

(declare-fun lt!165187 () tuple2!9084)

(assert (=> b!109298 (= e!71624 (= (_2!4799 lt!165185) (_2!4799 lt!165187)))))

(declare-fun b!109299 () Bool)

(declare-fun e!71629 () Bool)

(declare-fun lt!165173 () tuple2!9084)

(declare-fun lt!165180 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109299 (= e!71629 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165173))) (currentByte!5196 (_1!4799 lt!165173)) (currentBit!5191 (_1!4799 lt!165173))) lt!165180))))

(declare-fun res!90178 () Bool)

(declare-fun e!71625 () Bool)

(assert (=> start!21622 (=> (not res!90178) (not e!71625))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21622 (= res!90178 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21622 e!71625))

(assert (=> start!21622 true))

(declare-fun thiss!1305 () BitStream!4012)

(declare-fun e!71628 () Bool)

(declare-fun inv!12 (BitStream!4012) Bool)

(assert (=> start!21622 (and (inv!12 thiss!1305) e!71628)))

(declare-fun b!109300 () Bool)

(declare-fun res!90190 () Bool)

(declare-fun e!71626 () Bool)

(assert (=> b!109300 (=> (not res!90190) (not e!71626))))

(declare-datatypes ((Unit!6679 0))(
  ( (Unit!6680) )
))
(declare-datatypes ((tuple2!9086 0))(
  ( (tuple2!9087 (_1!4800 Unit!6679) (_2!4800 BitStream!4012)) )
))
(declare-fun lt!165171 () tuple2!9086)

(declare-fun isPrefixOf!0 (BitStream!4012 BitStream!4012) Bool)

(assert (=> b!109300 (= res!90190 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165171)))))

(declare-fun b!109301 () Bool)

(declare-fun e!71630 () Bool)

(declare-datatypes ((tuple2!9088 0))(
  ( (tuple2!9089 (_1!4801 BitStream!4012) (_2!4801 BitStream!4012)) )
))
(declare-fun lt!165175 () tuple2!9088)

(declare-fun lt!165193 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109301 (= e!71630 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4801 lt!165175)))) ((_ sign_extend 32) (currentByte!5196 (_1!4801 lt!165175))) ((_ sign_extend 32) (currentBit!5191 (_1!4801 lt!165175))) lt!165193))))

(declare-fun b!109302 () Bool)

(declare-fun res!90188 () Bool)

(declare-fun e!71632 () Bool)

(assert (=> b!109302 (=> (not res!90188) (not e!71632))))

(assert (=> b!109302 (= res!90188 (bvslt i!615 nBits!396))))

(declare-fun b!109303 () Bool)

(declare-fun res!90181 () Bool)

(assert (=> b!109303 (=> (not res!90181) (not e!71632))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109303 (= res!90181 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!165182 () BitStream!4012)

(declare-fun lt!165176 () (_ BitVec 64))

(declare-fun b!109304 () Bool)

(declare-datatypes ((tuple2!9090 0))(
  ( (tuple2!9091 (_1!4802 BitStream!4012) (_2!4802 (_ BitVec 64))) )
))
(declare-fun lt!165184 () tuple2!9090)

(declare-fun lt!165168 () tuple2!9090)

(declare-fun lt!165183 () tuple2!9088)

(declare-fun e!71631 () Bool)

(declare-fun lt!165177 () (_ BitVec 64))

(assert (=> b!109304 (= e!71631 (and (= lt!165176 (bvsub lt!165177 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4801 lt!165183) lt!165182)) (and (= (_2!4802 lt!165184) (_2!4802 lt!165168)) (= (_1!4802 lt!165184) (_2!4801 lt!165175))))))))

(declare-fun b!109305 () Bool)

(declare-fun e!71623 () Bool)

(assert (=> b!109305 (= e!71632 (not e!71623))))

(declare-fun res!90187 () Bool)

(assert (=> b!109305 (=> res!90187 e!71623)))

(assert (=> b!109305 (= res!90187 (not (= (_1!4802 lt!165168) (_2!4801 lt!165183))))))

(declare-fun lt!165166 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9090)

(assert (=> b!109305 (= lt!165168 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165183) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166))))

(declare-fun lt!165186 () tuple2!9086)

(declare-fun lt!165170 () (_ BitVec 64))

(assert (=> b!109305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165170)))

(declare-fun lt!165190 () Unit!6679)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4012 array!4985 (_ BitVec 64)) Unit!6679)

(assert (=> b!109305 (= lt!165190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4800 lt!165171) (buf!2660 (_2!4800 lt!165186)) lt!165170))))

(assert (=> b!109305 (= lt!165170 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!165181 () (_ BitVec 64))

(declare-fun lt!165192 () (_ BitVec 64))

(declare-fun lt!165194 () tuple2!9084)

(assert (=> b!109305 (= lt!165166 (bvor lt!165181 (ite (_2!4799 lt!165194) lt!165192 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109305 (= lt!165184 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181))))

(assert (=> b!109305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)) lt!165193)))

(declare-fun lt!165169 () Unit!6679)

(assert (=> b!109305 (= lt!165169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2660 (_2!4800 lt!165186)) lt!165193))))

(assert (=> b!109305 (= lt!165181 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!165178 () Bool)

(assert (=> b!109305 (= (_2!4799 lt!165194) lt!165178)))

(declare-fun readBitPure!0 (BitStream!4012) tuple2!9084)

(assert (=> b!109305 (= lt!165194 (readBitPure!0 (_1!4801 lt!165175)))))

(declare-fun reader!0 (BitStream!4012 BitStream!4012) tuple2!9088)

(assert (=> b!109305 (= lt!165183 (reader!0 (_2!4800 lt!165171) (_2!4800 lt!165186)))))

(assert (=> b!109305 (= lt!165175 (reader!0 thiss!1305 (_2!4800 lt!165186)))))

(assert (=> b!109305 e!71624))

(declare-fun res!90185 () Bool)

(assert (=> b!109305 (=> (not res!90185) (not e!71624))))

(assert (=> b!109305 (= res!90185 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165185))) (currentByte!5196 (_1!4799 lt!165185)) (currentBit!5191 (_1!4799 lt!165185))) (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165187))) (currentByte!5196 (_1!4799 lt!165187)) (currentBit!5191 (_1!4799 lt!165187)))))))

(declare-fun lt!165167 () Unit!6679)

(declare-fun lt!165174 () BitStream!4012)

(declare-fun readBitPrefixLemma!0 (BitStream!4012 BitStream!4012) Unit!6679)

(assert (=> b!109305 (= lt!165167 (readBitPrefixLemma!0 lt!165174 (_2!4800 lt!165186)))))

(assert (=> b!109305 (= lt!165187 (readBitPure!0 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))))))

(assert (=> b!109305 (= lt!165185 (readBitPure!0 lt!165174))))

(assert (=> b!109305 (= lt!165174 (BitStream!4013 (buf!2660 (_2!4800 lt!165171)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun e!71622 () Bool)

(assert (=> b!109305 e!71622))

(declare-fun res!90189 () Bool)

(assert (=> b!109305 (=> (not res!90189) (not e!71622))))

(assert (=> b!109305 (= res!90189 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165186)))))

(declare-fun lt!165172 () Unit!6679)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4012 BitStream!4012 BitStream!4012) Unit!6679)

(assert (=> b!109305 (= lt!165172 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4800 lt!165171) (_2!4800 lt!165186)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4012 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9086)

(assert (=> b!109305 (= lt!165186 (appendNLeastSignificantBitsLoop!0 (_2!4800 lt!165171) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71627 () Bool)

(assert (=> b!109305 e!71627))

(declare-fun res!90184 () Bool)

(assert (=> b!109305 (=> (not res!90184) (not e!71627))))

(assert (=> b!109305 (= res!90184 (= (size!2269 (buf!2660 thiss!1305)) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(declare-fun appendBit!0 (BitStream!4012 Bool) tuple2!9086)

(assert (=> b!109305 (= lt!165171 (appendBit!0 thiss!1305 lt!165178))))

(assert (=> b!109305 (= lt!165178 (not (= (bvand v!199 lt!165192) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109305 (= lt!165192 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109306 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109306 (= e!71622 (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165186)))))))

(declare-fun b!109307 () Bool)

(declare-fun array_inv!2071 (array!4985) Bool)

(assert (=> b!109307 (= e!71628 (array_inv!2071 (buf!2660 thiss!1305)))))

(declare-fun b!109308 () Bool)

(assert (=> b!109308 (= e!71626 e!71629)))

(declare-fun res!90186 () Bool)

(assert (=> b!109308 (=> (not res!90186) (not e!71629))))

(assert (=> b!109308 (= res!90186 (and (= (_2!4799 lt!165173) lt!165178) (= (_1!4799 lt!165173) (_2!4800 lt!165171))))))

(declare-fun readerFrom!0 (BitStream!4012 (_ BitVec 32) (_ BitVec 32)) BitStream!4012)

(assert (=> b!109308 (= lt!165173 (readBitPure!0 (readerFrom!0 (_2!4800 lt!165171) (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305))))))

(declare-fun b!109309 () Bool)

(declare-fun res!90183 () Bool)

(assert (=> b!109309 (=> (not res!90183) (not e!71622))))

(assert (=> b!109309 (= res!90183 (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(declare-fun b!109310 () Bool)

(assert (=> b!109310 (= e!71625 e!71632)))

(declare-fun res!90177 () Bool)

(assert (=> b!109310 (=> (not res!90177) (not e!71632))))

(assert (=> b!109310 (= res!90177 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)) lt!165193))))

(assert (=> b!109310 (= lt!165193 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109311 () Bool)

(assert (=> b!109311 (= e!71627 e!71626)))

(declare-fun res!90182 () Bool)

(assert (=> b!109311 (=> (not res!90182) (not e!71626))))

(declare-fun lt!165179 () (_ BitVec 64))

(assert (=> b!109311 (= res!90182 (= lt!165180 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!165179)))))

(assert (=> b!109311 (= lt!165180 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(assert (=> b!109311 (= lt!165179 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun b!109312 () Bool)

(assert (=> b!109312 (= e!71623 e!71630)))

(declare-fun res!90179 () Bool)

(assert (=> b!109312 (=> res!90179 e!71630)))

(declare-fun lt!165191 () (_ BitVec 64))

(assert (=> b!109312 (= res!90179 (or (not (= (_1!4801 lt!165183) lt!165182)) (not (= (size!2269 (buf!2660 thiss!1305)) (size!2269 (buf!2660 (_2!4800 lt!165186))))) (not (= lt!165191 (bvadd lt!165176 lt!165193)))))))

(assert (=> b!109312 e!71631))

(declare-fun res!90180 () Bool)

(assert (=> b!109312 (=> (not res!90180) (not e!71631))))

(declare-fun withMovedBitIndex!0 (BitStream!4012 (_ BitVec 64)) BitStream!4012)

(assert (=> b!109312 (= res!90180 (= (_1!4801 lt!165183) (withMovedBitIndex!0 (_2!4801 lt!165183) (bvsub lt!165177 lt!165191))))))

(assert (=> b!109312 (= lt!165177 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(assert (=> b!109312 (= (_1!4801 lt!165175) (withMovedBitIndex!0 (_2!4801 lt!165175) (bvsub lt!165176 lt!165191)))))

(assert (=> b!109312 (= lt!165191 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165186))) (currentByte!5196 (_2!4800 lt!165186)) (currentBit!5191 (_2!4800 lt!165186))))))

(assert (=> b!109312 (= lt!165176 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun lt!165189 () tuple2!9090)

(assert (=> b!109312 (and (= (_2!4802 lt!165184) (_2!4802 lt!165189)) (= (_1!4802 lt!165184) (_1!4802 lt!165189)))))

(declare-fun lt!165188 () Unit!6679)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6679)

(assert (=> b!109312 (= lt!165188 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181))))

(assert (=> b!109312 (= lt!165189 (readNLeastSignificantBitsLoopPure!0 lt!165182 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166))))

(assert (=> b!109312 (= lt!165182 (withMovedBitIndex!0 (_1!4801 lt!165175) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!21622 res!90178) b!109310))

(assert (= (and b!109310 res!90177) b!109303))

(assert (= (and b!109303 res!90181) b!109302))

(assert (= (and b!109302 res!90188) b!109305))

(assert (= (and b!109305 res!90184) b!109311))

(assert (= (and b!109311 res!90182) b!109300))

(assert (= (and b!109300 res!90190) b!109308))

(assert (= (and b!109308 res!90186) b!109299))

(assert (= (and b!109305 res!90189) b!109309))

(assert (= (and b!109309 res!90183) b!109306))

(assert (= (and b!109305 res!90185) b!109298))

(assert (= (and b!109305 (not res!90187)) b!109312))

(assert (= (and b!109312 res!90180) b!109304))

(assert (= (and b!109312 (not res!90179)) b!109301))

(assert (= start!21622 b!109307))

(declare-fun m!162209 () Bool)

(assert (=> b!109310 m!162209))

(declare-fun m!162211 () Bool)

(assert (=> b!109307 m!162211))

(declare-fun m!162213 () Bool)

(assert (=> b!109299 m!162213))

(declare-fun m!162215 () Bool)

(assert (=> b!109312 m!162215))

(declare-fun m!162217 () Bool)

(assert (=> b!109312 m!162217))

(declare-fun m!162219 () Bool)

(assert (=> b!109312 m!162219))

(declare-fun m!162221 () Bool)

(assert (=> b!109312 m!162221))

(declare-fun m!162223 () Bool)

(assert (=> b!109312 m!162223))

(declare-fun m!162225 () Bool)

(assert (=> b!109312 m!162225))

(declare-fun m!162227 () Bool)

(assert (=> b!109312 m!162227))

(declare-fun m!162229 () Bool)

(assert (=> b!109312 m!162229))

(declare-fun m!162231 () Bool)

(assert (=> b!109300 m!162231))

(declare-fun m!162233 () Bool)

(assert (=> b!109305 m!162233))

(declare-fun m!162235 () Bool)

(assert (=> b!109305 m!162235))

(declare-fun m!162237 () Bool)

(assert (=> b!109305 m!162237))

(declare-fun m!162239 () Bool)

(assert (=> b!109305 m!162239))

(declare-fun m!162241 () Bool)

(assert (=> b!109305 m!162241))

(declare-fun m!162243 () Bool)

(assert (=> b!109305 m!162243))

(declare-fun m!162245 () Bool)

(assert (=> b!109305 m!162245))

(declare-fun m!162247 () Bool)

(assert (=> b!109305 m!162247))

(declare-fun m!162249 () Bool)

(assert (=> b!109305 m!162249))

(declare-fun m!162251 () Bool)

(assert (=> b!109305 m!162251))

(declare-fun m!162253 () Bool)

(assert (=> b!109305 m!162253))

(declare-fun m!162255 () Bool)

(assert (=> b!109305 m!162255))

(declare-fun m!162257 () Bool)

(assert (=> b!109305 m!162257))

(declare-fun m!162259 () Bool)

(assert (=> b!109305 m!162259))

(declare-fun m!162261 () Bool)

(assert (=> b!109305 m!162261))

(declare-fun m!162263 () Bool)

(assert (=> b!109305 m!162263))

(declare-fun m!162265 () Bool)

(assert (=> b!109305 m!162265))

(declare-fun m!162267 () Bool)

(assert (=> b!109305 m!162267))

(declare-fun m!162269 () Bool)

(assert (=> b!109305 m!162269))

(declare-fun m!162271 () Bool)

(assert (=> b!109309 m!162271))

(declare-fun m!162273 () Bool)

(assert (=> b!109308 m!162273))

(assert (=> b!109308 m!162273))

(declare-fun m!162275 () Bool)

(assert (=> b!109308 m!162275))

(declare-fun m!162277 () Bool)

(assert (=> b!109301 m!162277))

(assert (=> b!109311 m!162217))

(assert (=> b!109311 m!162225))

(declare-fun m!162279 () Bool)

(assert (=> start!21622 m!162279))

(declare-fun m!162281 () Bool)

(assert (=> b!109306 m!162281))

(declare-fun m!162283 () Bool)

(assert (=> b!109303 m!162283))

(push 1)

(assert (not b!109301))

(assert (not b!109300))

(assert (not start!21622))

(assert (not b!109305))

(assert (not b!109306))

(assert (not b!109303))

(assert (not b!109309))

(assert (not b!109307))

(assert (not b!109310))

(assert (not b!109299))

(assert (not b!109308))

(assert (not b!109311))

(assert (not b!109312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34452 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)) lt!165193) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305))) lt!165193))))

(declare-fun bs!8414 () Bool)

(assert (= bs!8414 d!34452))

(declare-fun m!162511 () Bool)

(assert (=> bs!8414 m!162511))

(assert (=> b!109310 d!34452))

(declare-fun d!34454 () Bool)

(declare-fun e!71725 () Bool)

(assert (=> d!34454 e!71725))

(declare-fun res!90305 () Bool)

(assert (=> d!34454 (=> (not res!90305) (not e!71725))))

(declare-fun lt!165498 () (_ BitVec 64))

(declare-fun lt!165500 () (_ BitVec 64))

(declare-fun lt!165497 () (_ BitVec 64))

(assert (=> d!34454 (= res!90305 (= lt!165500 (bvsub lt!165498 lt!165497)))))

(assert (=> d!34454 (or (= (bvand lt!165498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165498 lt!165497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34454 (= lt!165497 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165173)))) ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165173))) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165173)))))))

(declare-fun lt!165496 () (_ BitVec 64))

(declare-fun lt!165499 () (_ BitVec 64))

(assert (=> d!34454 (= lt!165498 (bvmul lt!165496 lt!165499))))

(assert (=> d!34454 (or (= lt!165496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165499 (bvsdiv (bvmul lt!165496 lt!165499) lt!165496)))))

(assert (=> d!34454 (= lt!165499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34454 (= lt!165496 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165173)))))))

(assert (=> d!34454 (= lt!165500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165173))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165173)))))))

(assert (=> d!34454 (invariant!0 (currentBit!5191 (_1!4799 lt!165173)) (currentByte!5196 (_1!4799 lt!165173)) (size!2269 (buf!2660 (_1!4799 lt!165173))))))

(assert (=> d!34454 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165173))) (currentByte!5196 (_1!4799 lt!165173)) (currentBit!5191 (_1!4799 lt!165173))) lt!165500)))

(declare-fun b!109438 () Bool)

(declare-fun res!90306 () Bool)

(assert (=> b!109438 (=> (not res!90306) (not e!71725))))

(assert (=> b!109438 (= res!90306 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165500))))

(declare-fun b!109439 () Bool)

(declare-fun lt!165495 () (_ BitVec 64))

(assert (=> b!109439 (= e!71725 (bvsle lt!165500 (bvmul lt!165495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109439 (or (= lt!165495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165495)))))

(assert (=> b!109439 (= lt!165495 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165173)))))))

(assert (= (and d!34454 res!90305) b!109438))

(assert (= (and b!109438 res!90306) b!109439))

(declare-fun m!162513 () Bool)

(assert (=> d!34454 m!162513))

(declare-fun m!162515 () Bool)

(assert (=> d!34454 m!162515))

(assert (=> b!109299 d!34454))

(declare-fun d!34456 () Bool)

(declare-fun res!90313 () Bool)

(declare-fun e!71730 () Bool)

(assert (=> d!34456 (=> (not res!90313) (not e!71730))))

(assert (=> d!34456 (= res!90313 (= (size!2269 (buf!2660 thiss!1305)) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(assert (=> d!34456 (= (isPrefixOf!0 thiss!1305 (_2!4800 lt!165171)) e!71730)))

(declare-fun b!109446 () Bool)

(declare-fun res!90315 () Bool)

(assert (=> b!109446 (=> (not res!90315) (not e!71730))))

(assert (=> b!109446 (= res!90315 (bvsle (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171)))))))

(declare-fun b!109447 () Bool)

(declare-fun e!71731 () Bool)

(assert (=> b!109447 (= e!71730 e!71731)))

(declare-fun res!90314 () Bool)

(assert (=> b!109447 (=> res!90314 e!71731)))

(assert (=> b!109447 (= res!90314 (= (size!2269 (buf!2660 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109448 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4985 array!4985 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109448 (= e!71731 (arrayBitRangesEq!0 (buf!2660 thiss!1305) (buf!2660 (_2!4800 lt!165171)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))))))

(assert (= (and d!34456 res!90313) b!109446))

(assert (= (and b!109446 res!90315) b!109447))

(assert (= (and b!109447 (not res!90314)) b!109448))

(assert (=> b!109446 m!162225))

(assert (=> b!109446 m!162217))

(assert (=> b!109448 m!162225))

(assert (=> b!109448 m!162225))

(declare-fun m!162517 () Bool)

(assert (=> b!109448 m!162517))

(assert (=> b!109300 d!34456))

(declare-fun d!34458 () Bool)

(assert (=> d!34458 (= (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165171)))) (and (bvsge (currentBit!5191 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5191 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5196 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165171)))) (and (= (currentBit!5191 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165171))))))))))

(assert (=> b!109309 d!34458))

(declare-fun d!34460 () Bool)

(declare-fun e!71732 () Bool)

(assert (=> d!34460 e!71732))

(declare-fun res!90316 () Bool)

(assert (=> d!34460 (=> (not res!90316) (not e!71732))))

(declare-fun lt!165504 () (_ BitVec 64))

(declare-fun lt!165503 () (_ BitVec 64))

(declare-fun lt!165506 () (_ BitVec 64))

(assert (=> d!34460 (= res!90316 (= lt!165506 (bvsub lt!165504 lt!165503)))))

(assert (=> d!34460 (or (= (bvand lt!165504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165504 lt!165503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34460 (= lt!165503 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165171)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171)))))))

(declare-fun lt!165502 () (_ BitVec 64))

(declare-fun lt!165505 () (_ BitVec 64))

(assert (=> d!34460 (= lt!165504 (bvmul lt!165502 lt!165505))))

(assert (=> d!34460 (or (= lt!165502 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165505 (bvsdiv (bvmul lt!165502 lt!165505) lt!165502)))))

(assert (=> d!34460 (= lt!165505 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34460 (= lt!165502 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(assert (=> d!34460 (= lt!165506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171)))))))

(assert (=> d!34460 (invariant!0 (currentBit!5191 (_2!4800 lt!165171)) (currentByte!5196 (_2!4800 lt!165171)) (size!2269 (buf!2660 (_2!4800 lt!165171))))))

(assert (=> d!34460 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))) lt!165506)))

(declare-fun b!109449 () Bool)

(declare-fun res!90317 () Bool)

(assert (=> b!109449 (=> (not res!90317) (not e!71732))))

(assert (=> b!109449 (= res!90317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165506))))

(declare-fun b!109450 () Bool)

(declare-fun lt!165501 () (_ BitVec 64))

(assert (=> b!109450 (= e!71732 (bvsle lt!165506 (bvmul lt!165501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109450 (or (= lt!165501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165501)))))

(assert (=> b!109450 (= lt!165501 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(assert (= (and d!34460 res!90316) b!109449))

(assert (= (and b!109449 res!90317) b!109450))

(declare-fun m!162519 () Bool)

(assert (=> d!34460 m!162519))

(declare-fun m!162521 () Bool)

(assert (=> d!34460 m!162521))

(assert (=> b!109311 d!34460))

(declare-fun d!34462 () Bool)

(declare-fun e!71733 () Bool)

(assert (=> d!34462 e!71733))

(declare-fun res!90318 () Bool)

(assert (=> d!34462 (=> (not res!90318) (not e!71733))))

(declare-fun lt!165509 () (_ BitVec 64))

(declare-fun lt!165510 () (_ BitVec 64))

(declare-fun lt!165512 () (_ BitVec 64))

(assert (=> d!34462 (= res!90318 (= lt!165512 (bvsub lt!165510 lt!165509)))))

(assert (=> d!34462 (or (= (bvand lt!165510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165510 lt!165509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34462 (= lt!165509 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305))))))

(declare-fun lt!165508 () (_ BitVec 64))

(declare-fun lt!165511 () (_ BitVec 64))

(assert (=> d!34462 (= lt!165510 (bvmul lt!165508 lt!165511))))

(assert (=> d!34462 (or (= lt!165508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165511 (bvsdiv (bvmul lt!165508 lt!165511) lt!165508)))))

(assert (=> d!34462 (= lt!165511 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34462 (= lt!165508 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))))))

(assert (=> d!34462 (= lt!165512 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 thiss!1305))))))

(assert (=> d!34462 (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 thiss!1305)))))

(assert (=> d!34462 (= (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)) lt!165512)))

(declare-fun b!109451 () Bool)

(declare-fun res!90319 () Bool)

(assert (=> b!109451 (=> (not res!90319) (not e!71733))))

(assert (=> b!109451 (= res!90319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165512))))

(declare-fun b!109452 () Bool)

(declare-fun lt!165507 () (_ BitVec 64))

(assert (=> b!109452 (= e!71733 (bvsle lt!165512 (bvmul lt!165507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109452 (or (= lt!165507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165507)))))

(assert (=> b!109452 (= lt!165507 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))))))

(assert (= (and d!34462 res!90318) b!109451))

(assert (= (and b!109451 res!90319) b!109452))

(assert (=> d!34462 m!162511))

(declare-fun m!162523 () Bool)

(assert (=> d!34462 m!162523))

(assert (=> b!109311 d!34462))

(assert (=> b!109312 d!34460))

(declare-fun d!34464 () Bool)

(declare-fun e!71736 () Bool)

(assert (=> d!34464 e!71736))

(declare-fun res!90322 () Bool)

(assert (=> d!34464 (=> (not res!90322) (not e!71736))))

(declare-fun lt!165518 () (_ BitVec 64))

(declare-fun lt!165517 () BitStream!4012)

(assert (=> d!34464 (= res!90322 (= (bvadd lt!165518 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2269 (buf!2660 lt!165517)) (currentByte!5196 lt!165517) (currentBit!5191 lt!165517))))))

(assert (=> d!34464 (or (not (= (bvand lt!165518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165518 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34464 (= lt!165518 (bitIndex!0 (size!2269 (buf!2660 (_1!4801 lt!165175))) (currentByte!5196 (_1!4801 lt!165175)) (currentBit!5191 (_1!4801 lt!165175))))))

(declare-fun moveBitIndex!0 (BitStream!4012 (_ BitVec 64)) tuple2!9086)

(assert (=> d!34464 (= lt!165517 (_2!4800 (moveBitIndex!0 (_1!4801 lt!165175) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4012 (_ BitVec 64)) Bool)

(assert (=> d!34464 (moveBitIndexPrecond!0 (_1!4801 lt!165175) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34464 (= (withMovedBitIndex!0 (_1!4801 lt!165175) #b0000000000000000000000000000000000000000000000000000000000000001) lt!165517)))

(declare-fun b!109455 () Bool)

(assert (=> b!109455 (= e!71736 (= (size!2269 (buf!2660 (_1!4801 lt!165175))) (size!2269 (buf!2660 lt!165517))))))

(assert (= (and d!34464 res!90322) b!109455))

(declare-fun m!162525 () Bool)

(assert (=> d!34464 m!162525))

(declare-fun m!162527 () Bool)

(assert (=> d!34464 m!162527))

(declare-fun m!162529 () Bool)

(assert (=> d!34464 m!162529))

(declare-fun m!162531 () Bool)

(assert (=> d!34464 m!162531))

(assert (=> b!109312 d!34464))

(declare-fun d!34466 () Bool)

(declare-fun e!71737 () Bool)

(assert (=> d!34466 e!71737))

(declare-fun res!90323 () Bool)

(assert (=> d!34466 (=> (not res!90323) (not e!71737))))

(declare-fun lt!165519 () BitStream!4012)

(declare-fun lt!165520 () (_ BitVec 64))

(assert (=> d!34466 (= res!90323 (= (bvadd lt!165520 (bvsub lt!165177 lt!165191)) (bitIndex!0 (size!2269 (buf!2660 lt!165519)) (currentByte!5196 lt!165519) (currentBit!5191 lt!165519))))))

(assert (=> d!34466 (or (not (= (bvand lt!165520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165177 lt!165191) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165520 (bvsub lt!165177 lt!165191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34466 (= lt!165520 (bitIndex!0 (size!2269 (buf!2660 (_2!4801 lt!165183))) (currentByte!5196 (_2!4801 lt!165183)) (currentBit!5191 (_2!4801 lt!165183))))))

(assert (=> d!34466 (= lt!165519 (_2!4800 (moveBitIndex!0 (_2!4801 lt!165183) (bvsub lt!165177 lt!165191))))))

(assert (=> d!34466 (moveBitIndexPrecond!0 (_2!4801 lt!165183) (bvsub lt!165177 lt!165191))))

(assert (=> d!34466 (= (withMovedBitIndex!0 (_2!4801 lt!165183) (bvsub lt!165177 lt!165191)) lt!165519)))

(declare-fun b!109456 () Bool)

(assert (=> b!109456 (= e!71737 (= (size!2269 (buf!2660 (_2!4801 lt!165183))) (size!2269 (buf!2660 lt!165519))))))

(assert (= (and d!34466 res!90323) b!109456))

(declare-fun m!162533 () Bool)

(assert (=> d!34466 m!162533))

(declare-fun m!162535 () Bool)

(assert (=> d!34466 m!162535))

(declare-fun m!162537 () Bool)

(assert (=> d!34466 m!162537))

(declare-fun m!162539 () Bool)

(assert (=> d!34466 m!162539))

(assert (=> b!109312 d!34466))

(declare-fun d!34468 () Bool)

(declare-fun e!71738 () Bool)

(assert (=> d!34468 e!71738))

(declare-fun res!90324 () Bool)

(assert (=> d!34468 (=> (not res!90324) (not e!71738))))

(declare-fun lt!165526 () (_ BitVec 64))

(declare-fun lt!165523 () (_ BitVec 64))

(declare-fun lt!165524 () (_ BitVec 64))

(assert (=> d!34468 (= res!90324 (= lt!165526 (bvsub lt!165524 lt!165523)))))

(assert (=> d!34468 (or (= (bvand lt!165524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165524 lt!165523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34468 (= lt!165523 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165186))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165186)))))))

(declare-fun lt!165522 () (_ BitVec 64))

(declare-fun lt!165525 () (_ BitVec 64))

(assert (=> d!34468 (= lt!165524 (bvmul lt!165522 lt!165525))))

(assert (=> d!34468 (or (= lt!165522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165525 (bvsdiv (bvmul lt!165522 lt!165525) lt!165522)))))

(assert (=> d!34468 (= lt!165525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34468 (= lt!165522 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))))))

(assert (=> d!34468 (= lt!165526 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165186))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165186)))))))

(assert (=> d!34468 (invariant!0 (currentBit!5191 (_2!4800 lt!165186)) (currentByte!5196 (_2!4800 lt!165186)) (size!2269 (buf!2660 (_2!4800 lt!165186))))))

(assert (=> d!34468 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165186))) (currentByte!5196 (_2!4800 lt!165186)) (currentBit!5191 (_2!4800 lt!165186))) lt!165526)))

(declare-fun b!109457 () Bool)

(declare-fun res!90325 () Bool)

(assert (=> b!109457 (=> (not res!90325) (not e!71738))))

(assert (=> b!109457 (= res!90325 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165526))))

(declare-fun b!109458 () Bool)

(declare-fun lt!165521 () (_ BitVec 64))

(assert (=> b!109458 (= e!71738 (bvsle lt!165526 (bvmul lt!165521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109458 (or (= lt!165521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165521)))))

(assert (=> b!109458 (= lt!165521 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))))))

(assert (= (and d!34468 res!90324) b!109457))

(assert (= (and b!109457 res!90325) b!109458))

(declare-fun m!162541 () Bool)

(assert (=> d!34468 m!162541))

(declare-fun m!162543 () Bool)

(assert (=> d!34468 m!162543))

(assert (=> b!109312 d!34468))

(declare-fun d!34470 () Bool)

(declare-fun lt!165543 () tuple2!9090)

(declare-fun lt!165539 () tuple2!9090)

(assert (=> d!34470 (and (= (_2!4802 lt!165543) (_2!4802 lt!165539)) (= (_1!4802 lt!165543) (_1!4802 lt!165539)))))

(declare-fun lt!165542 () Bool)

(declare-fun lt!165541 () (_ BitVec 64))

(declare-fun lt!165540 () Unit!6679)

(declare-fun lt!165544 () BitStream!4012)

(declare-fun choose!45 (BitStream!4012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9090 tuple2!9090 BitStream!4012 (_ BitVec 64) Bool BitStream!4012 (_ BitVec 64) tuple2!9090 tuple2!9090 BitStream!4012 (_ BitVec 64)) Unit!6679)

(assert (=> d!34470 (= lt!165540 (choose!45 (_1!4801 lt!165175) nBits!396 i!615 lt!165181 lt!165543 (tuple2!9091 (_1!4802 lt!165543) (_2!4802 lt!165543)) (_1!4802 lt!165543) (_2!4802 lt!165543) lt!165542 lt!165544 lt!165541 lt!165539 (tuple2!9091 (_1!4802 lt!165539) (_2!4802 lt!165539)) (_1!4802 lt!165539) (_2!4802 lt!165539)))))

(assert (=> d!34470 (= lt!165539 (readNLeastSignificantBitsLoopPure!0 lt!165544 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!165541))))

(assert (=> d!34470 (= lt!165541 (bvor lt!165181 (ite lt!165542 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34470 (= lt!165544 (withMovedBitIndex!0 (_1!4801 lt!165175) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34470 (= lt!165542 (_2!4799 (readBitPure!0 (_1!4801 lt!165175))))))

(assert (=> d!34470 (= lt!165543 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181))))

(assert (=> d!34470 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181) lt!165540)))

(declare-fun bs!8416 () Bool)

(assert (= bs!8416 d!34470))

(assert (=> bs!8416 m!162257))

(declare-fun m!162545 () Bool)

(assert (=> bs!8416 m!162545))

(declare-fun m!162547 () Bool)

(assert (=> bs!8416 m!162547))

(assert (=> bs!8416 m!162227))

(assert (=> bs!8416 m!162245))

(assert (=> b!109312 d!34470))

(declare-fun d!34472 () Bool)

(declare-datatypes ((tuple2!9112 0))(
  ( (tuple2!9113 (_1!4813 (_ BitVec 64)) (_2!4813 BitStream!4012)) )
))
(declare-fun lt!165547 () tuple2!9112)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9112)

(assert (=> d!34472 (= lt!165547 (readNLeastSignificantBitsLoop!0 lt!165182 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166))))

(assert (=> d!34472 (= (readNLeastSignificantBitsLoopPure!0 lt!165182 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166) (tuple2!9091 (_2!4813 lt!165547) (_1!4813 lt!165547)))))

(declare-fun bs!8417 () Bool)

(assert (= bs!8417 d!34472))

(declare-fun m!162549 () Bool)

(assert (=> bs!8417 m!162549))

(assert (=> b!109312 d!34472))

(declare-fun d!34474 () Bool)

(declare-fun e!71739 () Bool)

(assert (=> d!34474 e!71739))

(declare-fun res!90326 () Bool)

(assert (=> d!34474 (=> (not res!90326) (not e!71739))))

(declare-fun lt!165549 () (_ BitVec 64))

(declare-fun lt!165548 () BitStream!4012)

(assert (=> d!34474 (= res!90326 (= (bvadd lt!165549 (bvsub lt!165176 lt!165191)) (bitIndex!0 (size!2269 (buf!2660 lt!165548)) (currentByte!5196 lt!165548) (currentBit!5191 lt!165548))))))

(assert (=> d!34474 (or (not (= (bvand lt!165549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165176 lt!165191) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165549 (bvsub lt!165176 lt!165191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34474 (= lt!165549 (bitIndex!0 (size!2269 (buf!2660 (_2!4801 lt!165175))) (currentByte!5196 (_2!4801 lt!165175)) (currentBit!5191 (_2!4801 lt!165175))))))

(assert (=> d!34474 (= lt!165548 (_2!4800 (moveBitIndex!0 (_2!4801 lt!165175) (bvsub lt!165176 lt!165191))))))

(assert (=> d!34474 (moveBitIndexPrecond!0 (_2!4801 lt!165175) (bvsub lt!165176 lt!165191))))

(assert (=> d!34474 (= (withMovedBitIndex!0 (_2!4801 lt!165175) (bvsub lt!165176 lt!165191)) lt!165548)))

(declare-fun b!109459 () Bool)

(assert (=> b!109459 (= e!71739 (= (size!2269 (buf!2660 (_2!4801 lt!165175))) (size!2269 (buf!2660 lt!165548))))))

(assert (= (and d!34474 res!90326) b!109459))

(declare-fun m!162551 () Bool)

(assert (=> d!34474 m!162551))

(declare-fun m!162553 () Bool)

(assert (=> d!34474 m!162553))

(declare-fun m!162555 () Bool)

(assert (=> d!34474 m!162555))

(declare-fun m!162557 () Bool)

(assert (=> d!34474 m!162557))

(assert (=> b!109312 d!34474))

(assert (=> b!109312 d!34462))

(declare-fun d!34476 () Bool)

(assert (=> d!34476 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4801 lt!165175)))) ((_ sign_extend 32) (currentByte!5196 (_1!4801 lt!165175))) ((_ sign_extend 32) (currentBit!5191 (_1!4801 lt!165175))) lt!165193) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4801 lt!165175)))) ((_ sign_extend 32) (currentByte!5196 (_1!4801 lt!165175))) ((_ sign_extend 32) (currentBit!5191 (_1!4801 lt!165175)))) lt!165193))))

(declare-fun bs!8418 () Bool)

(assert (= bs!8418 d!34476))

(declare-fun m!162559 () Bool)

(assert (=> bs!8418 m!162559))

(assert (=> b!109301 d!34476))

(declare-fun d!34478 () Bool)

(assert (=> d!34478 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!109305 d!34478))

(declare-fun d!34480 () Bool)

(declare-datatypes ((tuple2!9114 0))(
  ( (tuple2!9115 (_1!4814 Bool) (_2!4814 BitStream!4012)) )
))
(declare-fun lt!165552 () tuple2!9114)

(declare-fun readBit!0 (BitStream!4012) tuple2!9114)

(assert (=> d!34480 (= lt!165552 (readBit!0 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))))))

(assert (=> d!34480 (= (readBitPure!0 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))) (tuple2!9085 (_2!4814 lt!165552) (_1!4814 lt!165552)))))

(declare-fun bs!8419 () Bool)

(assert (= bs!8419 d!34480))

(declare-fun m!162561 () Bool)

(assert (=> bs!8419 m!162561))

(assert (=> b!109305 d!34480))

(declare-fun d!34482 () Bool)

(assert (=> d!34482 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165186))))

(declare-fun lt!165555 () Unit!6679)

(declare-fun choose!30 (BitStream!4012 BitStream!4012 BitStream!4012) Unit!6679)

(assert (=> d!34482 (= lt!165555 (choose!30 thiss!1305 (_2!4800 lt!165171) (_2!4800 lt!165186)))))

(assert (=> d!34482 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165171))))

(assert (=> d!34482 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4800 lt!165171) (_2!4800 lt!165186)) lt!165555)))

(declare-fun bs!8420 () Bool)

(assert (= bs!8420 d!34482))

(assert (=> bs!8420 m!162237))

(declare-fun m!162563 () Bool)

(assert (=> bs!8420 m!162563))

(assert (=> bs!8420 m!162231))

(assert (=> b!109305 d!34482))

(declare-fun d!34484 () Bool)

(declare-fun e!71742 () Bool)

(assert (=> d!34484 e!71742))

(declare-fun res!90329 () Bool)

(assert (=> d!34484 (=> (not res!90329) (not e!71742))))

(declare-fun lt!165566 () tuple2!9084)

(declare-fun lt!165564 () tuple2!9084)

(assert (=> d!34484 (= res!90329 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165566))) (currentByte!5196 (_1!4799 lt!165566)) (currentBit!5191 (_1!4799 lt!165566))) (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165564))) (currentByte!5196 (_1!4799 lt!165564)) (currentBit!5191 (_1!4799 lt!165564)))))))

(declare-fun lt!165567 () Unit!6679)

(declare-fun lt!165565 () BitStream!4012)

(declare-fun choose!50 (BitStream!4012 BitStream!4012 BitStream!4012 tuple2!9084 tuple2!9084 BitStream!4012 Bool tuple2!9084 tuple2!9084 BitStream!4012 Bool) Unit!6679)

(assert (=> d!34484 (= lt!165567 (choose!50 lt!165174 (_2!4800 lt!165186) lt!165565 lt!165566 (tuple2!9085 (_1!4799 lt!165566) (_2!4799 lt!165566)) (_1!4799 lt!165566) (_2!4799 lt!165566) lt!165564 (tuple2!9085 (_1!4799 lt!165564) (_2!4799 lt!165564)) (_1!4799 lt!165564) (_2!4799 lt!165564)))))

(assert (=> d!34484 (= lt!165564 (readBitPure!0 lt!165565))))

(assert (=> d!34484 (= lt!165566 (readBitPure!0 lt!165174))))

(assert (=> d!34484 (= lt!165565 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 lt!165174) (currentBit!5191 lt!165174)))))

(assert (=> d!34484 (invariant!0 (currentBit!5191 lt!165174) (currentByte!5196 lt!165174) (size!2269 (buf!2660 (_2!4800 lt!165186))))))

(assert (=> d!34484 (= (readBitPrefixLemma!0 lt!165174 (_2!4800 lt!165186)) lt!165567)))

(declare-fun b!109462 () Bool)

(assert (=> b!109462 (= e!71742 (= (_2!4799 lt!165566) (_2!4799 lt!165564)))))

(assert (= (and d!34484 res!90329) b!109462))

(assert (=> d!34484 m!162253))

(declare-fun m!162565 () Bool)

(assert (=> d!34484 m!162565))

(declare-fun m!162567 () Bool)

(assert (=> d!34484 m!162567))

(declare-fun m!162569 () Bool)

(assert (=> d!34484 m!162569))

(declare-fun m!162571 () Bool)

(assert (=> d!34484 m!162571))

(declare-fun m!162573 () Bool)

(assert (=> d!34484 m!162573))

(assert (=> b!109305 d!34484))

(declare-fun d!34486 () Bool)

(declare-fun e!71743 () Bool)

(assert (=> d!34486 e!71743))

(declare-fun res!90330 () Bool)

(assert (=> d!34486 (=> (not res!90330) (not e!71743))))

(declare-fun lt!165573 () (_ BitVec 64))

(declare-fun lt!165571 () (_ BitVec 64))

(declare-fun lt!165570 () (_ BitVec 64))

(assert (=> d!34486 (= res!90330 (= lt!165573 (bvsub lt!165571 lt!165570)))))

(assert (=> d!34486 (or (= (bvand lt!165571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165571 lt!165570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34486 (= lt!165570 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165187)))) ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165187))) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165187)))))))

(declare-fun lt!165569 () (_ BitVec 64))

(declare-fun lt!165572 () (_ BitVec 64))

(assert (=> d!34486 (= lt!165571 (bvmul lt!165569 lt!165572))))

(assert (=> d!34486 (or (= lt!165569 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165572 (bvsdiv (bvmul lt!165569 lt!165572) lt!165569)))))

(assert (=> d!34486 (= lt!165572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34486 (= lt!165569 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165187)))))))

(assert (=> d!34486 (= lt!165573 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165187)))))))

(assert (=> d!34486 (invariant!0 (currentBit!5191 (_1!4799 lt!165187)) (currentByte!5196 (_1!4799 lt!165187)) (size!2269 (buf!2660 (_1!4799 lt!165187))))))

(assert (=> d!34486 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165187))) (currentByte!5196 (_1!4799 lt!165187)) (currentBit!5191 (_1!4799 lt!165187))) lt!165573)))

(declare-fun b!109463 () Bool)

(declare-fun res!90331 () Bool)

(assert (=> b!109463 (=> (not res!90331) (not e!71743))))

(assert (=> b!109463 (= res!90331 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165573))))

(declare-fun b!109464 () Bool)

(declare-fun lt!165568 () (_ BitVec 64))

(assert (=> b!109464 (= e!71743 (bvsle lt!165573 (bvmul lt!165568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109464 (or (= lt!165568 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165568 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165568)))))

(assert (=> b!109464 (= lt!165568 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165187)))))))

(assert (= (and d!34486 res!90330) b!109463))

(assert (= (and b!109463 res!90331) b!109464))

(declare-fun m!162575 () Bool)

(assert (=> d!34486 m!162575))

(declare-fun m!162577 () Bool)

(assert (=> d!34486 m!162577))

(assert (=> b!109305 d!34486))

(declare-fun d!34488 () Bool)

(assert (=> d!34488 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165170)))

(declare-fun lt!165576 () Unit!6679)

(declare-fun choose!9 (BitStream!4012 array!4985 (_ BitVec 64) BitStream!4012) Unit!6679)

(assert (=> d!34488 (= lt!165576 (choose!9 (_2!4800 lt!165171) (buf!2660 (_2!4800 lt!165186)) lt!165170 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171)))))))

(assert (=> d!34488 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4800 lt!165171) (buf!2660 (_2!4800 lt!165186)) lt!165170) lt!165576)))

(declare-fun bs!8421 () Bool)

(assert (= bs!8421 d!34488))

(assert (=> bs!8421 m!162267))

(declare-fun m!162579 () Bool)

(assert (=> bs!8421 m!162579))

(assert (=> b!109305 d!34488))

(declare-fun b!109474 () Bool)

(declare-fun res!90343 () Bool)

(declare-fun e!71749 () Bool)

(assert (=> b!109474 (=> (not res!90343) (not e!71749))))

(declare-fun lt!165587 () tuple2!9086)

(declare-fun lt!165586 () (_ BitVec 64))

(declare-fun lt!165588 () (_ BitVec 64))

(assert (=> b!109474 (= res!90343 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165587))) (currentByte!5196 (_2!4800 lt!165587)) (currentBit!5191 (_2!4800 lt!165587))) (bvadd lt!165586 lt!165588)))))

(assert (=> b!109474 (or (not (= (bvand lt!165586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165588 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165586 lt!165588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109474 (= lt!165588 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!109474 (= lt!165586 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun d!34490 () Bool)

(assert (=> d!34490 e!71749))

(declare-fun res!90341 () Bool)

(assert (=> d!34490 (=> (not res!90341) (not e!71749))))

(assert (=> d!34490 (= res!90341 (= (size!2269 (buf!2660 thiss!1305)) (size!2269 (buf!2660 (_2!4800 lt!165587)))))))

(declare-fun choose!16 (BitStream!4012 Bool) tuple2!9086)

(assert (=> d!34490 (= lt!165587 (choose!16 thiss!1305 lt!165178))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34490 (validate_offset_bit!0 ((_ sign_extend 32) (size!2269 (buf!2660 thiss!1305))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)))))

(assert (=> d!34490 (= (appendBit!0 thiss!1305 lt!165178) lt!165587)))

(declare-fun b!109477 () Bool)

(declare-fun e!71748 () Bool)

(declare-fun lt!165585 () tuple2!9084)

(assert (=> b!109477 (= e!71748 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165585))) (currentByte!5196 (_1!4799 lt!165585)) (currentBit!5191 (_1!4799 lt!165585))) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165587))) (currentByte!5196 (_2!4800 lt!165587)) (currentBit!5191 (_2!4800 lt!165587)))))))

(declare-fun b!109476 () Bool)

(assert (=> b!109476 (= e!71749 e!71748)))

(declare-fun res!90342 () Bool)

(assert (=> b!109476 (=> (not res!90342) (not e!71748))))

(assert (=> b!109476 (= res!90342 (and (= (_2!4799 lt!165585) lt!165178) (= (_1!4799 lt!165585) (_2!4800 lt!165587))))))

(assert (=> b!109476 (= lt!165585 (readBitPure!0 (readerFrom!0 (_2!4800 lt!165587) (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305))))))

(declare-fun b!109475 () Bool)

(declare-fun res!90340 () Bool)

(assert (=> b!109475 (=> (not res!90340) (not e!71749))))

(assert (=> b!109475 (= res!90340 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165587)))))

(assert (= (and d!34490 res!90341) b!109474))

(assert (= (and b!109474 res!90343) b!109475))

(assert (= (and b!109475 res!90340) b!109476))

(assert (= (and b!109476 res!90342) b!109477))

(declare-fun m!162581 () Bool)

(assert (=> b!109475 m!162581))

(declare-fun m!162583 () Bool)

(assert (=> b!109476 m!162583))

(assert (=> b!109476 m!162583))

(declare-fun m!162585 () Bool)

(assert (=> b!109476 m!162585))

(declare-fun m!162587 () Bool)

(assert (=> b!109474 m!162587))

(assert (=> b!109474 m!162225))

(declare-fun m!162589 () Bool)

(assert (=> b!109477 m!162589))

(assert (=> b!109477 m!162587))

(declare-fun m!162591 () Bool)

(assert (=> d!34490 m!162591))

(declare-fun m!162593 () Bool)

(assert (=> d!34490 m!162593))

(assert (=> b!109305 d!34490))

(declare-fun d!34492 () Bool)

(assert (=> d!34492 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)) lt!165193)))

(declare-fun lt!165589 () Unit!6679)

(assert (=> d!34492 (= lt!165589 (choose!9 thiss!1305 (buf!2660 (_2!4800 lt!165186)) lt!165193 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))))))

(assert (=> d!34492 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2660 (_2!4800 lt!165186)) lt!165193) lt!165589)))

(declare-fun bs!8422 () Bool)

(assert (= bs!8422 d!34492))

(assert (=> bs!8422 m!162239))

(declare-fun m!162595 () Bool)

(assert (=> bs!8422 m!162595))

(assert (=> b!109305 d!34492))

(declare-fun d!34494 () Bool)

(declare-fun res!90344 () Bool)

(declare-fun e!71750 () Bool)

(assert (=> d!34494 (=> (not res!90344) (not e!71750))))

(assert (=> d!34494 (= res!90344 (= (size!2269 (buf!2660 thiss!1305)) (size!2269 (buf!2660 (_2!4800 lt!165186)))))))

(assert (=> d!34494 (= (isPrefixOf!0 thiss!1305 (_2!4800 lt!165186)) e!71750)))

(declare-fun b!109478 () Bool)

(declare-fun res!90346 () Bool)

(assert (=> b!109478 (=> (not res!90346) (not e!71750))))

(assert (=> b!109478 (= res!90346 (bvsle (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165186))) (currentByte!5196 (_2!4800 lt!165186)) (currentBit!5191 (_2!4800 lt!165186)))))))

(declare-fun b!109479 () Bool)

(declare-fun e!71751 () Bool)

(assert (=> b!109479 (= e!71750 e!71751)))

(declare-fun res!90345 () Bool)

(assert (=> b!109479 (=> res!90345 e!71751)))

(assert (=> b!109479 (= res!90345 (= (size!2269 (buf!2660 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109480 () Bool)

(assert (=> b!109480 (= e!71751 (arrayBitRangesEq!0 (buf!2660 thiss!1305) (buf!2660 (_2!4800 lt!165186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305))))))

(assert (= (and d!34494 res!90344) b!109478))

(assert (= (and b!109478 res!90346) b!109479))

(assert (= (and b!109479 (not res!90345)) b!109480))

(assert (=> b!109478 m!162225))

(assert (=> b!109478 m!162215))

(assert (=> b!109480 m!162225))

(assert (=> b!109480 m!162225))

(declare-fun m!162597 () Bool)

(assert (=> b!109480 m!162597))

(assert (=> b!109305 d!34494))

(declare-fun d!34496 () Bool)

(declare-fun lt!165590 () tuple2!9114)

(assert (=> d!34496 (= lt!165590 (readBit!0 lt!165174))))

(assert (=> d!34496 (= (readBitPure!0 lt!165174) (tuple2!9085 (_2!4814 lt!165590) (_1!4814 lt!165590)))))

(declare-fun bs!8423 () Bool)

(assert (= bs!8423 d!34496))

(declare-fun m!162599 () Bool)

(assert (=> bs!8423 m!162599))

(assert (=> b!109305 d!34496))

(declare-fun d!34498 () Bool)

(assert (=> d!34498 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305)) lt!165193) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 thiss!1305)) ((_ sign_extend 32) (currentBit!5191 thiss!1305))) lt!165193))))

(declare-fun bs!8424 () Bool)

(assert (= bs!8424 d!34498))

(declare-fun m!162601 () Bool)

(assert (=> bs!8424 m!162601))

(assert (=> b!109305 d!34498))

(declare-fun d!34500 () Bool)

(declare-fun e!71752 () Bool)

(assert (=> d!34500 e!71752))

(declare-fun res!90347 () Bool)

(assert (=> d!34500 (=> (not res!90347) (not e!71752))))

(declare-fun lt!165594 () (_ BitVec 64))

(declare-fun lt!165593 () (_ BitVec 64))

(declare-fun lt!165596 () (_ BitVec 64))

(assert (=> d!34500 (= res!90347 (= lt!165596 (bvsub lt!165594 lt!165593)))))

(assert (=> d!34500 (or (= (bvand lt!165594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165593 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165594 lt!165593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34500 (= lt!165593 (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165185)))) ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165185))) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165185)))))))

(declare-fun lt!165592 () (_ BitVec 64))

(declare-fun lt!165595 () (_ BitVec 64))

(assert (=> d!34500 (= lt!165594 (bvmul lt!165592 lt!165595))))

(assert (=> d!34500 (or (= lt!165592 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165595 (bvsdiv (bvmul lt!165592 lt!165595) lt!165592)))))

(assert (=> d!34500 (= lt!165595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34500 (= lt!165592 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165185)))))))

(assert (=> d!34500 (= lt!165596 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5196 (_1!4799 lt!165185))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5191 (_1!4799 lt!165185)))))))

(assert (=> d!34500 (invariant!0 (currentBit!5191 (_1!4799 lt!165185)) (currentByte!5196 (_1!4799 lt!165185)) (size!2269 (buf!2660 (_1!4799 lt!165185))))))

(assert (=> d!34500 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165185))) (currentByte!5196 (_1!4799 lt!165185)) (currentBit!5191 (_1!4799 lt!165185))) lt!165596)))

(declare-fun b!109481 () Bool)

(declare-fun res!90348 () Bool)

(assert (=> b!109481 (=> (not res!90348) (not e!71752))))

(assert (=> b!109481 (= res!90348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165596))))

(declare-fun b!109482 () Bool)

(declare-fun lt!165591 () (_ BitVec 64))

(assert (=> b!109482 (= e!71752 (bvsle lt!165596 (bvmul lt!165591 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109482 (or (= lt!165591 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165591 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165591)))))

(assert (=> b!109482 (= lt!165591 ((_ sign_extend 32) (size!2269 (buf!2660 (_1!4799 lt!165185)))))))

(assert (= (and d!34500 res!90347) b!109481))

(assert (= (and b!109481 res!90348) b!109482))

(declare-fun m!162603 () Bool)

(assert (=> d!34500 m!162603))

(declare-fun m!162605 () Bool)

(assert (=> d!34500 m!162605))

(assert (=> b!109305 d!34500))

(declare-fun d!34502 () Bool)

(assert (=> d!34502 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165170) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165186)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171)))) lt!165170))))

(declare-fun bs!8425 () Bool)

(assert (= bs!8425 d!34502))

(declare-fun m!162607 () Bool)

(assert (=> bs!8425 m!162607))

(assert (=> b!109305 d!34502))

(declare-fun b!109623 () Bool)

(declare-fun e!71835 () tuple2!9086)

(declare-fun lt!165967 () Unit!6679)

(assert (=> b!109623 (= e!71835 (tuple2!9087 lt!165967 (_2!4800 lt!165171)))))

(declare-fun lt!165960 () BitStream!4012)

(assert (=> b!109623 (= lt!165960 (_2!4800 lt!165171))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4012) Unit!6679)

(assert (=> b!109623 (= lt!165967 (lemmaIsPrefixRefl!0 lt!165960))))

(declare-fun call!1383 () Bool)

(assert (=> b!109623 call!1383))

(declare-fun b!109624 () Bool)

(declare-fun res!90466 () Bool)

(declare-fun e!71831 () Bool)

(assert (=> b!109624 (=> (not res!90466) (not e!71831))))

(declare-fun lt!165985 () tuple2!9086)

(assert (=> b!109624 (= res!90466 (isPrefixOf!0 (_2!4800 lt!165171) (_2!4800 lt!165985)))))

(declare-fun b!109625 () Bool)

(declare-fun res!90467 () Bool)

(declare-fun lt!166001 () tuple2!9086)

(assert (=> b!109625 (= res!90467 (isPrefixOf!0 (_2!4800 lt!165171) (_2!4800 lt!166001)))))

(declare-fun e!71830 () Bool)

(assert (=> b!109625 (=> (not res!90467) (not e!71830))))

(declare-fun lt!165958 () tuple2!9086)

(declare-fun bm!1380 () Bool)

(declare-fun c!6705 () Bool)

(assert (=> bm!1380 (= call!1383 (isPrefixOf!0 (ite c!6705 (_2!4800 lt!165171) lt!165960) (ite c!6705 (_2!4800 lt!165958) lt!165960)))))

(declare-fun b!109626 () Bool)

(declare-fun lt!165964 () tuple2!9084)

(assert (=> b!109626 (= lt!165964 (readBitPure!0 (readerFrom!0 (_2!4800 lt!166001) (currentBit!5191 (_2!4800 lt!165171)) (currentByte!5196 (_2!4800 lt!165171)))))))

(declare-fun res!90472 () Bool)

(declare-fun lt!165986 () Bool)

(assert (=> b!109626 (= res!90472 (and (= (_2!4799 lt!165964) lt!165986) (= (_1!4799 lt!165964) (_2!4800 lt!166001))))))

(declare-fun e!71832 () Bool)

(assert (=> b!109626 (=> (not res!90472) (not e!71832))))

(assert (=> b!109626 (= e!71830 e!71832)))

(declare-fun b!109627 () Bool)

(declare-fun e!71834 () (_ BitVec 64))

(assert (=> b!109627 (= e!71834 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!109629 () Bool)

(declare-fun e!71833 () Bool)

(declare-fun lt!165973 () tuple2!9084)

(declare-fun lt!165979 () tuple2!9084)

(assert (=> b!109629 (= e!71833 (= (_2!4799 lt!165973) (_2!4799 lt!165979)))))

(declare-fun b!109630 () Bool)

(assert (=> b!109630 (= e!71832 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165964))) (currentByte!5196 (_1!4799 lt!165964)) (currentBit!5191 (_1!4799 lt!165964))) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!166001))) (currentByte!5196 (_2!4800 lt!166001)) (currentBit!5191 (_2!4800 lt!166001)))))))

(declare-fun lt!165981 () tuple2!9088)

(declare-fun b!109631 () Bool)

(declare-fun lt!165962 () tuple2!9090)

(assert (=> b!109631 (= e!71831 (and (= (_2!4802 lt!165962) v!199) (= (_1!4802 lt!165962) (_2!4801 lt!165981))))))

(declare-fun lt!165972 () (_ BitVec 64))

(assert (=> b!109631 (= lt!165962 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165981) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165972))))

(declare-fun lt!165994 () Unit!6679)

(declare-fun lt!165976 () Unit!6679)

(assert (=> b!109631 (= lt!165994 lt!165976)))

(declare-fun lt!165997 () (_ BitVec 64))

(assert (=> b!109631 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165985)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165997)))

(assert (=> b!109631 (= lt!165976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4800 lt!165171) (buf!2660 (_2!4800 lt!165985)) lt!165997))))

(declare-fun e!71836 () Bool)

(assert (=> b!109631 e!71836))

(declare-fun res!90468 () Bool)

(assert (=> b!109631 (=> (not res!90468) (not e!71836))))

(assert (=> b!109631 (= res!90468 (and (= (size!2269 (buf!2660 (_2!4800 lt!165171))) (size!2269 (buf!2660 (_2!4800 lt!165985)))) (bvsge lt!165997 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109631 (= lt!165997 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109631 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109631 (= lt!165972 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!109631 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109631 (= lt!165981 (reader!0 (_2!4800 lt!165171) (_2!4800 lt!165985)))))

(declare-fun b!109632 () Bool)

(assert (=> b!109632 (= e!71836 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165171)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165997))))

(declare-fun b!109633 () Bool)

(declare-fun res!90465 () Bool)

(assert (=> b!109633 (=> (not res!90465) (not e!71831))))

(declare-fun lt!165992 () (_ BitVec 64))

(declare-fun lt!165980 () (_ BitVec 64))

(assert (=> b!109633 (= res!90465 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165985))) (currentByte!5196 (_2!4800 lt!165985)) (currentBit!5191 (_2!4800 lt!165985))) (bvadd lt!165992 lt!165980)))))

(assert (=> b!109633 (or (not (= (bvand lt!165992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165980 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165992 lt!165980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109633 (= lt!165980 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109633 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109633 (= lt!165992 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(declare-fun b!109634 () Bool)

(declare-fun Unit!6693 () Unit!6679)

(assert (=> b!109634 (= e!71835 (tuple2!9087 Unit!6693 (_2!4800 lt!165958)))))

(assert (=> b!109634 (= lt!165986 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109634 (= lt!166001 (appendBit!0 (_2!4800 lt!165171) lt!165986))))

(declare-fun res!90469 () Bool)

(assert (=> b!109634 (= res!90469 (= (size!2269 (buf!2660 (_2!4800 lt!165171))) (size!2269 (buf!2660 (_2!4800 lt!166001)))))))

(assert (=> b!109634 (=> (not res!90469) (not e!71830))))

(assert (=> b!109634 e!71830))

(declare-fun lt!165975 () tuple2!9086)

(assert (=> b!109634 (= lt!165975 lt!166001)))

(assert (=> b!109634 (= lt!165958 (appendNLeastSignificantBitsLoop!0 (_2!4800 lt!165975) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!165998 () Unit!6679)

(assert (=> b!109634 (= lt!165998 (lemmaIsPrefixTransitive!0 (_2!4800 lt!165171) (_2!4800 lt!165975) (_2!4800 lt!165958)))))

(assert (=> b!109634 call!1383))

(declare-fun lt!165966 () Unit!6679)

(assert (=> b!109634 (= lt!165966 lt!165998)))

(assert (=> b!109634 (invariant!0 (currentBit!5191 (_2!4800 lt!165171)) (currentByte!5196 (_2!4800 lt!165171)) (size!2269 (buf!2660 (_2!4800 lt!165975))))))

(declare-fun lt!165991 () BitStream!4012)

(assert (=> b!109634 (= lt!165991 (BitStream!4013 (buf!2660 (_2!4800 lt!165975)) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(assert (=> b!109634 (invariant!0 (currentBit!5191 lt!165991) (currentByte!5196 lt!165991) (size!2269 (buf!2660 (_2!4800 lt!165958))))))

(declare-fun lt!165996 () BitStream!4012)

(assert (=> b!109634 (= lt!165996 (BitStream!4013 (buf!2660 (_2!4800 lt!165958)) (currentByte!5196 lt!165991) (currentBit!5191 lt!165991)))))

(assert (=> b!109634 (= lt!165973 (readBitPure!0 lt!165991))))

(assert (=> b!109634 (= lt!165979 (readBitPure!0 lt!165996))))

(declare-fun lt!165968 () Unit!6679)

(assert (=> b!109634 (= lt!165968 (readBitPrefixLemma!0 lt!165991 (_2!4800 lt!165958)))))

(declare-fun res!90471 () Bool)

(assert (=> b!109634 (= res!90471 (= (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165973))) (currentByte!5196 (_1!4799 lt!165973)) (currentBit!5191 (_1!4799 lt!165973))) (bitIndex!0 (size!2269 (buf!2660 (_1!4799 lt!165979))) (currentByte!5196 (_1!4799 lt!165979)) (currentBit!5191 (_1!4799 lt!165979)))))))

(assert (=> b!109634 (=> (not res!90471) (not e!71833))))

(assert (=> b!109634 e!71833))

(declare-fun lt!165977 () Unit!6679)

(assert (=> b!109634 (= lt!165977 lt!165968)))

(declare-fun lt!165984 () tuple2!9088)

(assert (=> b!109634 (= lt!165984 (reader!0 (_2!4800 lt!165171) (_2!4800 lt!165958)))))

(declare-fun lt!166002 () tuple2!9088)

(assert (=> b!109634 (= lt!166002 (reader!0 (_2!4800 lt!165975) (_2!4800 lt!165958)))))

(declare-fun lt!165988 () tuple2!9084)

(assert (=> b!109634 (= lt!165988 (readBitPure!0 (_1!4801 lt!165984)))))

(assert (=> b!109634 (= (_2!4799 lt!165988) lt!165986)))

(declare-fun lt!165971 () Unit!6679)

(declare-fun Unit!6694 () Unit!6679)

(assert (=> b!109634 (= lt!165971 Unit!6694)))

(declare-fun lt!165990 () (_ BitVec 64))

(assert (=> b!109634 (= lt!165990 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!165974 () (_ BitVec 64))

(assert (=> b!109634 (= lt!165974 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!165959 () Unit!6679)

(assert (=> b!109634 (= lt!165959 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4800 lt!165171) (buf!2660 (_2!4800 lt!165958)) lt!165974))))

(assert (=> b!109634 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165958)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165171))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165171))) lt!165974)))

(declare-fun lt!165969 () Unit!6679)

(assert (=> b!109634 (= lt!165969 lt!165959)))

(declare-fun lt!165961 () tuple2!9090)

(assert (=> b!109634 (= lt!165961 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165984) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165990))))

(declare-fun lt!165987 () (_ BitVec 64))

(assert (=> b!109634 (= lt!165987 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!165970 () Unit!6679)

(assert (=> b!109634 (= lt!165970 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4800 lt!165975) (buf!2660 (_2!4800 lt!165958)) lt!165987))))

(assert (=> b!109634 (validate_offset_bits!1 ((_ sign_extend 32) (size!2269 (buf!2660 (_2!4800 lt!165958)))) ((_ sign_extend 32) (currentByte!5196 (_2!4800 lt!165975))) ((_ sign_extend 32) (currentBit!5191 (_2!4800 lt!165975))) lt!165987)))

(declare-fun lt!165995 () Unit!6679)

(assert (=> b!109634 (= lt!165995 lt!165970)))

(declare-fun lt!165963 () tuple2!9090)

(assert (=> b!109634 (= lt!165963 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!166002) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!165990 (ite (_2!4799 lt!165988) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!165978 () tuple2!9090)

(assert (=> b!109634 (= lt!165978 (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165984) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165990))))

(declare-fun c!6704 () Bool)

(assert (=> b!109634 (= c!6704 (_2!4799 (readBitPure!0 (_1!4801 lt!165984))))))

(declare-fun lt!165982 () tuple2!9090)

(assert (=> b!109634 (= lt!165982 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4801 lt!165984) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!165990 e!71834)))))

(declare-fun lt!165999 () Unit!6679)

(assert (=> b!109634 (= lt!165999 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4801 lt!165984) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165990))))

(assert (=> b!109634 (and (= (_2!4802 lt!165978) (_2!4802 lt!165982)) (= (_1!4802 lt!165978) (_1!4802 lt!165982)))))

(declare-fun lt!166000 () Unit!6679)

(assert (=> b!109634 (= lt!166000 lt!165999)))

(assert (=> b!109634 (= (_1!4801 lt!165984) (withMovedBitIndex!0 (_2!4801 lt!165984) (bvsub (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165958))) (currentByte!5196 (_2!4800 lt!165958)) (currentBit!5191 (_2!4800 lt!165958))))))))

(declare-fun lt!165983 () Unit!6679)

(declare-fun Unit!6695 () Unit!6679)

(assert (=> b!109634 (= lt!165983 Unit!6695)))

(assert (=> b!109634 (= (_1!4801 lt!166002) (withMovedBitIndex!0 (_2!4801 lt!166002) (bvsub (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165975))) (currentByte!5196 (_2!4800 lt!165975)) (currentBit!5191 (_2!4800 lt!165975))) (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165958))) (currentByte!5196 (_2!4800 lt!165958)) (currentBit!5191 (_2!4800 lt!165958))))))))

(declare-fun lt!165965 () Unit!6679)

(declare-fun Unit!6696 () Unit!6679)

(assert (=> b!109634 (= lt!165965 Unit!6696)))

(assert (=> b!109634 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))) (bvsub (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165975))) (currentByte!5196 (_2!4800 lt!165975)) (currentBit!5191 (_2!4800 lt!165975))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!165989 () Unit!6679)

(declare-fun Unit!6697 () Unit!6679)

(assert (=> b!109634 (= lt!165989 Unit!6697)))

(assert (=> b!109634 (= (_2!4802 lt!165961) (_2!4802 lt!165963))))

(declare-fun lt!165993 () Unit!6679)

(declare-fun Unit!6698 () Unit!6679)

(assert (=> b!109634 (= lt!165993 Unit!6698)))

(assert (=> b!109634 (= (_1!4802 lt!165961) (_2!4801 lt!165984))))

(declare-fun b!109635 () Bool)

(assert (=> b!109635 (= e!71834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!109628 () Bool)

(declare-fun res!90470 () Bool)

(assert (=> b!109628 (= res!90470 (= (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!166001))) (currentByte!5196 (_2!4800 lt!166001)) (currentBit!5191 (_2!4800 lt!166001))) (bvadd (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!109628 (=> (not res!90470) (not e!71830))))

(declare-fun d!34504 () Bool)

(assert (=> d!34504 e!71831))

(declare-fun res!90473 () Bool)

(assert (=> d!34504 (=> (not res!90473) (not e!71831))))

(assert (=> d!34504 (= res!90473 (= (size!2269 (buf!2660 (_2!4800 lt!165171))) (size!2269 (buf!2660 (_2!4800 lt!165985)))))))

(assert (=> d!34504 (= lt!165985 e!71835)))

(assert (=> d!34504 (= c!6705 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34504 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34504 (= (appendNLeastSignificantBitsLoop!0 (_2!4800 lt!165171) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!165985)))

(assert (= (and d!34504 c!6705) b!109634))

(assert (= (and d!34504 (not c!6705)) b!109623))

(assert (= (and b!109634 res!90469) b!109628))

(assert (= (and b!109628 res!90470) b!109625))

(assert (= (and b!109625 res!90467) b!109626))

(assert (= (and b!109626 res!90472) b!109630))

(assert (= (and b!109634 res!90471) b!109629))

(assert (= (and b!109634 c!6704) b!109627))

(assert (= (and b!109634 (not c!6704)) b!109635))

(assert (= (or b!109634 b!109623) bm!1380))

(assert (= (and d!34504 res!90473) b!109633))

(assert (= (and b!109633 res!90465) b!109624))

(assert (= (and b!109624 res!90466) b!109631))

(assert (= (and b!109631 res!90468) b!109632))

(declare-fun m!162819 () Bool)

(assert (=> b!109633 m!162819))

(assert (=> b!109633 m!162217))

(declare-fun m!162821 () Bool)

(assert (=> bm!1380 m!162821))

(declare-fun m!162823 () Bool)

(assert (=> b!109626 m!162823))

(assert (=> b!109626 m!162823))

(declare-fun m!162825 () Bool)

(assert (=> b!109626 m!162825))

(declare-fun m!162827 () Bool)

(assert (=> b!109628 m!162827))

(assert (=> b!109628 m!162217))

(declare-fun m!162829 () Bool)

(assert (=> b!109630 m!162829))

(assert (=> b!109630 m!162827))

(declare-fun m!162831 () Bool)

(assert (=> b!109623 m!162831))

(declare-fun m!162833 () Bool)

(assert (=> b!109631 m!162833))

(declare-fun m!162835 () Bool)

(assert (=> b!109631 m!162835))

(declare-fun m!162837 () Bool)

(assert (=> b!109631 m!162837))

(declare-fun m!162839 () Bool)

(assert (=> b!109631 m!162839))

(declare-fun m!162841 () Bool)

(assert (=> b!109631 m!162841))

(declare-fun m!162843 () Bool)

(assert (=> b!109632 m!162843))

(declare-fun m!162845 () Bool)

(assert (=> b!109624 m!162845))

(declare-fun m!162847 () Bool)

(assert (=> b!109625 m!162847))

(declare-fun m!162849 () Bool)

(assert (=> b!109634 m!162849))

(declare-fun m!162851 () Bool)

(assert (=> b!109634 m!162851))

(declare-fun m!162853 () Bool)

(assert (=> b!109634 m!162853))

(declare-fun m!162855 () Bool)

(assert (=> b!109634 m!162855))

(assert (=> b!109634 m!162837))

(declare-fun m!162857 () Bool)

(assert (=> b!109634 m!162857))

(declare-fun m!162859 () Bool)

(assert (=> b!109634 m!162859))

(declare-fun m!162861 () Bool)

(assert (=> b!109634 m!162861))

(declare-fun m!162863 () Bool)

(assert (=> b!109634 m!162863))

(declare-fun m!162865 () Bool)

(assert (=> b!109634 m!162865))

(declare-fun m!162867 () Bool)

(assert (=> b!109634 m!162867))

(declare-fun m!162869 () Bool)

(assert (=> b!109634 m!162869))

(declare-fun m!162871 () Bool)

(assert (=> b!109634 m!162871))

(declare-fun m!162873 () Bool)

(assert (=> b!109634 m!162873))

(declare-fun m!162875 () Bool)

(assert (=> b!109634 m!162875))

(declare-fun m!162877 () Bool)

(assert (=> b!109634 m!162877))

(assert (=> b!109634 m!162217))

(declare-fun m!162879 () Bool)

(assert (=> b!109634 m!162879))

(declare-fun m!162881 () Bool)

(assert (=> b!109634 m!162881))

(declare-fun m!162883 () Bool)

(assert (=> b!109634 m!162883))

(declare-fun m!162885 () Bool)

(assert (=> b!109634 m!162885))

(declare-fun m!162887 () Bool)

(assert (=> b!109634 m!162887))

(declare-fun m!162889 () Bool)

(assert (=> b!109634 m!162889))

(assert (=> b!109634 m!162857))

(declare-fun m!162891 () Bool)

(assert (=> b!109634 m!162891))

(declare-fun m!162893 () Bool)

(assert (=> b!109634 m!162893))

(declare-fun m!162895 () Bool)

(assert (=> b!109634 m!162895))

(declare-fun m!162897 () Bool)

(assert (=> b!109634 m!162897))

(declare-fun m!162899 () Bool)

(assert (=> b!109634 m!162899))

(assert (=> b!109305 d!34504))

(declare-fun b!109685 () Bool)

(declare-fun e!71862 () Unit!6679)

(declare-fun lt!166194 () Unit!6679)

(assert (=> b!109685 (= e!71862 lt!166194)))

(declare-fun lt!166177 () (_ BitVec 64))

(assert (=> b!109685 (= lt!166177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!166190 () (_ BitVec 64))

(assert (=> b!109685 (= lt!166190 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4985 array!4985 (_ BitVec 64) (_ BitVec 64)) Unit!6679)

(assert (=> b!109685 (= lt!166194 (arrayBitRangesEqSymmetric!0 (buf!2660 thiss!1305) (buf!2660 (_2!4800 lt!165186)) lt!166177 lt!166190))))

(assert (=> b!109685 (arrayBitRangesEq!0 (buf!2660 (_2!4800 lt!165186)) (buf!2660 thiss!1305) lt!166177 lt!166190)))

(declare-fun lt!166197 () (_ BitVec 64))

(declare-fun lt!166191 () tuple2!9088)

(declare-fun b!109686 () Bool)

(declare-fun e!71863 () Bool)

(declare-fun lt!166176 () (_ BitVec 64))

(assert (=> b!109686 (= e!71863 (= (_1!4801 lt!166191) (withMovedBitIndex!0 (_2!4801 lt!166191) (bvsub lt!166197 lt!166176))))))

(assert (=> b!109686 (or (= (bvand lt!166197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166197 lt!166176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109686 (= lt!166176 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165186))) (currentByte!5196 (_2!4800 lt!165186)) (currentBit!5191 (_2!4800 lt!165186))))))

(assert (=> b!109686 (= lt!166197 (bitIndex!0 (size!2269 (buf!2660 thiss!1305)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun b!109687 () Bool)

(declare-fun res!90509 () Bool)

(assert (=> b!109687 (=> (not res!90509) (not e!71863))))

(assert (=> b!109687 (= res!90509 (isPrefixOf!0 (_2!4801 lt!166191) (_2!4800 lt!165186)))))

(declare-fun b!109688 () Bool)

(declare-fun res!90507 () Bool)

(assert (=> b!109688 (=> (not res!90507) (not e!71863))))

(assert (=> b!109688 (= res!90507 (isPrefixOf!0 (_1!4801 lt!166191) thiss!1305))))

(declare-fun b!109689 () Bool)

(declare-fun Unit!6699 () Unit!6679)

(assert (=> b!109689 (= e!71862 Unit!6699)))

(declare-fun d!34572 () Bool)

(assert (=> d!34572 e!71863))

(declare-fun res!90508 () Bool)

(assert (=> d!34572 (=> (not res!90508) (not e!71863))))

(assert (=> d!34572 (= res!90508 (isPrefixOf!0 (_1!4801 lt!166191) (_2!4801 lt!166191)))))

(declare-fun lt!166184 () BitStream!4012)

(assert (=> d!34572 (= lt!166191 (tuple2!9089 lt!166184 (_2!4800 lt!165186)))))

(declare-fun lt!166187 () Unit!6679)

(declare-fun lt!166178 () Unit!6679)

(assert (=> d!34572 (= lt!166187 lt!166178)))

(assert (=> d!34572 (isPrefixOf!0 lt!166184 (_2!4800 lt!165186))))

(assert (=> d!34572 (= lt!166178 (lemmaIsPrefixTransitive!0 lt!166184 (_2!4800 lt!165186) (_2!4800 lt!165186)))))

(declare-fun lt!166180 () Unit!6679)

(declare-fun lt!166185 () Unit!6679)

(assert (=> d!34572 (= lt!166180 lt!166185)))

(assert (=> d!34572 (isPrefixOf!0 lt!166184 (_2!4800 lt!165186))))

(assert (=> d!34572 (= lt!166185 (lemmaIsPrefixTransitive!0 lt!166184 thiss!1305 (_2!4800 lt!165186)))))

(declare-fun lt!166183 () Unit!6679)

(assert (=> d!34572 (= lt!166183 e!71862)))

(declare-fun c!6714 () Bool)

(assert (=> d!34572 (= c!6714 (not (= (size!2269 (buf!2660 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!166182 () Unit!6679)

(declare-fun lt!166188 () Unit!6679)

(assert (=> d!34572 (= lt!166182 lt!166188)))

(assert (=> d!34572 (isPrefixOf!0 (_2!4800 lt!165186) (_2!4800 lt!165186))))

(assert (=> d!34572 (= lt!166188 (lemmaIsPrefixRefl!0 (_2!4800 lt!165186)))))

(declare-fun lt!166192 () Unit!6679)

(declare-fun lt!166189 () Unit!6679)

(assert (=> d!34572 (= lt!166192 lt!166189)))

(assert (=> d!34572 (= lt!166189 (lemmaIsPrefixRefl!0 (_2!4800 lt!165186)))))

(declare-fun lt!166186 () Unit!6679)

(declare-fun lt!166193 () Unit!6679)

(assert (=> d!34572 (= lt!166186 lt!166193)))

(assert (=> d!34572 (isPrefixOf!0 lt!166184 lt!166184)))

(assert (=> d!34572 (= lt!166193 (lemmaIsPrefixRefl!0 lt!166184))))

(declare-fun lt!166196 () Unit!6679)

(declare-fun lt!166195 () Unit!6679)

(assert (=> d!34572 (= lt!166196 lt!166195)))

(assert (=> d!34572 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34572 (= lt!166195 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34572 (= lt!166184 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(assert (=> d!34572 (isPrefixOf!0 thiss!1305 (_2!4800 lt!165186))))

(assert (=> d!34572 (= (reader!0 thiss!1305 (_2!4800 lt!165186)) lt!166191)))

(assert (= (and d!34572 c!6714) b!109685))

(assert (= (and d!34572 (not c!6714)) b!109689))

(assert (= (and d!34572 res!90508) b!109688))

(assert (= (and b!109688 res!90507) b!109687))

(assert (= (and b!109687 res!90509) b!109686))

(declare-fun m!162901 () Bool)

(assert (=> b!109687 m!162901))

(declare-fun m!162903 () Bool)

(assert (=> b!109688 m!162903))

(assert (=> b!109685 m!162225))

(declare-fun m!162905 () Bool)

(assert (=> b!109685 m!162905))

(declare-fun m!162907 () Bool)

(assert (=> b!109685 m!162907))

(declare-fun m!162909 () Bool)

(assert (=> d!34572 m!162909))

(declare-fun m!162911 () Bool)

(assert (=> d!34572 m!162911))

(declare-fun m!162913 () Bool)

(assert (=> d!34572 m!162913))

(declare-fun m!162915 () Bool)

(assert (=> d!34572 m!162915))

(declare-fun m!162917 () Bool)

(assert (=> d!34572 m!162917))

(assert (=> d!34572 m!162237))

(declare-fun m!162919 () Bool)

(assert (=> d!34572 m!162919))

(declare-fun m!162921 () Bool)

(assert (=> d!34572 m!162921))

(declare-fun m!162923 () Bool)

(assert (=> d!34572 m!162923))

(declare-fun m!162925 () Bool)

(assert (=> d!34572 m!162925))

(declare-fun m!162927 () Bool)

(assert (=> d!34572 m!162927))

(declare-fun m!162929 () Bool)

(assert (=> b!109686 m!162929))

(assert (=> b!109686 m!162215))

(assert (=> b!109686 m!162225))

(assert (=> b!109305 d!34572))

(declare-fun lt!166198 () tuple2!9112)

(declare-fun d!34574 () Bool)

(assert (=> d!34574 (= lt!166198 (readNLeastSignificantBitsLoop!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181))))

(assert (=> d!34574 (= (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165175) nBits!396 i!615 lt!165181) (tuple2!9091 (_2!4813 lt!166198) (_1!4813 lt!166198)))))

(declare-fun bs!8438 () Bool)

(assert (= bs!8438 d!34574))

(declare-fun m!162931 () Bool)

(assert (=> bs!8438 m!162931))

(assert (=> b!109305 d!34574))

(declare-fun d!34576 () Bool)

(declare-fun lt!166199 () tuple2!9114)

(assert (=> d!34576 (= lt!166199 (readBit!0 (_1!4801 lt!165175)))))

(assert (=> d!34576 (= (readBitPure!0 (_1!4801 lt!165175)) (tuple2!9085 (_2!4814 lt!166199) (_1!4814 lt!166199)))))

(declare-fun bs!8439 () Bool)

(assert (= bs!8439 d!34576))

(declare-fun m!162933 () Bool)

(assert (=> bs!8439 m!162933))

(assert (=> b!109305 d!34576))

(declare-fun b!109690 () Bool)

(declare-fun e!71864 () Unit!6679)

(declare-fun lt!166216 () Unit!6679)

(assert (=> b!109690 (= e!71864 lt!166216)))

(declare-fun lt!166201 () (_ BitVec 64))

(assert (=> b!109690 (= lt!166201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!166212 () (_ BitVec 64))

(assert (=> b!109690 (= lt!166212 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(assert (=> b!109690 (= lt!166216 (arrayBitRangesEqSymmetric!0 (buf!2660 (_2!4800 lt!165171)) (buf!2660 (_2!4800 lt!165186)) lt!166201 lt!166212))))

(assert (=> b!109690 (arrayBitRangesEq!0 (buf!2660 (_2!4800 lt!165186)) (buf!2660 (_2!4800 lt!165171)) lt!166201 lt!166212)))

(declare-fun b!109691 () Bool)

(declare-fun lt!166213 () tuple2!9088)

(declare-fun lt!166219 () (_ BitVec 64))

(declare-fun lt!166200 () (_ BitVec 64))

(declare-fun e!71865 () Bool)

(assert (=> b!109691 (= e!71865 (= (_1!4801 lt!166213) (withMovedBitIndex!0 (_2!4801 lt!166213) (bvsub lt!166219 lt!166200))))))

(assert (=> b!109691 (or (= (bvand lt!166219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!166219 lt!166200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109691 (= lt!166200 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165186))) (currentByte!5196 (_2!4800 lt!165186)) (currentBit!5191 (_2!4800 lt!165186))))))

(assert (=> b!109691 (= lt!166219 (bitIndex!0 (size!2269 (buf!2660 (_2!4800 lt!165171))) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(declare-fun b!109692 () Bool)

(declare-fun res!90512 () Bool)

(assert (=> b!109692 (=> (not res!90512) (not e!71865))))

(assert (=> b!109692 (= res!90512 (isPrefixOf!0 (_2!4801 lt!166213) (_2!4800 lt!165186)))))

(declare-fun b!109693 () Bool)

(declare-fun res!90510 () Bool)

(assert (=> b!109693 (=> (not res!90510) (not e!71865))))

(assert (=> b!109693 (= res!90510 (isPrefixOf!0 (_1!4801 lt!166213) (_2!4800 lt!165171)))))

(declare-fun b!109694 () Bool)

(declare-fun Unit!6700 () Unit!6679)

(assert (=> b!109694 (= e!71864 Unit!6700)))

(declare-fun d!34578 () Bool)

(assert (=> d!34578 e!71865))

(declare-fun res!90511 () Bool)

(assert (=> d!34578 (=> (not res!90511) (not e!71865))))

(assert (=> d!34578 (= res!90511 (isPrefixOf!0 (_1!4801 lt!166213) (_2!4801 lt!166213)))))

(declare-fun lt!166206 () BitStream!4012)

(assert (=> d!34578 (= lt!166213 (tuple2!9089 lt!166206 (_2!4800 lt!165186)))))

(declare-fun lt!166209 () Unit!6679)

(declare-fun lt!166202 () Unit!6679)

(assert (=> d!34578 (= lt!166209 lt!166202)))

(assert (=> d!34578 (isPrefixOf!0 lt!166206 (_2!4800 lt!165186))))

(assert (=> d!34578 (= lt!166202 (lemmaIsPrefixTransitive!0 lt!166206 (_2!4800 lt!165186) (_2!4800 lt!165186)))))

(declare-fun lt!166203 () Unit!6679)

(declare-fun lt!166207 () Unit!6679)

(assert (=> d!34578 (= lt!166203 lt!166207)))

(assert (=> d!34578 (isPrefixOf!0 lt!166206 (_2!4800 lt!165186))))

(assert (=> d!34578 (= lt!166207 (lemmaIsPrefixTransitive!0 lt!166206 (_2!4800 lt!165171) (_2!4800 lt!165186)))))

(declare-fun lt!166205 () Unit!6679)

(assert (=> d!34578 (= lt!166205 e!71864)))

(declare-fun c!6715 () Bool)

(assert (=> d!34578 (= c!6715 (not (= (size!2269 (buf!2660 (_2!4800 lt!165171))) #b00000000000000000000000000000000)))))

(declare-fun lt!166204 () Unit!6679)

(declare-fun lt!166210 () Unit!6679)

(assert (=> d!34578 (= lt!166204 lt!166210)))

(assert (=> d!34578 (isPrefixOf!0 (_2!4800 lt!165186) (_2!4800 lt!165186))))

(assert (=> d!34578 (= lt!166210 (lemmaIsPrefixRefl!0 (_2!4800 lt!165186)))))

(declare-fun lt!166214 () Unit!6679)

(declare-fun lt!166211 () Unit!6679)

(assert (=> d!34578 (= lt!166214 lt!166211)))

(assert (=> d!34578 (= lt!166211 (lemmaIsPrefixRefl!0 (_2!4800 lt!165186)))))

(declare-fun lt!166208 () Unit!6679)

(declare-fun lt!166215 () Unit!6679)

(assert (=> d!34578 (= lt!166208 lt!166215)))

(assert (=> d!34578 (isPrefixOf!0 lt!166206 lt!166206)))

(assert (=> d!34578 (= lt!166215 (lemmaIsPrefixRefl!0 lt!166206))))

(declare-fun lt!166218 () Unit!6679)

(declare-fun lt!166217 () Unit!6679)

(assert (=> d!34578 (= lt!166218 lt!166217)))

(assert (=> d!34578 (isPrefixOf!0 (_2!4800 lt!165171) (_2!4800 lt!165171))))

(assert (=> d!34578 (= lt!166217 (lemmaIsPrefixRefl!0 (_2!4800 lt!165171)))))

(assert (=> d!34578 (= lt!166206 (BitStream!4013 (buf!2660 (_2!4800 lt!165186)) (currentByte!5196 (_2!4800 lt!165171)) (currentBit!5191 (_2!4800 lt!165171))))))

(assert (=> d!34578 (isPrefixOf!0 (_2!4800 lt!165171) (_2!4800 lt!165186))))

(assert (=> d!34578 (= (reader!0 (_2!4800 lt!165171) (_2!4800 lt!165186)) lt!166213)))

(assert (= (and d!34578 c!6715) b!109690))

(assert (= (and d!34578 (not c!6715)) b!109694))

(assert (= (and d!34578 res!90511) b!109693))

(assert (= (and b!109693 res!90510) b!109692))

(assert (= (and b!109692 res!90512) b!109691))

(declare-fun m!162935 () Bool)

(assert (=> b!109692 m!162935))

(declare-fun m!162937 () Bool)

(assert (=> b!109693 m!162937))

(assert (=> b!109690 m!162217))

(declare-fun m!162939 () Bool)

(assert (=> b!109690 m!162939))

(declare-fun m!162941 () Bool)

(assert (=> b!109690 m!162941))

(assert (=> d!34578 m!162909))

(declare-fun m!162943 () Bool)

(assert (=> d!34578 m!162943))

(declare-fun m!162945 () Bool)

(assert (=> d!34578 m!162945))

(declare-fun m!162947 () Bool)

(assert (=> d!34578 m!162947))

(declare-fun m!162949 () Bool)

(assert (=> d!34578 m!162949))

(declare-fun m!162951 () Bool)

(assert (=> d!34578 m!162951))

(declare-fun m!162953 () Bool)

(assert (=> d!34578 m!162953))

(assert (=> d!34578 m!162921))

(declare-fun m!162955 () Bool)

(assert (=> d!34578 m!162955))

(declare-fun m!162957 () Bool)

(assert (=> d!34578 m!162957))

(declare-fun m!162959 () Bool)

(assert (=> d!34578 m!162959))

(declare-fun m!162963 () Bool)

(assert (=> b!109691 m!162963))

(assert (=> b!109691 m!162215))

(assert (=> b!109691 m!162217))

(assert (=> b!109305 d!34578))

(declare-fun d!34580 () Bool)

(declare-fun lt!166220 () tuple2!9112)

(assert (=> d!34580 (= lt!166220 (readNLeastSignificantBitsLoop!0 (_1!4801 lt!165183) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166))))

(assert (=> d!34580 (= (readNLeastSignificantBitsLoopPure!0 (_1!4801 lt!165183) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165166) (tuple2!9091 (_2!4813 lt!166220) (_1!4813 lt!166220)))))

(declare-fun bs!8440 () Bool)

(assert (= bs!8440 d!34580))

(declare-fun m!162977 () Bool)

(assert (=> bs!8440 m!162977))

(assert (=> b!109305 d!34580))

(declare-fun d!34582 () Bool)

(assert (=> d!34582 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!109303 d!34582))

(declare-fun d!34584 () Bool)

(assert (=> d!34584 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 thiss!1305))))))

(declare-fun bs!8441 () Bool)

(assert (= bs!8441 d!34584))

(assert (=> bs!8441 m!162523))

(assert (=> start!21622 d!34584))

(declare-fun d!34586 () Bool)

(assert (=> d!34586 (= (array_inv!2071 (buf!2660 thiss!1305)) (bvsge (size!2269 (buf!2660 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!109307 d!34586))

(declare-fun d!34588 () Bool)

(declare-fun lt!166221 () tuple2!9114)

(assert (=> d!34588 (= lt!166221 (readBit!0 (readerFrom!0 (_2!4800 lt!165171) (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305))))))

(assert (=> d!34588 (= (readBitPure!0 (readerFrom!0 (_2!4800 lt!165171) (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305))) (tuple2!9085 (_2!4814 lt!166221) (_1!4814 lt!166221)))))

(declare-fun bs!8442 () Bool)

(assert (= bs!8442 d!34588))

(assert (=> bs!8442 m!162273))

(declare-fun m!163043 () Bool)

(assert (=> bs!8442 m!163043))

(assert (=> b!109308 d!34588))

(declare-fun d!34590 () Bool)

(declare-fun e!71868 () Bool)

(assert (=> d!34590 e!71868))

(declare-fun res!90516 () Bool)

(assert (=> d!34590 (=> (not res!90516) (not e!71868))))

(assert (=> d!34590 (= res!90516 (invariant!0 (currentBit!5191 (_2!4800 lt!165171)) (currentByte!5196 (_2!4800 lt!165171)) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(assert (=> d!34590 (= (readerFrom!0 (_2!4800 lt!165171) (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305)) (BitStream!4013 (buf!2660 (_2!4800 lt!165171)) (currentByte!5196 thiss!1305) (currentBit!5191 thiss!1305)))))

(declare-fun b!109697 () Bool)

(assert (=> b!109697 (= e!71868 (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165171)))))))

(assert (= (and d!34590 res!90516) b!109697))

(assert (=> d!34590 m!162521))

(assert (=> b!109697 m!162271))

(assert (=> b!109308 d!34590))

(declare-fun d!34596 () Bool)

(assert (=> d!34596 (= (invariant!0 (currentBit!5191 thiss!1305) (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165186)))) (and (bvsge (currentBit!5191 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5191 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5196 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165186)))) (and (= (currentBit!5191 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5196 thiss!1305) (size!2269 (buf!2660 (_2!4800 lt!165186))))))))))

(assert (=> b!109306 d!34596))

(push 1)

(assert (not b!109478))

(assert (not d!34462))

(assert (not b!109474))

(assert (not d!34584))

(assert (not b!109625))

(assert (not d!34452))

(assert (not b!109693))

(assert (not d!34484))

(assert (not d!34472))

(assert (not d!34498))

(assert (not b!109691))

(assert (not b!109448))

(assert (not b!109697))

(assert (not b!109628))

(assert (not b!109632))

(assert (not b!109633))

(assert (not b!109480))

(assert (not d!34454))

(assert (not b!109475))

(assert (not d!34578))

(assert (not d!34476))

(assert (not d!34576))

(assert (not b!109623))

(assert (not d!34502))

(assert (not b!109446))

(assert (not d!34490))

(assert (not d!34460))

(assert (not b!109692))

(assert (not bm!1380))

(assert (not d!34488))

(assert (not b!109634))

(assert (not d!34580))

(assert (not d!34588))

(assert (not d!34574))

(assert (not b!109687))

(assert (not d!34474))

(assert (not b!109688))

(assert (not d!34464))

(assert (not b!109476))

(assert (not d!34572))

(assert (not d!34486))

(assert (not b!109477))

(assert (not d!34590))

(assert (not d!34492))

(assert (not b!109624))

(assert (not b!109630))

(assert (not b!109626))

(assert (not d!34482))

(assert (not b!109686))

(assert (not d!34480))

(assert (not d!34468))

(assert (not b!109690))

(assert (not d!34496))

(assert (not b!109685))

(assert (not d!34500))

(assert (not d!34466))

(assert (not b!109631))

(assert (not d!34470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

