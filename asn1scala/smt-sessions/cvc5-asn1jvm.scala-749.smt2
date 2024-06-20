; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21580 () Bool)

(assert start!21580)

(declare-fun b!108407 () Bool)

(declare-fun e!70920 () Bool)

(declare-datatypes ((array!4943 0))(
  ( (array!4944 (arr!2841 (Array (_ BitVec 32) (_ BitVec 8))) (size!2248 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3970 0))(
  ( (BitStream!3971 (buf!2639 array!4943) (currentByte!5175 (_ BitVec 32)) (currentBit!5170 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8916 0))(
  ( (tuple2!8917 (_1!4715 BitStream!3970) (_2!4715 Bool)) )
))
(declare-fun lt!163359 () tuple2!8916)

(declare-fun lt!163346 () tuple2!8916)

(assert (=> b!108407 (= e!70920 (= (_2!4715 lt!163359) (_2!4715 lt!163346)))))

(declare-datatypes ((tuple2!8918 0))(
  ( (tuple2!8919 (_1!4716 BitStream!3970) (_2!4716 (_ BitVec 64))) )
))
(declare-fun lt!163356 () tuple2!8918)

(declare-fun lt!163339 () BitStream!3970)

(declare-datatypes ((tuple2!8920 0))(
  ( (tuple2!8921 (_1!4717 BitStream!3970) (_2!4717 BitStream!3970)) )
))
(declare-fun lt!163366 () tuple2!8920)

(declare-fun lt!163350 () (_ BitVec 64))

(declare-fun e!70929 () Bool)

(declare-fun b!108408 () Bool)

(declare-fun lt!163357 () tuple2!8920)

(declare-fun lt!163364 () tuple2!8918)

(declare-fun lt!163340 () (_ BitVec 64))

(assert (=> b!108408 (= e!70929 (and (= lt!163350 (bvsub lt!163340 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4717 lt!163357) lt!163339)) (and (= (_2!4716 lt!163356) (_2!4716 lt!163364)) (= (_1!4716 lt!163356) (_2!4717 lt!163366))))))))

(declare-fun b!108409 () Bool)

(declare-fun e!70921 () Bool)

(declare-fun e!70930 () Bool)

(assert (=> b!108409 (= e!70921 e!70930)))

(declare-fun res!89351 () Bool)

(assert (=> b!108409 (=> (not res!89351) (not e!70930))))

(declare-fun lt!163345 () tuple2!8916)

(declare-datatypes ((Unit!6637 0))(
  ( (Unit!6638) )
))
(declare-datatypes ((tuple2!8922 0))(
  ( (tuple2!8923 (_1!4718 Unit!6637) (_2!4718 BitStream!3970)) )
))
(declare-fun lt!163343 () tuple2!8922)

(declare-fun lt!163352 () Bool)

(assert (=> b!108409 (= res!89351 (and (= (_2!4715 lt!163345) lt!163352) (= (_1!4715 lt!163345) (_2!4718 lt!163343))))))

(declare-fun thiss!1305 () BitStream!3970)

(declare-fun readBitPure!0 (BitStream!3970) tuple2!8916)

(declare-fun readerFrom!0 (BitStream!3970 (_ BitVec 32) (_ BitVec 32)) BitStream!3970)

(assert (=> b!108409 (= lt!163345 (readBitPure!0 (readerFrom!0 (_2!4718 lt!163343) (currentBit!5170 thiss!1305) (currentByte!5175 thiss!1305))))))

(declare-fun b!108410 () Bool)

(declare-fun res!89350 () Bool)

(declare-fun e!70927 () Bool)

(assert (=> b!108410 (=> (not res!89350) (not e!70927))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108410 (= res!89350 (invariant!0 (currentBit!5170 thiss!1305) (currentByte!5175 thiss!1305) (size!2248 (buf!2639 (_2!4718 lt!163343)))))))

(declare-fun res!89352 () Bool)

(declare-fun e!70925 () Bool)

(assert (=> start!21580 (=> (not res!89352) (not e!70925))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21580 (= res!89352 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21580 e!70925))

(assert (=> start!21580 true))

(declare-fun e!70923 () Bool)

(declare-fun inv!12 (BitStream!3970) Bool)

(assert (=> start!21580 (and (inv!12 thiss!1305) e!70923)))

(declare-fun b!108411 () Bool)

(declare-fun res!89360 () Bool)

(declare-fun e!70924 () Bool)

(assert (=> b!108411 (=> (not res!89360) (not e!70924))))

(assert (=> b!108411 (= res!89360 (bvslt i!615 nBits!396))))

(declare-fun b!108412 () Bool)

(declare-fun lt!163361 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108412 (= e!70930 (= (bitIndex!0 (size!2248 (buf!2639 (_1!4715 lt!163345))) (currentByte!5175 (_1!4715 lt!163345)) (currentBit!5170 (_1!4715 lt!163345))) lt!163361))))

(declare-fun b!108413 () Bool)

(declare-fun res!89359 () Bool)

(assert (=> b!108413 (=> (not res!89359) (not e!70924))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108413 (= res!89359 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108414 () Bool)

(declare-fun e!70926 () Bool)

(assert (=> b!108414 (= e!70926 e!70921)))

(declare-fun res!89356 () Bool)

(assert (=> b!108414 (=> (not res!89356) (not e!70921))))

(declare-fun lt!163363 () (_ BitVec 64))

(assert (=> b!108414 (= res!89356 (= lt!163361 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163363)))))

(assert (=> b!108414 (= lt!163361 (bitIndex!0 (size!2248 (buf!2639 (_2!4718 lt!163343))) (currentByte!5175 (_2!4718 lt!163343)) (currentBit!5170 (_2!4718 lt!163343))))))

(assert (=> b!108414 (= lt!163363 (bitIndex!0 (size!2248 (buf!2639 thiss!1305)) (currentByte!5175 thiss!1305) (currentBit!5170 thiss!1305)))))

(declare-fun b!108415 () Bool)

(declare-fun e!70931 () Bool)

(assert (=> b!108415 (= e!70931 (invariant!0 (currentBit!5170 thiss!1305) (currentByte!5175 thiss!1305) (size!2248 (buf!2639 thiss!1305))))))

(declare-fun b!108416 () Bool)

(declare-fun e!70928 () Bool)

(assert (=> b!108416 (= e!70928 e!70931)))

(declare-fun res!89355 () Bool)

(assert (=> b!108416 (=> res!89355 e!70931)))

(declare-fun lt!163349 () tuple2!8922)

(assert (=> b!108416 (= res!89355 (or (not (= (_1!4717 lt!163357) lt!163339)) (not (= (size!2248 (buf!2639 thiss!1305)) (size!2248 (buf!2639 (_2!4718 lt!163349)))))))))

(assert (=> b!108416 e!70929))

(declare-fun res!89361 () Bool)

(assert (=> b!108416 (=> (not res!89361) (not e!70929))))

(declare-fun lt!163354 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3970 (_ BitVec 64)) BitStream!3970)

(assert (=> b!108416 (= res!89361 (= (_1!4717 lt!163357) (withMovedBitIndex!0 (_2!4717 lt!163357) (bvsub lt!163340 lt!163354))))))

(assert (=> b!108416 (= lt!163340 (bitIndex!0 (size!2248 (buf!2639 (_2!4718 lt!163343))) (currentByte!5175 (_2!4718 lt!163343)) (currentBit!5170 (_2!4718 lt!163343))))))

(assert (=> b!108416 (= (_1!4717 lt!163366) (withMovedBitIndex!0 (_2!4717 lt!163366) (bvsub lt!163350 lt!163354)))))

(assert (=> b!108416 (= lt!163354 (bitIndex!0 (size!2248 (buf!2639 (_2!4718 lt!163349))) (currentByte!5175 (_2!4718 lt!163349)) (currentBit!5170 (_2!4718 lt!163349))))))

(assert (=> b!108416 (= lt!163350 (bitIndex!0 (size!2248 (buf!2639 thiss!1305)) (currentByte!5175 thiss!1305) (currentBit!5170 thiss!1305)))))

(declare-fun lt!163360 () tuple2!8918)

(assert (=> b!108416 (and (= (_2!4716 lt!163356) (_2!4716 lt!163360)) (= (_1!4716 lt!163356) (_1!4716 lt!163360)))))

(declare-fun lt!163355 () Unit!6637)

(declare-fun lt!163351 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6637)

(assert (=> b!108416 (= lt!163355 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4717 lt!163366) nBits!396 i!615 lt!163351))))

(declare-fun lt!163362 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8918)

(assert (=> b!108416 (= lt!163360 (readNLeastSignificantBitsLoopPure!0 lt!163339 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163362))))

(assert (=> b!108416 (= lt!163339 (withMovedBitIndex!0 (_1!4717 lt!163366) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108417 () Bool)

(declare-fun array_inv!2050 (array!4943) Bool)

(assert (=> b!108417 (= e!70923 (array_inv!2050 (buf!2639 thiss!1305)))))

(declare-fun b!108418 () Bool)

(assert (=> b!108418 (= e!70927 (invariant!0 (currentBit!5170 thiss!1305) (currentByte!5175 thiss!1305) (size!2248 (buf!2639 (_2!4718 lt!163349)))))))

(declare-fun b!108419 () Bool)

(declare-fun res!89354 () Bool)

(assert (=> b!108419 (=> (not res!89354) (not e!70921))))

(declare-fun isPrefixOf!0 (BitStream!3970 BitStream!3970) Bool)

(assert (=> b!108419 (= res!89354 (isPrefixOf!0 thiss!1305 (_2!4718 lt!163343)))))

(declare-fun b!108420 () Bool)

(assert (=> b!108420 (= e!70924 (not e!70928))))

(declare-fun res!89358 () Bool)

(assert (=> b!108420 (=> res!89358 e!70928)))

(assert (=> b!108420 (= res!89358 (not (= (_1!4716 lt!163364) (_2!4717 lt!163357))))))

(assert (=> b!108420 (= lt!163364 (readNLeastSignificantBitsLoopPure!0 (_1!4717 lt!163357) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163362))))

(declare-fun lt!163342 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2248 (buf!2639 (_2!4718 lt!163349)))) ((_ sign_extend 32) (currentByte!5175 (_2!4718 lt!163343))) ((_ sign_extend 32) (currentBit!5170 (_2!4718 lt!163343))) lt!163342)))

(declare-fun lt!163347 () Unit!6637)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3970 array!4943 (_ BitVec 64)) Unit!6637)

(assert (=> b!108420 (= lt!163347 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4718 lt!163343) (buf!2639 (_2!4718 lt!163349)) lt!163342))))

(assert (=> b!108420 (= lt!163342 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163341 () tuple2!8916)

(declare-fun lt!163367 () (_ BitVec 64))

(assert (=> b!108420 (= lt!163362 (bvor lt!163351 (ite (_2!4715 lt!163341) lt!163367 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108420 (= lt!163356 (readNLeastSignificantBitsLoopPure!0 (_1!4717 lt!163366) nBits!396 i!615 lt!163351))))

(declare-fun lt!163358 () (_ BitVec 64))

(assert (=> b!108420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2248 (buf!2639 (_2!4718 lt!163349)))) ((_ sign_extend 32) (currentByte!5175 thiss!1305)) ((_ sign_extend 32) (currentBit!5170 thiss!1305)) lt!163358)))

(declare-fun lt!163344 () Unit!6637)

(assert (=> b!108420 (= lt!163344 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2639 (_2!4718 lt!163349)) lt!163358))))

(assert (=> b!108420 (= lt!163351 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108420 (= (_2!4715 lt!163341) lt!163352)))

(assert (=> b!108420 (= lt!163341 (readBitPure!0 (_1!4717 lt!163366)))))

(declare-fun reader!0 (BitStream!3970 BitStream!3970) tuple2!8920)

(assert (=> b!108420 (= lt!163357 (reader!0 (_2!4718 lt!163343) (_2!4718 lt!163349)))))

(assert (=> b!108420 (= lt!163366 (reader!0 thiss!1305 (_2!4718 lt!163349)))))

(assert (=> b!108420 e!70920))

(declare-fun res!89349 () Bool)

(assert (=> b!108420 (=> (not res!89349) (not e!70920))))

(assert (=> b!108420 (= res!89349 (= (bitIndex!0 (size!2248 (buf!2639 (_1!4715 lt!163359))) (currentByte!5175 (_1!4715 lt!163359)) (currentBit!5170 (_1!4715 lt!163359))) (bitIndex!0 (size!2248 (buf!2639 (_1!4715 lt!163346))) (currentByte!5175 (_1!4715 lt!163346)) (currentBit!5170 (_1!4715 lt!163346)))))))

(declare-fun lt!163353 () Unit!6637)

(declare-fun lt!163348 () BitStream!3970)

(declare-fun readBitPrefixLemma!0 (BitStream!3970 BitStream!3970) Unit!6637)

(assert (=> b!108420 (= lt!163353 (readBitPrefixLemma!0 lt!163348 (_2!4718 lt!163349)))))

(assert (=> b!108420 (= lt!163346 (readBitPure!0 (BitStream!3971 (buf!2639 (_2!4718 lt!163349)) (currentByte!5175 thiss!1305) (currentBit!5170 thiss!1305))))))

(assert (=> b!108420 (= lt!163359 (readBitPure!0 lt!163348))))

(assert (=> b!108420 (= lt!163348 (BitStream!3971 (buf!2639 (_2!4718 lt!163343)) (currentByte!5175 thiss!1305) (currentBit!5170 thiss!1305)))))

(assert (=> b!108420 e!70927))

(declare-fun res!89362 () Bool)

(assert (=> b!108420 (=> (not res!89362) (not e!70927))))

(assert (=> b!108420 (= res!89362 (isPrefixOf!0 thiss!1305 (_2!4718 lt!163349)))))

(declare-fun lt!163365 () Unit!6637)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3970 BitStream!3970 BitStream!3970) Unit!6637)

(assert (=> b!108420 (= lt!163365 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4718 lt!163343) (_2!4718 lt!163349)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3970 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8922)

(assert (=> b!108420 (= lt!163349 (appendNLeastSignificantBitsLoop!0 (_2!4718 lt!163343) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108420 e!70926))

(declare-fun res!89357 () Bool)

(assert (=> b!108420 (=> (not res!89357) (not e!70926))))

(assert (=> b!108420 (= res!89357 (= (size!2248 (buf!2639 thiss!1305)) (size!2248 (buf!2639 (_2!4718 lt!163343)))))))

(declare-fun appendBit!0 (BitStream!3970 Bool) tuple2!8922)

(assert (=> b!108420 (= lt!163343 (appendBit!0 thiss!1305 lt!163352))))

(assert (=> b!108420 (= lt!163352 (not (= (bvand v!199 lt!163367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108420 (= lt!163367 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108421 () Bool)

(assert (=> b!108421 (= e!70925 e!70924)))

(declare-fun res!89353 () Bool)

(assert (=> b!108421 (=> (not res!89353) (not e!70924))))

(assert (=> b!108421 (= res!89353 (validate_offset_bits!1 ((_ sign_extend 32) (size!2248 (buf!2639 thiss!1305))) ((_ sign_extend 32) (currentByte!5175 thiss!1305)) ((_ sign_extend 32) (currentBit!5170 thiss!1305)) lt!163358))))

(assert (=> b!108421 (= lt!163358 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!21580 res!89352) b!108421))

(assert (= (and b!108421 res!89353) b!108413))

(assert (= (and b!108413 res!89359) b!108411))

(assert (= (and b!108411 res!89360) b!108420))

(assert (= (and b!108420 res!89357) b!108414))

(assert (= (and b!108414 res!89356) b!108419))

(assert (= (and b!108419 res!89354) b!108409))

(assert (= (and b!108409 res!89351) b!108412))

(assert (= (and b!108420 res!89362) b!108410))

(assert (= (and b!108410 res!89350) b!108418))

(assert (= (and b!108420 res!89349) b!108407))

(assert (= (and b!108420 (not res!89358)) b!108416))

(assert (= (and b!108416 res!89361) b!108408))

(assert (= (and b!108416 (not res!89355)) b!108415))

(assert (= start!21580 b!108417))

(declare-fun m!160649 () Bool)

(assert (=> b!108418 m!160649))

(declare-fun m!160651 () Bool)

(assert (=> b!108419 m!160651))

(declare-fun m!160653 () Bool)

(assert (=> start!21580 m!160653))

(declare-fun m!160655 () Bool)

(assert (=> b!108415 m!160655))

(declare-fun m!160657 () Bool)

(assert (=> b!108416 m!160657))

(declare-fun m!160659 () Bool)

(assert (=> b!108416 m!160659))

(declare-fun m!160661 () Bool)

(assert (=> b!108416 m!160661))

(declare-fun m!160663 () Bool)

(assert (=> b!108416 m!160663))

(declare-fun m!160665 () Bool)

(assert (=> b!108416 m!160665))

(declare-fun m!160667 () Bool)

(assert (=> b!108416 m!160667))

(declare-fun m!160669 () Bool)

(assert (=> b!108416 m!160669))

(declare-fun m!160671 () Bool)

(assert (=> b!108416 m!160671))

(declare-fun m!160673 () Bool)

(assert (=> b!108421 m!160673))

(declare-fun m!160675 () Bool)

(assert (=> b!108413 m!160675))

(declare-fun m!160677 () Bool)

(assert (=> b!108409 m!160677))

(assert (=> b!108409 m!160677))

(declare-fun m!160679 () Bool)

(assert (=> b!108409 m!160679))

(assert (=> b!108414 m!160661))

(assert (=> b!108414 m!160671))

(declare-fun m!160681 () Bool)

(assert (=> b!108412 m!160681))

(declare-fun m!160683 () Bool)

(assert (=> b!108417 m!160683))

(declare-fun m!160685 () Bool)

(assert (=> b!108420 m!160685))

(declare-fun m!160687 () Bool)

(assert (=> b!108420 m!160687))

(declare-fun m!160689 () Bool)

(assert (=> b!108420 m!160689))

(declare-fun m!160691 () Bool)

(assert (=> b!108420 m!160691))

(declare-fun m!160693 () Bool)

(assert (=> b!108420 m!160693))

(declare-fun m!160695 () Bool)

(assert (=> b!108420 m!160695))

(declare-fun m!160697 () Bool)

(assert (=> b!108420 m!160697))

(declare-fun m!160699 () Bool)

(assert (=> b!108420 m!160699))

(declare-fun m!160701 () Bool)

(assert (=> b!108420 m!160701))

(declare-fun m!160703 () Bool)

(assert (=> b!108420 m!160703))

(declare-fun m!160705 () Bool)

(assert (=> b!108420 m!160705))

(declare-fun m!160707 () Bool)

(assert (=> b!108420 m!160707))

(declare-fun m!160709 () Bool)

(assert (=> b!108420 m!160709))

(declare-fun m!160711 () Bool)

(assert (=> b!108420 m!160711))

(declare-fun m!160713 () Bool)

(assert (=> b!108420 m!160713))

(declare-fun m!160715 () Bool)

(assert (=> b!108420 m!160715))

(declare-fun m!160717 () Bool)

(assert (=> b!108420 m!160717))

(declare-fun m!160719 () Bool)

(assert (=> b!108420 m!160719))

(declare-fun m!160721 () Bool)

(assert (=> b!108420 m!160721))

(declare-fun m!160723 () Bool)

(assert (=> b!108410 m!160723))

(push 1)

(assert (not b!108421))

(assert (not b!108416))

(assert (not start!21580))

(assert (not b!108414))

(assert (not b!108417))

(assert (not b!108420))

(assert (not b!108412))

(assert (not b!108410))

(assert (not b!108419))

(assert (not b!108413))

(assert (not b!108415))

(assert (not b!108418))

(assert (not b!108409))

(check-sat)

