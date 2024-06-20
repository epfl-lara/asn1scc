; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!970 () Bool)

(assert start!970)

(declare-fun res!5201 () Bool)

(declare-fun e!2446 () Bool)

(assert (=> start!970 (=> (not res!5201) (not e!2446))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!302 0))(
  ( (array!303 (arr!512 (Array (_ BitVec 32) (_ BitVec 8))) (size!125 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!302)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!970 (= res!5201 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!125 srcBuffer!6))))))))

(assert (=> start!970 e!2446))

(assert (=> start!970 true))

(declare-fun array_inv!120 (array!302) Bool)

(assert (=> start!970 (array_inv!120 srcBuffer!6)))

(declare-datatypes ((BitStream!228 0))(
  ( (BitStream!229 (buf!443 array!302) (currentByte!1416 (_ BitVec 32)) (currentBit!1411 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!228)

(declare-fun e!2442 () Bool)

(declare-fun inv!12 (BitStream!228) Bool)

(assert (=> start!970 (and (inv!12 thiss!1486) e!2442)))

(declare-fun b!3686 () Bool)

(declare-fun res!5203 () Bool)

(assert (=> b!3686 (=> (not res!5203) (not e!2446))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3686 (= res!5203 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) nBits!460))))

(declare-fun b!3687 () Bool)

(declare-fun res!5205 () Bool)

(declare-fun e!2445 () Bool)

(assert (=> b!3687 (=> (not res!5205) (not e!2445))))

(declare-datatypes ((Unit!276 0))(
  ( (Unit!277) )
))
(declare-datatypes ((tuple2!382 0))(
  ( (tuple2!383 (_1!204 Unit!276) (_2!204 BitStream!228)) )
))
(declare-fun lt!4345 () tuple2!382)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3687 (= res!5205 (= (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4345))) (currentByte!1416 (_2!204 lt!4345)) (currentBit!1411 (_2!204 lt!4345))) (bvadd (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)) nBits!460)))))

(declare-fun b!3688 () Bool)

(assert (=> b!3688 (= e!2446 e!2445)))

(declare-fun res!5206 () Bool)

(assert (=> b!3688 (=> (not res!5206) (not e!2445))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3688 (= res!5206 (invariant!0 (currentBit!1411 (_2!204 lt!4345)) (currentByte!1416 (_2!204 lt!4345)) (size!125 (buf!443 (_2!204 lt!4345)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!228 array!302 (_ BitVec 64) (_ BitVec 64)) tuple2!382)

(assert (=> b!3688 (= lt!4345 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3689 () Bool)

(declare-fun res!5202 () Bool)

(assert (=> b!3689 (=> (not res!5202) (not e!2445))))

(declare-fun isPrefixOf!0 (BitStream!228 BitStream!228) Bool)

(assert (=> b!3689 (= res!5202 (isPrefixOf!0 thiss!1486 (_2!204 lt!4345)))))

(declare-fun b!3690 () Bool)

(declare-fun e!2444 () Bool)

(declare-datatypes ((tuple2!384 0))(
  ( (tuple2!385 (_1!205 BitStream!228) (_2!205 BitStream!228)) )
))
(declare-fun lt!4346 () tuple2!384)

(assert (=> b!3690 (= e!2444 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_1!205 lt!4346)))) ((_ sign_extend 32) (currentByte!1416 (_1!205 lt!4346))) ((_ sign_extend 32) (currentBit!1411 (_1!205 lt!4346))) nBits!460))))

(declare-fun b!3691 () Bool)

(declare-fun res!5204 () Bool)

(assert (=> b!3691 (=> (not res!5204) (not e!2445))))

(assert (=> b!3691 (= res!5204 (= (size!125 (buf!443 thiss!1486)) (size!125 (buf!443 (_2!204 lt!4345)))))))

(declare-fun b!3692 () Bool)

(assert (=> b!3692 (= e!2442 (array_inv!120 (buf!443 thiss!1486)))))

(declare-fun b!3693 () Bool)

(assert (=> b!3693 (= e!2445 (not e!2444))))

(declare-fun res!5200 () Bool)

(assert (=> b!3693 (=> res!5200 e!2444)))

(declare-datatypes ((List!25 0))(
  ( (Nil!22) (Cons!21 (h!140 Bool) (t!775 List!25)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!228 array!302 (_ BitVec 64) (_ BitVec 64)) List!25)

(declare-datatypes ((tuple2!386 0))(
  ( (tuple2!387 (_1!206 array!302) (_2!206 BitStream!228)) )
))
(declare-fun readBits!0 (BitStream!228 (_ BitVec 64)) tuple2!386)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!228 BitStream!228 (_ BitVec 64)) List!25)

(assert (=> b!3693 (= res!5200 (not (= (byteArrayBitContentToList!0 (_2!204 lt!4345) (_1!206 (readBits!0 (_1!205 lt!4346) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!204 lt!4345) (_1!205 lt!4346) nBits!460))))))

(assert (=> b!3693 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) nBits!460)))

(declare-fun lt!4344 () Unit!276)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!228 array!302 (_ BitVec 64)) Unit!276)

(assert (=> b!3693 (= lt!4344 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!443 (_2!204 lt!4345)) nBits!460))))

(declare-fun reader!0 (BitStream!228 BitStream!228) tuple2!384)

(assert (=> b!3693 (= lt!4346 (reader!0 thiss!1486 (_2!204 lt!4345)))))

(assert (= (and start!970 res!5201) b!3686))

(assert (= (and b!3686 res!5203) b!3688))

(assert (= (and b!3688 res!5206) b!3691))

(assert (= (and b!3691 res!5204) b!3687))

(assert (= (and b!3687 res!5205) b!3689))

(assert (= (and b!3689 res!5202) b!3693))

(assert (= (and b!3693 (not res!5200)) b!3690))

(assert (= start!970 b!3692))

(declare-fun m!4133 () Bool)

(assert (=> b!3689 m!4133))

(declare-fun m!4135 () Bool)

(assert (=> b!3690 m!4135))

(declare-fun m!4137 () Bool)

(assert (=> b!3687 m!4137))

(declare-fun m!4139 () Bool)

(assert (=> b!3687 m!4139))

(declare-fun m!4141 () Bool)

(assert (=> b!3688 m!4141))

(declare-fun m!4143 () Bool)

(assert (=> b!3688 m!4143))

(declare-fun m!4145 () Bool)

(assert (=> b!3693 m!4145))

(declare-fun m!4147 () Bool)

(assert (=> b!3693 m!4147))

(declare-fun m!4149 () Bool)

(assert (=> b!3693 m!4149))

(declare-fun m!4151 () Bool)

(assert (=> b!3693 m!4151))

(declare-fun m!4153 () Bool)

(assert (=> b!3693 m!4153))

(declare-fun m!4155 () Bool)

(assert (=> b!3693 m!4155))

(declare-fun m!4157 () Bool)

(assert (=> start!970 m!4157))

(declare-fun m!4159 () Bool)

(assert (=> start!970 m!4159))

(declare-fun m!4161 () Bool)

(assert (=> b!3686 m!4161))

(declare-fun m!4163 () Bool)

(assert (=> b!3692 m!4163))

(check-sat (not b!3692) (not b!3689) (not b!3690) (not start!970) (not b!3693) (not b!3688) (not b!3686) (not b!3687))
(check-sat)
(get-model)

(declare-fun d!1658 () Bool)

(declare-fun res!5236 () Bool)

(declare-fun e!2471 () Bool)

(assert (=> d!1658 (=> (not res!5236) (not e!2471))))

(assert (=> d!1658 (= res!5236 (= (size!125 (buf!443 thiss!1486)) (size!125 (buf!443 (_2!204 lt!4345)))))))

(assert (=> d!1658 (= (isPrefixOf!0 thiss!1486 (_2!204 lt!4345)) e!2471)))

(declare-fun b!3724 () Bool)

(declare-fun res!5235 () Bool)

(assert (=> b!3724 (=> (not res!5235) (not e!2471))))

(assert (=> b!3724 (= res!5235 (bvsle (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)) (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4345))) (currentByte!1416 (_2!204 lt!4345)) (currentBit!1411 (_2!204 lt!4345)))))))

(declare-fun b!3725 () Bool)

(declare-fun e!2470 () Bool)

(assert (=> b!3725 (= e!2471 e!2470)))

(declare-fun res!5234 () Bool)

(assert (=> b!3725 (=> res!5234 e!2470)))

(assert (=> b!3725 (= res!5234 (= (size!125 (buf!443 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3726 () Bool)

(declare-fun arrayBitRangesEq!0 (array!302 array!302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3726 (= e!2470 (arrayBitRangesEq!0 (buf!443 thiss!1486) (buf!443 (_2!204 lt!4345)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486))))))

(assert (= (and d!1658 res!5236) b!3724))

(assert (= (and b!3724 res!5235) b!3725))

(assert (= (and b!3725 (not res!5234)) b!3726))

(assert (=> b!3724 m!4139))

(assert (=> b!3724 m!4137))

(assert (=> b!3726 m!4139))

(assert (=> b!3726 m!4139))

(declare-fun m!4197 () Bool)

(assert (=> b!3726 m!4197))

(assert (=> b!3689 d!1658))

(declare-fun d!1660 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_1!205 lt!4346)))) ((_ sign_extend 32) (currentByte!1416 (_1!205 lt!4346))) ((_ sign_extend 32) (currentBit!1411 (_1!205 lt!4346))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!125 (buf!443 (_1!205 lt!4346)))) ((_ sign_extend 32) (currentByte!1416 (_1!205 lt!4346))) ((_ sign_extend 32) (currentBit!1411 (_1!205 lt!4346)))) nBits!460))))

(declare-fun bs!614 () Bool)

(assert (= bs!614 d!1660))

(declare-fun m!4199 () Bool)

(assert (=> bs!614 m!4199))

(assert (=> b!3690 d!1660))

(declare-fun d!1662 () Bool)

(assert (=> d!1662 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) nBits!460)))

(declare-fun lt!4358 () Unit!276)

(declare-fun choose!9 (BitStream!228 array!302 (_ BitVec 64) BitStream!228) Unit!276)

(assert (=> d!1662 (= lt!4358 (choose!9 thiss!1486 (buf!443 (_2!204 lt!4345)) nBits!460 (BitStream!229 (buf!443 (_2!204 lt!4345)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486))))))

(assert (=> d!1662 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!443 (_2!204 lt!4345)) nBits!460) lt!4358)))

(declare-fun bs!615 () Bool)

(assert (= bs!615 d!1662))

(assert (=> bs!615 m!4155))

(declare-fun m!4201 () Bool)

(assert (=> bs!615 m!4201))

(assert (=> b!3693 d!1662))

(declare-fun lt!4420 () (_ BitVec 64))

(declare-fun lt!4425 () tuple2!384)

(declare-fun b!3762 () Bool)

(declare-fun e!2491 () Bool)

(declare-fun lt!4416 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!228 (_ BitVec 64)) BitStream!228)

(assert (=> b!3762 (= e!2491 (= (_1!205 lt!4425) (withMovedBitIndex!0 (_2!205 lt!4425) (bvsub lt!4416 lt!4420))))))

(assert (=> b!3762 (or (= (bvand lt!4416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4416 lt!4420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3762 (= lt!4420 (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4345))) (currentByte!1416 (_2!204 lt!4345)) (currentBit!1411 (_2!204 lt!4345))))))

(assert (=> b!3762 (= lt!4416 (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)))))

(declare-fun b!3763 () Bool)

(declare-fun e!2490 () Unit!276)

(declare-fun lt!4417 () Unit!276)

(assert (=> b!3763 (= e!2490 lt!4417)))

(declare-fun lt!4428 () (_ BitVec 64))

(assert (=> b!3763 (= lt!4428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4423 () (_ BitVec 64))

(assert (=> b!3763 (= lt!4423 (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!302 array!302 (_ BitVec 64) (_ BitVec 64)) Unit!276)

(assert (=> b!3763 (= lt!4417 (arrayBitRangesEqSymmetric!0 (buf!443 thiss!1486) (buf!443 (_2!204 lt!4345)) lt!4428 lt!4423))))

(assert (=> b!3763 (arrayBitRangesEq!0 (buf!443 (_2!204 lt!4345)) (buf!443 thiss!1486) lt!4428 lt!4423)))

(declare-fun b!3764 () Bool)

(declare-fun res!5253 () Bool)

(assert (=> b!3764 (=> (not res!5253) (not e!2491))))

(assert (=> b!3764 (= res!5253 (isPrefixOf!0 (_2!205 lt!4425) (_2!204 lt!4345)))))

(declare-fun b!3765 () Bool)

(declare-fun Unit!280 () Unit!276)

(assert (=> b!3765 (= e!2490 Unit!280)))

(declare-fun b!3766 () Bool)

(declare-fun res!5254 () Bool)

(assert (=> b!3766 (=> (not res!5254) (not e!2491))))

(assert (=> b!3766 (= res!5254 (isPrefixOf!0 (_1!205 lt!4425) thiss!1486))))

(declare-fun d!1664 () Bool)

(assert (=> d!1664 e!2491))

(declare-fun res!5252 () Bool)

(assert (=> d!1664 (=> (not res!5252) (not e!2491))))

(assert (=> d!1664 (= res!5252 (isPrefixOf!0 (_1!205 lt!4425) (_2!205 lt!4425)))))

(declare-fun lt!4426 () BitStream!228)

(assert (=> d!1664 (= lt!4425 (tuple2!385 lt!4426 (_2!204 lt!4345)))))

(declare-fun lt!4422 () Unit!276)

(declare-fun lt!4419 () Unit!276)

(assert (=> d!1664 (= lt!4422 lt!4419)))

(assert (=> d!1664 (isPrefixOf!0 lt!4426 (_2!204 lt!4345))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!228 BitStream!228 BitStream!228) Unit!276)

(assert (=> d!1664 (= lt!4419 (lemmaIsPrefixTransitive!0 lt!4426 (_2!204 lt!4345) (_2!204 lt!4345)))))

(declare-fun lt!4413 () Unit!276)

(declare-fun lt!4427 () Unit!276)

(assert (=> d!1664 (= lt!4413 lt!4427)))

(assert (=> d!1664 (isPrefixOf!0 lt!4426 (_2!204 lt!4345))))

(assert (=> d!1664 (= lt!4427 (lemmaIsPrefixTransitive!0 lt!4426 thiss!1486 (_2!204 lt!4345)))))

(declare-fun lt!4418 () Unit!276)

(assert (=> d!1664 (= lt!4418 e!2490)))

(declare-fun c!163 () Bool)

(assert (=> d!1664 (= c!163 (not (= (size!125 (buf!443 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!4412 () Unit!276)

(declare-fun lt!4424 () Unit!276)

(assert (=> d!1664 (= lt!4412 lt!4424)))

(assert (=> d!1664 (isPrefixOf!0 (_2!204 lt!4345) (_2!204 lt!4345))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!228) Unit!276)

(assert (=> d!1664 (= lt!4424 (lemmaIsPrefixRefl!0 (_2!204 lt!4345)))))

(declare-fun lt!4414 () Unit!276)

(declare-fun lt!4430 () Unit!276)

(assert (=> d!1664 (= lt!4414 lt!4430)))

(assert (=> d!1664 (= lt!4430 (lemmaIsPrefixRefl!0 (_2!204 lt!4345)))))

(declare-fun lt!4415 () Unit!276)

(declare-fun lt!4421 () Unit!276)

(assert (=> d!1664 (= lt!4415 lt!4421)))

(assert (=> d!1664 (isPrefixOf!0 lt!4426 lt!4426)))

(assert (=> d!1664 (= lt!4421 (lemmaIsPrefixRefl!0 lt!4426))))

(declare-fun lt!4429 () Unit!276)

(declare-fun lt!4411 () Unit!276)

(assert (=> d!1664 (= lt!4429 lt!4411)))

(assert (=> d!1664 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1664 (= lt!4411 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1664 (= lt!4426 (BitStream!229 (buf!443 (_2!204 lt!4345)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)))))

(assert (=> d!1664 (isPrefixOf!0 thiss!1486 (_2!204 lt!4345))))

(assert (=> d!1664 (= (reader!0 thiss!1486 (_2!204 lt!4345)) lt!4425)))

(assert (= (and d!1664 c!163) b!3763))

(assert (= (and d!1664 (not c!163)) b!3765))

(assert (= (and d!1664 res!5252) b!3766))

(assert (= (and b!3766 res!5254) b!3764))

(assert (= (and b!3764 res!5253) b!3762))

(declare-fun m!4219 () Bool)

(assert (=> b!3762 m!4219))

(assert (=> b!3762 m!4137))

(assert (=> b!3762 m!4139))

(assert (=> b!3763 m!4139))

(declare-fun m!4225 () Bool)

(assert (=> b!3763 m!4225))

(declare-fun m!4229 () Bool)

(assert (=> b!3763 m!4229))

(declare-fun m!4231 () Bool)

(assert (=> d!1664 m!4231))

(declare-fun m!4233 () Bool)

(assert (=> d!1664 m!4233))

(declare-fun m!4235 () Bool)

(assert (=> d!1664 m!4235))

(assert (=> d!1664 m!4133))

(declare-fun m!4237 () Bool)

(assert (=> d!1664 m!4237))

(declare-fun m!4239 () Bool)

(assert (=> d!1664 m!4239))

(declare-fun m!4241 () Bool)

(assert (=> d!1664 m!4241))

(declare-fun m!4243 () Bool)

(assert (=> d!1664 m!4243))

(declare-fun m!4245 () Bool)

(assert (=> d!1664 m!4245))

(declare-fun m!4247 () Bool)

(assert (=> d!1664 m!4247))

(declare-fun m!4249 () Bool)

(assert (=> d!1664 m!4249))

(declare-fun m!4251 () Bool)

(assert (=> b!3766 m!4251))

(declare-fun m!4253 () Bool)

(assert (=> b!3764 m!4253))

(assert (=> b!3693 d!1664))

(declare-fun d!1682 () Bool)

(assert (=> d!1682 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486))) nBits!460))))

(declare-fun bs!619 () Bool)

(assert (= bs!619 d!1682))

(declare-fun m!4255 () Bool)

(assert (=> bs!619 m!4255))

(assert (=> b!3693 d!1682))

(declare-fun d!1684 () Bool)

(declare-fun c!167 () Bool)

(assert (=> d!1684 (= c!167 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!2495 () List!25)

(assert (=> d!1684 (= (byteArrayBitContentToList!0 (_2!204 lt!4345) (_1!206 (readBits!0 (_1!205 lt!4346) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!2495)))

(declare-fun b!3773 () Bool)

(assert (=> b!3773 (= e!2495 Nil!22)))

(declare-fun b!3774 () Bool)

(assert (=> b!3774 (= e!2495 (Cons!21 (not (= (bvand ((_ sign_extend 24) (select (arr!512 (_1!206 (readBits!0 (_1!205 lt!4346) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!204 lt!4345) (_1!206 (readBits!0 (_1!205 lt!4346) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1684 c!167) b!3773))

(assert (= (and d!1684 (not c!167)) b!3774))

(declare-fun m!4259 () Bool)

(assert (=> b!3774 m!4259))

(declare-fun m!4261 () Bool)

(assert (=> b!3774 m!4261))

(declare-fun m!4263 () Bool)

(assert (=> b!3774 m!4263))

(assert (=> b!3693 d!1684))

(declare-fun d!1688 () Bool)

(declare-fun e!2510 () Bool)

(assert (=> d!1688 e!2510))

(declare-fun res!5290 () Bool)

(assert (=> d!1688 (=> (not res!5290) (not e!2510))))

(declare-fun lt!4546 () tuple2!386)

(assert (=> d!1688 (= res!5290 (= (buf!443 (_2!206 lt!4546)) (buf!443 (_1!205 lt!4346))))))

(declare-datatypes ((tuple3!26 0))(
  ( (tuple3!27 (_1!211 Unit!276) (_2!211 BitStream!228) (_3!13 array!302)) )
))
(declare-fun lt!4547 () tuple3!26)

(assert (=> d!1688 (= lt!4546 (tuple2!387 (_3!13 lt!4547) (_2!211 lt!4547)))))

(declare-fun readBitsLoop!0 (BitStream!228 (_ BitVec 64) array!302 (_ BitVec 64) (_ BitVec 64)) tuple3!26)

(assert (=> d!1688 (= lt!4547 (readBitsLoop!0 (_1!205 lt!4346) nBits!460 (array!303 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1688 (= (readBits!0 (_1!205 lt!4346) nBits!460) lt!4546)))

(declare-fun b!3821 () Bool)

(declare-fun res!5289 () Bool)

(assert (=> b!3821 (=> (not res!5289) (not e!2510))))

(assert (=> b!3821 (= res!5289 (bvsle (currentByte!1416 (_1!205 lt!4346)) (currentByte!1416 (_2!206 lt!4546))))))

(declare-fun b!3822 () Bool)

(declare-fun res!5292 () Bool)

(assert (=> b!3822 (=> (not res!5292) (not e!2510))))

(assert (=> b!3822 (= res!5292 (invariant!0 (currentBit!1411 (_2!206 lt!4546)) (currentByte!1416 (_2!206 lt!4546)) (size!125 (buf!443 (_2!206 lt!4546)))))))

(declare-fun b!3823 () Bool)

(declare-fun res!5291 () Bool)

(assert (=> b!3823 (=> (not res!5291) (not e!2510))))

(declare-fun lt!4540 () (_ BitVec 64))

(assert (=> b!3823 (= res!5291 (= (size!125 (_1!206 lt!4546)) ((_ extract 31 0) lt!4540)))))

(assert (=> b!3823 (and (bvslt lt!4540 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!4540 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!4541 () (_ BitVec 64))

(declare-fun lt!4544 () (_ BitVec 64))

(assert (=> b!3823 (= lt!4540 (bvsdiv lt!4541 lt!4544))))

(assert (=> b!3823 (and (not (= lt!4544 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!4541 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4544 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3823 (= lt!4544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!4543 () (_ BitVec 64))

(declare-fun lt!4539 () (_ BitVec 64))

(assert (=> b!3823 (= lt!4541 (bvsub lt!4543 lt!4539))))

(assert (=> b!3823 (or (= (bvand lt!4543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4543 lt!4539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3823 (= lt!4539 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4545 () (_ BitVec 64))

(assert (=> b!3823 (= lt!4543 (bvadd nBits!460 lt!4545))))

(assert (=> b!3823 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4545 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!4545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3823 (= lt!4545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3824 () Bool)

(declare-fun res!5293 () Bool)

(assert (=> b!3824 (=> (not res!5293) (not e!2510))))

(declare-fun lt!4542 () (_ BitVec 64))

(assert (=> b!3824 (= res!5293 (= (bvadd lt!4542 nBits!460) (bitIndex!0 (size!125 (buf!443 (_2!206 lt!4546))) (currentByte!1416 (_2!206 lt!4546)) (currentBit!1411 (_2!206 lt!4546)))))))

(assert (=> b!3824 (or (not (= (bvand lt!4542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!4542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!4542 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3824 (= lt!4542 (bitIndex!0 (size!125 (buf!443 (_1!205 lt!4346))) (currentByte!1416 (_1!205 lt!4346)) (currentBit!1411 (_1!205 lt!4346))))))

(declare-fun b!3825 () Bool)

(assert (=> b!3825 (= e!2510 (= (byteArrayBitContentToList!0 (_2!206 lt!4546) (_1!206 lt!4546) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!206 lt!4546) (_1!205 lt!4346) nBits!460)))))

(assert (= (and d!1688 res!5290) b!3824))

(assert (= (and b!3824 res!5293) b!3822))

(assert (= (and b!3822 res!5292) b!3823))

(assert (= (and b!3823 res!5291) b!3821))

(assert (= (and b!3821 res!5289) b!3825))

(declare-fun m!4313 () Bool)

(assert (=> d!1688 m!4313))

(declare-fun m!4315 () Bool)

(assert (=> b!3822 m!4315))

(declare-fun m!4317 () Bool)

(assert (=> b!3824 m!4317))

(declare-fun m!4319 () Bool)

(assert (=> b!3824 m!4319))

(declare-fun m!4321 () Bool)

(assert (=> b!3825 m!4321))

(declare-fun m!4323 () Bool)

(assert (=> b!3825 m!4323))

(assert (=> b!3693 d!1688))

(declare-fun b!3848 () Bool)

(declare-fun e!2522 () Bool)

(declare-fun lt!4563 () List!25)

(declare-fun isEmpty!8 (List!25) Bool)

(assert (=> b!3848 (= e!2522 (isEmpty!8 lt!4563))))

(declare-fun d!1696 () Bool)

(assert (=> d!1696 e!2522))

(declare-fun c!184 () Bool)

(assert (=> d!1696 (= c!184 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!398 0))(
  ( (tuple2!399 (_1!213 List!25) (_2!213 BitStream!228)) )
))
(declare-fun e!2521 () tuple2!398)

(assert (=> d!1696 (= lt!4563 (_1!213 e!2521))))

(declare-fun c!185 () Bool)

(assert (=> d!1696 (= c!185 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1696 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1696 (= (bitStreamReadBitsIntoList!0 (_2!204 lt!4345) (_1!205 lt!4346) nBits!460) lt!4563)))

(declare-fun b!3846 () Bool)

(assert (=> b!3846 (= e!2521 (tuple2!399 Nil!22 (_1!205 lt!4346)))))

(declare-fun b!3847 () Bool)

(declare-fun lt!4564 () (_ BitVec 64))

(declare-datatypes ((tuple2!400 0))(
  ( (tuple2!401 (_1!215 Bool) (_2!215 BitStream!228)) )
))
(declare-fun lt!4565 () tuple2!400)

(assert (=> b!3847 (= e!2521 (tuple2!399 (Cons!21 (_1!215 lt!4565) (bitStreamReadBitsIntoList!0 (_2!204 lt!4345) (_2!215 lt!4565) (bvsub nBits!460 lt!4564))) (_2!215 lt!4565)))))

(declare-fun readBit!0 (BitStream!228) tuple2!400)

(assert (=> b!3847 (= lt!4565 (readBit!0 (_1!205 lt!4346)))))

(assert (=> b!3847 (= lt!4564 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!3849 () Bool)

(declare-fun length!3 (List!25) Int)

(assert (=> b!3849 (= e!2522 (> (length!3 lt!4563) 0))))

(assert (= (and d!1696 c!185) b!3846))

(assert (= (and d!1696 (not c!185)) b!3847))

(assert (= (and d!1696 c!184) b!3848))

(assert (= (and d!1696 (not c!184)) b!3849))

(declare-fun m!4333 () Bool)

(assert (=> b!3848 m!4333))

(declare-fun m!4335 () Bool)

(assert (=> b!3847 m!4335))

(declare-fun m!4337 () Bool)

(assert (=> b!3847 m!4337))

(declare-fun m!4339 () Bool)

(assert (=> b!3849 m!4339))

(assert (=> b!3693 d!1696))

(declare-fun d!1700 () Bool)

(assert (=> d!1700 (= (invariant!0 (currentBit!1411 (_2!204 lt!4345)) (currentByte!1416 (_2!204 lt!4345)) (size!125 (buf!443 (_2!204 lt!4345)))) (and (bvsge (currentBit!1411 (_2!204 lt!4345)) #b00000000000000000000000000000000) (bvslt (currentBit!1411 (_2!204 lt!4345)) #b00000000000000000000000000001000) (bvsge (currentByte!1416 (_2!204 lt!4345)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1416 (_2!204 lt!4345)) (size!125 (buf!443 (_2!204 lt!4345)))) (and (= (currentBit!1411 (_2!204 lt!4345)) #b00000000000000000000000000000000) (= (currentByte!1416 (_2!204 lt!4345)) (size!125 (buf!443 (_2!204 lt!4345))))))))))

(assert (=> b!3688 d!1700))

(declare-fun d!1702 () Bool)

(declare-fun e!2542 () Bool)

(assert (=> d!1702 e!2542))

(declare-fun res!5335 () Bool)

(assert (=> d!1702 (=> (not res!5335) (not e!2542))))

(declare-fun lt!4787 () (_ BitVec 64))

(declare-fun lt!4829 () tuple2!382)

(assert (=> d!1702 (= res!5335 (= (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4829))) (currentByte!1416 (_2!204 lt!4829)) (currentBit!1411 (_2!204 lt!4829))) (bvsub lt!4787 from!367)))))

(assert (=> d!1702 (or (= (bvand lt!4787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4787 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!4790 () (_ BitVec 64))

(assert (=> d!1702 (= lt!4787 (bvadd lt!4790 from!367 nBits!460))))

(assert (=> d!1702 (or (not (= (bvand lt!4790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!4790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!4790 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1702 (= lt!4790 (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)))))

(declare-fun e!2541 () tuple2!382)

(assert (=> d!1702 (= lt!4829 e!2541)))

(declare-fun c!193 () Bool)

(assert (=> d!1702 (= c!193 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!4791 () Unit!276)

(declare-fun lt!4806 () Unit!276)

(assert (=> d!1702 (= lt!4791 lt!4806)))

(assert (=> d!1702 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1702 (= lt!4806 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!4812 () (_ BitVec 64))

(assert (=> d!1702 (= lt!4812 (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)))))

(assert (=> d!1702 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1702 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!4829)))

(declare-fun b!3902 () Bool)

(declare-fun lt!4830 () tuple2!382)

(declare-fun Unit!282 () Unit!276)

(assert (=> b!3902 (= e!2541 (tuple2!383 Unit!282 (_2!204 lt!4830)))))

(declare-fun lt!4832 () tuple2!382)

(declare-fun appendBitFromByte!0 (BitStream!228 (_ BitVec 8) (_ BitVec 32)) tuple2!382)

(assert (=> b!3902 (= lt!4832 (appendBitFromByte!0 thiss!1486 (select (arr!512 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!4823 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4823 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4797 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4805 () Unit!276)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!228 BitStream!228 (_ BitVec 64) (_ BitVec 64)) Unit!276)

(assert (=> b!3902 (= lt!4805 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!204 lt!4832) lt!4823 lt!4797))))

(assert (=> b!3902 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4832)))) ((_ sign_extend 32) (currentByte!1416 (_2!204 lt!4832))) ((_ sign_extend 32) (currentBit!1411 (_2!204 lt!4832))) (bvsub lt!4823 lt!4797))))

(declare-fun lt!4815 () Unit!276)

(assert (=> b!3902 (= lt!4815 lt!4805)))

(declare-fun lt!4814 () tuple2!384)

(declare-fun call!41 () tuple2!384)

(assert (=> b!3902 (= lt!4814 call!41)))

(declare-fun lt!4788 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4788 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4801 () Unit!276)

(assert (=> b!3902 (= lt!4801 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!443 (_2!204 lt!4832)) lt!4788))))

(assert (=> b!3902 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4832)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) lt!4788)))

(declare-fun lt!4808 () Unit!276)

(assert (=> b!3902 (= lt!4808 lt!4801)))

(declare-fun head!17 (List!25) Bool)

(assert (=> b!3902 (= (head!17 (byteArrayBitContentToList!0 (_2!204 lt!4832) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!17 (bitStreamReadBitsIntoList!0 (_2!204 lt!4832) (_1!205 lt!4814) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4804 () Unit!276)

(declare-fun Unit!283 () Unit!276)

(assert (=> b!3902 (= lt!4804 Unit!283)))

(assert (=> b!3902 (= lt!4830 (appendBitsMSBFirstLoop!0 (_2!204 lt!4832) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!4825 () Unit!276)

(assert (=> b!3902 (= lt!4825 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!204 lt!4832) (_2!204 lt!4830)))))

(assert (=> b!3902 (isPrefixOf!0 thiss!1486 (_2!204 lt!4830))))

(declare-fun lt!4807 () Unit!276)

(assert (=> b!3902 (= lt!4807 lt!4825)))

(assert (=> b!3902 (= (size!125 (buf!443 (_2!204 lt!4830))) (size!125 (buf!443 thiss!1486)))))

(declare-fun lt!4800 () Unit!276)

(declare-fun Unit!284 () Unit!276)

(assert (=> b!3902 (= lt!4800 Unit!284)))

(assert (=> b!3902 (= (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4830))) (currentByte!1416 (_2!204 lt!4830)) (currentBit!1411 (_2!204 lt!4830))) (bvsub (bvadd (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!4794 () Unit!276)

(declare-fun Unit!286 () Unit!276)

(assert (=> b!3902 (= lt!4794 Unit!286)))

(assert (=> b!3902 (= (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4830))) (currentByte!1416 (_2!204 lt!4830)) (currentBit!1411 (_2!204 lt!4830))) (bvsub (bvsub (bvadd (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4832))) (currentByte!1416 (_2!204 lt!4832)) (currentBit!1411 (_2!204 lt!4832))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4792 () Unit!276)

(declare-fun Unit!287 () Unit!276)

(assert (=> b!3902 (= lt!4792 Unit!287)))

(declare-fun lt!4809 () tuple2!384)

(assert (=> b!3902 (= lt!4809 (reader!0 thiss!1486 (_2!204 lt!4830)))))

(declare-fun lt!4789 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4789 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4811 () Unit!276)

(assert (=> b!3902 (= lt!4811 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!443 (_2!204 lt!4830)) lt!4789))))

(assert (=> b!3902 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4830)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) lt!4789)))

(declare-fun lt!4813 () Unit!276)

(assert (=> b!3902 (= lt!4813 lt!4811)))

(declare-fun lt!4793 () tuple2!384)

(assert (=> b!3902 (= lt!4793 (reader!0 (_2!204 lt!4832) (_2!204 lt!4830)))))

(declare-fun lt!4826 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4826 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!4821 () Unit!276)

(assert (=> b!3902 (= lt!4821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!204 lt!4832) (buf!443 (_2!204 lt!4830)) lt!4826))))

(assert (=> b!3902 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4830)))) ((_ sign_extend 32) (currentByte!1416 (_2!204 lt!4832))) ((_ sign_extend 32) (currentBit!1411 (_2!204 lt!4832))) lt!4826)))

(declare-fun lt!4810 () Unit!276)

(assert (=> b!3902 (= lt!4810 lt!4821)))

(declare-fun lt!4816 () List!25)

(assert (=> b!3902 (= lt!4816 (byteArrayBitContentToList!0 (_2!204 lt!4830) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!4803 () List!25)

(assert (=> b!3902 (= lt!4803 (byteArrayBitContentToList!0 (_2!204 lt!4830) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4820 () List!25)

(assert (=> b!3902 (= lt!4820 (bitStreamReadBitsIntoList!0 (_2!204 lt!4830) (_1!205 lt!4809) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!4831 () List!25)

(assert (=> b!3902 (= lt!4831 (bitStreamReadBitsIntoList!0 (_2!204 lt!4830) (_1!205 lt!4793) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!4817 () (_ BitVec 64))

(assert (=> b!3902 (= lt!4817 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!4796 () Unit!276)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!228 BitStream!228 BitStream!228 BitStream!228 (_ BitVec 64) List!25) Unit!276)

(assert (=> b!3902 (= lt!4796 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!204 lt!4830) (_2!204 lt!4830) (_1!205 lt!4809) (_1!205 lt!4793) lt!4817 lt!4820))))

(declare-fun tail!25 (List!25) List!25)

(assert (=> b!3902 (= (bitStreamReadBitsIntoList!0 (_2!204 lt!4830) (_1!205 lt!4793) (bvsub lt!4817 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!25 lt!4820))))

(declare-fun lt!4827 () Unit!276)

(assert (=> b!3902 (= lt!4827 lt!4796)))

(declare-fun lt!4795 () Unit!276)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!302 array!302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!276)

(assert (=> b!3902 (= lt!4795 (arrayBitRangesEqImpliesEq!0 (buf!443 (_2!204 lt!4832)) (buf!443 (_2!204 lt!4830)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!4812 (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4832))) (currentByte!1416 (_2!204 lt!4832)) (currentBit!1411 (_2!204 lt!4832)))))))

(declare-fun bitAt!0 (array!302 (_ BitVec 64)) Bool)

(assert (=> b!3902 (= (bitAt!0 (buf!443 (_2!204 lt!4832)) lt!4812) (bitAt!0 (buf!443 (_2!204 lt!4830)) lt!4812))))

(declare-fun lt!4824 () Unit!276)

(assert (=> b!3902 (= lt!4824 lt!4795)))

(declare-fun b!3903 () Bool)

(declare-fun res!5334 () Bool)

(assert (=> b!3903 (=> (not res!5334) (not e!2542))))

(assert (=> b!3903 (= res!5334 (= (size!125 (buf!443 thiss!1486)) (size!125 (buf!443 (_2!204 lt!4829)))))))

(declare-fun b!3904 () Bool)

(declare-fun res!5330 () Bool)

(assert (=> b!3904 (=> (not res!5330) (not e!2542))))

(assert (=> b!3904 (= res!5330 (invariant!0 (currentBit!1411 (_2!204 lt!4829)) (currentByte!1416 (_2!204 lt!4829)) (size!125 (buf!443 (_2!204 lt!4829)))))))

(declare-fun b!3905 () Bool)

(declare-fun Unit!288 () Unit!276)

(assert (=> b!3905 (= e!2541 (tuple2!383 Unit!288 thiss!1486))))

(assert (=> b!3905 (= (size!125 (buf!443 thiss!1486)) (size!125 (buf!443 thiss!1486)))))

(declare-fun lt!4798 () Unit!276)

(declare-fun Unit!289 () Unit!276)

(assert (=> b!3905 (= lt!4798 Unit!289)))

(declare-fun checkByteArrayBitContent!0 (BitStream!228 array!302 array!302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3905 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!206 (readBits!0 (_1!205 call!41) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun bm!38 () Bool)

(assert (=> bm!38 (= call!41 (reader!0 thiss!1486 (ite c!193 (_2!204 lt!4832) thiss!1486)))))

(declare-fun b!3906 () Bool)

(declare-fun e!2540 () Bool)

(declare-fun lt!4799 () (_ BitVec 64))

(assert (=> b!3906 (= e!2540 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) lt!4799))))

(declare-fun b!3907 () Bool)

(declare-fun res!5331 () Bool)

(assert (=> b!3907 (=> (not res!5331) (not e!2542))))

(assert (=> b!3907 (= res!5331 (= (size!125 (buf!443 (_2!204 lt!4829))) (size!125 (buf!443 thiss!1486))))))

(declare-fun b!3908 () Bool)

(declare-fun lt!4802 () tuple2!384)

(assert (=> b!3908 (= e!2542 (= (bitStreamReadBitsIntoList!0 (_2!204 lt!4829) (_1!205 lt!4802) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!204 lt!4829) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3908 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3908 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!4822 () Unit!276)

(declare-fun lt!4828 () Unit!276)

(assert (=> b!3908 (= lt!4822 lt!4828)))

(assert (=> b!3908 (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4829)))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) lt!4799)))

(assert (=> b!3908 (= lt!4828 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!443 (_2!204 lt!4829)) lt!4799))))

(assert (=> b!3908 e!2540))

(declare-fun res!5332 () Bool)

(assert (=> b!3908 (=> (not res!5332) (not e!2540))))

(assert (=> b!3908 (= res!5332 (and (= (size!125 (buf!443 thiss!1486)) (size!125 (buf!443 (_2!204 lt!4829)))) (bvsge lt!4799 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3908 (= lt!4799 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3908 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3908 (= lt!4802 (reader!0 thiss!1486 (_2!204 lt!4829)))))

(declare-fun b!3909 () Bool)

(declare-fun res!5333 () Bool)

(assert (=> b!3909 (=> (not res!5333) (not e!2542))))

(assert (=> b!3909 (= res!5333 (isPrefixOf!0 thiss!1486 (_2!204 lt!4829)))))

(assert (= (and d!1702 c!193) b!3902))

(assert (= (and d!1702 (not c!193)) b!3905))

(assert (= (or b!3902 b!3905) bm!38))

(assert (= (and d!1702 res!5335) b!3904))

(assert (= (and b!3904 res!5330) b!3903))

(assert (= (and b!3903 res!5334) b!3909))

(assert (= (and b!3909 res!5333) b!3907))

(assert (= (and b!3907 res!5331) b!3908))

(assert (= (and b!3908 res!5332) b!3906))

(declare-fun m!4387 () Bool)

(assert (=> b!3908 m!4387))

(declare-fun m!4389 () Bool)

(assert (=> b!3908 m!4389))

(declare-fun m!4391 () Bool)

(assert (=> b!3908 m!4391))

(declare-fun m!4393 () Bool)

(assert (=> b!3908 m!4393))

(declare-fun m!4395 () Bool)

(assert (=> b!3908 m!4395))

(declare-fun m!4397 () Bool)

(assert (=> b!3906 m!4397))

(declare-fun m!4399 () Bool)

(assert (=> d!1702 m!4399))

(assert (=> d!1702 m!4139))

(assert (=> d!1702 m!4231))

(assert (=> d!1702 m!4245))

(declare-fun m!4401 () Bool)

(assert (=> b!3902 m!4401))

(declare-fun m!4403 () Bool)

(assert (=> b!3902 m!4403))

(declare-fun m!4405 () Bool)

(assert (=> b!3902 m!4405))

(declare-fun m!4407 () Bool)

(assert (=> b!3902 m!4407))

(declare-fun m!4409 () Bool)

(assert (=> b!3902 m!4409))

(declare-fun m!4411 () Bool)

(assert (=> b!3902 m!4411))

(declare-fun m!4413 () Bool)

(assert (=> b!3902 m!4413))

(declare-fun m!4415 () Bool)

(assert (=> b!3902 m!4415))

(declare-fun m!4417 () Bool)

(assert (=> b!3902 m!4417))

(declare-fun m!4419 () Bool)

(assert (=> b!3902 m!4419))

(declare-fun m!4421 () Bool)

(assert (=> b!3902 m!4421))

(declare-fun m!4423 () Bool)

(assert (=> b!3902 m!4423))

(declare-fun m!4425 () Bool)

(assert (=> b!3902 m!4425))

(declare-fun m!4427 () Bool)

(assert (=> b!3902 m!4427))

(declare-fun m!4429 () Bool)

(assert (=> b!3902 m!4429))

(declare-fun m!4431 () Bool)

(assert (=> b!3902 m!4431))

(declare-fun m!4433 () Bool)

(assert (=> b!3902 m!4433))

(declare-fun m!4435 () Bool)

(assert (=> b!3902 m!4435))

(declare-fun m!4437 () Bool)

(assert (=> b!3902 m!4437))

(assert (=> b!3902 m!4433))

(declare-fun m!4439 () Bool)

(assert (=> b!3902 m!4439))

(declare-fun m!4441 () Bool)

(assert (=> b!3902 m!4441))

(declare-fun m!4443 () Bool)

(assert (=> b!3902 m!4443))

(declare-fun m!4445 () Bool)

(assert (=> b!3902 m!4445))

(declare-fun m!4447 () Bool)

(assert (=> b!3902 m!4447))

(assert (=> b!3902 m!4139))

(declare-fun m!4449 () Bool)

(assert (=> b!3902 m!4449))

(assert (=> b!3902 m!4407))

(declare-fun m!4451 () Bool)

(assert (=> b!3902 m!4451))

(declare-fun m!4453 () Bool)

(assert (=> b!3902 m!4453))

(declare-fun m!4455 () Bool)

(assert (=> b!3902 m!4455))

(assert (=> b!3902 m!4417))

(assert (=> b!3902 m!4401))

(declare-fun m!4457 () Bool)

(assert (=> b!3902 m!4457))

(declare-fun m!4459 () Bool)

(assert (=> b!3902 m!4459))

(declare-fun m!4461 () Bool)

(assert (=> b!3902 m!4461))

(declare-fun m!4463 () Bool)

(assert (=> b!3905 m!4463))

(declare-fun m!4465 () Bool)

(assert (=> b!3905 m!4465))

(declare-fun m!4467 () Bool)

(assert (=> bm!38 m!4467))

(declare-fun m!4469 () Bool)

(assert (=> b!3904 m!4469))

(declare-fun m!4471 () Bool)

(assert (=> b!3909 m!4471))

(assert (=> b!3688 d!1702))

(declare-fun d!1720 () Bool)

(assert (=> d!1720 (= (array_inv!120 (buf!443 thiss!1486)) (bvsge (size!125 (buf!443 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3692 d!1720))

(declare-fun d!1722 () Bool)

(declare-fun e!2558 () Bool)

(assert (=> d!1722 e!2558))

(declare-fun res!5371 () Bool)

(assert (=> d!1722 (=> (not res!5371) (not e!2558))))

(declare-fun lt!5021 () (_ BitVec 64))

(declare-fun lt!5019 () (_ BitVec 64))

(declare-fun lt!5020 () (_ BitVec 64))

(assert (=> d!1722 (= res!5371 (= lt!5019 (bvsub lt!5021 lt!5020)))))

(assert (=> d!1722 (or (= (bvand lt!5021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5021 lt!5020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1722 (= lt!5020 (remainingBits!0 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))) ((_ sign_extend 32) (currentByte!1416 (_2!204 lt!4345))) ((_ sign_extend 32) (currentBit!1411 (_2!204 lt!4345)))))))

(declare-fun lt!5018 () (_ BitVec 64))

(declare-fun lt!5017 () (_ BitVec 64))

(assert (=> d!1722 (= lt!5021 (bvmul lt!5018 lt!5017))))

(assert (=> d!1722 (or (= lt!5018 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5017 (bvsdiv (bvmul lt!5018 lt!5017) lt!5018)))))

(assert (=> d!1722 (= lt!5017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1722 (= lt!5018 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))))))

(assert (=> d!1722 (= lt!5019 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1416 (_2!204 lt!4345))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1411 (_2!204 lt!4345)))))))

(assert (=> d!1722 (invariant!0 (currentBit!1411 (_2!204 lt!4345)) (currentByte!1416 (_2!204 lt!4345)) (size!125 (buf!443 (_2!204 lt!4345))))))

(assert (=> d!1722 (= (bitIndex!0 (size!125 (buf!443 (_2!204 lt!4345))) (currentByte!1416 (_2!204 lt!4345)) (currentBit!1411 (_2!204 lt!4345))) lt!5019)))

(declare-fun b!3948 () Bool)

(declare-fun res!5370 () Bool)

(assert (=> b!3948 (=> (not res!5370) (not e!2558))))

(assert (=> b!3948 (= res!5370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5019))))

(declare-fun b!3949 () Bool)

(declare-fun lt!5022 () (_ BitVec 64))

(assert (=> b!3949 (= e!2558 (bvsle lt!5019 (bvmul lt!5022 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3949 (or (= lt!5022 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5022 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5022)))))

(assert (=> b!3949 (= lt!5022 ((_ sign_extend 32) (size!125 (buf!443 (_2!204 lt!4345)))))))

(assert (= (and d!1722 res!5371) b!3948))

(assert (= (and b!3948 res!5370) b!3949))

(declare-fun m!4473 () Bool)

(assert (=> d!1722 m!4473))

(assert (=> d!1722 m!4141))

(assert (=> b!3687 d!1722))

(declare-fun d!1724 () Bool)

(declare-fun e!2559 () Bool)

(assert (=> d!1724 e!2559))

(declare-fun res!5373 () Bool)

(assert (=> d!1724 (=> (not res!5373) (not e!2559))))

(declare-fun lt!5026 () (_ BitVec 64))

(declare-fun lt!5027 () (_ BitVec 64))

(declare-fun lt!5025 () (_ BitVec 64))

(assert (=> d!1724 (= res!5373 (= lt!5025 (bvsub lt!5027 lt!5026)))))

(assert (=> d!1724 (or (= (bvand lt!5027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5027 lt!5026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1724 (= lt!5026 (remainingBits!0 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486))))))

(declare-fun lt!5024 () (_ BitVec 64))

(declare-fun lt!5023 () (_ BitVec 64))

(assert (=> d!1724 (= lt!5027 (bvmul lt!5024 lt!5023))))

(assert (=> d!1724 (or (= lt!5024 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5023 (bvsdiv (bvmul lt!5024 lt!5023) lt!5024)))))

(assert (=> d!1724 (= lt!5023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1724 (= lt!5024 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))))))

(assert (=> d!1724 (= lt!5025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1416 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1411 thiss!1486))))))

(assert (=> d!1724 (invariant!0 (currentBit!1411 thiss!1486) (currentByte!1416 thiss!1486) (size!125 (buf!443 thiss!1486)))))

(assert (=> d!1724 (= (bitIndex!0 (size!125 (buf!443 thiss!1486)) (currentByte!1416 thiss!1486) (currentBit!1411 thiss!1486)) lt!5025)))

(declare-fun b!3950 () Bool)

(declare-fun res!5372 () Bool)

(assert (=> b!3950 (=> (not res!5372) (not e!2559))))

(assert (=> b!3950 (= res!5372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5025))))

(declare-fun b!3951 () Bool)

(declare-fun lt!5028 () (_ BitVec 64))

(assert (=> b!3951 (= e!2559 (bvsle lt!5025 (bvmul lt!5028 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3951 (or (= lt!5028 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5028 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5028)))))

(assert (=> b!3951 (= lt!5028 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))))))

(assert (= (and d!1724 res!5373) b!3950))

(assert (= (and b!3950 res!5372) b!3951))

(declare-fun m!4475 () Bool)

(assert (=> d!1724 m!4475))

(declare-fun m!4477 () Bool)

(assert (=> d!1724 m!4477))

(assert (=> b!3687 d!1724))

(declare-fun d!1726 () Bool)

(assert (=> d!1726 (= (array_inv!120 srcBuffer!6) (bvsge (size!125 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!970 d!1726))

(declare-fun d!1728 () Bool)

(assert (=> d!1728 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1411 thiss!1486) (currentByte!1416 thiss!1486) (size!125 (buf!443 thiss!1486))))))

(declare-fun bs!623 () Bool)

(assert (= bs!623 d!1728))

(assert (=> bs!623 m!4477))

(assert (=> start!970 d!1728))

(declare-fun d!1730 () Bool)

(assert (=> d!1730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!125 (buf!443 thiss!1486))) ((_ sign_extend 32) (currentByte!1416 thiss!1486)) ((_ sign_extend 32) (currentBit!1411 thiss!1486))) nBits!460))))

(declare-fun bs!624 () Bool)

(assert (= bs!624 d!1730))

(assert (=> bs!624 m!4475))

(assert (=> b!3686 d!1730))

(check-sat (not b!3766) (not b!3849) (not b!3909) (not b!3905) (not d!1664) (not b!3847) (not b!3822) (not b!3908) (not d!1682) (not d!1722) (not b!3764) (not b!3824) (not d!1688) (not b!3763) (not b!3724) (not d!1728) (not d!1662) (not bm!38) (not b!3825) (not d!1724) (not b!3904) (not b!3726) (not d!1730) (not b!3774) (not b!3902) (not d!1702) (not b!3906) (not d!1660) (not b!3848) (not b!3762))
(check-sat)
