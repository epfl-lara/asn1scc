; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1110 () Bool)

(assert start!1110)

(declare-fun res!6032 () Bool)

(declare-fun e!3089 () Bool)

(assert (=> start!1110 (=> (not res!6032) (not e!3089))))

(declare-datatypes ((array!373 0))(
  ( (array!374 (arr!549 (Array (_ BitVec 32) (_ BitVec 8))) (size!159 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!373)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!1110 (= res!6032 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!159 srcBuffer!6))))))))

(assert (=> start!1110 e!3089))

(assert (=> start!1110 true))

(declare-fun array_inv!154 (array!373) Bool)

(assert (=> start!1110 (array_inv!154 srcBuffer!6)))

(declare-datatypes ((BitStream!296 0))(
  ( (BitStream!297 (buf!480 array!373) (currentByte!1459 (_ BitVec 32)) (currentBit!1454 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!296)

(declare-fun e!3085 () Bool)

(declare-fun inv!12 (BitStream!296) Bool)

(assert (=> start!1110 (and (inv!12 thiss!1486) e!3085)))

(declare-fun b!4705 () Bool)

(declare-fun res!6027 () Bool)

(declare-fun e!3088 () Bool)

(assert (=> b!4705 (=> res!6027 e!3088)))

(declare-datatypes ((Unit!368 0))(
  ( (Unit!369) )
))
(declare-datatypes ((tuple2!598 0))(
  ( (tuple2!599 (_1!315 Unit!368) (_2!315 BitStream!296)) )
))
(declare-fun lt!5614 () tuple2!598)

(declare-datatypes ((List!59 0))(
  ( (Nil!56) (Cons!55 (h!174 Bool) (t!809 List!59)) )
))
(declare-fun lt!5611 () List!59)

(declare-fun byteArrayBitContentToList!0 (BitStream!296 array!373 (_ BitVec 64) (_ BitVec 64)) List!59)

(assert (=> b!4705 (= res!6027 (not (= lt!5611 (byteArrayBitContentToList!0 (_2!315 lt!5614) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!4706 () Bool)

(assert (=> b!4706 (= e!3085 (array_inv!154 (buf!480 thiss!1486)))))

(declare-fun b!4707 () Bool)

(declare-fun e!3086 () Bool)

(assert (=> b!4707 (= e!3089 e!3086)))

(declare-fun res!6031 () Bool)

(assert (=> b!4707 (=> (not res!6031) (not e!3086))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4707 (= res!6031 (invariant!0 (currentBit!1454 (_2!315 lt!5614)) (currentByte!1459 (_2!315 lt!5614)) (size!159 (buf!480 (_2!315 lt!5614)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!296 array!373 (_ BitVec 64) (_ BitVec 64)) tuple2!598)

(assert (=> b!4707 (= lt!5614 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4708 () Bool)

(declare-datatypes ((tuple2!600 0))(
  ( (tuple2!601 (_1!316 array!373) (_2!316 BitStream!296)) )
))
(declare-fun lt!5612 () tuple2!600)

(assert (=> b!4708 (= e!3088 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!159 (_1!316 lt!5612)))))))))

(declare-fun b!4709 () Bool)

(declare-fun res!6033 () Bool)

(assert (=> b!4709 (=> (not res!6033) (not e!3089))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4709 (= res!6033 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) nBits!460))))

(declare-fun b!4710 () Bool)

(declare-fun res!6029 () Bool)

(assert (=> b!4710 (=> (not res!6029) (not e!3086))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4710 (= res!6029 (= (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5614))) (currentByte!1459 (_2!315 lt!5614)) (currentBit!1454 (_2!315 lt!5614))) (bvadd (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)) nBits!460)))))

(declare-fun b!4711 () Bool)

(declare-fun res!6028 () Bool)

(assert (=> b!4711 (=> (not res!6028) (not e!3086))))

(assert (=> b!4711 (= res!6028 (= (size!159 (buf!480 thiss!1486)) (size!159 (buf!480 (_2!315 lt!5614)))))))

(declare-fun b!4712 () Bool)

(declare-fun res!6030 () Bool)

(assert (=> b!4712 (=> (not res!6030) (not e!3086))))

(declare-fun isPrefixOf!0 (BitStream!296 BitStream!296) Bool)

(assert (=> b!4712 (= res!6030 (isPrefixOf!0 thiss!1486 (_2!315 lt!5614)))))

(declare-fun b!4713 () Bool)

(assert (=> b!4713 (= e!3086 (not e!3088))))

(declare-fun res!6034 () Bool)

(assert (=> b!4713 (=> res!6034 e!3088)))

(assert (=> b!4713 (= res!6034 (not (= (byteArrayBitContentToList!0 (_2!315 lt!5614) (_1!316 lt!5612) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5611)))))

(declare-datatypes ((tuple2!602 0))(
  ( (tuple2!603 (_1!317 BitStream!296) (_2!317 BitStream!296)) )
))
(declare-fun lt!5613 () tuple2!602)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!296 BitStream!296 (_ BitVec 64)) List!59)

(assert (=> b!4713 (= lt!5611 (bitStreamReadBitsIntoList!0 (_2!315 lt!5614) (_1!317 lt!5613) nBits!460))))

(declare-fun readBits!0 (BitStream!296 (_ BitVec 64)) tuple2!600)

(assert (=> b!4713 (= lt!5612 (readBits!0 (_1!317 lt!5613) nBits!460))))

(assert (=> b!4713 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) nBits!460)))

(declare-fun lt!5615 () Unit!368)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!296 array!373 (_ BitVec 64)) Unit!368)

(assert (=> b!4713 (= lt!5615 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!480 (_2!315 lt!5614)) nBits!460))))

(declare-fun reader!0 (BitStream!296 BitStream!296) tuple2!602)

(assert (=> b!4713 (= lt!5613 (reader!0 thiss!1486 (_2!315 lt!5614)))))

(assert (= (and start!1110 res!6032) b!4709))

(assert (= (and b!4709 res!6033) b!4707))

(assert (= (and b!4707 res!6031) b!4711))

(assert (= (and b!4711 res!6028) b!4710))

(assert (= (and b!4710 res!6029) b!4712))

(assert (= (and b!4712 res!6030) b!4713))

(assert (= (and b!4713 (not res!6034)) b!4705))

(assert (= (and b!4705 (not res!6027)) b!4708))

(assert (= start!1110 b!4706))

(declare-fun m!5581 () Bool)

(assert (=> b!4707 m!5581))

(declare-fun m!5583 () Bool)

(assert (=> b!4707 m!5583))

(declare-fun m!5585 () Bool)

(assert (=> b!4705 m!5585))

(declare-fun m!5587 () Bool)

(assert (=> start!1110 m!5587))

(declare-fun m!5589 () Bool)

(assert (=> start!1110 m!5589))

(declare-fun m!5591 () Bool)

(assert (=> b!4709 m!5591))

(declare-fun m!5593 () Bool)

(assert (=> b!4706 m!5593))

(declare-fun m!5595 () Bool)

(assert (=> b!4710 m!5595))

(declare-fun m!5597 () Bool)

(assert (=> b!4710 m!5597))

(declare-fun m!5599 () Bool)

(assert (=> b!4713 m!5599))

(declare-fun m!5601 () Bool)

(assert (=> b!4713 m!5601))

(declare-fun m!5603 () Bool)

(assert (=> b!4713 m!5603))

(declare-fun m!5605 () Bool)

(assert (=> b!4713 m!5605))

(declare-fun m!5607 () Bool)

(assert (=> b!4713 m!5607))

(declare-fun m!5609 () Bool)

(assert (=> b!4713 m!5609))

(declare-fun m!5611 () Bool)

(assert (=> b!4712 m!5611))

(push 1)

(assert (not b!4706))

(assert (not b!4713))

(assert (not b!4712))

(assert (not start!1110))

(assert (not b!4709))

(assert (not b!4710))

(assert (not b!4707))

(assert (not b!4705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1776 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1776 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486))) nBits!460))))

(declare-fun bs!662 () Bool)

(assert (= bs!662 d!1776))

(declare-fun m!5613 () Bool)

(assert (=> bs!662 m!5613))

(assert (=> b!4709 d!1776))

(declare-fun d!1778 () Bool)

(assert (=> d!1778 (= (array_inv!154 srcBuffer!6) (bvsge (size!159 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1110 d!1778))

(declare-fun d!1780 () Bool)

(assert (=> d!1780 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1454 thiss!1486) (currentByte!1459 thiss!1486) (size!159 (buf!480 thiss!1486))))))

(declare-fun bs!663 () Bool)

(assert (= bs!663 d!1780))

(declare-fun m!5615 () Bool)

(assert (=> bs!663 m!5615))

(assert (=> start!1110 d!1780))

(declare-fun d!1782 () Bool)

(assert (=> d!1782 (= (invariant!0 (currentBit!1454 (_2!315 lt!5614)) (currentByte!1459 (_2!315 lt!5614)) (size!159 (buf!480 (_2!315 lt!5614)))) (and (bvsge (currentBit!1454 (_2!315 lt!5614)) #b00000000000000000000000000000000) (bvslt (currentBit!1454 (_2!315 lt!5614)) #b00000000000000000000000000001000) (bvsge (currentByte!1459 (_2!315 lt!5614)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1459 (_2!315 lt!5614)) (size!159 (buf!480 (_2!315 lt!5614)))) (and (= (currentBit!1454 (_2!315 lt!5614)) #b00000000000000000000000000000000) (= (currentByte!1459 (_2!315 lt!5614)) (size!159 (buf!480 (_2!315 lt!5614))))))))))

(assert (=> b!4707 d!1782))

(declare-fun b!4753 () Bool)

(declare-fun res!6067 () Bool)

(declare-fun e!3109 () Bool)

(assert (=> b!4753 (=> (not res!6067) (not e!3109))))

(declare-fun lt!5730 () tuple2!598)

(assert (=> b!4753 (= res!6067 (isPrefixOf!0 thiss!1486 (_2!315 lt!5730)))))

(declare-fun b!4754 () Bool)

(declare-fun e!3110 () tuple2!598)

(declare-fun Unit!370 () Unit!368)

(assert (=> b!4754 (= e!3110 (tuple2!599 Unit!370 thiss!1486))))

(assert (=> b!4754 (= (size!159 (buf!480 thiss!1486)) (size!159 (buf!480 thiss!1486)))))

(declare-fun lt!5734 () Unit!368)

(declare-fun Unit!371 () Unit!368)

(assert (=> b!4754 (= lt!5734 Unit!371)))

(declare-fun call!50 () tuple2!602)

(declare-fun checkByteArrayBitContent!0 (BitStream!296 array!373 array!373 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4754 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!316 (readBits!0 (_1!317 call!50) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!4755 () Bool)

(declare-fun res!6065 () Bool)

(assert (=> b!4755 (=> (not res!6065) (not e!3109))))

(assert (=> b!4755 (= res!6065 (invariant!0 (currentBit!1454 (_2!315 lt!5730)) (currentByte!1459 (_2!315 lt!5730)) (size!159 (buf!480 (_2!315 lt!5730)))))))

(declare-fun b!4757 () Bool)

(declare-fun res!6068 () Bool)

(assert (=> b!4757 (=> (not res!6068) (not e!3109))))

(assert (=> b!4757 (= res!6068 (= (size!159 (buf!480 thiss!1486)) (size!159 (buf!480 (_2!315 lt!5730)))))))

(declare-fun b!4756 () Bool)

(declare-fun e!3111 () Bool)

(declare-fun lt!5729 () (_ BitVec 64))

(assert (=> b!4756 (= e!3111 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) lt!5729))))

(declare-fun d!1786 () Bool)

(assert (=> d!1786 e!3109))

(declare-fun res!6066 () Bool)

(assert (=> d!1786 (=> (not res!6066) (not e!3109))))

(declare-fun lt!5737 () (_ BitVec 64))

(assert (=> d!1786 (= res!6066 (= (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5730))) (currentByte!1459 (_2!315 lt!5730)) (currentBit!1454 (_2!315 lt!5730))) (bvsub lt!5737 from!367)))))

(assert (=> d!1786 (or (= (bvand lt!5737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5737 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5753 () (_ BitVec 64))

(assert (=> d!1786 (= lt!5737 (bvadd lt!5753 from!367 nBits!460))))

(assert (=> d!1786 (or (not (= (bvand lt!5753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!5753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!5753 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1786 (= lt!5753 (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)))))

(assert (=> d!1786 (= lt!5730 e!3110)))

(declare-fun c!203 () Bool)

(assert (=> d!1786 (= c!203 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!5766 () Unit!368)

(declare-fun lt!5767 () Unit!368)

(assert (=> d!1786 (= lt!5766 lt!5767)))

(assert (=> d!1786 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!296) Unit!368)

(assert (=> d!1786 (= lt!5767 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!5768 () (_ BitVec 64))

(assert (=> d!1786 (= lt!5768 (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)))))

(assert (=> d!1786 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1786 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!5730)))

(declare-fun lt!5744 () tuple2!602)

(declare-fun b!4758 () Bool)

(assert (=> b!4758 (= e!3109 (= (bitStreamReadBitsIntoList!0 (_2!315 lt!5730) (_1!317 lt!5744) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!315 lt!5730) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!4758 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4758 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5743 () Unit!368)

(declare-fun lt!5763 () Unit!368)

(assert (=> b!4758 (= lt!5743 lt!5763)))

(assert (=> b!4758 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5730)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) lt!5729)))

(assert (=> b!4758 (= lt!5763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!480 (_2!315 lt!5730)) lt!5729))))

(assert (=> b!4758 e!3111))

(declare-fun res!6069 () Bool)

(assert (=> b!4758 (=> (not res!6069) (not e!3111))))

(assert (=> b!4758 (= res!6069 (and (= (size!159 (buf!480 thiss!1486)) (size!159 (buf!480 (_2!315 lt!5730)))) (bvsge lt!5729 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4758 (= lt!5729 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!4758 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4758 (= lt!5744 (reader!0 thiss!1486 (_2!315 lt!5730)))))

(declare-fun b!4759 () Bool)

(declare-fun lt!5771 () tuple2!598)

(declare-fun Unit!372 () Unit!368)

(assert (=> b!4759 (= e!3110 (tuple2!599 Unit!372 (_2!315 lt!5771)))))

(declare-fun lt!5735 () tuple2!598)

(declare-fun appendBitFromByte!0 (BitStream!296 (_ BitVec 8) (_ BitVec 32)) tuple2!598)

(assert (=> b!4759 (= lt!5735 (appendBitFromByte!0 thiss!1486 (select (arr!549 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!5758 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5758 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5756 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5736 () Unit!368)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!296 BitStream!296 (_ BitVec 64) (_ BitVec 64)) Unit!368)

(assert (=> b!4759 (= lt!5736 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!315 lt!5735) lt!5758 lt!5756))))

(assert (=> b!4759 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5735)))) ((_ sign_extend 32) (currentByte!1459 (_2!315 lt!5735))) ((_ sign_extend 32) (currentBit!1454 (_2!315 lt!5735))) (bvsub lt!5758 lt!5756))))

(declare-fun lt!5746 () Unit!368)

(assert (=> b!4759 (= lt!5746 lt!5736)))

(declare-fun lt!5752 () tuple2!602)

(assert (=> b!4759 (= lt!5752 call!50)))

(declare-fun lt!5750 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5750 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5759 () Unit!368)

(assert (=> b!4759 (= lt!5759 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!480 (_2!315 lt!5735)) lt!5750))))

(assert (=> b!4759 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5735)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) lt!5750)))

(declare-fun lt!5741 () Unit!368)

(assert (=> b!4759 (= lt!5741 lt!5759)))

(declare-fun head!20 (List!59) Bool)

(assert (=> b!4759 (= (head!20 (byteArrayBitContentToList!0 (_2!315 lt!5735) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!20 (bitStreamReadBitsIntoList!0 (_2!315 lt!5735) (_1!317 lt!5752) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5765 () Unit!368)

(declare-fun Unit!373 () Unit!368)

(assert (=> b!4759 (= lt!5765 Unit!373)))

(assert (=> b!4759 (= lt!5771 (appendBitsMSBFirstLoop!0 (_2!315 lt!5735) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!5760 () Unit!368)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!296 BitStream!296 BitStream!296) Unit!368)

(assert (=> b!4759 (= lt!5760 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!315 lt!5735) (_2!315 lt!5771)))))

(assert (=> b!4759 (isPrefixOf!0 thiss!1486 (_2!315 lt!5771))))

(declare-fun lt!5749 () Unit!368)

(assert (=> b!4759 (= lt!5749 lt!5760)))

(assert (=> b!4759 (= (size!159 (buf!480 (_2!315 lt!5771))) (size!159 (buf!480 thiss!1486)))))

(declare-fun lt!5740 () Unit!368)

(declare-fun Unit!374 () Unit!368)

(assert (=> b!4759 (= lt!5740 Unit!374)))

(assert (=> b!4759 (= (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5771))) (currentByte!1459 (_2!315 lt!5771)) (currentBit!1454 (_2!315 lt!5771))) (bvsub (bvadd (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!5747 () Unit!368)

(declare-fun Unit!375 () Unit!368)

(assert (=> b!4759 (= lt!5747 Unit!375)))

(assert (=> b!4759 (= (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5771))) (currentByte!1459 (_2!315 lt!5771)) (currentBit!1454 (_2!315 lt!5771))) (bvsub (bvsub (bvadd (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5735))) (currentByte!1459 (_2!315 lt!5735)) (currentBit!1454 (_2!315 lt!5735))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5739 () Unit!368)

(declare-fun Unit!376 () Unit!368)

(assert (=> b!4759 (= lt!5739 Unit!376)))

(declare-fun lt!5770 () tuple2!602)

(assert (=> b!4759 (= lt!5770 (reader!0 thiss!1486 (_2!315 lt!5771)))))

(declare-fun lt!5733 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5733 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5745 () Unit!368)

(assert (=> b!4759 (= lt!5745 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!480 (_2!315 lt!5771)) lt!5733))))

(assert (=> b!4759 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5771)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) lt!5733)))

(declare-fun lt!5731 () Unit!368)

(assert (=> b!4759 (= lt!5731 lt!5745)))

(declare-fun lt!5748 () tuple2!602)

(assert (=> b!4759 (= lt!5748 (reader!0 (_2!315 lt!5735) (_2!315 lt!5771)))))

(declare-fun lt!5755 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5755 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5732 () Unit!368)

(assert (=> b!4759 (= lt!5732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!315 lt!5735) (buf!480 (_2!315 lt!5771)) lt!5755))))

(assert (=> b!4759 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5771)))) ((_ sign_extend 32) (currentByte!1459 (_2!315 lt!5735))) ((_ sign_extend 32) (currentBit!1454 (_2!315 lt!5735))) lt!5755)))

(declare-fun lt!5757 () Unit!368)

(assert (=> b!4759 (= lt!5757 lt!5732)))

(declare-fun lt!5728 () List!59)

(assert (=> b!4759 (= lt!5728 (byteArrayBitContentToList!0 (_2!315 lt!5771) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5754 () List!59)

(assert (=> b!4759 (= lt!5754 (byteArrayBitContentToList!0 (_2!315 lt!5771) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5762 () List!59)

(assert (=> b!4759 (= lt!5762 (bitStreamReadBitsIntoList!0 (_2!315 lt!5771) (_1!317 lt!5770) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5738 () List!59)

(assert (=> b!4759 (= lt!5738 (bitStreamReadBitsIntoList!0 (_2!315 lt!5771) (_1!317 lt!5748) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5769 () (_ BitVec 64))

(assert (=> b!4759 (= lt!5769 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5761 () Unit!368)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!296 BitStream!296 BitStream!296 BitStream!296 (_ BitVec 64) List!59) Unit!368)

(assert (=> b!4759 (= lt!5761 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!315 lt!5771) (_2!315 lt!5771) (_1!317 lt!5770) (_1!317 lt!5748) lt!5769 lt!5762))))

(declare-fun tail!28 (List!59) List!59)

(assert (=> b!4759 (= (bitStreamReadBitsIntoList!0 (_2!315 lt!5771) (_1!317 lt!5748) (bvsub lt!5769 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!28 lt!5762))))

(declare-fun lt!5764 () Unit!368)

(assert (=> b!4759 (= lt!5764 lt!5761)))

(declare-fun lt!5751 () Unit!368)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!373 array!373 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!368)

(assert (=> b!4759 (= lt!5751 (arrayBitRangesEqImpliesEq!0 (buf!480 (_2!315 lt!5735)) (buf!480 (_2!315 lt!5771)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!5768 (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5735))) (currentByte!1459 (_2!315 lt!5735)) (currentBit!1454 (_2!315 lt!5735)))))))

(declare-fun bitAt!0 (array!373 (_ BitVec 64)) Bool)

(assert (=> b!4759 (= (bitAt!0 (buf!480 (_2!315 lt!5735)) lt!5768) (bitAt!0 (buf!480 (_2!315 lt!5771)) lt!5768))))

(declare-fun lt!5742 () Unit!368)

(assert (=> b!4759 (= lt!5742 lt!5751)))

(declare-fun bm!47 () Bool)

(assert (=> bm!47 (= call!50 (reader!0 thiss!1486 (ite c!203 (_2!315 lt!5735) thiss!1486)))))

(declare-fun b!4760 () Bool)

(declare-fun res!6064 () Bool)

(assert (=> b!4760 (=> (not res!6064) (not e!3109))))

(assert (=> b!4760 (= res!6064 (= (size!159 (buf!480 (_2!315 lt!5730))) (size!159 (buf!480 thiss!1486))))))

(assert (= (and d!1786 c!203) b!4759))

(assert (= (and d!1786 (not c!203)) b!4754))

(assert (= (or b!4759 b!4754) bm!47))

(assert (= (and d!1786 res!6066) b!4755))

(assert (= (and b!4755 res!6065) b!4757))

(assert (= (and b!4757 res!6068) b!4753))

(assert (= (and b!4753 res!6067) b!4760))

(assert (= (and b!4760 res!6064) b!4758))

(assert (= (and b!4758 res!6069) b!4756))

(declare-fun m!5631 () Bool)

(assert (=> bm!47 m!5631))

(declare-fun m!5633 () Bool)

(assert (=> b!4756 m!5633))

(declare-fun m!5635 () Bool)

(assert (=> b!4759 m!5635))

(declare-fun m!5637 () Bool)

(assert (=> b!4759 m!5637))

(declare-fun m!5639 () Bool)

(assert (=> b!4759 m!5639))

(declare-fun m!5641 () Bool)

(assert (=> b!4759 m!5641))

(declare-fun m!5643 () Bool)

(assert (=> b!4759 m!5643))

(declare-fun m!5645 () Bool)

(assert (=> b!4759 m!5645))

(declare-fun m!5647 () Bool)

(assert (=> b!4759 m!5647))

(declare-fun m!5649 () Bool)

(assert (=> b!4759 m!5649))

(declare-fun m!5651 () Bool)

(assert (=> b!4759 m!5651))

(declare-fun m!5653 () Bool)

(assert (=> b!4759 m!5653))

(declare-fun m!5655 () Bool)

(assert (=> b!4759 m!5655))

(assert (=> b!4759 m!5653))

(assert (=> b!4759 m!5597))

(declare-fun m!5657 () Bool)

(assert (=> b!4759 m!5657))

(declare-fun m!5659 () Bool)

(assert (=> b!4759 m!5659))

(declare-fun m!5661 () Bool)

(assert (=> b!4759 m!5661))

(assert (=> b!4759 m!5649))

(declare-fun m!5663 () Bool)

(assert (=> b!4759 m!5663))

(declare-fun m!5665 () Bool)

(assert (=> b!4759 m!5665))

(declare-fun m!5667 () Bool)

(assert (=> b!4759 m!5667))

(declare-fun m!5669 () Bool)

(assert (=> b!4759 m!5669))

(declare-fun m!5671 () Bool)

(assert (=> b!4759 m!5671))

(declare-fun m!5673 () Bool)

(assert (=> b!4759 m!5673))

(declare-fun m!5675 () Bool)

(assert (=> b!4759 m!5675))

(assert (=> b!4759 m!5641))

(declare-fun m!5677 () Bool)

(assert (=> b!4759 m!5677))

(declare-fun m!5679 () Bool)

(assert (=> b!4759 m!5679))

(declare-fun m!5681 () Bool)

(assert (=> b!4759 m!5681))

(declare-fun m!5683 () Bool)

(assert (=> b!4759 m!5683))

(declare-fun m!5685 () Bool)

(assert (=> b!4759 m!5685))

(assert (=> b!4759 m!5681))

(declare-fun m!5687 () Bool)

(assert (=> b!4759 m!5687))

(declare-fun m!5689 () Bool)

(assert (=> b!4759 m!5689))

(declare-fun m!5691 () Bool)

(assert (=> b!4759 m!5691))

(declare-fun m!5693 () Bool)

(assert (=> b!4759 m!5693))

(declare-fun m!5695 () Bool)

(assert (=> b!4759 m!5695))

(declare-fun m!5697 () Bool)

(assert (=> b!4755 m!5697))

(declare-fun m!5699 () Bool)

(assert (=> b!4758 m!5699))

(declare-fun m!5701 () Bool)

(assert (=> b!4758 m!5701))

(declare-fun m!5703 () Bool)

(assert (=> b!4758 m!5703))

(declare-fun m!5705 () Bool)

(assert (=> b!4758 m!5705))

(declare-fun m!5707 () Bool)

(assert (=> b!4758 m!5707))

(declare-fun m!5709 () Bool)

(assert (=> d!1786 m!5709))

(assert (=> d!1786 m!5597))

(declare-fun m!5711 () Bool)

(assert (=> d!1786 m!5711))

(declare-fun m!5713 () Bool)

(assert (=> d!1786 m!5713))

(declare-fun m!5715 () Bool)

(assert (=> b!4754 m!5715))

(declare-fun m!5717 () Bool)

(assert (=> b!4754 m!5717))

(declare-fun m!5719 () Bool)

(assert (=> b!4753 m!5719))

(assert (=> b!4707 d!1786))

(declare-fun d!1802 () Bool)

(assert (=> d!1802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486))) nBits!460))))

(declare-fun bs!664 () Bool)

(assert (= bs!664 d!1802))

(declare-fun m!5721 () Bool)

(assert (=> bs!664 m!5721))

(assert (=> b!4713 d!1802))

(declare-fun d!1804 () Bool)

(declare-fun c!210 () Bool)

(assert (=> d!1804 (= c!210 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3122 () List!59)

(assert (=> d!1804 (= (byteArrayBitContentToList!0 (_2!315 lt!5614) (_1!316 lt!5612) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3122)))

(declare-fun b!4785 () Bool)

(assert (=> b!4785 (= e!3122 Nil!56)))

(declare-fun b!4786 () Bool)

(assert (=> b!4786 (= e!3122 (Cons!55 (not (= (bvand ((_ sign_extend 24) (select (arr!549 (_1!316 lt!5612)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!315 lt!5614) (_1!316 lt!5612) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1804 c!210) b!4785))

(assert (= (and d!1804 (not c!210)) b!4786))

(declare-fun m!5723 () Bool)

(assert (=> b!4786 m!5723))

(declare-fun m!5725 () Bool)

(assert (=> b!4786 m!5725))

(declare-fun m!5727 () Bool)

(assert (=> b!4786 m!5727))

(assert (=> b!4713 d!1804))

(declare-fun b!4825 () Bool)

(declare-fun res!6114 () Bool)

(declare-fun e!3137 () Bool)

(assert (=> b!4825 (=> (not res!6114) (not e!3137))))

(declare-fun lt!6096 () tuple2!602)

(assert (=> b!4825 (= res!6114 (isPrefixOf!0 (_2!317 lt!6096) (_2!315 lt!5614)))))

(declare-fun b!4826 () Bool)

(declare-fun e!3138 () Unit!368)

(declare-fun lt!6098 () Unit!368)

(assert (=> b!4826 (= e!3138 lt!6098)))

(declare-fun lt!6095 () (_ BitVec 64))

(assert (=> b!4826 (= lt!6095 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6085 () (_ BitVec 64))

(assert (=> b!4826 (= lt!6085 (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!373 array!373 (_ BitVec 64) (_ BitVec 64)) Unit!368)

(assert (=> b!4826 (= lt!6098 (arrayBitRangesEqSymmetric!0 (buf!480 thiss!1486) (buf!480 (_2!315 lt!5614)) lt!6095 lt!6085))))

(declare-fun arrayBitRangesEq!0 (array!373 array!373 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4826 (arrayBitRangesEq!0 (buf!480 (_2!315 lt!5614)) (buf!480 thiss!1486) lt!6095 lt!6085)))

(declare-fun b!4827 () Bool)

(declare-fun lt!6092 () (_ BitVec 64))

(declare-fun lt!6087 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!296 (_ BitVec 64)) BitStream!296)

(assert (=> b!4827 (= e!3137 (= (_1!317 lt!6096) (withMovedBitIndex!0 (_2!317 lt!6096) (bvsub lt!6092 lt!6087))))))

(assert (=> b!4827 (or (= (bvand lt!6092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6092 lt!6087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4827 (= lt!6087 (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5614))) (currentByte!1459 (_2!315 lt!5614)) (currentBit!1454 (_2!315 lt!5614))))))

(assert (=> b!4827 (= lt!6092 (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)))))

(declare-fun d!1806 () Bool)

(assert (=> d!1806 e!3137))

(declare-fun res!6112 () Bool)

(assert (=> d!1806 (=> (not res!6112) (not e!3137))))

(assert (=> d!1806 (= res!6112 (isPrefixOf!0 (_1!317 lt!6096) (_2!317 lt!6096)))))

(declare-fun lt!6093 () BitStream!296)

(assert (=> d!1806 (= lt!6096 (tuple2!603 lt!6093 (_2!315 lt!5614)))))

(declare-fun lt!6086 () Unit!368)

(declare-fun lt!6079 () Unit!368)

(assert (=> d!1806 (= lt!6086 lt!6079)))

(assert (=> d!1806 (isPrefixOf!0 lt!6093 (_2!315 lt!5614))))

(assert (=> d!1806 (= lt!6079 (lemmaIsPrefixTransitive!0 lt!6093 (_2!315 lt!5614) (_2!315 lt!5614)))))

(declare-fun lt!6097 () Unit!368)

(declare-fun lt!6082 () Unit!368)

(assert (=> d!1806 (= lt!6097 lt!6082)))

(assert (=> d!1806 (isPrefixOf!0 lt!6093 (_2!315 lt!5614))))

(assert (=> d!1806 (= lt!6082 (lemmaIsPrefixTransitive!0 lt!6093 thiss!1486 (_2!315 lt!5614)))))

(declare-fun lt!6094 () Unit!368)

(assert (=> d!1806 (= lt!6094 e!3138)))

(declare-fun c!215 () Bool)

(assert (=> d!1806 (= c!215 (not (= (size!159 (buf!480 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!6091 () Unit!368)

(declare-fun lt!6083 () Unit!368)

(assert (=> d!1806 (= lt!6091 lt!6083)))

(assert (=> d!1806 (isPrefixOf!0 (_2!315 lt!5614) (_2!315 lt!5614))))

(assert (=> d!1806 (= lt!6083 (lemmaIsPrefixRefl!0 (_2!315 lt!5614)))))

(declare-fun lt!6081 () Unit!368)

(declare-fun lt!6084 () Unit!368)

(assert (=> d!1806 (= lt!6081 lt!6084)))

(assert (=> d!1806 (= lt!6084 (lemmaIsPrefixRefl!0 (_2!315 lt!5614)))))

(declare-fun lt!6089 () Unit!368)

(declare-fun lt!6090 () Unit!368)

(assert (=> d!1806 (= lt!6089 lt!6090)))

(assert (=> d!1806 (isPrefixOf!0 lt!6093 lt!6093)))

(assert (=> d!1806 (= lt!6090 (lemmaIsPrefixRefl!0 lt!6093))))

(declare-fun lt!6080 () Unit!368)

(declare-fun lt!6088 () Unit!368)

(assert (=> d!1806 (= lt!6080 lt!6088)))

(assert (=> d!1806 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1806 (= lt!6088 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1806 (= lt!6093 (BitStream!297 (buf!480 (_2!315 lt!5614)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)))))

(assert (=> d!1806 (isPrefixOf!0 thiss!1486 (_2!315 lt!5614))))

(assert (=> d!1806 (= (reader!0 thiss!1486 (_2!315 lt!5614)) lt!6096)))

(declare-fun b!4828 () Bool)

(declare-fun res!6113 () Bool)

(assert (=> b!4828 (=> (not res!6113) (not e!3137))))

(assert (=> b!4828 (= res!6113 (isPrefixOf!0 (_1!317 lt!6096) thiss!1486))))

(declare-fun b!4829 () Bool)

(declare-fun Unit!389 () Unit!368)

(assert (=> b!4829 (= e!3138 Unit!389)))

(assert (= (and d!1806 c!215) b!4826))

(assert (= (and d!1806 (not c!215)) b!4829))

(assert (= (and d!1806 res!6112) b!4828))

(assert (= (and b!4828 res!6113) b!4825))

(assert (= (and b!4825 res!6114) b!4827))

(declare-fun m!5913 () Bool)

(assert (=> b!4828 m!5913))

(declare-fun m!5915 () Bool)

(assert (=> b!4827 m!5915))

(assert (=> b!4827 m!5595))

(assert (=> b!4827 m!5597))

(assert (=> b!4826 m!5597))

(declare-fun m!5917 () Bool)

(assert (=> b!4826 m!5917))

(declare-fun m!5919 () Bool)

(assert (=> b!4826 m!5919))

(declare-fun m!5921 () Bool)

(assert (=> d!1806 m!5921))

(declare-fun m!5923 () Bool)

(assert (=> d!1806 m!5923))

(assert (=> d!1806 m!5711))

(assert (=> d!1806 m!5611))

(declare-fun m!5925 () Bool)

(assert (=> d!1806 m!5925))

(declare-fun m!5927 () Bool)

(assert (=> d!1806 m!5927))

(declare-fun m!5929 () Bool)

(assert (=> d!1806 m!5929))

(declare-fun m!5931 () Bool)

(assert (=> d!1806 m!5931))

(assert (=> d!1806 m!5713))

(declare-fun m!5933 () Bool)

(assert (=> d!1806 m!5933))

(declare-fun m!5935 () Bool)

(assert (=> d!1806 m!5935))

(declare-fun m!5937 () Bool)

(assert (=> b!4825 m!5937))

(assert (=> b!4713 d!1806))

(declare-fun b!4882 () Bool)

(declare-fun res!6156 () Bool)

(declare-fun e!3153 () Bool)

(assert (=> b!4882 (=> (not res!6156) (not e!3153))))

(declare-fun lt!6187 () tuple2!600)

(assert (=> b!4882 (= res!6156 (bvsle (currentByte!1459 (_1!317 lt!5613)) (currentByte!1459 (_2!316 lt!6187))))))

(declare-fun b!4883 () Bool)

(declare-fun res!6157 () Bool)

(assert (=> b!4883 (=> (not res!6157) (not e!3153))))

(declare-fun lt!6182 () (_ BitVec 64))

(assert (=> b!4883 (= res!6157 (= (size!159 (_1!316 lt!6187)) ((_ extract 31 0) lt!6182)))))

(assert (=> b!4883 (and (bvslt lt!6182 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!6182 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!6185 () (_ BitVec 64))

(declare-fun lt!6188 () (_ BitVec 64))

(assert (=> b!4883 (= lt!6182 (bvsdiv lt!6185 lt!6188))))

(assert (=> b!4883 (and (not (= lt!6188 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!6185 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!6188 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!4883 (= lt!6188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!6186 () (_ BitVec 64))

(declare-fun lt!6184 () (_ BitVec 64))

(assert (=> b!4883 (= lt!6185 (bvsub lt!6186 lt!6184))))

(assert (=> b!4883 (or (= (bvand lt!6186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6186 lt!6184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4883 (= lt!6184 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6183 () (_ BitVec 64))

(assert (=> b!4883 (= lt!6186 (bvadd nBits!460 lt!6183))))

(assert (=> b!4883 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6183 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!6183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4883 (= lt!6183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!4884 () Bool)

(declare-fun res!6158 () Bool)

(assert (=> b!4884 (=> (not res!6158) (not e!3153))))

(declare-fun lt!6180 () (_ BitVec 64))

(assert (=> b!4884 (= res!6158 (= (bvadd lt!6180 nBits!460) (bitIndex!0 (size!159 (buf!480 (_2!316 lt!6187))) (currentByte!1459 (_2!316 lt!6187)) (currentBit!1454 (_2!316 lt!6187)))))))

(assert (=> b!4884 (or (not (= (bvand lt!6180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!6180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!6180 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4884 (= lt!6180 (bitIndex!0 (size!159 (buf!480 (_1!317 lt!5613))) (currentByte!1459 (_1!317 lt!5613)) (currentBit!1454 (_1!317 lt!5613))))))

(declare-fun b!4885 () Bool)

(assert (=> b!4885 (= e!3153 (= (byteArrayBitContentToList!0 (_2!316 lt!6187) (_1!316 lt!6187) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!316 lt!6187) (_1!317 lt!5613) nBits!460)))))

(declare-fun b!4886 () Bool)

(declare-fun res!6155 () Bool)

(assert (=> b!4886 (=> (not res!6155) (not e!3153))))

(assert (=> b!4886 (= res!6155 (invariant!0 (currentBit!1454 (_2!316 lt!6187)) (currentByte!1459 (_2!316 lt!6187)) (size!159 (buf!480 (_2!316 lt!6187)))))))

(declare-fun d!1820 () Bool)

(assert (=> d!1820 e!3153))

(declare-fun res!6159 () Bool)

(assert (=> d!1820 (=> (not res!6159) (not e!3153))))

(assert (=> d!1820 (= res!6159 (= (buf!480 (_2!316 lt!6187)) (buf!480 (_1!317 lt!5613))))))

(declare-datatypes ((tuple3!34 0))(
  ( (tuple3!35 (_1!319 Unit!368) (_2!319 BitStream!296) (_3!17 array!373)) )
))
(declare-fun lt!6181 () tuple3!34)

(assert (=> d!1820 (= lt!6187 (tuple2!601 (_3!17 lt!6181) (_2!319 lt!6181)))))

(declare-fun readBitsLoop!0 (BitStream!296 (_ BitVec 64) array!373 (_ BitVec 64) (_ BitVec 64)) tuple3!34)

(assert (=> d!1820 (= lt!6181 (readBitsLoop!0 (_1!317 lt!5613) nBits!460 (array!374 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1820 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1820 (= (readBits!0 (_1!317 lt!5613) nBits!460) lt!6187)))

(assert (= (and d!1820 res!6159) b!4884))

(assert (= (and b!4884 res!6158) b!4886))

(assert (= (and b!4886 res!6155) b!4883))

(assert (= (and b!4883 res!6157) b!4882))

(assert (= (and b!4882 res!6156) b!4885))

(declare-fun m!5971 () Bool)

(assert (=> b!4884 m!5971))

(declare-fun m!5973 () Bool)

(assert (=> b!4884 m!5973))

(declare-fun m!5975 () Bool)

(assert (=> b!4885 m!5975))

(declare-fun m!5977 () Bool)

(assert (=> b!4885 m!5977))

(declare-fun m!5979 () Bool)

(assert (=> b!4886 m!5979))

(declare-fun m!5981 () Bool)

(assert (=> d!1820 m!5981))

(assert (=> b!4713 d!1820))

(declare-fun b!4903 () Bool)

(declare-fun e!3161 () Bool)

(declare-fun lt!6196 () List!59)

(declare-fun isEmpty!11 (List!59) Bool)

(assert (=> b!4903 (= e!3161 (isEmpty!11 lt!6196))))

(declare-fun b!4904 () Bool)

(declare-fun length!6 (List!59) Int)

(assert (=> b!4904 (= e!3161 (> (length!6 lt!6196) 0))))

(declare-datatypes ((tuple2!608 0))(
  ( (tuple2!609 (_1!322 List!59) (_2!322 BitStream!296)) )
))
(declare-fun e!3162 () tuple2!608)

(declare-datatypes ((tuple2!610 0))(
  ( (tuple2!611 (_1!323 Bool) (_2!323 BitStream!296)) )
))
(declare-fun lt!6197 () tuple2!610)

(declare-fun b!4902 () Bool)

(declare-fun lt!6195 () (_ BitVec 64))

(assert (=> b!4902 (= e!3162 (tuple2!609 (Cons!55 (_1!323 lt!6197) (bitStreamReadBitsIntoList!0 (_2!315 lt!5614) (_2!323 lt!6197) (bvsub nBits!460 lt!6195))) (_2!323 lt!6197)))))

(declare-fun readBit!0 (BitStream!296) tuple2!610)

(assert (=> b!4902 (= lt!6197 (readBit!0 (_1!317 lt!5613)))))

(assert (=> b!4902 (= lt!6195 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!1828 () Bool)

(assert (=> d!1828 e!3161))

(declare-fun c!230 () Bool)

(assert (=> d!1828 (= c!230 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1828 (= lt!6196 (_1!322 e!3162))))

(declare-fun c!229 () Bool)

(assert (=> d!1828 (= c!229 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1828 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1828 (= (bitStreamReadBitsIntoList!0 (_2!315 lt!5614) (_1!317 lt!5613) nBits!460) lt!6196)))

(declare-fun b!4901 () Bool)

(assert (=> b!4901 (= e!3162 (tuple2!609 Nil!56 (_1!317 lt!5613)))))

(assert (= (and d!1828 c!229) b!4901))

(assert (= (and d!1828 (not c!229)) b!4902))

(assert (= (and d!1828 c!230) b!4903))

(assert (= (and d!1828 (not c!230)) b!4904))

(declare-fun m!5989 () Bool)

(assert (=> b!4903 m!5989))

(declare-fun m!5991 () Bool)

(assert (=> b!4904 m!5991))

(declare-fun m!5993 () Bool)

(assert (=> b!4902 m!5993))

(declare-fun m!5995 () Bool)

(assert (=> b!4902 m!5995))

(assert (=> b!4713 d!1828))

(declare-fun d!1832 () Bool)

(assert (=> d!1832 (validate_offset_bits!1 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486)) nBits!460)))

(declare-fun lt!6200 () Unit!368)

(declare-fun choose!9 (BitStream!296 array!373 (_ BitVec 64) BitStream!296) Unit!368)

(assert (=> d!1832 (= lt!6200 (choose!9 thiss!1486 (buf!480 (_2!315 lt!5614)) nBits!460 (BitStream!297 (buf!480 (_2!315 lt!5614)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486))))))

(assert (=> d!1832 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!480 (_2!315 lt!5614)) nBits!460) lt!6200)))

(declare-fun bs!668 () Bool)

(assert (= bs!668 d!1832))

(assert (=> bs!668 m!5603))

(declare-fun m!5997 () Bool)

(assert (=> bs!668 m!5997))

(assert (=> b!4713 d!1832))

(declare-fun d!1834 () Bool)

(assert (=> d!1834 (= (array_inv!154 (buf!480 thiss!1486)) (bvsge (size!159 (buf!480 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!4706 d!1834))

(declare-fun d!1836 () Bool)

(declare-fun res!6167 () Bool)

(declare-fun e!3167 () Bool)

(assert (=> d!1836 (=> (not res!6167) (not e!3167))))

(assert (=> d!1836 (= res!6167 (= (size!159 (buf!480 thiss!1486)) (size!159 (buf!480 (_2!315 lt!5614)))))))

(assert (=> d!1836 (= (isPrefixOf!0 thiss!1486 (_2!315 lt!5614)) e!3167)))

(declare-fun b!4911 () Bool)

(declare-fun res!6168 () Bool)

(assert (=> b!4911 (=> (not res!6168) (not e!3167))))

(assert (=> b!4911 (= res!6168 (bvsle (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)) (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5614))) (currentByte!1459 (_2!315 lt!5614)) (currentBit!1454 (_2!315 lt!5614)))))))

(declare-fun b!4912 () Bool)

(declare-fun e!3168 () Bool)

(assert (=> b!4912 (= e!3167 e!3168)))

(declare-fun res!6166 () Bool)

(assert (=> b!4912 (=> res!6166 e!3168)))

(assert (=> b!4912 (= res!6166 (= (size!159 (buf!480 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!4913 () Bool)

(assert (=> b!4913 (= e!3168 (arrayBitRangesEq!0 (buf!480 thiss!1486) (buf!480 (_2!315 lt!5614)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486))))))

(assert (= (and d!1836 res!6167) b!4911))

(assert (= (and b!4911 res!6168) b!4912))

(assert (= (and b!4912 (not res!6166)) b!4913))

(assert (=> b!4911 m!5597))

(assert (=> b!4911 m!5595))

(assert (=> b!4913 m!5597))

(assert (=> b!4913 m!5597))

(declare-fun m!5999 () Bool)

(assert (=> b!4913 m!5999))

(assert (=> b!4712 d!1836))

(declare-fun d!1838 () Bool)

(declare-fun e!3177 () Bool)

(assert (=> d!1838 e!3177))

(declare-fun res!6182 () Bool)

(assert (=> d!1838 (=> (not res!6182) (not e!3177))))

(declare-fun lt!6278 () (_ BitVec 64))

(declare-fun lt!6276 () (_ BitVec 64))

(declare-fun lt!6275 () (_ BitVec 64))

(assert (=> d!1838 (= res!6182 (= lt!6276 (bvsub lt!6275 lt!6278)))))

(assert (=> d!1838 (or (= (bvand lt!6275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6275 lt!6278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1838 (= lt!6278 (remainingBits!0 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))) ((_ sign_extend 32) (currentByte!1459 (_2!315 lt!5614))) ((_ sign_extend 32) (currentBit!1454 (_2!315 lt!5614)))))))

(declare-fun lt!6277 () (_ BitVec 64))

(declare-fun lt!6274 () (_ BitVec 64))

(assert (=> d!1838 (= lt!6275 (bvmul lt!6277 lt!6274))))

(assert (=> d!1838 (or (= lt!6277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6274 (bvsdiv (bvmul lt!6277 lt!6274) lt!6277)))))

(assert (=> d!1838 (= lt!6274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1838 (= lt!6277 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))))))

(assert (=> d!1838 (= lt!6276 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1459 (_2!315 lt!5614))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1454 (_2!315 lt!5614)))))))

(assert (=> d!1838 (invariant!0 (currentBit!1454 (_2!315 lt!5614)) (currentByte!1459 (_2!315 lt!5614)) (size!159 (buf!480 (_2!315 lt!5614))))))

(assert (=> d!1838 (= (bitIndex!0 (size!159 (buf!480 (_2!315 lt!5614))) (currentByte!1459 (_2!315 lt!5614)) (currentBit!1454 (_2!315 lt!5614))) lt!6276)))

(declare-fun b!4933 () Bool)

(declare-fun res!6183 () Bool)

(assert (=> b!4933 (=> (not res!6183) (not e!3177))))

(assert (=> b!4933 (= res!6183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6276))))

(declare-fun b!4934 () Bool)

(declare-fun lt!6273 () (_ BitVec 64))

(assert (=> b!4934 (= e!3177 (bvsle lt!6276 (bvmul lt!6273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4934 (or (= lt!6273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6273)))))

(assert (=> b!4934 (= lt!6273 ((_ sign_extend 32) (size!159 (buf!480 (_2!315 lt!5614)))))))

(assert (= (and d!1838 res!6182) b!4933))

(assert (= (and b!4933 res!6183) b!4934))

(declare-fun m!6029 () Bool)

(assert (=> d!1838 m!6029))

(assert (=> d!1838 m!5581))

(assert (=> b!4710 d!1838))

(declare-fun d!1844 () Bool)

(declare-fun e!3178 () Bool)

(assert (=> d!1844 e!3178))

(declare-fun res!6184 () Bool)

(assert (=> d!1844 (=> (not res!6184) (not e!3178))))

(declare-fun lt!6281 () (_ BitVec 64))

(declare-fun lt!6284 () (_ BitVec 64))

(declare-fun lt!6282 () (_ BitVec 64))

(assert (=> d!1844 (= res!6184 (= lt!6282 (bvsub lt!6281 lt!6284)))))

(assert (=> d!1844 (or (= (bvand lt!6281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6284 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6281 lt!6284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1844 (= lt!6284 (remainingBits!0 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))) ((_ sign_extend 32) (currentByte!1459 thiss!1486)) ((_ sign_extend 32) (currentBit!1454 thiss!1486))))))

(declare-fun lt!6283 () (_ BitVec 64))

(declare-fun lt!6280 () (_ BitVec 64))

(assert (=> d!1844 (= lt!6281 (bvmul lt!6283 lt!6280))))

(assert (=> d!1844 (or (= lt!6283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6280 (bvsdiv (bvmul lt!6283 lt!6280) lt!6283)))))

(assert (=> d!1844 (= lt!6280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1844 (= lt!6283 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))))))

(assert (=> d!1844 (= lt!6282 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1459 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1454 thiss!1486))))))

(assert (=> d!1844 (invariant!0 (currentBit!1454 thiss!1486) (currentByte!1459 thiss!1486) (size!159 (buf!480 thiss!1486)))))

(assert (=> d!1844 (= (bitIndex!0 (size!159 (buf!480 thiss!1486)) (currentByte!1459 thiss!1486) (currentBit!1454 thiss!1486)) lt!6282)))

(declare-fun b!4935 () Bool)

(declare-fun res!6185 () Bool)

(assert (=> b!4935 (=> (not res!6185) (not e!3178))))

(assert (=> b!4935 (= res!6185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6282))))

(declare-fun b!4936 () Bool)

(declare-fun lt!6279 () (_ BitVec 64))

(assert (=> b!4936 (= e!3178 (bvsle lt!6282 (bvmul lt!6279 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4936 (or (= lt!6279 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6279 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6279)))))

(assert (=> b!4936 (= lt!6279 ((_ sign_extend 32) (size!159 (buf!480 thiss!1486))))))

(assert (= (and d!1844 res!6184) b!4935))

(assert (= (and b!4935 res!6185) b!4936))

(assert (=> d!1844 m!5613))

(assert (=> d!1844 m!5615))

(assert (=> b!4710 d!1844))

(declare-fun d!1846 () Bool)

(declare-fun c!234 () Bool)

(assert (=> d!1846 (= c!234 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3179 () List!59)

(assert (=> d!1846 (= (byteArrayBitContentToList!0 (_2!315 lt!5614) srcBuffer!6 from!367 nBits!460) e!3179)))

(declare-fun b!4937 () Bool)

(assert (=> b!4937 (= e!3179 Nil!56)))

(declare-fun b!4938 () Bool)

(assert (=> b!4938 (= e!3179 (Cons!55 (not (= (bvand ((_ sign_extend 24) (select (arr!549 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!315 lt!5614) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1846 c!234) b!4937))

(assert (= (and d!1846 (not c!234)) b!4938))

(assert (=> b!4938 m!5641))

(declare-fun m!6031 () Bool)

(assert (=> b!4938 m!6031))

(declare-fun m!6033 () Bool)

(assert (=> b!4938 m!6033))

(assert (=> b!4705 d!1846))

(push 1)

(assert (not bm!47))

(assert (not b!4754))

(assert (not b!4786))

(assert (not b!4911))

(assert (not b!4886))

(assert (not d!1802))

(assert (not d!1780))

(assert (not d!1844))

(assert (not d!1838))

(assert (not b!4938))

(assert (not b!4759))

(assert (not b!4756))

(assert (not b!4825))

(assert (not b!4827))

(assert (not b!4758))

(assert (not b!4884))

(assert (not b!4902))

(assert (not b!4828))

(assert (not d!1832))

(assert (not b!4903))

(assert (not d!1786))

(assert (not b!4904))

(assert (not b!4755))

(assert (not b!4885))

(assert (not d!1776))

(assert (not b!4913))

(assert (not d!1806))

(assert (not b!4826))

(assert (not d!1820))

(assert (not b!4753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

