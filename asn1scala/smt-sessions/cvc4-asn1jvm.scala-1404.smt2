; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38620 () Bool)

(assert start!38620)

(declare-fun b!173705 () Bool)

(declare-fun res!143865 () Bool)

(declare-fun e!121228 () Bool)

(assert (=> b!173705 (=> (not res!143865) (not e!121228))))

(declare-datatypes ((array!9354 0))(
  ( (array!9355 (arr!5058 (Array (_ BitVec 32) (_ BitVec 8))) (size!4128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7364 0))(
  ( (BitStream!7365 (buf!4559 array!9354) (currentByte!8658 (_ BitVec 32)) (currentBit!8653 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7364)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-datatypes ((Unit!12455 0))(
  ( (Unit!12456) )
))
(declare-datatypes ((tuple2!14966 0))(
  ( (tuple2!14967 (_1!8125 Unit!12455) (_2!8125 BitStream!7364)) )
))
(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14966)

(assert (=> b!173705 (= res!143865 (= (size!4128 (buf!4559 (_2!8125 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000)))) (size!4128 (buf!4559 thiss!1187))))))

(declare-fun res!143866 () Bool)

(assert (=> start!38620 (=> (not res!143866) (not e!121228))))

(assert (=> start!38620 (= res!143866 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38620 e!121228))

(assert (=> start!38620 true))

(declare-fun e!121227 () Bool)

(declare-fun inv!12 (BitStream!7364) Bool)

(assert (=> start!38620 (and (inv!12 thiss!1187) e!121227)))

(declare-fun b!173706 () Bool)

(declare-fun res!143867 () Bool)

(assert (=> b!173706 (=> (not res!143867) (not e!121228))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173706 (= res!143867 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173707 () Bool)

(declare-fun res!143868 () Bool)

(assert (=> b!173707 (=> (not res!143868) (not e!121228))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173707 (= res!143868 (invariant!0 (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187))))))

(declare-fun b!173708 () Bool)

(declare-fun array_inv!3869 (array!9354) Bool)

(assert (=> b!173708 (= e!121227 (array_inv!3869 (buf!4559 thiss!1187)))))

(declare-fun b!173709 () Bool)

(declare-fun lt!267523 () (_ BitVec 64))

(declare-fun lt!267524 () (_ BitVec 64))

(assert (=> b!173709 (= e!121228 (and (= lt!267524 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!267524 (bvand (bvadd lt!267523 ((_ sign_extend 32) nBits!340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!173709 (= lt!267524 (bvand lt!267523 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173709 (= lt!267523 (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)))))

(assert (= (and start!38620 res!143866) b!173706))

(assert (= (and b!173706 res!143867) b!173707))

(assert (= (and b!173707 res!143868) b!173705))

(assert (= (and b!173705 res!143865) b!173709))

(assert (= start!38620 b!173708))

(declare-fun m!272967 () Bool)

(assert (=> b!173709 m!272967))

(declare-fun m!272969 () Bool)

(assert (=> start!38620 m!272969))

(declare-fun m!272971 () Bool)

(assert (=> b!173707 m!272971))

(declare-fun m!272973 () Bool)

(assert (=> b!173706 m!272973))

(declare-fun m!272975 () Bool)

(assert (=> b!173705 m!272975))

(declare-fun m!272977 () Bool)

(assert (=> b!173708 m!272977))

(push 1)

(assert (not b!173708))

(assert (not start!38620))

(assert (not b!173709))

(assert (not b!173707))

(assert (not b!173705))

(assert (not b!173706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61317 () Bool)

(assert (=> d!61317 (= (invariant!0 (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187))) (and (bvsge (currentBit!8653 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8653 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8658 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187))) (and (= (currentBit!8653 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187)))))))))

(assert (=> b!173707 d!61317))

(declare-fun d!61319 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61319 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15277 () Bool)

(assert (= bs!15277 d!61319))

(declare-fun m!272979 () Bool)

(assert (=> bs!15277 m!272979))

(assert (=> b!173706 d!61319))

(declare-fun d!61323 () Bool)

(assert (=> d!61323 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187))))))

(declare-fun bs!15278 () Bool)

(assert (= bs!15278 d!61323))

(assert (=> bs!15278 m!272971))

(assert (=> start!38620 d!61323))

(declare-fun b!173780 () Bool)

(declare-fun e!121275 () Bool)

(declare-datatypes ((tuple2!14968 0))(
  ( (tuple2!14969 (_1!8126 BitStream!7364) (_2!8126 Bool)) )
))
(declare-fun lt!267776 () tuple2!14968)

(declare-fun lt!267804 () tuple2!14968)

(assert (=> b!173780 (= e!121275 (= (_2!8126 lt!267776) (_2!8126 lt!267804)))))

(declare-fun b!173781 () Bool)

(declare-fun e!121269 () tuple2!14966)

(declare-fun lt!267770 () tuple2!14966)

(assert (=> b!173781 (= e!121269 (tuple2!14967 (_1!8125 lt!267770) (_2!8125 lt!267770)))))

(declare-fun lt!267814 () Bool)

(assert (=> b!173781 (= lt!267814 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!267819 () tuple2!14966)

(declare-fun appendBit!0 (BitStream!7364 Bool) tuple2!14966)

(assert (=> b!173781 (= lt!267819 (appendBit!0 thiss!1187 lt!267814))))

(declare-fun res!143926 () Bool)

(assert (=> b!173781 (= res!143926 (= (size!4128 (buf!4559 thiss!1187)) (size!4128 (buf!4559 (_2!8125 lt!267819)))))))

(declare-fun e!121276 () Bool)

(assert (=> b!173781 (=> (not res!143926) (not e!121276))))

(assert (=> b!173781 e!121276))

(declare-fun lt!267780 () tuple2!14966)

(assert (=> b!173781 (= lt!267780 lt!267819)))

(assert (=> b!173781 (= lt!267770 (appendBitsLSBFirstLoopTR!0 (_2!8125 lt!267780) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!267795 () Unit!12455)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7364 BitStream!7364 BitStream!7364) Unit!12455)

(assert (=> b!173781 (= lt!267795 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8125 lt!267780) (_2!8125 lt!267770)))))

(declare-fun call!2872 () Bool)

(assert (=> b!173781 call!2872))

(declare-fun lt!267787 () Unit!12455)

(assert (=> b!173781 (= lt!267787 lt!267795)))

(assert (=> b!173781 (invariant!0 (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187) (size!4128 (buf!4559 (_2!8125 lt!267780))))))

(declare-fun lt!267800 () BitStream!7364)

(assert (=> b!173781 (= lt!267800 (BitStream!7365 (buf!4559 (_2!8125 lt!267780)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)))))

(assert (=> b!173781 (invariant!0 (currentBit!8653 lt!267800) (currentByte!8658 lt!267800) (size!4128 (buf!4559 (_2!8125 lt!267770))))))

(declare-fun lt!267769 () BitStream!7364)

(assert (=> b!173781 (= lt!267769 (BitStream!7365 (buf!4559 (_2!8125 lt!267770)) (currentByte!8658 lt!267800) (currentBit!8653 lt!267800)))))

(declare-fun readBitPure!0 (BitStream!7364) tuple2!14968)

(assert (=> b!173781 (= lt!267776 (readBitPure!0 lt!267800))))

(assert (=> b!173781 (= lt!267804 (readBitPure!0 lt!267769))))

(declare-fun lt!267793 () Unit!12455)

(declare-fun readBitPrefixLemma!0 (BitStream!7364 BitStream!7364) Unit!12455)

(assert (=> b!173781 (= lt!267793 (readBitPrefixLemma!0 lt!267800 (_2!8125 lt!267770)))))

(declare-fun res!143930 () Bool)

(assert (=> b!173781 (= res!143930 (= (bitIndex!0 (size!4128 (buf!4559 (_1!8126 lt!267776))) (currentByte!8658 (_1!8126 lt!267776)) (currentBit!8653 (_1!8126 lt!267776))) (bitIndex!0 (size!4128 (buf!4559 (_1!8126 lt!267804))) (currentByte!8658 (_1!8126 lt!267804)) (currentBit!8653 (_1!8126 lt!267804)))))))

(assert (=> b!173781 (=> (not res!143930) (not e!121275))))

(assert (=> b!173781 e!121275))

(declare-fun lt!267778 () Unit!12455)

(assert (=> b!173781 (= lt!267778 lt!267793)))

(declare-datatypes ((tuple2!14976 0))(
  ( (tuple2!14977 (_1!8130 BitStream!7364) (_2!8130 BitStream!7364)) )
))
(declare-fun lt!267768 () tuple2!14976)

(declare-fun reader!0 (BitStream!7364 BitStream!7364) tuple2!14976)

(assert (=> b!173781 (= lt!267768 (reader!0 thiss!1187 (_2!8125 lt!267770)))))

(declare-fun lt!267813 () tuple2!14976)

(assert (=> b!173781 (= lt!267813 (reader!0 (_2!8125 lt!267780) (_2!8125 lt!267770)))))

(declare-fun lt!267815 () tuple2!14968)

(assert (=> b!173781 (= lt!267815 (readBitPure!0 (_1!8130 lt!267768)))))

(assert (=> b!173781 (= (_2!8126 lt!267815) lt!267814)))

(declare-fun lt!267818 () Unit!12455)

(declare-fun Unit!12458 () Unit!12455)

(assert (=> b!173781 (= lt!267818 Unit!12458)))

(declare-fun lt!267797 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173781 (= lt!267797 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!267803 () (_ BitVec 64))

(assert (=> b!173781 (= lt!267803 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267781 () Unit!12455)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7364 array!9354 (_ BitVec 64)) Unit!12455)

(assert (=> b!173781 (= lt!267781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4559 (_2!8125 lt!267770)) lt!267803))))

(assert (=> b!173781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 (_2!8125 lt!267770)))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) lt!267803)))

(declare-fun lt!267796 () Unit!12455)

(assert (=> b!173781 (= lt!267796 lt!267781)))

(declare-datatypes ((tuple2!14978 0))(
  ( (tuple2!14979 (_1!8131 BitStream!7364) (_2!8131 (_ BitVec 64))) )
))
(declare-fun lt!267786 () tuple2!14978)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14978)

(assert (=> b!173781 (= lt!267786 (readNBitsLSBFirstsLoopPure!0 (_1!8130 lt!267768) nBits!340 #b00000000000000000000000000000000 lt!267797))))

(declare-fun lt!267783 () (_ BitVec 64))

(assert (=> b!173781 (= lt!267783 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!267802 () Unit!12455)

(assert (=> b!173781 (= lt!267802 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8125 lt!267780) (buf!4559 (_2!8125 lt!267770)) lt!267783))))

(assert (=> b!173781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 (_2!8125 lt!267770)))) ((_ sign_extend 32) (currentByte!8658 (_2!8125 lt!267780))) ((_ sign_extend 32) (currentBit!8653 (_2!8125 lt!267780))) lt!267783)))

(declare-fun lt!267772 () Unit!12455)

(assert (=> b!173781 (= lt!267772 lt!267802)))

(declare-fun lt!267792 () tuple2!14978)

(assert (=> b!173781 (= lt!267792 (readNBitsLSBFirstsLoopPure!0 (_1!8130 lt!267813) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267797 (ite (_2!8126 lt!267815) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!267821 () tuple2!14978)

(assert (=> b!173781 (= lt!267821 (readNBitsLSBFirstsLoopPure!0 (_1!8130 lt!267768) nBits!340 #b00000000000000000000000000000000 lt!267797))))

(declare-fun c!9142 () Bool)

(assert (=> b!173781 (= c!9142 (_2!8126 (readBitPure!0 (_1!8130 lt!267768))))))

(declare-fun lt!267788 () tuple2!14978)

(declare-fun e!121270 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7364 (_ BitVec 64)) BitStream!7364)

(assert (=> b!173781 (= lt!267788 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8130 lt!267768) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267797 e!121270)))))

(declare-fun lt!267816 () Unit!12455)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12455)

(assert (=> b!173781 (= lt!267816 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8130 lt!267768) nBits!340 #b00000000000000000000000000000000 lt!267797))))

(assert (=> b!173781 (and (= (_2!8131 lt!267821) (_2!8131 lt!267788)) (= (_1!8131 lt!267821) (_1!8131 lt!267788)))))

(declare-fun lt!267777 () Unit!12455)

(assert (=> b!173781 (= lt!267777 lt!267816)))

(assert (=> b!173781 (= (_1!8130 lt!267768) (withMovedBitIndex!0 (_2!8130 lt!267768) (bvsub (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)) (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267770))) (currentByte!8658 (_2!8125 lt!267770)) (currentBit!8653 (_2!8125 lt!267770))))))))

(declare-fun lt!267779 () Unit!12455)

(declare-fun Unit!12459 () Unit!12455)

(assert (=> b!173781 (= lt!267779 Unit!12459)))

(assert (=> b!173781 (= (_1!8130 lt!267813) (withMovedBitIndex!0 (_2!8130 lt!267813) (bvsub (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267780))) (currentByte!8658 (_2!8125 lt!267780)) (currentBit!8653 (_2!8125 lt!267780))) (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267770))) (currentByte!8658 (_2!8125 lt!267770)) (currentBit!8653 (_2!8125 lt!267770))))))))

(declare-fun lt!267811 () Unit!12455)

(declare-fun Unit!12460 () Unit!12455)

(assert (=> b!173781 (= lt!267811 Unit!12460)))

(assert (=> b!173781 (= (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)) (bvsub (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267780))) (currentByte!8658 (_2!8125 lt!267780)) (currentBit!8653 (_2!8125 lt!267780))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!267790 () Unit!12455)

(declare-fun Unit!12462 () Unit!12455)

(assert (=> b!173781 (= lt!267790 Unit!12462)))

(assert (=> b!173781 (= (_2!8131 lt!267786) (_2!8131 lt!267792))))

(declare-fun lt!267817 () Unit!12455)

(declare-fun Unit!12463 () Unit!12455)

(assert (=> b!173781 (= lt!267817 Unit!12463)))

(assert (=> b!173781 (invariant!0 (currentBit!8653 (_2!8125 lt!267770)) (currentByte!8658 (_2!8125 lt!267770)) (size!4128 (buf!4559 (_2!8125 lt!267770))))))

(declare-fun lt!267799 () Unit!12455)

(declare-fun Unit!12464 () Unit!12455)

(assert (=> b!173781 (= lt!267799 Unit!12464)))

(assert (=> b!173781 (= (size!4128 (buf!4559 thiss!1187)) (size!4128 (buf!4559 (_2!8125 lt!267770))))))

(declare-fun lt!267812 () Unit!12455)

(declare-fun Unit!12465 () Unit!12455)

(assert (=> b!173781 (= lt!267812 Unit!12465)))

(assert (=> b!173781 (= (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267770))) (currentByte!8658 (_2!8125 lt!267770)) (currentBit!8653 (_2!8125 lt!267770))) (bvsub (bvadd (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!267774 () Unit!12455)

(declare-fun Unit!12466 () Unit!12455)

(assert (=> b!173781 (= lt!267774 Unit!12466)))

(declare-fun lt!267798 () Unit!12455)

(declare-fun Unit!12467 () Unit!12455)

(assert (=> b!173781 (= lt!267798 Unit!12467)))

(declare-fun lt!267805 () tuple2!14976)

(assert (=> b!173781 (= lt!267805 (reader!0 thiss!1187 (_2!8125 lt!267770)))))

(declare-fun lt!267820 () (_ BitVec 64))

(assert (=> b!173781 (= lt!267820 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267775 () Unit!12455)

(assert (=> b!173781 (= lt!267775 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4559 (_2!8125 lt!267770)) lt!267820))))

(assert (=> b!173781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 (_2!8125 lt!267770)))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) lt!267820)))

(declare-fun lt!267808 () Unit!12455)

(assert (=> b!173781 (= lt!267808 lt!267775)))

(declare-fun lt!267806 () tuple2!14978)

(assert (=> b!173781 (= lt!267806 (readNBitsLSBFirstsLoopPure!0 (_1!8130 lt!267805) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143928 () Bool)

(assert (=> b!173781 (= res!143928 (= (_2!8131 lt!267806) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121271 () Bool)

(assert (=> b!173781 (=> (not res!143928) (not e!121271))))

(assert (=> b!173781 e!121271))

(declare-fun lt!267822 () Unit!12455)

(declare-fun Unit!12471 () Unit!12455)

(assert (=> b!173781 (= lt!267822 Unit!12471)))

(declare-fun d!61325 () Bool)

(declare-fun e!121272 () Bool)

(assert (=> d!61325 e!121272))

(declare-fun res!143932 () Bool)

(assert (=> d!61325 (=> (not res!143932) (not e!121272))))

(declare-fun lt!267809 () tuple2!14966)

(assert (=> d!61325 (= res!143932 (invariant!0 (currentBit!8653 (_2!8125 lt!267809)) (currentByte!8658 (_2!8125 lt!267809)) (size!4128 (buf!4559 (_2!8125 lt!267809)))))))

(assert (=> d!61325 (= lt!267809 e!121269)))

(declare-fun c!9141 () Bool)

(assert (=> d!61325 (= c!9141 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61325 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61325 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!267809)))

(declare-fun bm!2869 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7364 BitStream!7364) Bool)

(assert (=> bm!2869 (= call!2872 (isPrefixOf!0 thiss!1187 (ite c!9141 thiss!1187 (_2!8125 lt!267770))))))

(declare-fun b!173782 () Bool)

(declare-fun e!121274 () Bool)

(declare-fun lt!267785 () (_ BitVec 64))

(assert (=> b!173782 (= e!121274 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) lt!267785))))

(declare-fun b!173783 () Bool)

(assert (=> b!173783 (= e!121270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!173784 () Bool)

(declare-fun res!143929 () Bool)

(assert (=> b!173784 (=> (not res!143929) (not e!121272))))

(assert (=> b!173784 (= res!143929 (isPrefixOf!0 thiss!1187 (_2!8125 lt!267809)))))

(declare-fun b!173785 () Bool)

(declare-fun e!121273 () Bool)

(declare-fun lt!267771 () tuple2!14978)

(declare-fun lt!267767 () tuple2!14976)

(assert (=> b!173785 (= e!121273 (= (_1!8131 lt!267771) (_2!8130 lt!267767)))))

(declare-fun b!173786 () Bool)

(declare-fun res!143923 () Bool)

(assert (=> b!173786 (= res!143923 (= (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267819))) (currentByte!8658 (_2!8125 lt!267819)) (currentBit!8653 (_2!8125 lt!267819))) (bvadd (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!173786 (=> (not res!143923) (not e!121276))))

(declare-fun b!173787 () Bool)

(declare-fun Unit!12478 () Unit!12455)

(assert (=> b!173787 (= e!121269 (tuple2!14967 Unit!12478 thiss!1187))))

(declare-fun lt!267810 () Unit!12455)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7364) Unit!12455)

(assert (=> b!173787 (= lt!267810 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!173787 call!2872))

(declare-fun lt!267794 () Unit!12455)

(assert (=> b!173787 (= lt!267794 lt!267810)))

(declare-fun b!173788 () Bool)

(declare-fun e!121268 () Bool)

(declare-fun lt!267807 () tuple2!14968)

(assert (=> b!173788 (= e!121268 (= (bitIndex!0 (size!4128 (buf!4559 (_1!8126 lt!267807))) (currentByte!8658 (_1!8126 lt!267807)) (currentBit!8653 (_1!8126 lt!267807))) (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267819))) (currentByte!8658 (_2!8125 lt!267819)) (currentBit!8653 (_2!8125 lt!267819)))))))

(declare-fun b!173789 () Bool)

(declare-fun res!143927 () Bool)

(assert (=> b!173789 (= res!143927 (isPrefixOf!0 thiss!1187 (_2!8125 lt!267819)))))

(assert (=> b!173789 (=> (not res!143927) (not e!121276))))

(declare-fun b!173790 () Bool)

(declare-fun res!143931 () Bool)

(assert (=> b!173790 (=> (not res!143931) (not e!121272))))

(assert (=> b!173790 (= res!143931 (= (size!4128 (buf!4559 thiss!1187)) (size!4128 (buf!4559 (_2!8125 lt!267809)))))))

(declare-fun b!173791 () Bool)

(assert (=> b!173791 (= e!121272 e!121273)))

(declare-fun res!143924 () Bool)

(assert (=> b!173791 (=> (not res!143924) (not e!121273))))

(assert (=> b!173791 (= res!143924 (= (_2!8131 lt!267771) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173791 (= lt!267771 (readNBitsLSBFirstsLoopPure!0 (_1!8130 lt!267767) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!267791 () Unit!12455)

(declare-fun lt!267789 () Unit!12455)

(assert (=> b!173791 (= lt!267791 lt!267789)))

(assert (=> b!173791 (validate_offset_bits!1 ((_ sign_extend 32) (size!4128 (buf!4559 (_2!8125 lt!267809)))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187)) lt!267785)))

(assert (=> b!173791 (= lt!267789 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4559 (_2!8125 lt!267809)) lt!267785))))

(assert (=> b!173791 e!121274))

(declare-fun res!143933 () Bool)

(assert (=> b!173791 (=> (not res!143933) (not e!121274))))

(assert (=> b!173791 (= res!143933 (and (= (size!4128 (buf!4559 thiss!1187)) (size!4128 (buf!4559 (_2!8125 lt!267809)))) (bvsge lt!267785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173791 (= lt!267785 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173791 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!173791 (= lt!267767 (reader!0 thiss!1187 (_2!8125 lt!267809)))))

(declare-fun b!173792 () Bool)

(declare-fun readerFrom!0 (BitStream!7364 (_ BitVec 32) (_ BitVec 32)) BitStream!7364)

(assert (=> b!173792 (= lt!267807 (readBitPure!0 (readerFrom!0 (_2!8125 lt!267819) (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187))))))

(declare-fun res!143925 () Bool)

(assert (=> b!173792 (= res!143925 (and (= (_2!8126 lt!267807) lt!267814) (= (_1!8126 lt!267807) (_2!8125 lt!267819))))))

(assert (=> b!173792 (=> (not res!143925) (not e!121268))))

(assert (=> b!173792 (= e!121276 e!121268)))

(declare-fun b!173793 () Bool)

(declare-fun res!143934 () Bool)

(assert (=> b!173793 (=> (not res!143934) (not e!121272))))

(declare-fun lt!267782 () (_ BitVec 64))

(declare-fun lt!267773 () (_ BitVec 64))

(assert (=> b!173793 (= res!143934 (= (bitIndex!0 (size!4128 (buf!4559 (_2!8125 lt!267809))) (currentByte!8658 (_2!8125 lt!267809)) (currentBit!8653 (_2!8125 lt!267809))) (bvsub lt!267773 lt!267782)))))

(assert (=> b!173793 (or (= (bvand lt!267773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267773 lt!267782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173793 (= lt!267782 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!267784 () (_ BitVec 64))

(declare-fun lt!267801 () (_ BitVec 64))

(assert (=> b!173793 (= lt!267773 (bvadd lt!267784 lt!267801))))

(assert (=> b!173793 (or (not (= (bvand lt!267784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267801 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!267784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!267784 lt!267801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173793 (= lt!267801 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173793 (= lt!267784 (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)))))

(declare-fun b!173794 () Bool)

(assert (=> b!173794 (= e!121271 (= (_1!8131 lt!267806) (_2!8130 lt!267805)))))

(declare-fun b!173795 () Bool)

(assert (=> b!173795 (= e!121270 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (= (and d!61325 c!9141) b!173787))

(assert (= (and d!61325 (not c!9141)) b!173781))

(assert (= (and b!173781 res!143926) b!173786))

(assert (= (and b!173786 res!143923) b!173789))

(assert (= (and b!173789 res!143927) b!173792))

(assert (= (and b!173792 res!143925) b!173788))

(assert (= (and b!173781 res!143930) b!173780))

(assert (= (and b!173781 c!9142) b!173795))

(assert (= (and b!173781 (not c!9142)) b!173783))

(assert (= (and b!173781 res!143928) b!173794))

(assert (= (or b!173787 b!173781) bm!2869))

(assert (= (and d!61325 res!143932) b!173790))

(assert (= (and b!173790 res!143931) b!173793))

(assert (= (and b!173793 res!143934) b!173784))

(assert (= (and b!173784 res!143929) b!173791))

(assert (= (and b!173791 res!143933) b!173782))

(assert (= (and b!173791 res!143924) b!173785))

(declare-fun m!272983 () Bool)

(assert (=> b!173793 m!272983))

(assert (=> b!173793 m!272967))

(declare-fun m!272985 () Bool)

(assert (=> b!173781 m!272985))

(declare-fun m!272987 () Bool)

(assert (=> b!173781 m!272987))

(declare-fun m!272989 () Bool)

(assert (=> b!173781 m!272989))

(declare-fun m!272991 () Bool)

(assert (=> b!173781 m!272991))

(declare-fun m!272993 () Bool)

(assert (=> b!173781 m!272993))

(declare-fun m!272995 () Bool)

(assert (=> b!173781 m!272995))

(declare-fun m!272997 () Bool)

(assert (=> b!173781 m!272997))

(declare-fun m!272999 () Bool)

(assert (=> b!173781 m!272999))

(declare-fun m!273001 () Bool)

(assert (=> b!173781 m!273001))

(declare-fun m!273003 () Bool)

(assert (=> b!173781 m!273003))

(declare-fun m!273005 () Bool)

(assert (=> b!173781 m!273005))

(declare-fun m!273007 () Bool)

(assert (=> b!173781 m!273007))

(declare-fun m!273009 () Bool)

(assert (=> b!173781 m!273009))

(declare-fun m!273011 () Bool)

(assert (=> b!173781 m!273011))

(declare-fun m!273013 () Bool)

(assert (=> b!173781 m!273013))

(declare-fun m!273015 () Bool)

(assert (=> b!173781 m!273015))

(declare-fun m!273017 () Bool)

(assert (=> b!173781 m!273017))

(assert (=> b!173781 m!272967))

(declare-fun m!273019 () Bool)

(assert (=> b!173781 m!273019))

(declare-fun m!273021 () Bool)

(assert (=> b!173781 m!273021))

(declare-fun m!273023 () Bool)

(assert (=> b!173781 m!273023))

(declare-fun m!273025 () Bool)

(assert (=> b!173781 m!273025))

(assert (=> b!173781 m!272991))

(declare-fun m!273027 () Bool)

(assert (=> b!173781 m!273027))

(declare-fun m!273029 () Bool)

(assert (=> b!173781 m!273029))

(declare-fun m!273031 () Bool)

(assert (=> b!173781 m!273031))

(declare-fun m!273033 () Bool)

(assert (=> b!173781 m!273033))

(declare-fun m!273035 () Bool)

(assert (=> b!173781 m!273035))

(declare-fun m!273037 () Bool)

(assert (=> b!173781 m!273037))

(declare-fun m!273039 () Bool)

(assert (=> b!173781 m!273039))

(declare-fun m!273041 () Bool)

(assert (=> b!173781 m!273041))

(declare-fun m!273043 () Bool)

(assert (=> b!173781 m!273043))

(declare-fun m!273045 () Bool)

(assert (=> b!173781 m!273045))

(declare-fun m!273047 () Bool)

(assert (=> b!173781 m!273047))

(declare-fun m!273049 () Bool)

(assert (=> b!173791 m!273049))

(declare-fun m!273051 () Bool)

(assert (=> b!173791 m!273051))

(assert (=> b!173791 m!273019))

(declare-fun m!273053 () Bool)

(assert (=> b!173791 m!273053))

(assert (=> b!173791 m!273023))

(declare-fun m!273055 () Bool)

(assert (=> b!173791 m!273055))

(declare-fun m!273057 () Bool)

(assert (=> b!173784 m!273057))

(declare-fun m!273059 () Bool)

(assert (=> b!173788 m!273059))

(declare-fun m!273061 () Bool)

(assert (=> b!173788 m!273061))

(declare-fun m!273063 () Bool)

(assert (=> bm!2869 m!273063))

(declare-fun m!273065 () Bool)

(assert (=> b!173782 m!273065))

(declare-fun m!273067 () Bool)

(assert (=> d!61325 m!273067))

(declare-fun m!273069 () Bool)

(assert (=> b!173787 m!273069))

(declare-fun m!273071 () Bool)

(assert (=> b!173792 m!273071))

(assert (=> b!173792 m!273071))

(declare-fun m!273073 () Bool)

(assert (=> b!173792 m!273073))

(assert (=> b!173786 m!273061))

(assert (=> b!173786 m!272967))

(declare-fun m!273075 () Bool)

(assert (=> b!173789 m!273075))

(assert (=> b!173705 d!61325))

(declare-fun d!61331 () Bool)

(assert (=> d!61331 (= (array_inv!3869 (buf!4559 thiss!1187)) (bvsge (size!4128 (buf!4559 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173708 d!61331))

(declare-fun d!61333 () Bool)

(declare-fun e!121288 () Bool)

(assert (=> d!61333 e!121288))

(declare-fun res!143952 () Bool)

(assert (=> d!61333 (=> (not res!143952) (not e!121288))))

(declare-fun lt!267892 () (_ BitVec 64))

(declare-fun lt!267895 () (_ BitVec 64))

(declare-fun lt!267891 () (_ BitVec 64))

(assert (=> d!61333 (= res!143952 (= lt!267892 (bvsub lt!267891 lt!267895)))))

(assert (=> d!61333 (or (= (bvand lt!267891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267891 lt!267895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61333 (= lt!267895 (remainingBits!0 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))) ((_ sign_extend 32) (currentByte!8658 thiss!1187)) ((_ sign_extend 32) (currentBit!8653 thiss!1187))))))

(declare-fun lt!267896 () (_ BitVec 64))

(declare-fun lt!267894 () (_ BitVec 64))

(assert (=> d!61333 (= lt!267891 (bvmul lt!267896 lt!267894))))

(assert (=> d!61333 (or (= lt!267896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!267894 (bvsdiv (bvmul lt!267896 lt!267894) lt!267896)))))

(assert (=> d!61333 (= lt!267894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61333 (= lt!267896 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))))))

(assert (=> d!61333 (= lt!267892 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8658 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8653 thiss!1187))))))

(assert (=> d!61333 (invariant!0 (currentBit!8653 thiss!1187) (currentByte!8658 thiss!1187) (size!4128 (buf!4559 thiss!1187)))))

(assert (=> d!61333 (= (bitIndex!0 (size!4128 (buf!4559 thiss!1187)) (currentByte!8658 thiss!1187) (currentBit!8653 thiss!1187)) lt!267892)))

(declare-fun b!173816 () Bool)

(declare-fun res!143951 () Bool)

(assert (=> b!173816 (=> (not res!143951) (not e!121288))))

(assert (=> b!173816 (= res!143951 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!267892))))

(declare-fun b!173817 () Bool)

(declare-fun lt!267893 () (_ BitVec 64))

(assert (=> b!173817 (= e!121288 (bvsle lt!267892 (bvmul lt!267893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173817 (or (= lt!267893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!267893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!267893)))))

(assert (=> b!173817 (= lt!267893 ((_ sign_extend 32) (size!4128 (buf!4559 thiss!1187))))))

(assert (= (and d!61333 res!143952) b!173816))

(assert (= (and b!173816 res!143951) b!173817))

(assert (=> d!61333 m!272979))

(assert (=> d!61333 m!272971))

(assert (=> b!173709 d!61333))

(push 1)

(assert (not b!173787))

(assert (not b!173791))

(assert (not b!173786))

(assert (not d!61333))

(assert (not b!173788))

(assert (not b!173784))

(assert (not b!173793))

(assert (not d!61323))

(assert (not b!173781))

(assert (not bm!2869))

(assert (not b!173782))

(assert (not d!61319))

(assert (not b!173792))

(assert (not b!173789))

(assert (not d!61325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

