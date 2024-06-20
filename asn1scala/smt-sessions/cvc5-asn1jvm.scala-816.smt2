; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24158 () Bool)

(assert start!24158)

(declare-fun b!122238 () Bool)

(declare-fun e!80069 () Bool)

(declare-fun e!80067 () Bool)

(assert (=> b!122238 (= e!80069 (not e!80067))))

(declare-fun res!101274 () Bool)

(assert (=> b!122238 (=> res!101274 e!80067)))

(declare-datatypes ((array!5408 0))(
  ( (array!5409 (arr!3039 (Array (_ BitVec 32) (_ BitVec 8))) (size!2446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4366 0))(
  ( (BitStream!4367 (buf!2886 array!5408) (currentByte!5583 (_ BitVec 32)) (currentBit!5578 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10288 0))(
  ( (tuple2!10289 (_1!5409 BitStream!4366) (_2!5409 (_ BitVec 64))) )
))
(declare-fun lt!192170 () tuple2!10288)

(declare-datatypes ((tuple2!10290 0))(
  ( (tuple2!10291 (_1!5410 BitStream!4366) (_2!5410 BitStream!4366)) )
))
(declare-fun lt!192175 () tuple2!10290)

(assert (=> b!122238 (= res!101274 (not (= (_1!5409 lt!192170) (_2!5410 lt!192175))))))

(declare-fun lt!192187 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10288)

(assert (=> b!122238 (= lt!192170 (readNLeastSignificantBitsLoopPure!0 (_1!5410 lt!192175) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192187))))

(declare-datatypes ((Unit!7531 0))(
  ( (Unit!7532) )
))
(declare-datatypes ((tuple2!10292 0))(
  ( (tuple2!10293 (_1!5411 Unit!7531) (_2!5411 BitStream!4366)) )
))
(declare-fun lt!192182 () tuple2!10292)

(declare-fun lt!192164 () tuple2!10292)

(declare-fun lt!192178 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122238 (validate_offset_bits!1 ((_ sign_extend 32) (size!2446 (buf!2886 (_2!5411 lt!192182)))) ((_ sign_extend 32) (currentByte!5583 (_2!5411 lt!192164))) ((_ sign_extend 32) (currentBit!5578 (_2!5411 lt!192164))) lt!192178)))

(declare-fun lt!192174 () Unit!7531)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4366 array!5408 (_ BitVec 64)) Unit!7531)

(assert (=> b!122238 (= lt!192174 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5411 lt!192164) (buf!2886 (_2!5411 lt!192182)) lt!192178))))

(assert (=> b!122238 (= lt!192178 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192186 () (_ BitVec 64))

(declare-fun lt!192190 () (_ BitVec 64))

(declare-datatypes ((tuple2!10294 0))(
  ( (tuple2!10295 (_1!5412 BitStream!4366) (_2!5412 Bool)) )
))
(declare-fun lt!192180 () tuple2!10294)

(assert (=> b!122238 (= lt!192187 (bvor lt!192186 (ite (_2!5412 lt!192180) lt!192190 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!192176 () tuple2!10288)

(declare-fun lt!192185 () tuple2!10290)

(assert (=> b!122238 (= lt!192176 (readNLeastSignificantBitsLoopPure!0 (_1!5410 lt!192185) nBits!396 i!615 lt!192186))))

(declare-fun thiss!1305 () BitStream!4366)

(declare-fun lt!192168 () (_ BitVec 64))

(assert (=> b!122238 (validate_offset_bits!1 ((_ sign_extend 32) (size!2446 (buf!2886 (_2!5411 lt!192182)))) ((_ sign_extend 32) (currentByte!5583 thiss!1305)) ((_ sign_extend 32) (currentBit!5578 thiss!1305)) lt!192168)))

(declare-fun lt!192173 () Unit!7531)

(assert (=> b!122238 (= lt!192173 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2886 (_2!5411 lt!192182)) lt!192168))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122238 (= lt!192186 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192188 () Bool)

(assert (=> b!122238 (= (_2!5412 lt!192180) lt!192188)))

(declare-fun readBitPure!0 (BitStream!4366) tuple2!10294)

(assert (=> b!122238 (= lt!192180 (readBitPure!0 (_1!5410 lt!192185)))))

(declare-fun reader!0 (BitStream!4366 BitStream!4366) tuple2!10290)

(assert (=> b!122238 (= lt!192175 (reader!0 (_2!5411 lt!192164) (_2!5411 lt!192182)))))

(assert (=> b!122238 (= lt!192185 (reader!0 thiss!1305 (_2!5411 lt!192182)))))

(declare-fun e!80066 () Bool)

(assert (=> b!122238 e!80066))

(declare-fun res!101279 () Bool)

(assert (=> b!122238 (=> (not res!101279) (not e!80066))))

(declare-fun lt!192191 () tuple2!10294)

(declare-fun lt!192179 () tuple2!10294)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122238 (= res!101279 (= (bitIndex!0 (size!2446 (buf!2886 (_1!5412 lt!192191))) (currentByte!5583 (_1!5412 lt!192191)) (currentBit!5578 (_1!5412 lt!192191))) (bitIndex!0 (size!2446 (buf!2886 (_1!5412 lt!192179))) (currentByte!5583 (_1!5412 lt!192179)) (currentBit!5578 (_1!5412 lt!192179)))))))

(declare-fun lt!192165 () Unit!7531)

(declare-fun lt!192167 () BitStream!4366)

(declare-fun readBitPrefixLemma!0 (BitStream!4366 BitStream!4366) Unit!7531)

(assert (=> b!122238 (= lt!192165 (readBitPrefixLemma!0 lt!192167 (_2!5411 lt!192182)))))

(assert (=> b!122238 (= lt!192179 (readBitPure!0 (BitStream!4367 (buf!2886 (_2!5411 lt!192182)) (currentByte!5583 thiss!1305) (currentBit!5578 thiss!1305))))))

(assert (=> b!122238 (= lt!192191 (readBitPure!0 lt!192167))))

(assert (=> b!122238 (= lt!192167 (BitStream!4367 (buf!2886 (_2!5411 lt!192164)) (currentByte!5583 thiss!1305) (currentBit!5578 thiss!1305)))))

(declare-fun e!80073 () Bool)

(assert (=> b!122238 e!80073))

(declare-fun res!101277 () Bool)

(assert (=> b!122238 (=> (not res!101277) (not e!80073))))

(declare-fun isPrefixOf!0 (BitStream!4366 BitStream!4366) Bool)

(assert (=> b!122238 (= res!101277 (isPrefixOf!0 thiss!1305 (_2!5411 lt!192182)))))

(declare-fun lt!192184 () Unit!7531)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4366 BitStream!4366 BitStream!4366) Unit!7531)

(assert (=> b!122238 (= lt!192184 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5411 lt!192164) (_2!5411 lt!192182)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10292)

(assert (=> b!122238 (= lt!192182 (appendNLeastSignificantBitsLoop!0 (_2!5411 lt!192164) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80068 () Bool)

(assert (=> b!122238 e!80068))

(declare-fun res!101276 () Bool)

(assert (=> b!122238 (=> (not res!101276) (not e!80068))))

(assert (=> b!122238 (= res!101276 (= (size!2446 (buf!2886 thiss!1305)) (size!2446 (buf!2886 (_2!5411 lt!192164)))))))

(declare-fun appendBit!0 (BitStream!4366 Bool) tuple2!10292)

(assert (=> b!122238 (= lt!192164 (appendBit!0 thiss!1305 lt!192188))))

(assert (=> b!122238 (= lt!192188 (not (= (bvand v!199 lt!192190) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122238 (= lt!192190 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!101284 () Bool)

(declare-fun e!80072 () Bool)

(assert (=> start!24158 (=> (not res!101284) (not e!80072))))

(assert (=> start!24158 (= res!101284 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24158 e!80072))

(assert (=> start!24158 true))

(declare-fun e!80071 () Bool)

(declare-fun inv!12 (BitStream!4366) Bool)

(assert (=> start!24158 (and (inv!12 thiss!1305) e!80071)))

(declare-fun b!122239 () Bool)

(assert (=> b!122239 (= e!80066 (= (_2!5412 lt!192191) (_2!5412 lt!192179)))))

(declare-fun e!80076 () Bool)

(declare-fun lt!192181 () (_ BitVec 64))

(declare-fun lt!192171 () BitStream!4366)

(declare-fun b!122240 () Bool)

(declare-fun lt!192192 () (_ BitVec 64))

(assert (=> b!122240 (= e!80076 (and (= lt!192181 (bvsub lt!192192 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5410 lt!192175) lt!192171)) (and (= (_2!5409 lt!192176) (_2!5409 lt!192170)) (= (_1!5409 lt!192176) (_2!5410 lt!192185))))))))

(declare-fun b!122241 () Bool)

(declare-fun res!101286 () Bool)

(assert (=> b!122241 (=> (not res!101286) (not e!80073))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122241 (= res!101286 (invariant!0 (currentBit!5578 thiss!1305) (currentByte!5583 thiss!1305) (size!2446 (buf!2886 (_2!5411 lt!192164)))))))

(declare-fun b!122242 () Bool)

(declare-fun e!80070 () Bool)

(declare-fun lt!192166 () tuple2!10294)

(declare-fun lt!192177 () (_ BitVec 64))

(assert (=> b!122242 (= e!80070 (= (bitIndex!0 (size!2446 (buf!2886 (_1!5412 lt!192166))) (currentByte!5583 (_1!5412 lt!192166)) (currentBit!5578 (_1!5412 lt!192166))) lt!192177))))

(declare-fun b!122243 () Bool)

(declare-fun res!101278 () Bool)

(assert (=> b!122243 (=> (not res!101278) (not e!80069))))

(assert (=> b!122243 (= res!101278 (bvslt i!615 nBits!396))))

(declare-fun b!122244 () Bool)

(declare-fun e!80075 () Bool)

(assert (=> b!122244 (= e!80068 e!80075)))

(declare-fun res!101285 () Bool)

(assert (=> b!122244 (=> (not res!101285) (not e!80075))))

(declare-fun lt!192189 () (_ BitVec 64))

(assert (=> b!122244 (= res!101285 (= lt!192177 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192189)))))

(assert (=> b!122244 (= lt!192177 (bitIndex!0 (size!2446 (buf!2886 (_2!5411 lt!192164))) (currentByte!5583 (_2!5411 lt!192164)) (currentBit!5578 (_2!5411 lt!192164))))))

(assert (=> b!122244 (= lt!192189 (bitIndex!0 (size!2446 (buf!2886 thiss!1305)) (currentByte!5583 thiss!1305) (currentBit!5578 thiss!1305)))))

(declare-fun b!122245 () Bool)

(assert (=> b!122245 (= e!80072 e!80069)))

(declare-fun res!101283 () Bool)

(assert (=> b!122245 (=> (not res!101283) (not e!80069))))

(assert (=> b!122245 (= res!101283 (validate_offset_bits!1 ((_ sign_extend 32) (size!2446 (buf!2886 thiss!1305))) ((_ sign_extend 32) (currentByte!5583 thiss!1305)) ((_ sign_extend 32) (currentBit!5578 thiss!1305)) lt!192168))))

(assert (=> b!122245 (= lt!192168 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122246 () Bool)

(declare-fun res!101281 () Bool)

(assert (=> b!122246 (=> (not res!101281) (not e!80069))))

(assert (=> b!122246 (= res!101281 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122247 () Bool)

(assert (=> b!122247 (= e!80075 e!80070)))

(declare-fun res!101282 () Bool)

(assert (=> b!122247 (=> (not res!101282) (not e!80070))))

(assert (=> b!122247 (= res!101282 (and (= (_2!5412 lt!192166) lt!192188) (= (_1!5412 lt!192166) (_2!5411 lt!192164))))))

(declare-fun readerFrom!0 (BitStream!4366 (_ BitVec 32) (_ BitVec 32)) BitStream!4366)

(assert (=> b!122247 (= lt!192166 (readBitPure!0 (readerFrom!0 (_2!5411 lt!192164) (currentBit!5578 thiss!1305) (currentByte!5583 thiss!1305))))))

(declare-fun b!122248 () Bool)

(declare-fun array_inv!2248 (array!5408) Bool)

(assert (=> b!122248 (= e!80071 (array_inv!2248 (buf!2886 thiss!1305)))))

(declare-fun b!122249 () Bool)

(assert (=> b!122249 (= e!80073 (invariant!0 (currentBit!5578 thiss!1305) (currentByte!5583 thiss!1305) (size!2446 (buf!2886 (_2!5411 lt!192182)))))))

(declare-fun lt!192172 () (_ BitVec 64))

(declare-fun b!122250 () Bool)

(assert (=> b!122250 (= e!80067 (or (not (= (_1!5410 lt!192175) lt!192171)) (not (= (size!2446 (buf!2886 thiss!1305)) (size!2446 (buf!2886 (_2!5411 lt!192182))))) (not (= lt!192172 (bvadd lt!192181 lt!192168))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122250 e!80076))

(declare-fun res!101280 () Bool)

(assert (=> b!122250 (=> (not res!101280) (not e!80076))))

(declare-fun withMovedBitIndex!0 (BitStream!4366 (_ BitVec 64)) BitStream!4366)

(assert (=> b!122250 (= res!101280 (= (_1!5410 lt!192175) (withMovedBitIndex!0 (_2!5410 lt!192175) (bvsub lt!192192 lt!192172))))))

(assert (=> b!122250 (= lt!192192 (bitIndex!0 (size!2446 (buf!2886 (_2!5411 lt!192164))) (currentByte!5583 (_2!5411 lt!192164)) (currentBit!5578 (_2!5411 lt!192164))))))

(assert (=> b!122250 (= (_1!5410 lt!192185) (withMovedBitIndex!0 (_2!5410 lt!192185) (bvsub lt!192181 lt!192172)))))

(assert (=> b!122250 (= lt!192172 (bitIndex!0 (size!2446 (buf!2886 (_2!5411 lt!192182))) (currentByte!5583 (_2!5411 lt!192182)) (currentBit!5578 (_2!5411 lt!192182))))))

(assert (=> b!122250 (= lt!192181 (bitIndex!0 (size!2446 (buf!2886 thiss!1305)) (currentByte!5583 thiss!1305) (currentBit!5578 thiss!1305)))))

(declare-fun lt!192169 () tuple2!10288)

(assert (=> b!122250 (and (= (_2!5409 lt!192176) (_2!5409 lt!192169)) (= (_1!5409 lt!192176) (_1!5409 lt!192169)))))

(declare-fun lt!192183 () Unit!7531)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7531)

(assert (=> b!122250 (= lt!192183 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5410 lt!192185) nBits!396 i!615 lt!192186))))

(assert (=> b!122250 (= lt!192169 (readNLeastSignificantBitsLoopPure!0 lt!192171 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192187))))

(assert (=> b!122250 (= lt!192171 (withMovedBitIndex!0 (_1!5410 lt!192185) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122251 () Bool)

(declare-fun res!101275 () Bool)

(assert (=> b!122251 (=> (not res!101275) (not e!80075))))

(assert (=> b!122251 (= res!101275 (isPrefixOf!0 thiss!1305 (_2!5411 lt!192164)))))

(assert (= (and start!24158 res!101284) b!122245))

(assert (= (and b!122245 res!101283) b!122246))

(assert (= (and b!122246 res!101281) b!122243))

(assert (= (and b!122243 res!101278) b!122238))

(assert (= (and b!122238 res!101276) b!122244))

(assert (= (and b!122244 res!101285) b!122251))

(assert (= (and b!122251 res!101275) b!122247))

(assert (= (and b!122247 res!101282) b!122242))

(assert (= (and b!122238 res!101277) b!122241))

(assert (= (and b!122241 res!101286) b!122249))

(assert (= (and b!122238 res!101279) b!122239))

(assert (= (and b!122238 (not res!101274)) b!122250))

(assert (= (and b!122250 res!101280) b!122240))

(assert (= start!24158 b!122248))

(declare-fun m!185603 () Bool)

(assert (=> b!122241 m!185603))

(declare-fun m!185605 () Bool)

(assert (=> start!24158 m!185605))

(declare-fun m!185607 () Bool)

(assert (=> b!122244 m!185607))

(declare-fun m!185609 () Bool)

(assert (=> b!122244 m!185609))

(declare-fun m!185611 () Bool)

(assert (=> b!122245 m!185611))

(declare-fun m!185613 () Bool)

(assert (=> b!122250 m!185613))

(declare-fun m!185615 () Bool)

(assert (=> b!122250 m!185615))

(assert (=> b!122250 m!185609))

(declare-fun m!185617 () Bool)

(assert (=> b!122250 m!185617))

(assert (=> b!122250 m!185607))

(declare-fun m!185619 () Bool)

(assert (=> b!122250 m!185619))

(declare-fun m!185621 () Bool)

(assert (=> b!122250 m!185621))

(declare-fun m!185623 () Bool)

(assert (=> b!122250 m!185623))

(declare-fun m!185625 () Bool)

(assert (=> b!122249 m!185625))

(declare-fun m!185627 () Bool)

(assert (=> b!122248 m!185627))

(declare-fun m!185629 () Bool)

(assert (=> b!122251 m!185629))

(declare-fun m!185631 () Bool)

(assert (=> b!122238 m!185631))

(declare-fun m!185633 () Bool)

(assert (=> b!122238 m!185633))

(declare-fun m!185635 () Bool)

(assert (=> b!122238 m!185635))

(declare-fun m!185637 () Bool)

(assert (=> b!122238 m!185637))

(declare-fun m!185639 () Bool)

(assert (=> b!122238 m!185639))

(declare-fun m!185641 () Bool)

(assert (=> b!122238 m!185641))

(declare-fun m!185643 () Bool)

(assert (=> b!122238 m!185643))

(declare-fun m!185645 () Bool)

(assert (=> b!122238 m!185645))

(declare-fun m!185647 () Bool)

(assert (=> b!122238 m!185647))

(declare-fun m!185649 () Bool)

(assert (=> b!122238 m!185649))

(declare-fun m!185651 () Bool)

(assert (=> b!122238 m!185651))

(declare-fun m!185653 () Bool)

(assert (=> b!122238 m!185653))

(declare-fun m!185655 () Bool)

(assert (=> b!122238 m!185655))

(declare-fun m!185657 () Bool)

(assert (=> b!122238 m!185657))

(declare-fun m!185659 () Bool)

(assert (=> b!122238 m!185659))

(declare-fun m!185661 () Bool)

(assert (=> b!122238 m!185661))

(declare-fun m!185663 () Bool)

(assert (=> b!122238 m!185663))

(declare-fun m!185665 () Bool)

(assert (=> b!122238 m!185665))

(declare-fun m!185667 () Bool)

(assert (=> b!122238 m!185667))

(declare-fun m!185669 () Bool)

(assert (=> b!122242 m!185669))

(declare-fun m!185671 () Bool)

(assert (=> b!122247 m!185671))

(assert (=> b!122247 m!185671))

(declare-fun m!185673 () Bool)

(assert (=> b!122247 m!185673))

(declare-fun m!185675 () Bool)

(assert (=> b!122246 m!185675))

(push 1)

(assert (not b!122241))

(assert (not b!122248))

(assert (not start!24158))

(assert (not b!122251))

(assert (not b!122238))

(assert (not b!122242))

(assert (not b!122249))

(assert (not b!122250))

(assert (not b!122244))

(assert (not b!122246))

(assert (not b!122247))

(assert (not b!122245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

