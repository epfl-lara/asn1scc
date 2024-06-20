; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21114 () Bool)

(assert start!21114)

(declare-fun b!106472 () Bool)

(declare-fun res!87710 () Bool)

(declare-fun e!69711 () Bool)

(assert (=> b!106472 (=> (not res!87710) (not e!69711))))

(declare-datatypes ((array!4903 0))(
  ( (array!4904 (arr!2827 (Array (_ BitVec 32) (_ BitVec 8))) (size!2234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3942 0))(
  ( (BitStream!3943 (buf!2613 array!4903) (currentByte!5125 (_ BitVec 32)) (currentBit!5120 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3942)

(declare-datatypes ((Unit!6522 0))(
  ( (Unit!6523) )
))
(declare-datatypes ((tuple2!8760 0))(
  ( (tuple2!8761 (_1!4637 Unit!6522) (_2!4637 BitStream!3942)) )
))
(declare-fun lt!158229 () tuple2!8760)

(declare-fun isPrefixOf!0 (BitStream!3942 BitStream!3942) Bool)

(assert (=> b!106472 (= res!87710 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158229)))))

(declare-fun b!106473 () Bool)

(declare-fun e!69703 () Bool)

(declare-datatypes ((tuple2!8762 0))(
  ( (tuple2!8763 (_1!4638 BitStream!3942) (_2!4638 Bool)) )
))
(declare-fun lt!158226 () tuple2!8762)

(declare-fun lt!158228 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106473 (= e!69703 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158226))) (currentByte!5125 (_1!4638 lt!158226)) (currentBit!5120 (_1!4638 lt!158226))) lt!158228))))

(declare-datatypes ((tuple2!8764 0))(
  ( (tuple2!8765 (_1!4639 BitStream!3942) (_2!4639 BitStream!3942)) )
))
(declare-fun lt!158234 () tuple2!8764)

(declare-fun e!69706 () Bool)

(declare-fun b!106474 () Bool)

(declare-fun lt!158250 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!3942 (_ BitVec 64)) Bool)

(assert (=> b!106474 (= e!69706 (moveBitIndexPrecond!0 (_2!4639 lt!158234) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!158250)))))

(declare-fun lt!158245 () tuple2!8764)

(declare-fun lt!158231 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3942 (_ BitVec 64)) BitStream!3942)

(assert (=> b!106474 (= (_1!4639 lt!158245) (withMovedBitIndex!0 (_2!4639 lt!158245) (bvsub lt!158231 lt!158250)))))

(declare-fun lt!158247 () tuple2!8760)

(assert (=> b!106474 (= lt!158250 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158247))) (currentByte!5125 (_2!4637 lt!158247)) (currentBit!5120 (_2!4637 lt!158247))))))

(assert (=> b!106474 (= lt!158231 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-datatypes ((tuple2!8766 0))(
  ( (tuple2!8767 (_1!4640 BitStream!3942) (_2!4640 (_ BitVec 64))) )
))
(declare-fun lt!158244 () tuple2!8766)

(declare-fun lt!158230 () tuple2!8766)

(assert (=> b!106474 (and (= (_2!4640 lt!158244) (_2!4640 lt!158230)) (= (_1!4640 lt!158244) (_1!4640 lt!158230)))))

(declare-fun lt!158237 () (_ BitVec 64))

(declare-fun lt!158232 () Unit!6522)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6522)

(assert (=> b!106474 (= lt!158232 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237))))

(declare-fun lt!158238 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8766)

(assert (=> b!106474 (= lt!158230 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238))))

(declare-fun b!106475 () Bool)

(declare-fun e!69709 () Bool)

(declare-fun e!69702 () Bool)

(assert (=> b!106475 (= e!69709 e!69702)))

(declare-fun res!87705 () Bool)

(assert (=> b!106475 (=> (not res!87705) (not e!69702))))

(declare-fun lt!158248 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106475 (= res!87705 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)) lt!158248))))

(assert (=> b!106475 (= lt!158248 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106476 () Bool)

(declare-fun res!87703 () Bool)

(assert (=> b!106476 (=> (not res!87703) (not e!69702))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106476 (= res!87703 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106477 () Bool)

(declare-fun e!69704 () Bool)

(declare-fun lt!158235 () tuple2!8762)

(declare-fun lt!158225 () tuple2!8762)

(assert (=> b!106477 (= e!69704 (= (_2!4638 lt!158235) (_2!4638 lt!158225)))))

(declare-fun b!106478 () Bool)

(assert (=> b!106478 (= e!69702 (not e!69706))))

(declare-fun res!87709 () Bool)

(assert (=> b!106478 (=> res!87709 e!69706)))

(assert (=> b!106478 (= res!87709 (not (= (_1!4640 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!158234) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238)) (_2!4639 lt!158234))))))

(declare-fun lt!158241 () (_ BitVec 64))

(assert (=> b!106478 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!158241)))

(declare-fun lt!158246 () Unit!6522)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3942 array!4903 (_ BitVec 64)) Unit!6522)

(assert (=> b!106478 (= lt!158246 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4637 lt!158229) (buf!2613 (_2!4637 lt!158247)) lt!158241))))

(assert (=> b!106478 (= lt!158241 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!158236 () tuple2!8762)

(declare-fun lt!158249 () (_ BitVec 64))

(assert (=> b!106478 (= lt!158238 (bvor lt!158237 (ite (_2!4638 lt!158236) lt!158249 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106478 (= lt!158244 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237))))

(assert (=> b!106478 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)) lt!158248)))

(declare-fun lt!158243 () Unit!6522)

(assert (=> b!106478 (= lt!158243 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2613 (_2!4637 lt!158247)) lt!158248))))

(assert (=> b!106478 (= lt!158237 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!158233 () Bool)

(assert (=> b!106478 (= (_2!4638 lt!158236) lt!158233)))

(declare-fun readBitPure!0 (BitStream!3942) tuple2!8762)

(assert (=> b!106478 (= lt!158236 (readBitPure!0 (_1!4639 lt!158245)))))

(declare-fun reader!0 (BitStream!3942 BitStream!3942) tuple2!8764)

(assert (=> b!106478 (= lt!158234 (reader!0 (_2!4637 lt!158229) (_2!4637 lt!158247)))))

(assert (=> b!106478 (= lt!158245 (reader!0 thiss!1305 (_2!4637 lt!158247)))))

(assert (=> b!106478 e!69704))

(declare-fun res!87708 () Bool)

(assert (=> b!106478 (=> (not res!87708) (not e!69704))))

(assert (=> b!106478 (= res!87708 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158235))) (currentByte!5125 (_1!4638 lt!158235)) (currentBit!5120 (_1!4638 lt!158235))) (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158225))) (currentByte!5125 (_1!4638 lt!158225)) (currentBit!5120 (_1!4638 lt!158225)))))))

(declare-fun lt!158227 () Unit!6522)

(declare-fun lt!158240 () BitStream!3942)

(declare-fun readBitPrefixLemma!0 (BitStream!3942 BitStream!3942) Unit!6522)

(assert (=> b!106478 (= lt!158227 (readBitPrefixLemma!0 lt!158240 (_2!4637 lt!158247)))))

(assert (=> b!106478 (= lt!158225 (readBitPure!0 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))))))

(assert (=> b!106478 (= lt!158235 (readBitPure!0 lt!158240))))

(assert (=> b!106478 (= lt!158240 (BitStream!3943 (buf!2613 (_2!4637 lt!158229)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun e!69705 () Bool)

(assert (=> b!106478 e!69705))

(declare-fun res!87714 () Bool)

(assert (=> b!106478 (=> (not res!87714) (not e!69705))))

(assert (=> b!106478 (= res!87714 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158247)))))

(declare-fun lt!158239 () Unit!6522)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3942 BitStream!3942 BitStream!3942) Unit!6522)

(assert (=> b!106478 (= lt!158239 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4637 lt!158229) (_2!4637 lt!158247)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8760)

(assert (=> b!106478 (= lt!158247 (appendNLeastSignificantBitsLoop!0 (_2!4637 lt!158229) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69710 () Bool)

(assert (=> b!106478 e!69710))

(declare-fun res!87713 () Bool)

(assert (=> b!106478 (=> (not res!87713) (not e!69710))))

(assert (=> b!106478 (= res!87713 (= (size!2234 (buf!2613 thiss!1305)) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(declare-fun appendBit!0 (BitStream!3942 Bool) tuple2!8760)

(assert (=> b!106478 (= lt!158229 (appendBit!0 thiss!1305 lt!158233))))

(assert (=> b!106478 (= lt!158233 (not (= (bvand v!199 lt!158249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106478 (= lt!158249 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106479 () Bool)

(assert (=> b!106479 (= e!69711 e!69703)))

(declare-fun res!87707 () Bool)

(assert (=> b!106479 (=> (not res!87707) (not e!69703))))

(assert (=> b!106479 (= res!87707 (and (= (_2!4638 lt!158226) lt!158233) (= (_1!4638 lt!158226) (_2!4637 lt!158229))))))

(declare-fun readerFrom!0 (BitStream!3942 (_ BitVec 32) (_ BitVec 32)) BitStream!3942)

(assert (=> b!106479 (= lt!158226 (readBitPure!0 (readerFrom!0 (_2!4637 lt!158229) (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305))))))

(declare-fun b!106480 () Bool)

(declare-fun res!87704 () Bool)

(assert (=> b!106480 (=> (not res!87704) (not e!69705))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106480 (= res!87704 (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(declare-fun res!87712 () Bool)

(assert (=> start!21114 (=> (not res!87712) (not e!69709))))

(assert (=> start!21114 (= res!87712 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21114 e!69709))

(assert (=> start!21114 true))

(declare-fun e!69707 () Bool)

(declare-fun inv!12 (BitStream!3942) Bool)

(assert (=> start!21114 (and (inv!12 thiss!1305) e!69707)))

(declare-fun b!106481 () Bool)

(declare-fun res!87706 () Bool)

(assert (=> b!106481 (=> (not res!87706) (not e!69702))))

(assert (=> b!106481 (= res!87706 (bvslt i!615 nBits!396))))

(declare-fun b!106482 () Bool)

(assert (=> b!106482 (= e!69710 e!69711)))

(declare-fun res!87711 () Bool)

(assert (=> b!106482 (=> (not res!87711) (not e!69711))))

(declare-fun lt!158242 () (_ BitVec 64))

(assert (=> b!106482 (= res!87711 (= lt!158228 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!158242)))))

(assert (=> b!106482 (= lt!158228 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(assert (=> b!106482 (= lt!158242 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun b!106483 () Bool)

(declare-fun array_inv!2036 (array!4903) Bool)

(assert (=> b!106483 (= e!69707 (array_inv!2036 (buf!2613 thiss!1305)))))

(declare-fun b!106484 () Bool)

(assert (=> b!106484 (= e!69705 (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158247)))))))

(assert (= (and start!21114 res!87712) b!106475))

(assert (= (and b!106475 res!87705) b!106476))

(assert (= (and b!106476 res!87703) b!106481))

(assert (= (and b!106481 res!87706) b!106478))

(assert (= (and b!106478 res!87713) b!106482))

(assert (= (and b!106482 res!87711) b!106472))

(assert (= (and b!106472 res!87710) b!106479))

(assert (= (and b!106479 res!87707) b!106473))

(assert (= (and b!106478 res!87714) b!106480))

(assert (= (and b!106480 res!87704) b!106484))

(assert (= (and b!106478 res!87708) b!106477))

(assert (= (and b!106478 (not res!87709)) b!106474))

(assert (= start!21114 b!106483))

(declare-fun m!156809 () Bool)

(assert (=> b!106473 m!156809))

(declare-fun m!156811 () Bool)

(assert (=> b!106484 m!156811))

(declare-fun m!156813 () Bool)

(assert (=> b!106480 m!156813))

(declare-fun m!156815 () Bool)

(assert (=> b!106479 m!156815))

(assert (=> b!106479 m!156815))

(declare-fun m!156817 () Bool)

(assert (=> b!106479 m!156817))

(declare-fun m!156819 () Bool)

(assert (=> start!21114 m!156819))

(declare-fun m!156821 () Bool)

(assert (=> b!106475 m!156821))

(declare-fun m!156823 () Bool)

(assert (=> b!106474 m!156823))

(declare-fun m!156825 () Bool)

(assert (=> b!106474 m!156825))

(assert (=> b!106474 m!156823))

(declare-fun m!156827 () Bool)

(assert (=> b!106474 m!156827))

(declare-fun m!156829 () Bool)

(assert (=> b!106474 m!156829))

(declare-fun m!156831 () Bool)

(assert (=> b!106474 m!156831))

(declare-fun m!156833 () Bool)

(assert (=> b!106474 m!156833))

(declare-fun m!156835 () Bool)

(assert (=> b!106474 m!156835))

(declare-fun m!156837 () Bool)

(assert (=> b!106474 m!156837))

(declare-fun m!156839 () Bool)

(assert (=> b!106476 m!156839))

(declare-fun m!156841 () Bool)

(assert (=> b!106483 m!156841))

(declare-fun m!156843 () Bool)

(assert (=> b!106478 m!156843))

(declare-fun m!156845 () Bool)

(assert (=> b!106478 m!156845))

(declare-fun m!156847 () Bool)

(assert (=> b!106478 m!156847))

(declare-fun m!156849 () Bool)

(assert (=> b!106478 m!156849))

(declare-fun m!156851 () Bool)

(assert (=> b!106478 m!156851))

(declare-fun m!156853 () Bool)

(assert (=> b!106478 m!156853))

(declare-fun m!156855 () Bool)

(assert (=> b!106478 m!156855))

(declare-fun m!156857 () Bool)

(assert (=> b!106478 m!156857))

(declare-fun m!156859 () Bool)

(assert (=> b!106478 m!156859))

(declare-fun m!156861 () Bool)

(assert (=> b!106478 m!156861))

(declare-fun m!156863 () Bool)

(assert (=> b!106478 m!156863))

(declare-fun m!156865 () Bool)

(assert (=> b!106478 m!156865))

(declare-fun m!156867 () Bool)

(assert (=> b!106478 m!156867))

(declare-fun m!156869 () Bool)

(assert (=> b!106478 m!156869))

(declare-fun m!156871 () Bool)

(assert (=> b!106478 m!156871))

(declare-fun m!156873 () Bool)

(assert (=> b!106478 m!156873))

(declare-fun m!156875 () Bool)

(assert (=> b!106478 m!156875))

(declare-fun m!156877 () Bool)

(assert (=> b!106478 m!156877))

(declare-fun m!156879 () Bool)

(assert (=> b!106478 m!156879))

(assert (=> b!106482 m!156829))

(assert (=> b!106482 m!156827))

(declare-fun m!156881 () Bool)

(assert (=> b!106472 m!156881))

(check-sat (not b!106472) (not b!106480) (not b!106474) (not b!106473) (not b!106479) (not b!106478) (not b!106484) (not b!106482) (not b!106483) (not b!106476) (not b!106475) (not start!21114))
(check-sat)
(get-model)

(declare-fun d!33628 () Bool)

(assert (=> d!33628 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 thiss!1305))))))

(declare-fun bs!8211 () Bool)

(assert (= bs!8211 d!33628))

(declare-fun m!157309 () Bool)

(assert (=> bs!8211 m!157309))

(assert (=> start!21114 d!33628))

(declare-fun d!33630 () Bool)

(assert (=> d!33630 (= (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158229)))) (and (bvsge (currentBit!5120 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5120 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5125 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158229)))) (and (= (currentBit!5120 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158229))))))))))

(assert (=> b!106480 d!33630))

(declare-fun d!33632 () Bool)

(assert (=> d!33632 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!106478 d!33632))

(declare-fun d!33634 () Bool)

(declare-fun e!69849 () Bool)

(assert (=> d!33634 e!69849))

(declare-fun res!87911 () Bool)

(assert (=> d!33634 (=> (not res!87911) (not e!69849))))

(declare-fun lt!158911 () (_ BitVec 64))

(declare-fun lt!158913 () (_ BitVec 64))

(declare-fun lt!158910 () (_ BitVec 64))

(assert (=> d!33634 (= res!87911 (= lt!158910 (bvsub lt!158913 lt!158911)))))

(assert (=> d!33634 (or (= (bvand lt!158913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158913 lt!158911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33634 (= lt!158911 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158235)))) ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158235))) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158235)))))))

(declare-fun lt!158914 () (_ BitVec 64))

(declare-fun lt!158912 () (_ BitVec 64))

(assert (=> d!33634 (= lt!158913 (bvmul lt!158914 lt!158912))))

(assert (=> d!33634 (or (= lt!158914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158912 (bvsdiv (bvmul lt!158914 lt!158912) lt!158914)))))

(assert (=> d!33634 (= lt!158912 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33634 (= lt!158914 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158235)))))))

(assert (=> d!33634 (= lt!158910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158235))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158235)))))))

(assert (=> d!33634 (invariant!0 (currentBit!5120 (_1!4638 lt!158235)) (currentByte!5125 (_1!4638 lt!158235)) (size!2234 (buf!2613 (_1!4638 lt!158235))))))

(assert (=> d!33634 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158235))) (currentByte!5125 (_1!4638 lt!158235)) (currentBit!5120 (_1!4638 lt!158235))) lt!158910)))

(declare-fun b!106721 () Bool)

(declare-fun res!87910 () Bool)

(assert (=> b!106721 (=> (not res!87910) (not e!69849))))

(assert (=> b!106721 (= res!87910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158910))))

(declare-fun b!106722 () Bool)

(declare-fun lt!158909 () (_ BitVec 64))

(assert (=> b!106722 (= e!69849 (bvsle lt!158910 (bvmul lt!158909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106722 (or (= lt!158909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158909)))))

(assert (=> b!106722 (= lt!158909 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158235)))))))

(assert (= (and d!33634 res!87911) b!106721))

(assert (= (and b!106721 res!87910) b!106722))

(declare-fun m!157311 () Bool)

(assert (=> d!33634 m!157311))

(declare-fun m!157313 () Bool)

(assert (=> d!33634 m!157313))

(assert (=> b!106478 d!33634))

(declare-fun d!33636 () Bool)

(declare-datatypes ((tuple2!8784 0))(
  ( (tuple2!8785 (_1!4649 Bool) (_2!4649 BitStream!3942)) )
))
(declare-fun lt!158917 () tuple2!8784)

(declare-fun readBit!0 (BitStream!3942) tuple2!8784)

(assert (=> d!33636 (= lt!158917 (readBit!0 (_1!4639 lt!158245)))))

(assert (=> d!33636 (= (readBitPure!0 (_1!4639 lt!158245)) (tuple2!8763 (_2!4649 lt!158917) (_1!4649 lt!158917)))))

(declare-fun bs!8212 () Bool)

(assert (= bs!8212 d!33636))

(declare-fun m!157315 () Bool)

(assert (=> bs!8212 m!157315))

(assert (=> b!106478 d!33636))

(declare-fun b!106757 () Bool)

(declare-fun e!69867 () Bool)

(declare-fun lt!158991 () tuple2!8762)

(declare-fun lt!158993 () tuple2!8760)

(assert (=> b!106757 (= e!69867 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158991))) (currentByte!5125 (_1!4638 lt!158991)) (currentBit!5120 (_1!4638 lt!158991))) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158993))) (currentByte!5125 (_2!4637 lt!158993)) (currentBit!5120 (_2!4637 lt!158993)))))))

(declare-fun b!106754 () Bool)

(declare-fun res!87942 () Bool)

(declare-fun e!69866 () Bool)

(assert (=> b!106754 (=> (not res!87942) (not e!69866))))

(declare-fun lt!158990 () (_ BitVec 64))

(declare-fun lt!158992 () (_ BitVec 64))

(assert (=> b!106754 (= res!87942 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158993))) (currentByte!5125 (_2!4637 lt!158993)) (currentBit!5120 (_2!4637 lt!158993))) (bvadd lt!158992 lt!158990)))))

(assert (=> b!106754 (or (not (= (bvand lt!158992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158990 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158992 lt!158990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106754 (= lt!158990 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!106754 (= lt!158992 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun d!33638 () Bool)

(assert (=> d!33638 e!69866))

(declare-fun res!87939 () Bool)

(assert (=> d!33638 (=> (not res!87939) (not e!69866))))

(assert (=> d!33638 (= res!87939 (= (size!2234 (buf!2613 thiss!1305)) (size!2234 (buf!2613 (_2!4637 lt!158993)))))))

(declare-fun choose!16 (BitStream!3942 Bool) tuple2!8760)

(assert (=> d!33638 (= lt!158993 (choose!16 thiss!1305 lt!158233))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33638 (validate_offset_bit!0 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)))))

(assert (=> d!33638 (= (appendBit!0 thiss!1305 lt!158233) lt!158993)))

(declare-fun b!106756 () Bool)

(assert (=> b!106756 (= e!69866 e!69867)))

(declare-fun res!87941 () Bool)

(assert (=> b!106756 (=> (not res!87941) (not e!69867))))

(assert (=> b!106756 (= res!87941 (and (= (_2!4638 lt!158991) lt!158233) (= (_1!4638 lt!158991) (_2!4637 lt!158993))))))

(assert (=> b!106756 (= lt!158991 (readBitPure!0 (readerFrom!0 (_2!4637 lt!158993) (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305))))))

(declare-fun b!106755 () Bool)

(declare-fun res!87940 () Bool)

(assert (=> b!106755 (=> (not res!87940) (not e!69866))))

(assert (=> b!106755 (= res!87940 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158993)))))

(assert (= (and d!33638 res!87939) b!106754))

(assert (= (and b!106754 res!87942) b!106755))

(assert (= (and b!106755 res!87940) b!106756))

(assert (= (and b!106756 res!87941) b!106757))

(declare-fun m!157413 () Bool)

(assert (=> b!106756 m!157413))

(assert (=> b!106756 m!157413))

(declare-fun m!157415 () Bool)

(assert (=> b!106756 m!157415))

(declare-fun m!157417 () Bool)

(assert (=> d!33638 m!157417))

(declare-fun m!157419 () Bool)

(assert (=> d!33638 m!157419))

(declare-fun m!157421 () Bool)

(assert (=> b!106757 m!157421))

(declare-fun m!157423 () Bool)

(assert (=> b!106757 m!157423))

(assert (=> b!106754 m!157423))

(assert (=> b!106754 m!156827))

(declare-fun m!157425 () Bool)

(assert (=> b!106755 m!157425))

(assert (=> b!106478 d!33638))

(declare-fun d!33658 () Bool)

(declare-fun e!69871 () Bool)

(assert (=> d!33658 e!69871))

(declare-fun res!87947 () Bool)

(assert (=> d!33658 (=> (not res!87947) (not e!69871))))

(declare-fun lt!158995 () (_ BitVec 64))

(declare-fun lt!158998 () (_ BitVec 64))

(declare-fun lt!158996 () (_ BitVec 64))

(assert (=> d!33658 (= res!87947 (= lt!158995 (bvsub lt!158998 lt!158996)))))

(assert (=> d!33658 (or (= (bvand lt!158998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158998 lt!158996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33658 (= lt!158996 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158225)))) ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158225))) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158225)))))))

(declare-fun lt!158999 () (_ BitVec 64))

(declare-fun lt!158997 () (_ BitVec 64))

(assert (=> d!33658 (= lt!158998 (bvmul lt!158999 lt!158997))))

(assert (=> d!33658 (or (= lt!158999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158997 (bvsdiv (bvmul lt!158999 lt!158997) lt!158999)))))

(assert (=> d!33658 (= lt!158997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33658 (= lt!158999 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158225)))))))

(assert (=> d!33658 (= lt!158995 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158225))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158225)))))))

(assert (=> d!33658 (invariant!0 (currentBit!5120 (_1!4638 lt!158225)) (currentByte!5125 (_1!4638 lt!158225)) (size!2234 (buf!2613 (_1!4638 lt!158225))))))

(assert (=> d!33658 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158225))) (currentByte!5125 (_1!4638 lt!158225)) (currentBit!5120 (_1!4638 lt!158225))) lt!158995)))

(declare-fun b!106761 () Bool)

(declare-fun res!87946 () Bool)

(assert (=> b!106761 (=> (not res!87946) (not e!69871))))

(assert (=> b!106761 (= res!87946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158995))))

(declare-fun b!106762 () Bool)

(declare-fun lt!158994 () (_ BitVec 64))

(assert (=> b!106762 (= e!69871 (bvsle lt!158995 (bvmul lt!158994 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106762 (or (= lt!158994 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158994 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158994)))))

(assert (=> b!106762 (= lt!158994 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158225)))))))

(assert (= (and d!33658 res!87947) b!106761))

(assert (= (and b!106761 res!87946) b!106762))

(declare-fun m!157427 () Bool)

(assert (=> d!33658 m!157427))

(declare-fun m!157429 () Bool)

(assert (=> d!33658 m!157429))

(assert (=> b!106478 d!33658))

(declare-datatypes ((tuple2!8786 0))(
  ( (tuple2!8787 (_1!4650 (_ BitVec 64)) (_2!4650 BitStream!3942)) )
))
(declare-fun lt!159002 () tuple2!8786)

(declare-fun d!33664 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8786)

(assert (=> d!33664 (= lt!159002 (readNLeastSignificantBitsLoop!0 (_1!4639 lt!158234) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238))))

(assert (=> d!33664 (= (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!158234) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238) (tuple2!8767 (_2!4650 lt!159002) (_1!4650 lt!159002)))))

(declare-fun bs!8215 () Bool)

(assert (= bs!8215 d!33664))

(declare-fun m!157431 () Bool)

(assert (=> bs!8215 m!157431))

(assert (=> b!106478 d!33664))

(declare-fun b!106783 () Bool)

(declare-fun e!69884 () Unit!6522)

(declare-fun Unit!6542 () Unit!6522)

(assert (=> b!106783 (= e!69884 Unit!6542)))

(declare-fun b!106784 () Bool)

(declare-fun res!87964 () Bool)

(declare-fun e!69885 () Bool)

(assert (=> b!106784 (=> (not res!87964) (not e!69885))))

(declare-fun lt!159084 () tuple2!8764)

(assert (=> b!106784 (= res!87964 (isPrefixOf!0 (_2!4639 lt!159084) (_2!4637 lt!158247)))))

(declare-fun b!106785 () Bool)

(declare-fun res!87965 () Bool)

(assert (=> b!106785 (=> (not res!87965) (not e!69885))))

(assert (=> b!106785 (= res!87965 (isPrefixOf!0 (_1!4639 lt!159084) thiss!1305))))

(declare-fun lt!159081 () (_ BitVec 64))

(declare-fun b!106786 () Bool)

(declare-fun lt!159085 () (_ BitVec 64))

(assert (=> b!106786 (= e!69885 (= (_1!4639 lt!159084) (withMovedBitIndex!0 (_2!4639 lt!159084) (bvsub lt!159081 lt!159085))))))

(assert (=> b!106786 (or (= (bvand lt!159081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159081 lt!159085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106786 (= lt!159085 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158247))) (currentByte!5125 (_2!4637 lt!158247)) (currentBit!5120 (_2!4637 lt!158247))))))

(assert (=> b!106786 (= lt!159081 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun b!106787 () Bool)

(declare-fun lt!159090 () Unit!6522)

(assert (=> b!106787 (= e!69884 lt!159090)))

(declare-fun lt!159080 () (_ BitVec 64))

(assert (=> b!106787 (= lt!159080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159097 () (_ BitVec 64))

(assert (=> b!106787 (= lt!159097 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4903 array!4903 (_ BitVec 64) (_ BitVec 64)) Unit!6522)

(assert (=> b!106787 (= lt!159090 (arrayBitRangesEqSymmetric!0 (buf!2613 thiss!1305) (buf!2613 (_2!4637 lt!158247)) lt!159080 lt!159097))))

(declare-fun arrayBitRangesEq!0 (array!4903 array!4903 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106787 (arrayBitRangesEq!0 (buf!2613 (_2!4637 lt!158247)) (buf!2613 thiss!1305) lt!159080 lt!159097)))

(declare-fun d!33668 () Bool)

(assert (=> d!33668 e!69885))

(declare-fun res!87963 () Bool)

(assert (=> d!33668 (=> (not res!87963) (not e!69885))))

(assert (=> d!33668 (= res!87963 (isPrefixOf!0 (_1!4639 lt!159084) (_2!4639 lt!159084)))))

(declare-fun lt!159087 () BitStream!3942)

(assert (=> d!33668 (= lt!159084 (tuple2!8765 lt!159087 (_2!4637 lt!158247)))))

(declare-fun lt!159092 () Unit!6522)

(declare-fun lt!159095 () Unit!6522)

(assert (=> d!33668 (= lt!159092 lt!159095)))

(assert (=> d!33668 (isPrefixOf!0 lt!159087 (_2!4637 lt!158247))))

(assert (=> d!33668 (= lt!159095 (lemmaIsPrefixTransitive!0 lt!159087 (_2!4637 lt!158247) (_2!4637 lt!158247)))))

(declare-fun lt!159086 () Unit!6522)

(declare-fun lt!159096 () Unit!6522)

(assert (=> d!33668 (= lt!159086 lt!159096)))

(assert (=> d!33668 (isPrefixOf!0 lt!159087 (_2!4637 lt!158247))))

(assert (=> d!33668 (= lt!159096 (lemmaIsPrefixTransitive!0 lt!159087 thiss!1305 (_2!4637 lt!158247)))))

(declare-fun lt!159098 () Unit!6522)

(assert (=> d!33668 (= lt!159098 e!69884)))

(declare-fun c!6592 () Bool)

(assert (=> d!33668 (= c!6592 (not (= (size!2234 (buf!2613 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!159082 () Unit!6522)

(declare-fun lt!159091 () Unit!6522)

(assert (=> d!33668 (= lt!159082 lt!159091)))

(assert (=> d!33668 (isPrefixOf!0 (_2!4637 lt!158247) (_2!4637 lt!158247))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3942) Unit!6522)

(assert (=> d!33668 (= lt!159091 (lemmaIsPrefixRefl!0 (_2!4637 lt!158247)))))

(declare-fun lt!159094 () Unit!6522)

(declare-fun lt!159088 () Unit!6522)

(assert (=> d!33668 (= lt!159094 lt!159088)))

(assert (=> d!33668 (= lt!159088 (lemmaIsPrefixRefl!0 (_2!4637 lt!158247)))))

(declare-fun lt!159093 () Unit!6522)

(declare-fun lt!159079 () Unit!6522)

(assert (=> d!33668 (= lt!159093 lt!159079)))

(assert (=> d!33668 (isPrefixOf!0 lt!159087 lt!159087)))

(assert (=> d!33668 (= lt!159079 (lemmaIsPrefixRefl!0 lt!159087))))

(declare-fun lt!159089 () Unit!6522)

(declare-fun lt!159083 () Unit!6522)

(assert (=> d!33668 (= lt!159089 lt!159083)))

(assert (=> d!33668 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33668 (= lt!159083 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33668 (= lt!159087 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(assert (=> d!33668 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158247))))

(assert (=> d!33668 (= (reader!0 thiss!1305 (_2!4637 lt!158247)) lt!159084)))

(assert (= (and d!33668 c!6592) b!106787))

(assert (= (and d!33668 (not c!6592)) b!106783))

(assert (= (and d!33668 res!87963) b!106785))

(assert (= (and b!106785 res!87965) b!106784))

(assert (= (and b!106784 res!87964) b!106786))

(declare-fun m!157461 () Bool)

(assert (=> d!33668 m!157461))

(declare-fun m!157463 () Bool)

(assert (=> d!33668 m!157463))

(assert (=> d!33668 m!156855))

(declare-fun m!157465 () Bool)

(assert (=> d!33668 m!157465))

(declare-fun m!157467 () Bool)

(assert (=> d!33668 m!157467))

(declare-fun m!157469 () Bool)

(assert (=> d!33668 m!157469))

(declare-fun m!157471 () Bool)

(assert (=> d!33668 m!157471))

(declare-fun m!157473 () Bool)

(assert (=> d!33668 m!157473))

(declare-fun m!157475 () Bool)

(assert (=> d!33668 m!157475))

(declare-fun m!157477 () Bool)

(assert (=> d!33668 m!157477))

(declare-fun m!157479 () Bool)

(assert (=> d!33668 m!157479))

(declare-fun m!157481 () Bool)

(assert (=> b!106785 m!157481))

(assert (=> b!106787 m!156827))

(declare-fun m!157483 () Bool)

(assert (=> b!106787 m!157483))

(declare-fun m!157485 () Bool)

(assert (=> b!106787 m!157485))

(declare-fun m!157487 () Bool)

(assert (=> b!106786 m!157487))

(assert (=> b!106786 m!156837))

(assert (=> b!106786 m!156827))

(declare-fun m!157489 () Bool)

(assert (=> b!106784 m!157489))

(assert (=> b!106478 d!33668))

(declare-fun d!33680 () Bool)

(assert (=> d!33680 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)) lt!158248)))

(declare-fun lt!159101 () Unit!6522)

(declare-fun choose!9 (BitStream!3942 array!4903 (_ BitVec 64) BitStream!3942) Unit!6522)

(assert (=> d!33680 (= lt!159101 (choose!9 thiss!1305 (buf!2613 (_2!4637 lt!158247)) lt!158248 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))))))

(assert (=> d!33680 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2613 (_2!4637 lt!158247)) lt!158248) lt!159101)))

(declare-fun bs!8219 () Bool)

(assert (= bs!8219 d!33680))

(assert (=> bs!8219 m!156861))

(declare-fun m!157491 () Bool)

(assert (=> bs!8219 m!157491))

(assert (=> b!106478 d!33680))

(declare-fun lt!159102 () tuple2!8786)

(declare-fun d!33682 () Bool)

(assert (=> d!33682 (= lt!159102 (readNLeastSignificantBitsLoop!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237))))

(assert (=> d!33682 (= (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237) (tuple2!8767 (_2!4650 lt!159102) (_1!4650 lt!159102)))))

(declare-fun bs!8220 () Bool)

(assert (= bs!8220 d!33682))

(declare-fun m!157493 () Bool)

(assert (=> bs!8220 m!157493))

(assert (=> b!106478 d!33682))

(declare-fun d!33684 () Bool)

(declare-fun lt!159103 () tuple2!8784)

(assert (=> d!33684 (= lt!159103 (readBit!0 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))))))

(assert (=> d!33684 (= (readBitPure!0 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))) (tuple2!8763 (_2!4649 lt!159103) (_1!4649 lt!159103)))))

(declare-fun bs!8221 () Bool)

(assert (= bs!8221 d!33684))

(declare-fun m!157495 () Bool)

(assert (=> bs!8221 m!157495))

(assert (=> b!106478 d!33684))

(declare-fun d!33686 () Bool)

(declare-fun e!69888 () Bool)

(assert (=> d!33686 e!69888))

(declare-fun res!87968 () Bool)

(assert (=> d!33686 (=> (not res!87968) (not e!69888))))

(declare-fun lt!159112 () tuple2!8762)

(declare-fun lt!159114 () tuple2!8762)

(assert (=> d!33686 (= res!87968 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!159112))) (currentByte!5125 (_1!4638 lt!159112)) (currentBit!5120 (_1!4638 lt!159112))) (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!159114))) (currentByte!5125 (_1!4638 lt!159114)) (currentBit!5120 (_1!4638 lt!159114)))))))

(declare-fun lt!159113 () Unit!6522)

(declare-fun lt!159115 () BitStream!3942)

(declare-fun choose!50 (BitStream!3942 BitStream!3942 BitStream!3942 tuple2!8762 tuple2!8762 BitStream!3942 Bool tuple2!8762 tuple2!8762 BitStream!3942 Bool) Unit!6522)

(assert (=> d!33686 (= lt!159113 (choose!50 lt!158240 (_2!4637 lt!158247) lt!159115 lt!159112 (tuple2!8763 (_1!4638 lt!159112) (_2!4638 lt!159112)) (_1!4638 lt!159112) (_2!4638 lt!159112) lt!159114 (tuple2!8763 (_1!4638 lt!159114) (_2!4638 lt!159114)) (_1!4638 lt!159114) (_2!4638 lt!159114)))))

(assert (=> d!33686 (= lt!159114 (readBitPure!0 lt!159115))))

(assert (=> d!33686 (= lt!159112 (readBitPure!0 lt!158240))))

(assert (=> d!33686 (= lt!159115 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 lt!158240) (currentBit!5120 lt!158240)))))

(assert (=> d!33686 (invariant!0 (currentBit!5120 lt!158240) (currentByte!5125 lt!158240) (size!2234 (buf!2613 (_2!4637 lt!158247))))))

(assert (=> d!33686 (= (readBitPrefixLemma!0 lt!158240 (_2!4637 lt!158247)) lt!159113)))

(declare-fun b!106790 () Bool)

(assert (=> b!106790 (= e!69888 (= (_2!4638 lt!159112) (_2!4638 lt!159114)))))

(assert (= (and d!33686 res!87968) b!106790))

(declare-fun m!157497 () Bool)

(assert (=> d!33686 m!157497))

(assert (=> d!33686 m!156869))

(declare-fun m!157499 () Bool)

(assert (=> d!33686 m!157499))

(declare-fun m!157501 () Bool)

(assert (=> d!33686 m!157501))

(declare-fun m!157503 () Bool)

(assert (=> d!33686 m!157503))

(declare-fun m!157505 () Bool)

(assert (=> d!33686 m!157505))

(assert (=> b!106478 d!33686))

(declare-fun d!33688 () Bool)

(assert (=> d!33688 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158247))))

(declare-fun lt!159118 () Unit!6522)

(declare-fun choose!30 (BitStream!3942 BitStream!3942 BitStream!3942) Unit!6522)

(assert (=> d!33688 (= lt!159118 (choose!30 thiss!1305 (_2!4637 lt!158229) (_2!4637 lt!158247)))))

(assert (=> d!33688 (isPrefixOf!0 thiss!1305 (_2!4637 lt!158229))))

(assert (=> d!33688 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4637 lt!158229) (_2!4637 lt!158247)) lt!159118)))

(declare-fun bs!8222 () Bool)

(assert (= bs!8222 d!33688))

(assert (=> bs!8222 m!156855))

(declare-fun m!157507 () Bool)

(assert (=> bs!8222 m!157507))

(assert (=> bs!8222 m!156881))

(assert (=> b!106478 d!33688))

(declare-fun d!33690 () Bool)

(declare-fun res!87976 () Bool)

(declare-fun e!69893 () Bool)

(assert (=> d!33690 (=> (not res!87976) (not e!69893))))

(assert (=> d!33690 (= res!87976 (= (size!2234 (buf!2613 thiss!1305)) (size!2234 (buf!2613 (_2!4637 lt!158247)))))))

(assert (=> d!33690 (= (isPrefixOf!0 thiss!1305 (_2!4637 lt!158247)) e!69893)))

(declare-fun b!106797 () Bool)

(declare-fun res!87975 () Bool)

(assert (=> b!106797 (=> (not res!87975) (not e!69893))))

(assert (=> b!106797 (= res!87975 (bvsle (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158247))) (currentByte!5125 (_2!4637 lt!158247)) (currentBit!5120 (_2!4637 lt!158247)))))))

(declare-fun b!106798 () Bool)

(declare-fun e!69894 () Bool)

(assert (=> b!106798 (= e!69893 e!69894)))

(declare-fun res!87977 () Bool)

(assert (=> b!106798 (=> res!87977 e!69894)))

(assert (=> b!106798 (= res!87977 (= (size!2234 (buf!2613 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106799 () Bool)

(assert (=> b!106799 (= e!69894 (arrayBitRangesEq!0 (buf!2613 thiss!1305) (buf!2613 (_2!4637 lt!158247)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))))))

(assert (= (and d!33690 res!87976) b!106797))

(assert (= (and b!106797 res!87975) b!106798))

(assert (= (and b!106798 (not res!87977)) b!106799))

(assert (=> b!106797 m!156827))

(assert (=> b!106797 m!156837))

(assert (=> b!106799 m!156827))

(assert (=> b!106799 m!156827))

(declare-fun m!157509 () Bool)

(assert (=> b!106799 m!157509))

(assert (=> b!106478 d!33690))

(declare-fun d!33692 () Bool)

(declare-fun lt!159119 () tuple2!8784)

(assert (=> d!33692 (= lt!159119 (readBit!0 lt!158240))))

(assert (=> d!33692 (= (readBitPure!0 lt!158240) (tuple2!8763 (_2!4649 lt!159119) (_1!4649 lt!159119)))))

(declare-fun bs!8223 () Bool)

(assert (= bs!8223 d!33692))

(declare-fun m!157511 () Bool)

(assert (=> bs!8223 m!157511))

(assert (=> b!106478 d!33692))

(declare-fun b!106800 () Bool)

(declare-fun e!69895 () Unit!6522)

(declare-fun Unit!6543 () Unit!6522)

(assert (=> b!106800 (= e!69895 Unit!6543)))

(declare-fun b!106801 () Bool)

(declare-fun res!87979 () Bool)

(declare-fun e!69896 () Bool)

(assert (=> b!106801 (=> (not res!87979) (not e!69896))))

(declare-fun lt!159125 () tuple2!8764)

(assert (=> b!106801 (= res!87979 (isPrefixOf!0 (_2!4639 lt!159125) (_2!4637 lt!158247)))))

(declare-fun b!106802 () Bool)

(declare-fun res!87980 () Bool)

(assert (=> b!106802 (=> (not res!87980) (not e!69896))))

(assert (=> b!106802 (= res!87980 (isPrefixOf!0 (_1!4639 lt!159125) (_2!4637 lt!158229)))))

(declare-fun lt!159126 () (_ BitVec 64))

(declare-fun lt!159122 () (_ BitVec 64))

(declare-fun b!106803 () Bool)

(assert (=> b!106803 (= e!69896 (= (_1!4639 lt!159125) (withMovedBitIndex!0 (_2!4639 lt!159125) (bvsub lt!159122 lt!159126))))))

(assert (=> b!106803 (or (= (bvand lt!159122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159122 lt!159126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106803 (= lt!159126 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158247))) (currentByte!5125 (_2!4637 lt!158247)) (currentBit!5120 (_2!4637 lt!158247))))))

(assert (=> b!106803 (= lt!159122 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(declare-fun b!106804 () Bool)

(declare-fun lt!159131 () Unit!6522)

(assert (=> b!106804 (= e!69895 lt!159131)))

(declare-fun lt!159121 () (_ BitVec 64))

(assert (=> b!106804 (= lt!159121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159138 () (_ BitVec 64))

(assert (=> b!106804 (= lt!159138 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(assert (=> b!106804 (= lt!159131 (arrayBitRangesEqSymmetric!0 (buf!2613 (_2!4637 lt!158229)) (buf!2613 (_2!4637 lt!158247)) lt!159121 lt!159138))))

(assert (=> b!106804 (arrayBitRangesEq!0 (buf!2613 (_2!4637 lt!158247)) (buf!2613 (_2!4637 lt!158229)) lt!159121 lt!159138)))

(declare-fun d!33694 () Bool)

(assert (=> d!33694 e!69896))

(declare-fun res!87978 () Bool)

(assert (=> d!33694 (=> (not res!87978) (not e!69896))))

(assert (=> d!33694 (= res!87978 (isPrefixOf!0 (_1!4639 lt!159125) (_2!4639 lt!159125)))))

(declare-fun lt!159128 () BitStream!3942)

(assert (=> d!33694 (= lt!159125 (tuple2!8765 lt!159128 (_2!4637 lt!158247)))))

(declare-fun lt!159133 () Unit!6522)

(declare-fun lt!159136 () Unit!6522)

(assert (=> d!33694 (= lt!159133 lt!159136)))

(assert (=> d!33694 (isPrefixOf!0 lt!159128 (_2!4637 lt!158247))))

(assert (=> d!33694 (= lt!159136 (lemmaIsPrefixTransitive!0 lt!159128 (_2!4637 lt!158247) (_2!4637 lt!158247)))))

(declare-fun lt!159127 () Unit!6522)

(declare-fun lt!159137 () Unit!6522)

(assert (=> d!33694 (= lt!159127 lt!159137)))

(assert (=> d!33694 (isPrefixOf!0 lt!159128 (_2!4637 lt!158247))))

(assert (=> d!33694 (= lt!159137 (lemmaIsPrefixTransitive!0 lt!159128 (_2!4637 lt!158229) (_2!4637 lt!158247)))))

(declare-fun lt!159139 () Unit!6522)

(assert (=> d!33694 (= lt!159139 e!69895)))

(declare-fun c!6593 () Bool)

(assert (=> d!33694 (= c!6593 (not (= (size!2234 (buf!2613 (_2!4637 lt!158229))) #b00000000000000000000000000000000)))))

(declare-fun lt!159123 () Unit!6522)

(declare-fun lt!159132 () Unit!6522)

(assert (=> d!33694 (= lt!159123 lt!159132)))

(assert (=> d!33694 (isPrefixOf!0 (_2!4637 lt!158247) (_2!4637 lt!158247))))

(assert (=> d!33694 (= lt!159132 (lemmaIsPrefixRefl!0 (_2!4637 lt!158247)))))

(declare-fun lt!159135 () Unit!6522)

(declare-fun lt!159129 () Unit!6522)

(assert (=> d!33694 (= lt!159135 lt!159129)))

(assert (=> d!33694 (= lt!159129 (lemmaIsPrefixRefl!0 (_2!4637 lt!158247)))))

(declare-fun lt!159134 () Unit!6522)

(declare-fun lt!159120 () Unit!6522)

(assert (=> d!33694 (= lt!159134 lt!159120)))

(assert (=> d!33694 (isPrefixOf!0 lt!159128 lt!159128)))

(assert (=> d!33694 (= lt!159120 (lemmaIsPrefixRefl!0 lt!159128))))

(declare-fun lt!159130 () Unit!6522)

(declare-fun lt!159124 () Unit!6522)

(assert (=> d!33694 (= lt!159130 lt!159124)))

(assert (=> d!33694 (isPrefixOf!0 (_2!4637 lt!158229) (_2!4637 lt!158229))))

(assert (=> d!33694 (= lt!159124 (lemmaIsPrefixRefl!0 (_2!4637 lt!158229)))))

(assert (=> d!33694 (= lt!159128 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(assert (=> d!33694 (isPrefixOf!0 (_2!4637 lt!158229) (_2!4637 lt!158247))))

(assert (=> d!33694 (= (reader!0 (_2!4637 lt!158229) (_2!4637 lt!158247)) lt!159125)))

(assert (= (and d!33694 c!6593) b!106804))

(assert (= (and d!33694 (not c!6593)) b!106800))

(assert (= (and d!33694 res!87978) b!106802))

(assert (= (and b!106802 res!87980) b!106801))

(assert (= (and b!106801 res!87979) b!106803))

(declare-fun m!157513 () Bool)

(assert (=> d!33694 m!157513))

(declare-fun m!157515 () Bool)

(assert (=> d!33694 m!157515))

(declare-fun m!157517 () Bool)

(assert (=> d!33694 m!157517))

(declare-fun m!157519 () Bool)

(assert (=> d!33694 m!157519))

(declare-fun m!157521 () Bool)

(assert (=> d!33694 m!157521))

(assert (=> d!33694 m!157469))

(declare-fun m!157523 () Bool)

(assert (=> d!33694 m!157523))

(declare-fun m!157525 () Bool)

(assert (=> d!33694 m!157525))

(declare-fun m!157527 () Bool)

(assert (=> d!33694 m!157527))

(assert (=> d!33694 m!157477))

(declare-fun m!157529 () Bool)

(assert (=> d!33694 m!157529))

(declare-fun m!157531 () Bool)

(assert (=> b!106802 m!157531))

(assert (=> b!106804 m!156829))

(declare-fun m!157533 () Bool)

(assert (=> b!106804 m!157533))

(declare-fun m!157535 () Bool)

(assert (=> b!106804 m!157535))

(declare-fun m!157537 () Bool)

(assert (=> b!106803 m!157537))

(assert (=> b!106803 m!156837))

(assert (=> b!106803 m!156829))

(declare-fun m!157539 () Bool)

(assert (=> b!106801 m!157539))

(assert (=> b!106478 d!33694))

(declare-fun b!106831 () Bool)

(declare-fun e!69913 () tuple2!8760)

(declare-fun lt!159246 () tuple2!8760)

(declare-fun Unit!6544 () Unit!6522)

(assert (=> b!106831 (= e!69913 (tuple2!8761 Unit!6544 (_2!4637 lt!159246)))))

(declare-fun lt!159251 () Bool)

(assert (=> b!106831 (= lt!159251 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159247 () tuple2!8760)

(assert (=> b!106831 (= lt!159247 (appendBit!0 (_2!4637 lt!158229) lt!159251))))

(declare-fun res!88002 () Bool)

(assert (=> b!106831 (= res!88002 (= (size!2234 (buf!2613 (_2!4637 lt!158229))) (size!2234 (buf!2613 (_2!4637 lt!159247)))))))

(declare-fun e!69917 () Bool)

(assert (=> b!106831 (=> (not res!88002) (not e!69917))))

(assert (=> b!106831 e!69917))

(declare-fun lt!159249 () tuple2!8760)

(assert (=> b!106831 (= lt!159249 lt!159247)))

(assert (=> b!106831 (= lt!159246 (appendNLeastSignificantBitsLoop!0 (_2!4637 lt!159249) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!159237 () Unit!6522)

(assert (=> b!106831 (= lt!159237 (lemmaIsPrefixTransitive!0 (_2!4637 lt!158229) (_2!4637 lt!159249) (_2!4637 lt!159246)))))

(declare-fun call!1350 () Bool)

(assert (=> b!106831 call!1350))

(declare-fun lt!159230 () Unit!6522)

(assert (=> b!106831 (= lt!159230 lt!159237)))

(assert (=> b!106831 (invariant!0 (currentBit!5120 (_2!4637 lt!158229)) (currentByte!5125 (_2!4637 lt!158229)) (size!2234 (buf!2613 (_2!4637 lt!159249))))))

(declare-fun lt!159261 () BitStream!3942)

(assert (=> b!106831 (= lt!159261 (BitStream!3943 (buf!2613 (_2!4637 lt!159249)) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(assert (=> b!106831 (invariant!0 (currentBit!5120 lt!159261) (currentByte!5125 lt!159261) (size!2234 (buf!2613 (_2!4637 lt!159246))))))

(declare-fun lt!159271 () BitStream!3942)

(assert (=> b!106831 (= lt!159271 (BitStream!3943 (buf!2613 (_2!4637 lt!159246)) (currentByte!5125 lt!159261) (currentBit!5120 lt!159261)))))

(declare-fun lt!159267 () tuple2!8762)

(assert (=> b!106831 (= lt!159267 (readBitPure!0 lt!159261))))

(declare-fun lt!159253 () tuple2!8762)

(assert (=> b!106831 (= lt!159253 (readBitPure!0 lt!159271))))

(declare-fun lt!159268 () Unit!6522)

(assert (=> b!106831 (= lt!159268 (readBitPrefixLemma!0 lt!159261 (_2!4637 lt!159246)))))

(declare-fun res!88004 () Bool)

(assert (=> b!106831 (= res!88004 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!159267))) (currentByte!5125 (_1!4638 lt!159267)) (currentBit!5120 (_1!4638 lt!159267))) (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!159253))) (currentByte!5125 (_1!4638 lt!159253)) (currentBit!5120 (_1!4638 lt!159253)))))))

(declare-fun e!69915 () Bool)

(assert (=> b!106831 (=> (not res!88004) (not e!69915))))

(assert (=> b!106831 e!69915))

(declare-fun lt!159258 () Unit!6522)

(assert (=> b!106831 (= lt!159258 lt!159268)))

(declare-fun lt!159232 () tuple2!8764)

(assert (=> b!106831 (= lt!159232 (reader!0 (_2!4637 lt!158229) (_2!4637 lt!159246)))))

(declare-fun lt!159248 () tuple2!8764)

(assert (=> b!106831 (= lt!159248 (reader!0 (_2!4637 lt!159249) (_2!4637 lt!159246)))))

(declare-fun lt!159235 () tuple2!8762)

(assert (=> b!106831 (= lt!159235 (readBitPure!0 (_1!4639 lt!159232)))))

(assert (=> b!106831 (= (_2!4638 lt!159235) lt!159251)))

(declare-fun lt!159242 () Unit!6522)

(declare-fun Unit!6545 () Unit!6522)

(assert (=> b!106831 (= lt!159242 Unit!6545)))

(declare-fun lt!159260 () (_ BitVec 64))

(assert (=> b!106831 (= lt!159260 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!159263 () (_ BitVec 64))

(assert (=> b!106831 (= lt!159263 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!159244 () Unit!6522)

(assert (=> b!106831 (= lt!159244 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4637 lt!158229) (buf!2613 (_2!4637 lt!159246)) lt!159263))))

(assert (=> b!106831 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!159246)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!159263)))

(declare-fun lt!159256 () Unit!6522)

(assert (=> b!106831 (= lt!159256 lt!159244)))

(declare-fun lt!159255 () tuple2!8766)

(assert (=> b!106831 (= lt!159255 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!159232) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159260))))

(declare-fun lt!159250 () (_ BitVec 64))

(assert (=> b!106831 (= lt!159250 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!159270 () Unit!6522)

(assert (=> b!106831 (= lt!159270 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4637 lt!159249) (buf!2613 (_2!4637 lt!159246)) lt!159250))))

(assert (=> b!106831 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!159246)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!159249))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!159249))) lt!159250)))

(declare-fun lt!159243 () Unit!6522)

(assert (=> b!106831 (= lt!159243 lt!159270)))

(declare-fun lt!159241 () tuple2!8766)

(assert (=> b!106831 (= lt!159241 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!159248) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!159260 (ite (_2!4638 lt!159235) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!159259 () tuple2!8766)

(assert (=> b!106831 (= lt!159259 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!159232) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159260))))

(declare-fun c!6598 () Bool)

(assert (=> b!106831 (= c!6598 (_2!4638 (readBitPure!0 (_1!4639 lt!159232))))))

(declare-fun e!69911 () (_ BitVec 64))

(declare-fun lt!159269 () tuple2!8766)

(assert (=> b!106831 (= lt!159269 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4639 lt!159232) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!159260 e!69911)))))

(declare-fun lt!159264 () Unit!6522)

(assert (=> b!106831 (= lt!159264 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4639 lt!159232) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159260))))

(assert (=> b!106831 (and (= (_2!4640 lt!159259) (_2!4640 lt!159269)) (= (_1!4640 lt!159259) (_1!4640 lt!159269)))))

(declare-fun lt!159233 () Unit!6522)

(assert (=> b!106831 (= lt!159233 lt!159264)))

(assert (=> b!106831 (= (_1!4639 lt!159232) (withMovedBitIndex!0 (_2!4639 lt!159232) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159246))) (currentByte!5125 (_2!4637 lt!159246)) (currentBit!5120 (_2!4637 lt!159246))))))))

(declare-fun lt!159262 () Unit!6522)

(declare-fun Unit!6546 () Unit!6522)

(assert (=> b!106831 (= lt!159262 Unit!6546)))

(assert (=> b!106831 (= (_1!4639 lt!159248) (withMovedBitIndex!0 (_2!4639 lt!159248) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159249))) (currentByte!5125 (_2!4637 lt!159249)) (currentBit!5120 (_2!4637 lt!159249))) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159246))) (currentByte!5125 (_2!4637 lt!159246)) (currentBit!5120 (_2!4637 lt!159246))))))))

(declare-fun lt!159234 () Unit!6522)

(declare-fun Unit!6547 () Unit!6522)

(assert (=> b!106831 (= lt!159234 Unit!6547)))

(assert (=> b!106831 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159249))) (currentByte!5125 (_2!4637 lt!159249)) (currentBit!5120 (_2!4637 lt!159249))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!159257 () Unit!6522)

(declare-fun Unit!6548 () Unit!6522)

(assert (=> b!106831 (= lt!159257 Unit!6548)))

(assert (=> b!106831 (= (_2!4640 lt!159255) (_2!4640 lt!159241))))

(declare-fun lt!159266 () Unit!6522)

(declare-fun Unit!6549 () Unit!6522)

(assert (=> b!106831 (= lt!159266 Unit!6549)))

(assert (=> b!106831 (= (_1!4640 lt!159255) (_2!4639 lt!159232))))

(declare-fun b!106832 () Bool)

(declare-fun e!69912 () Bool)

(declare-fun lt!159254 () (_ BitVec 64))

(assert (=> b!106832 (= e!69912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158229)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!159254))))

(declare-fun d!33696 () Bool)

(declare-fun e!69914 () Bool)

(assert (=> d!33696 e!69914))

(declare-fun res!88003 () Bool)

(assert (=> d!33696 (=> (not res!88003) (not e!69914))))

(declare-fun lt!159265 () tuple2!8760)

(assert (=> d!33696 (= res!88003 (= (size!2234 (buf!2613 (_2!4637 lt!158229))) (size!2234 (buf!2613 (_2!4637 lt!159265)))))))

(assert (=> d!33696 (= lt!159265 e!69913)))

(declare-fun c!6599 () Bool)

(assert (=> d!33696 (= c!6599 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33696 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33696 (= (appendNLeastSignificantBitsLoop!0 (_2!4637 lt!158229) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!159265)))

(declare-fun b!106833 () Bool)

(declare-fun res!88007 () Bool)

(assert (=> b!106833 (=> (not res!88007) (not e!69914))))

(assert (=> b!106833 (= res!88007 (isPrefixOf!0 (_2!4637 lt!158229) (_2!4637 lt!159265)))))

(declare-fun b!106834 () Bool)

(assert (=> b!106834 (= e!69911 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!106835 () Bool)

(declare-fun res!88005 () Bool)

(assert (=> b!106835 (= res!88005 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159247))) (currentByte!5125 (_2!4637 lt!159247)) (currentBit!5120 (_2!4637 lt!159247))) (bvadd (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!106835 (=> (not res!88005) (not e!69917))))

(declare-fun bm!1347 () Bool)

(declare-fun lt!159238 () BitStream!3942)

(assert (=> bm!1347 (= call!1350 (isPrefixOf!0 (ite c!6599 (_2!4637 lt!158229) lt!159238) (ite c!6599 (_2!4637 lt!159246) lt!159238)))))

(declare-fun b!106836 () Bool)

(declare-fun res!87999 () Bool)

(assert (=> b!106836 (=> (not res!87999) (not e!69914))))

(declare-fun lt!159274 () (_ BitVec 64))

(declare-fun lt!159240 () (_ BitVec 64))

(assert (=> b!106836 (= res!87999 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159265))) (currentByte!5125 (_2!4637 lt!159265)) (currentBit!5120 (_2!4637 lt!159265))) (bvadd lt!159240 lt!159274)))))

(assert (=> b!106836 (or (not (= (bvand lt!159240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159274 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159240 lt!159274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106836 (= lt!159274 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106836 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106836 (= lt!159240 (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))))))

(declare-fun b!106837 () Bool)

(declare-fun lt!159231 () tuple2!8762)

(assert (=> b!106837 (= lt!159231 (readBitPure!0 (readerFrom!0 (_2!4637 lt!159247) (currentBit!5120 (_2!4637 lt!158229)) (currentByte!5125 (_2!4637 lt!158229)))))))

(declare-fun res!88000 () Bool)

(assert (=> b!106837 (= res!88000 (and (= (_2!4638 lt!159231) lt!159251) (= (_1!4638 lt!159231) (_2!4637 lt!159247))))))

(declare-fun e!69916 () Bool)

(assert (=> b!106837 (=> (not res!88000) (not e!69916))))

(assert (=> b!106837 (= e!69917 e!69916)))

(declare-fun b!106838 () Bool)

(assert (=> b!106838 (= e!69911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!106839 () Bool)

(declare-fun res!88006 () Bool)

(assert (=> b!106839 (= res!88006 (isPrefixOf!0 (_2!4637 lt!158229) (_2!4637 lt!159247)))))

(assert (=> b!106839 (=> (not res!88006) (not e!69917))))

(declare-fun b!106840 () Bool)

(declare-fun lt!159239 () Unit!6522)

(assert (=> b!106840 (= e!69913 (tuple2!8761 lt!159239 (_2!4637 lt!158229)))))

(assert (=> b!106840 (= lt!159238 (_2!4637 lt!158229))))

(assert (=> b!106840 (= lt!159239 (lemmaIsPrefixRefl!0 lt!159238))))

(assert (=> b!106840 call!1350))

(declare-fun b!106841 () Bool)

(declare-fun lt!159245 () tuple2!8764)

(declare-fun lt!159236 () tuple2!8766)

(assert (=> b!106841 (= e!69914 (and (= (_2!4640 lt!159236) v!199) (= (_1!4640 lt!159236) (_2!4639 lt!159245))))))

(declare-fun lt!159273 () (_ BitVec 64))

(assert (=> b!106841 (= lt!159236 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!159245) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159273))))

(declare-fun lt!159252 () Unit!6522)

(declare-fun lt!159272 () Unit!6522)

(assert (=> b!106841 (= lt!159252 lt!159272)))

(assert (=> b!106841 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!159265)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!159254)))

(assert (=> b!106841 (= lt!159272 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4637 lt!158229) (buf!2613 (_2!4637 lt!159265)) lt!159254))))

(assert (=> b!106841 e!69912))

(declare-fun res!88001 () Bool)

(assert (=> b!106841 (=> (not res!88001) (not e!69912))))

(assert (=> b!106841 (= res!88001 (and (= (size!2234 (buf!2613 (_2!4637 lt!158229))) (size!2234 (buf!2613 (_2!4637 lt!159265)))) (bvsge lt!159254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106841 (= lt!159254 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106841 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106841 (= lt!159273 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!106841 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106841 (= lt!159245 (reader!0 (_2!4637 lt!158229) (_2!4637 lt!159265)))))

(declare-fun b!106842 () Bool)

(assert (=> b!106842 (= e!69915 (= (_2!4638 lt!159267) (_2!4638 lt!159253)))))

(declare-fun b!106843 () Bool)

(assert (=> b!106843 (= e!69916 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!159231))) (currentByte!5125 (_1!4638 lt!159231)) (currentBit!5120 (_1!4638 lt!159231))) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!159247))) (currentByte!5125 (_2!4637 lt!159247)) (currentBit!5120 (_2!4637 lt!159247)))))))

(assert (= (and d!33696 c!6599) b!106831))

(assert (= (and d!33696 (not c!6599)) b!106840))

(assert (= (and b!106831 res!88002) b!106835))

(assert (= (and b!106835 res!88005) b!106839))

(assert (= (and b!106839 res!88006) b!106837))

(assert (= (and b!106837 res!88000) b!106843))

(assert (= (and b!106831 res!88004) b!106842))

(assert (= (and b!106831 c!6598) b!106834))

(assert (= (and b!106831 (not c!6598)) b!106838))

(assert (= (or b!106831 b!106840) bm!1347))

(assert (= (and d!33696 res!88003) b!106836))

(assert (= (and b!106836 res!87999) b!106833))

(assert (= (and b!106833 res!88007) b!106841))

(assert (= (and b!106841 res!88001) b!106832))

(declare-fun m!157541 () Bool)

(assert (=> b!106840 m!157541))

(declare-fun m!157543 () Bool)

(assert (=> b!106839 m!157543))

(declare-fun m!157545 () Bool)

(assert (=> bm!1347 m!157545))

(declare-fun m!157547 () Bool)

(assert (=> b!106835 m!157547))

(assert (=> b!106835 m!156829))

(declare-fun m!157549 () Bool)

(assert (=> b!106841 m!157549))

(declare-fun m!157551 () Bool)

(assert (=> b!106841 m!157551))

(declare-fun m!157553 () Bool)

(assert (=> b!106841 m!157553))

(declare-fun m!157555 () Bool)

(assert (=> b!106841 m!157555))

(declare-fun m!157557 () Bool)

(assert (=> b!106841 m!157557))

(declare-fun m!157559 () Bool)

(assert (=> b!106837 m!157559))

(assert (=> b!106837 m!157559))

(declare-fun m!157561 () Bool)

(assert (=> b!106837 m!157561))

(declare-fun m!157563 () Bool)

(assert (=> b!106833 m!157563))

(declare-fun m!157565 () Bool)

(assert (=> b!106832 m!157565))

(declare-fun m!157567 () Bool)

(assert (=> b!106843 m!157567))

(assert (=> b!106843 m!157547))

(declare-fun m!157569 () Bool)

(assert (=> b!106836 m!157569))

(assert (=> b!106836 m!156829))

(declare-fun m!157571 () Bool)

(assert (=> b!106831 m!157571))

(declare-fun m!157573 () Bool)

(assert (=> b!106831 m!157573))

(declare-fun m!157575 () Bool)

(assert (=> b!106831 m!157575))

(declare-fun m!157577 () Bool)

(assert (=> b!106831 m!157577))

(declare-fun m!157579 () Bool)

(assert (=> b!106831 m!157579))

(declare-fun m!157581 () Bool)

(assert (=> b!106831 m!157581))

(declare-fun m!157583 () Bool)

(assert (=> b!106831 m!157583))

(declare-fun m!157585 () Bool)

(assert (=> b!106831 m!157585))

(declare-fun m!157587 () Bool)

(assert (=> b!106831 m!157587))

(declare-fun m!157589 () Bool)

(assert (=> b!106831 m!157589))

(declare-fun m!157591 () Bool)

(assert (=> b!106831 m!157591))

(declare-fun m!157593 () Bool)

(assert (=> b!106831 m!157593))

(declare-fun m!157595 () Bool)

(assert (=> b!106831 m!157595))

(declare-fun m!157597 () Bool)

(assert (=> b!106831 m!157597))

(declare-fun m!157599 () Bool)

(assert (=> b!106831 m!157599))

(declare-fun m!157601 () Bool)

(assert (=> b!106831 m!157601))

(assert (=> b!106831 m!157571))

(declare-fun m!157603 () Bool)

(assert (=> b!106831 m!157603))

(declare-fun m!157605 () Bool)

(assert (=> b!106831 m!157605))

(declare-fun m!157607 () Bool)

(assert (=> b!106831 m!157607))

(declare-fun m!157609 () Bool)

(assert (=> b!106831 m!157609))

(assert (=> b!106831 m!157555))

(declare-fun m!157611 () Bool)

(assert (=> b!106831 m!157611))

(assert (=> b!106831 m!156829))

(declare-fun m!157613 () Bool)

(assert (=> b!106831 m!157613))

(declare-fun m!157615 () Bool)

(assert (=> b!106831 m!157615))

(declare-fun m!157617 () Bool)

(assert (=> b!106831 m!157617))

(declare-fun m!157619 () Bool)

(assert (=> b!106831 m!157619))

(declare-fun m!157621 () Bool)

(assert (=> b!106831 m!157621))

(assert (=> b!106478 d!33696))

(declare-fun d!33698 () Bool)

(assert (=> d!33698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)) lt!158248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305))) lt!158248))))

(declare-fun bs!8224 () Bool)

(assert (= bs!8224 d!33698))

(declare-fun m!157623 () Bool)

(assert (=> bs!8224 m!157623))

(assert (=> b!106478 d!33698))

(declare-fun d!33700 () Bool)

(assert (=> d!33700 (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!158241)))

(declare-fun lt!159275 () Unit!6522)

(assert (=> d!33700 (= lt!159275 (choose!9 (_2!4637 lt!158229) (buf!2613 (_2!4637 lt!158247)) lt!158241 (BitStream!3943 (buf!2613 (_2!4637 lt!158247)) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229)))))))

(assert (=> d!33700 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4637 lt!158229) (buf!2613 (_2!4637 lt!158247)) lt!158241) lt!159275)))

(declare-fun bs!8225 () Bool)

(assert (= bs!8225 d!33700))

(assert (=> bs!8225 m!156843))

(declare-fun m!157625 () Bool)

(assert (=> bs!8225 m!157625))

(assert (=> b!106478 d!33700))

(declare-fun d!33702 () Bool)

(assert (=> d!33702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229))) lt!158241) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229)))) lt!158241))))

(declare-fun bs!8226 () Bool)

(assert (= bs!8226 d!33702))

(declare-fun m!157627 () Bool)

(assert (=> bs!8226 m!157627))

(assert (=> b!106478 d!33702))

(declare-fun d!33704 () Bool)

(declare-fun lt!159276 () tuple2!8784)

(assert (=> d!33704 (= lt!159276 (readBit!0 (readerFrom!0 (_2!4637 lt!158229) (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305))))))

(assert (=> d!33704 (= (readBitPure!0 (readerFrom!0 (_2!4637 lt!158229) (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305))) (tuple2!8763 (_2!4649 lt!159276) (_1!4649 lt!159276)))))

(declare-fun bs!8227 () Bool)

(assert (= bs!8227 d!33704))

(assert (=> bs!8227 m!156815))

(declare-fun m!157629 () Bool)

(assert (=> bs!8227 m!157629))

(assert (=> b!106479 d!33704))

(declare-fun d!33706 () Bool)

(declare-fun e!69920 () Bool)

(assert (=> d!33706 e!69920))

(declare-fun res!88011 () Bool)

(assert (=> d!33706 (=> (not res!88011) (not e!69920))))

(assert (=> d!33706 (= res!88011 (invariant!0 (currentBit!5120 (_2!4637 lt!158229)) (currentByte!5125 (_2!4637 lt!158229)) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(assert (=> d!33706 (= (readerFrom!0 (_2!4637 lt!158229) (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305)) (BitStream!3943 (buf!2613 (_2!4637 lt!158229)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)))))

(declare-fun b!106846 () Bool)

(assert (=> b!106846 (= e!69920 (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(assert (= (and d!33706 res!88011) b!106846))

(declare-fun m!157631 () Bool)

(assert (=> d!33706 m!157631))

(assert (=> b!106846 m!156813))

(assert (=> b!106479 d!33706))

(declare-fun d!33708 () Bool)

(assert (=> d!33708 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!106476 d!33708))

(declare-fun d!33710 () Bool)

(declare-fun e!69923 () Bool)

(assert (=> d!33710 e!69923))

(declare-fun res!88014 () Bool)

(assert (=> d!33710 (=> (not res!88014) (not e!69923))))

(declare-fun lt!159281 () BitStream!3942)

(declare-fun lt!159282 () (_ BitVec 64))

(assert (=> d!33710 (= res!88014 (= (bvadd lt!159282 (bvsub lt!158231 lt!158250)) (bitIndex!0 (size!2234 (buf!2613 lt!159281)) (currentByte!5125 lt!159281) (currentBit!5120 lt!159281))))))

(assert (=> d!33710 (or (not (= (bvand lt!159282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158231 lt!158250) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159282 (bvsub lt!158231 lt!158250)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33710 (= lt!159282 (bitIndex!0 (size!2234 (buf!2613 (_2!4639 lt!158245))) (currentByte!5125 (_2!4639 lt!158245)) (currentBit!5120 (_2!4639 lt!158245))))))

(declare-fun moveBitIndex!0 (BitStream!3942 (_ BitVec 64)) tuple2!8760)

(assert (=> d!33710 (= lt!159281 (_2!4637 (moveBitIndex!0 (_2!4639 lt!158245) (bvsub lt!158231 lt!158250))))))

(assert (=> d!33710 (moveBitIndexPrecond!0 (_2!4639 lt!158245) (bvsub lt!158231 lt!158250))))

(assert (=> d!33710 (= (withMovedBitIndex!0 (_2!4639 lt!158245) (bvsub lt!158231 lt!158250)) lt!159281)))

(declare-fun b!106849 () Bool)

(assert (=> b!106849 (= e!69923 (= (size!2234 (buf!2613 (_2!4639 lt!158245))) (size!2234 (buf!2613 lt!159281))))))

(assert (= (and d!33710 res!88014) b!106849))

(declare-fun m!157633 () Bool)

(assert (=> d!33710 m!157633))

(declare-fun m!157635 () Bool)

(assert (=> d!33710 m!157635))

(declare-fun m!157637 () Bool)

(assert (=> d!33710 m!157637))

(declare-fun m!157639 () Bool)

(assert (=> d!33710 m!157639))

(assert (=> b!106474 d!33710))

(declare-fun d!33712 () Bool)

(declare-fun e!69924 () Bool)

(assert (=> d!33712 e!69924))

(declare-fun res!88015 () Bool)

(assert (=> d!33712 (=> (not res!88015) (not e!69924))))

(declare-fun lt!159284 () (_ BitVec 64))

(declare-fun lt!159283 () BitStream!3942)

(assert (=> d!33712 (= res!88015 (= (bvadd lt!159284 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2234 (buf!2613 lt!159283)) (currentByte!5125 lt!159283) (currentBit!5120 lt!159283))))))

(assert (=> d!33712 (or (not (= (bvand lt!159284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159284 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33712 (= lt!159284 (bitIndex!0 (size!2234 (buf!2613 (_1!4639 lt!158245))) (currentByte!5125 (_1!4639 lt!158245)) (currentBit!5120 (_1!4639 lt!158245))))))

(assert (=> d!33712 (= lt!159283 (_2!4637 (moveBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33712 (moveBitIndexPrecond!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33712 (= (withMovedBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001) lt!159283)))

(declare-fun b!106850 () Bool)

(assert (=> b!106850 (= e!69924 (= (size!2234 (buf!2613 (_1!4639 lt!158245))) (size!2234 (buf!2613 lt!159283))))))

(assert (= (and d!33712 res!88015) b!106850))

(declare-fun m!157641 () Bool)

(assert (=> d!33712 m!157641))

(declare-fun m!157643 () Bool)

(assert (=> d!33712 m!157643))

(declare-fun m!157645 () Bool)

(assert (=> d!33712 m!157645))

(declare-fun m!157647 () Bool)

(assert (=> d!33712 m!157647))

(assert (=> b!106474 d!33712))

(declare-fun d!33714 () Bool)

(declare-fun e!69925 () Bool)

(assert (=> d!33714 e!69925))

(declare-fun res!88017 () Bool)

(assert (=> d!33714 (=> (not res!88017) (not e!69925))))

(declare-fun lt!159286 () (_ BitVec 64))

(declare-fun lt!159287 () (_ BitVec 64))

(declare-fun lt!159289 () (_ BitVec 64))

(assert (=> d!33714 (= res!88017 (= lt!159286 (bvsub lt!159289 lt!159287)))))

(assert (=> d!33714 (or (= (bvand lt!159289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159289 lt!159287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33714 (= lt!159287 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158229)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229)))))))

(declare-fun lt!159290 () (_ BitVec 64))

(declare-fun lt!159288 () (_ BitVec 64))

(assert (=> d!33714 (= lt!159289 (bvmul lt!159290 lt!159288))))

(assert (=> d!33714 (or (= lt!159290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159288 (bvsdiv (bvmul lt!159290 lt!159288) lt!159290)))))

(assert (=> d!33714 (= lt!159288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33714 (= lt!159290 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(assert (=> d!33714 (= lt!159286 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158229))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158229)))))))

(assert (=> d!33714 (invariant!0 (currentBit!5120 (_2!4637 lt!158229)) (currentByte!5125 (_2!4637 lt!158229)) (size!2234 (buf!2613 (_2!4637 lt!158229))))))

(assert (=> d!33714 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!159286)))

(declare-fun b!106851 () Bool)

(declare-fun res!88016 () Bool)

(assert (=> b!106851 (=> (not res!88016) (not e!69925))))

(assert (=> b!106851 (= res!88016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159286))))

(declare-fun b!106852 () Bool)

(declare-fun lt!159285 () (_ BitVec 64))

(assert (=> b!106852 (= e!69925 (bvsle lt!159286 (bvmul lt!159285 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106852 (or (= lt!159285 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159285 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159285)))))

(assert (=> b!106852 (= lt!159285 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(assert (= (and d!33714 res!88017) b!106851))

(assert (= (and b!106851 res!88016) b!106852))

(declare-fun m!157649 () Bool)

(assert (=> d!33714 m!157649))

(assert (=> d!33714 m!157631))

(assert (=> b!106474 d!33714))

(declare-fun lt!159291 () tuple2!8786)

(declare-fun d!33716 () Bool)

(assert (=> d!33716 (= lt!159291 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238))))

(assert (=> d!33716 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158238) (tuple2!8767 (_2!4650 lt!159291) (_1!4650 lt!159291)))))

(declare-fun bs!8228 () Bool)

(assert (= bs!8228 d!33716))

(assert (=> bs!8228 m!156823))

(declare-fun m!157651 () Bool)

(assert (=> bs!8228 m!157651))

(assert (=> b!106474 d!33716))

(declare-fun d!33718 () Bool)

(declare-fun res!88020 () Bool)

(declare-fun e!69928 () Bool)

(assert (=> d!33718 (=> (not res!88020) (not e!69928))))

(assert (=> d!33718 (= res!88020 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4639 lt!158234))))) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!158250)) (bvsle (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!158250) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4639 lt!158234))))))))))

(assert (=> d!33718 (= (moveBitIndexPrecond!0 (_2!4639 lt!158234) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!158250)) e!69928)))

(declare-fun b!106856 () Bool)

(declare-fun lt!159294 () (_ BitVec 64))

(assert (=> b!106856 (= e!69928 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159294) (bvsle lt!159294 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4639 lt!158234))))))))))

(assert (=> b!106856 (= lt!159294 (bvadd (bitIndex!0 (size!2234 (buf!2613 (_2!4639 lt!158234))) (currentByte!5125 (_2!4639 lt!158234)) (currentBit!5120 (_2!4639 lt!158234))) (bvsub (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229))) lt!158250)))))

(assert (= (and d!33718 res!88020) b!106856))

(declare-fun m!157653 () Bool)

(assert (=> b!106856 m!157653))

(assert (=> b!106474 d!33718))

(declare-fun d!33720 () Bool)

(declare-fun e!69929 () Bool)

(assert (=> d!33720 e!69929))

(declare-fun res!88022 () Bool)

(assert (=> d!33720 (=> (not res!88022) (not e!69929))))

(declare-fun lt!159296 () (_ BitVec 64))

(declare-fun lt!159297 () (_ BitVec 64))

(declare-fun lt!159299 () (_ BitVec 64))

(assert (=> d!33720 (= res!88022 (= lt!159296 (bvsub lt!159299 lt!159297)))))

(assert (=> d!33720 (or (= (bvand lt!159299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159299 lt!159297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33720 (= lt!159297 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))) ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158247))) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158247)))))))

(declare-fun lt!159300 () (_ BitVec 64))

(declare-fun lt!159298 () (_ BitVec 64))

(assert (=> d!33720 (= lt!159299 (bvmul lt!159300 lt!159298))))

(assert (=> d!33720 (or (= lt!159300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159298 (bvsdiv (bvmul lt!159300 lt!159298) lt!159300)))))

(assert (=> d!33720 (= lt!159298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33720 (= lt!159300 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))))))

(assert (=> d!33720 (= lt!159296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 (_2!4637 lt!158247))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 (_2!4637 lt!158247)))))))

(assert (=> d!33720 (invariant!0 (currentBit!5120 (_2!4637 lt!158247)) (currentByte!5125 (_2!4637 lt!158247)) (size!2234 (buf!2613 (_2!4637 lt!158247))))))

(assert (=> d!33720 (= (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158247))) (currentByte!5125 (_2!4637 lt!158247)) (currentBit!5120 (_2!4637 lt!158247))) lt!159296)))

(declare-fun b!106857 () Bool)

(declare-fun res!88021 () Bool)

(assert (=> b!106857 (=> (not res!88021) (not e!69929))))

(assert (=> b!106857 (= res!88021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159296))))

(declare-fun b!106858 () Bool)

(declare-fun lt!159295 () (_ BitVec 64))

(assert (=> b!106858 (= e!69929 (bvsle lt!159296 (bvmul lt!159295 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106858 (or (= lt!159295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159295)))))

(assert (=> b!106858 (= lt!159295 ((_ sign_extend 32) (size!2234 (buf!2613 (_2!4637 lt!158247)))))))

(assert (= (and d!33720 res!88022) b!106857))

(assert (= (and b!106857 res!88021) b!106858))

(declare-fun m!157655 () Bool)

(assert (=> d!33720 m!157655))

(declare-fun m!157657 () Bool)

(assert (=> d!33720 m!157657))

(assert (=> b!106474 d!33720))

(declare-fun d!33722 () Bool)

(declare-fun lt!159316 () tuple2!8766)

(declare-fun lt!159317 () tuple2!8766)

(assert (=> d!33722 (and (= (_2!4640 lt!159316) (_2!4640 lt!159317)) (= (_1!4640 lt!159316) (_1!4640 lt!159317)))))

(declare-fun lt!159313 () (_ BitVec 64))

(declare-fun lt!159314 () Bool)

(declare-fun lt!159315 () Unit!6522)

(declare-fun lt!159318 () BitStream!3942)

(declare-fun choose!45 (BitStream!3942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8766 tuple2!8766 BitStream!3942 (_ BitVec 64) Bool BitStream!3942 (_ BitVec 64) tuple2!8766 tuple2!8766 BitStream!3942 (_ BitVec 64)) Unit!6522)

(assert (=> d!33722 (= lt!159315 (choose!45 (_1!4639 lt!158245) nBits!396 i!615 lt!158237 lt!159316 (tuple2!8767 (_1!4640 lt!159316) (_2!4640 lt!159316)) (_1!4640 lt!159316) (_2!4640 lt!159316) lt!159314 lt!159318 lt!159313 lt!159317 (tuple2!8767 (_1!4640 lt!159317) (_2!4640 lt!159317)) (_1!4640 lt!159317) (_2!4640 lt!159317)))))

(assert (=> d!33722 (= lt!159317 (readNLeastSignificantBitsLoopPure!0 lt!159318 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!159313))))

(assert (=> d!33722 (= lt!159313 (bvor lt!158237 (ite lt!159314 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33722 (= lt!159318 (withMovedBitIndex!0 (_1!4639 lt!158245) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33722 (= lt!159314 (_2!4638 (readBitPure!0 (_1!4639 lt!158245))))))

(assert (=> d!33722 (= lt!159316 (readNLeastSignificantBitsLoopPure!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237))))

(assert (=> d!33722 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4639 lt!158245) nBits!396 i!615 lt!158237) lt!159315)))

(declare-fun bs!8230 () Bool)

(assert (= bs!8230 d!33722))

(assert (=> bs!8230 m!156857))

(assert (=> bs!8230 m!156853))

(declare-fun m!157659 () Bool)

(assert (=> bs!8230 m!157659))

(assert (=> bs!8230 m!156823))

(declare-fun m!157661 () Bool)

(assert (=> bs!8230 m!157661))

(assert (=> b!106474 d!33722))

(declare-fun d!33724 () Bool)

(declare-fun e!69930 () Bool)

(assert (=> d!33724 e!69930))

(declare-fun res!88024 () Bool)

(assert (=> d!33724 (=> (not res!88024) (not e!69930))))

(declare-fun lt!159320 () (_ BitVec 64))

(declare-fun lt!159321 () (_ BitVec 64))

(declare-fun lt!159323 () (_ BitVec 64))

(assert (=> d!33724 (= res!88024 (= lt!159320 (bvsub lt!159323 lt!159321)))))

(assert (=> d!33724 (or (= (bvand lt!159323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159323 lt!159321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33724 (= lt!159321 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305))))))

(declare-fun lt!159324 () (_ BitVec 64))

(declare-fun lt!159322 () (_ BitVec 64))

(assert (=> d!33724 (= lt!159323 (bvmul lt!159324 lt!159322))))

(assert (=> d!33724 (or (= lt!159324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159322 (bvsdiv (bvmul lt!159324 lt!159322) lt!159324)))))

(assert (=> d!33724 (= lt!159322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33724 (= lt!159324 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))))))

(assert (=> d!33724 (= lt!159320 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 thiss!1305))))))

(assert (=> d!33724 (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 thiss!1305)))))

(assert (=> d!33724 (= (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)) lt!159320)))

(declare-fun b!106859 () Bool)

(declare-fun res!88023 () Bool)

(assert (=> b!106859 (=> (not res!88023) (not e!69930))))

(assert (=> b!106859 (= res!88023 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159320))))

(declare-fun b!106860 () Bool)

(declare-fun lt!159319 () (_ BitVec 64))

(assert (=> b!106860 (= e!69930 (bvsle lt!159320 (bvmul lt!159319 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106860 (or (= lt!159319 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159319 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159319)))))

(assert (=> b!106860 (= lt!159319 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))))))

(assert (= (and d!33724 res!88024) b!106859))

(assert (= (and b!106859 res!88023) b!106860))

(declare-fun m!157663 () Bool)

(assert (=> d!33724 m!157663))

(assert (=> d!33724 m!157309))

(assert (=> b!106474 d!33724))

(declare-fun d!33726 () Bool)

(assert (=> d!33726 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305)) lt!158248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 thiss!1305))) ((_ sign_extend 32) (currentByte!5125 thiss!1305)) ((_ sign_extend 32) (currentBit!5120 thiss!1305))) lt!158248))))

(declare-fun bs!8231 () Bool)

(assert (= bs!8231 d!33726))

(assert (=> bs!8231 m!157663))

(assert (=> b!106475 d!33726))

(declare-fun d!33728 () Bool)

(declare-fun e!69931 () Bool)

(assert (=> d!33728 e!69931))

(declare-fun res!88026 () Bool)

(assert (=> d!33728 (=> (not res!88026) (not e!69931))))

(declare-fun lt!159326 () (_ BitVec 64))

(declare-fun lt!159329 () (_ BitVec 64))

(declare-fun lt!159327 () (_ BitVec 64))

(assert (=> d!33728 (= res!88026 (= lt!159326 (bvsub lt!159329 lt!159327)))))

(assert (=> d!33728 (or (= (bvand lt!159329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159329 lt!159327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33728 (= lt!159327 (remainingBits!0 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158226)))) ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158226))) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158226)))))))

(declare-fun lt!159330 () (_ BitVec 64))

(declare-fun lt!159328 () (_ BitVec 64))

(assert (=> d!33728 (= lt!159329 (bvmul lt!159330 lt!159328))))

(assert (=> d!33728 (or (= lt!159330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159328 (bvsdiv (bvmul lt!159330 lt!159328) lt!159330)))))

(assert (=> d!33728 (= lt!159328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33728 (= lt!159330 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158226)))))))

(assert (=> d!33728 (= lt!159326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5125 (_1!4638 lt!158226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5120 (_1!4638 lt!158226)))))))

(assert (=> d!33728 (invariant!0 (currentBit!5120 (_1!4638 lt!158226)) (currentByte!5125 (_1!4638 lt!158226)) (size!2234 (buf!2613 (_1!4638 lt!158226))))))

(assert (=> d!33728 (= (bitIndex!0 (size!2234 (buf!2613 (_1!4638 lt!158226))) (currentByte!5125 (_1!4638 lt!158226)) (currentBit!5120 (_1!4638 lt!158226))) lt!159326)))

(declare-fun b!106861 () Bool)

(declare-fun res!88025 () Bool)

(assert (=> b!106861 (=> (not res!88025) (not e!69931))))

(assert (=> b!106861 (= res!88025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159326))))

(declare-fun b!106862 () Bool)

(declare-fun lt!159325 () (_ BitVec 64))

(assert (=> b!106862 (= e!69931 (bvsle lt!159326 (bvmul lt!159325 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106862 (or (= lt!159325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159325)))))

(assert (=> b!106862 (= lt!159325 ((_ sign_extend 32) (size!2234 (buf!2613 (_1!4638 lt!158226)))))))

(assert (= (and d!33728 res!88026) b!106861))

(assert (= (and b!106861 res!88025) b!106862))

(declare-fun m!157665 () Bool)

(assert (=> d!33728 m!157665))

(declare-fun m!157667 () Bool)

(assert (=> d!33728 m!157667))

(assert (=> b!106473 d!33728))

(declare-fun d!33730 () Bool)

(assert (=> d!33730 (= (invariant!0 (currentBit!5120 thiss!1305) (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158247)))) (and (bvsge (currentBit!5120 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5120 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5125 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158247)))) (and (= (currentBit!5120 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5125 thiss!1305) (size!2234 (buf!2613 (_2!4637 lt!158247))))))))))

(assert (=> b!106484 d!33730))

(assert (=> b!106482 d!33714))

(assert (=> b!106482 d!33724))

(declare-fun d!33732 () Bool)

(declare-fun res!88028 () Bool)

(declare-fun e!69932 () Bool)

(assert (=> d!33732 (=> (not res!88028) (not e!69932))))

(assert (=> d!33732 (= res!88028 (= (size!2234 (buf!2613 thiss!1305)) (size!2234 (buf!2613 (_2!4637 lt!158229)))))))

(assert (=> d!33732 (= (isPrefixOf!0 thiss!1305 (_2!4637 lt!158229)) e!69932)))

(declare-fun b!106863 () Bool)

(declare-fun res!88027 () Bool)

(assert (=> b!106863 (=> (not res!88027) (not e!69932))))

(assert (=> b!106863 (= res!88027 (bvsle (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305)) (bitIndex!0 (size!2234 (buf!2613 (_2!4637 lt!158229))) (currentByte!5125 (_2!4637 lt!158229)) (currentBit!5120 (_2!4637 lt!158229)))))))

(declare-fun b!106864 () Bool)

(declare-fun e!69933 () Bool)

(assert (=> b!106864 (= e!69932 e!69933)))

(declare-fun res!88029 () Bool)

(assert (=> b!106864 (=> res!88029 e!69933)))

(assert (=> b!106864 (= res!88029 (= (size!2234 (buf!2613 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106865 () Bool)

(assert (=> b!106865 (= e!69933 (arrayBitRangesEq!0 (buf!2613 thiss!1305) (buf!2613 (_2!4637 lt!158229)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2234 (buf!2613 thiss!1305)) (currentByte!5125 thiss!1305) (currentBit!5120 thiss!1305))))))

(assert (= (and d!33732 res!88028) b!106863))

(assert (= (and b!106863 res!88027) b!106864))

(assert (= (and b!106864 (not res!88029)) b!106865))

(assert (=> b!106863 m!156827))

(assert (=> b!106863 m!156829))

(assert (=> b!106865 m!156827))

(assert (=> b!106865 m!156827))

(declare-fun m!157669 () Bool)

(assert (=> b!106865 m!157669))

(assert (=> b!106472 d!33732))

(declare-fun d!33734 () Bool)

(assert (=> d!33734 (= (array_inv!2036 (buf!2613 thiss!1305)) (bvsge (size!2234 (buf!2613 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!106483 d!33734))

(check-sat (not b!106757) (not d!33710) (not b!106863) (not b!106839) (not b!106803) (not d!33664) (not b!106801) (not d!33698) (not d!33684) (not b!106840) (not d!33706) (not d!33658) (not b!106856) (not d!33682) (not d!33722) (not b!106835) (not b!106833) (not b!106841) (not b!106831) (not b!106865) (not b!106802) (not d!33714) (not d!33700) (not b!106756) (not b!106787) (not b!106786) (not b!106843) (not d!33680) (not d!33716) (not b!106785) (not b!106754) (not b!106837) (not b!106755) (not b!106846) (not d!33720) (not d!33686) (not b!106784) (not b!106804) (not b!106797) (not d!33712) (not d!33702) (not d!33668) (not d!33726) (not b!106836) (not b!106832) (not d!33724) (not d!33634) (not b!106799) (not d!33638) (not d!33692) (not d!33628) (not d!33694) (not d!33688) (not d!33704) (not d!33728) (not d!33636) (not bm!1347))
(check-sat)
