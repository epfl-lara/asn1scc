; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19580 () Bool)

(assert start!19580)

(declare-fun b!97775 () Bool)

(declare-fun res!80230 () Bool)

(declare-fun e!64030 () Bool)

(assert (=> b!97775 (=> (not res!80230) (not e!64030))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97775 (= res!80230 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97776 () Bool)

(declare-fun res!80232 () Bool)

(assert (=> b!97776 (=> (not res!80232) (not e!64030))))

(declare-datatypes ((array!4584 0))(
  ( (array!4585 (arr!2689 (Array (_ BitVec 32) (_ BitVec 8))) (size!2096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3666 0))(
  ( (BitStream!3667 (buf!2444 array!4584) (currentByte!4865 (_ BitVec 32)) (currentBit!4860 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3666)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97776 (= res!80232 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97777 () Bool)

(declare-fun e!64032 () Bool)

(assert (=> b!97777 (= e!64030 e!64032)))

(declare-fun res!80231 () Bool)

(assert (=> b!97777 (=> (not res!80231) (not e!64032))))

(declare-datatypes ((Unit!5962 0))(
  ( (Unit!5963) )
))
(declare-datatypes ((tuple2!7856 0))(
  ( (tuple2!7857 (_1!4180 Unit!5962) (_2!4180 BitStream!3666)) )
))
(declare-fun lt!141371 () tuple2!7856)

(assert (=> b!97777 (= res!80231 (= (size!2096 (buf!2444 thiss!1288)) (size!2096 (buf!2444 (_2!4180 lt!141371)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7856)

(assert (=> b!97777 (= lt!141371 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97778 () Bool)

(declare-datatypes ((tuple2!7858 0))(
  ( (tuple2!7859 (_1!4181 BitStream!3666) (_2!4181 BitStream!3666)) )
))
(declare-fun lt!141373 () tuple2!7858)

(assert (=> b!97778 (= e!64032 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_1!4181 lt!141373)))) ((_ sign_extend 32) (currentByte!4865 (_1!4181 lt!141373))) ((_ sign_extend 32) (currentBit!4860 (_1!4181 lt!141373))) ((_ sign_extend 32) nBits!388))))))

(assert (=> b!97778 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141372 () Unit!5962)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3666 array!4584 (_ BitVec 64)) Unit!5962)

(assert (=> b!97778 (= lt!141372 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2444 (_2!4180 lt!141371)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3666 BitStream!3666) tuple2!7858)

(assert (=> b!97778 (= lt!141373 (reader!0 thiss!1288 (_2!4180 lt!141371)))))

(declare-fun b!97780 () Bool)

(declare-fun res!80234 () Bool)

(assert (=> b!97780 (=> (not res!80234) (not e!64032))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97780 (= res!80234 (= (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141371))) (currentByte!4865 (_2!4180 lt!141371)) (currentBit!4860 (_2!4180 lt!141371))) (bvadd (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97781 () Bool)

(declare-fun e!64029 () Bool)

(declare-fun array_inv!1898 (array!4584) Bool)

(assert (=> b!97781 (= e!64029 (array_inv!1898 (buf!2444 thiss!1288)))))

(declare-fun b!97779 () Bool)

(declare-fun res!80233 () Bool)

(assert (=> b!97779 (=> (not res!80233) (not e!64032))))

(declare-fun isPrefixOf!0 (BitStream!3666 BitStream!3666) Bool)

(assert (=> b!97779 (= res!80233 (isPrefixOf!0 thiss!1288 (_2!4180 lt!141371)))))

(declare-fun res!80229 () Bool)

(assert (=> start!19580 (=> (not res!80229) (not e!64030))))

(assert (=> start!19580 (= res!80229 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19580 e!64030))

(assert (=> start!19580 true))

(declare-fun inv!12 (BitStream!3666) Bool)

(assert (=> start!19580 (and (inv!12 thiss!1288) e!64029)))

(assert (= (and start!19580 res!80229) b!97776))

(assert (= (and b!97776 res!80232) b!97775))

(assert (= (and b!97775 res!80230) b!97777))

(assert (= (and b!97777 res!80231) b!97780))

(assert (= (and b!97780 res!80234) b!97779))

(assert (= (and b!97779 res!80233) b!97778))

(assert (= start!19580 b!97781))

(declare-fun m!142033 () Bool)

(assert (=> b!97776 m!142033))

(declare-fun m!142035 () Bool)

(assert (=> b!97777 m!142035))

(declare-fun m!142037 () Bool)

(assert (=> b!97775 m!142037))

(declare-fun m!142039 () Bool)

(assert (=> b!97780 m!142039))

(declare-fun m!142041 () Bool)

(assert (=> b!97780 m!142041))

(declare-fun m!142043 () Bool)

(assert (=> b!97778 m!142043))

(declare-fun m!142045 () Bool)

(assert (=> b!97778 m!142045))

(declare-fun m!142047 () Bool)

(assert (=> b!97778 m!142047))

(declare-fun m!142049 () Bool)

(assert (=> b!97778 m!142049))

(declare-fun m!142051 () Bool)

(assert (=> b!97781 m!142051))

(declare-fun m!142053 () Bool)

(assert (=> start!19580 m!142053))

(declare-fun m!142055 () Bool)

(assert (=> b!97779 m!142055))

(check-sat (not b!97779) (not b!97778) (not b!97776) (not b!97777) (not b!97775) (not b!97780) (not b!97781) (not start!19580))
(check-sat)
(get-model)

(declare-fun d!30676 () Bool)

(declare-fun res!80259 () Bool)

(declare-fun e!64049 () Bool)

(assert (=> d!30676 (=> (not res!80259) (not e!64049))))

(assert (=> d!30676 (= res!80259 (= (size!2096 (buf!2444 thiss!1288)) (size!2096 (buf!2444 (_2!4180 lt!141371)))))))

(assert (=> d!30676 (= (isPrefixOf!0 thiss!1288 (_2!4180 lt!141371)) e!64049)))

(declare-fun b!97809 () Bool)

(declare-fun res!80260 () Bool)

(assert (=> b!97809 (=> (not res!80260) (not e!64049))))

(assert (=> b!97809 (= res!80260 (bvsle (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141371))) (currentByte!4865 (_2!4180 lt!141371)) (currentBit!4860 (_2!4180 lt!141371)))))))

(declare-fun b!97810 () Bool)

(declare-fun e!64050 () Bool)

(assert (=> b!97810 (= e!64049 e!64050)))

(declare-fun res!80261 () Bool)

(assert (=> b!97810 (=> res!80261 e!64050)))

(assert (=> b!97810 (= res!80261 (= (size!2096 (buf!2444 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97811 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4584 array!4584 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97811 (= e!64050 (arrayBitRangesEq!0 (buf!2444 thiss!1288) (buf!2444 (_2!4180 lt!141371)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288))))))

(assert (= (and d!30676 res!80259) b!97809))

(assert (= (and b!97809 res!80260) b!97810))

(assert (= (and b!97810 (not res!80261)) b!97811))

(assert (=> b!97809 m!142041))

(assert (=> b!97809 m!142039))

(assert (=> b!97811 m!142041))

(assert (=> b!97811 m!142041))

(declare-fun m!142081 () Bool)

(assert (=> b!97811 m!142081))

(assert (=> b!97779 d!30676))

(declare-fun d!30678 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_1!4181 lt!141373)))) ((_ sign_extend 32) (currentByte!4865 (_1!4181 lt!141373))) ((_ sign_extend 32) (currentBit!4860 (_1!4181 lt!141373))) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2096 (buf!2444 (_1!4181 lt!141373)))) ((_ sign_extend 32) (currentByte!4865 (_1!4181 lt!141373))) ((_ sign_extend 32) (currentBit!4860 (_1!4181 lt!141373)))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7511 () Bool)

(assert (= bs!7511 d!30678))

(declare-fun m!142083 () Bool)

(assert (=> bs!7511 m!142083))

(assert (=> b!97778 d!30678))

(declare-fun d!30680 () Bool)

(assert (=> d!30680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7512 () Bool)

(assert (= bs!7512 d!30680))

(declare-fun m!142085 () Bool)

(assert (=> bs!7512 m!142085))

(assert (=> b!97778 d!30680))

(declare-fun d!30682 () Bool)

(assert (=> d!30682 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141385 () Unit!5962)

(declare-fun choose!9 (BitStream!3666 array!4584 (_ BitVec 64) BitStream!3666) Unit!5962)

(assert (=> d!30682 (= lt!141385 (choose!9 thiss!1288 (buf!2444 (_2!4180 lt!141371)) ((_ sign_extend 32) nBits!388) (BitStream!3667 (buf!2444 (_2!4180 lt!141371)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288))))))

(assert (=> d!30682 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2444 (_2!4180 lt!141371)) ((_ sign_extend 32) nBits!388)) lt!141385)))

(declare-fun bs!7513 () Bool)

(assert (= bs!7513 d!30682))

(assert (=> bs!7513 m!142045))

(declare-fun m!142087 () Bool)

(assert (=> bs!7513 m!142087))

(assert (=> b!97778 d!30682))

(declare-fun b!97833 () Bool)

(declare-fun lt!141458 () tuple2!7858)

(declare-fun e!64062 () Bool)

(declare-fun lt!141467 () (_ BitVec 64))

(declare-fun lt!141454 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3666 (_ BitVec 64)) BitStream!3666)

(assert (=> b!97833 (= e!64062 (= (_1!4181 lt!141458) (withMovedBitIndex!0 (_2!4181 lt!141458) (bvsub lt!141454 lt!141467))))))

(assert (=> b!97833 (or (= (bvand lt!141454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141454 lt!141467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97833 (= lt!141467 (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141371))) (currentByte!4865 (_2!4180 lt!141371)) (currentBit!4860 (_2!4180 lt!141371))))))

(assert (=> b!97833 (= lt!141454 (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)))))

(declare-fun b!97834 () Bool)

(declare-fun e!64061 () Unit!5962)

(declare-fun lt!141466 () Unit!5962)

(assert (=> b!97834 (= e!64061 lt!141466)))

(declare-fun lt!141459 () (_ BitVec 64))

(assert (=> b!97834 (= lt!141459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!141460 () (_ BitVec 64))

(assert (=> b!97834 (= lt!141460 (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4584 array!4584 (_ BitVec 64) (_ BitVec 64)) Unit!5962)

(assert (=> b!97834 (= lt!141466 (arrayBitRangesEqSymmetric!0 (buf!2444 thiss!1288) (buf!2444 (_2!4180 lt!141371)) lt!141459 lt!141460))))

(assert (=> b!97834 (arrayBitRangesEq!0 (buf!2444 (_2!4180 lt!141371)) (buf!2444 thiss!1288) lt!141459 lt!141460)))

(declare-fun b!97835 () Bool)

(declare-fun res!80278 () Bool)

(assert (=> b!97835 (=> (not res!80278) (not e!64062))))

(assert (=> b!97835 (= res!80278 (isPrefixOf!0 (_2!4181 lt!141458) (_2!4180 lt!141371)))))

(declare-fun d!30684 () Bool)

(assert (=> d!30684 e!64062))

(declare-fun res!80277 () Bool)

(assert (=> d!30684 (=> (not res!80277) (not e!64062))))

(assert (=> d!30684 (= res!80277 (isPrefixOf!0 (_1!4181 lt!141458) (_2!4181 lt!141458)))))

(declare-fun lt!141471 () BitStream!3666)

(assert (=> d!30684 (= lt!141458 (tuple2!7859 lt!141471 (_2!4180 lt!141371)))))

(declare-fun lt!141473 () Unit!5962)

(declare-fun lt!141462 () Unit!5962)

(assert (=> d!30684 (= lt!141473 lt!141462)))

(assert (=> d!30684 (isPrefixOf!0 lt!141471 (_2!4180 lt!141371))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3666 BitStream!3666 BitStream!3666) Unit!5962)

(assert (=> d!30684 (= lt!141462 (lemmaIsPrefixTransitive!0 lt!141471 (_2!4180 lt!141371) (_2!4180 lt!141371)))))

(declare-fun lt!141455 () Unit!5962)

(declare-fun lt!141470 () Unit!5962)

(assert (=> d!30684 (= lt!141455 lt!141470)))

(assert (=> d!30684 (isPrefixOf!0 lt!141471 (_2!4180 lt!141371))))

(assert (=> d!30684 (= lt!141470 (lemmaIsPrefixTransitive!0 lt!141471 thiss!1288 (_2!4180 lt!141371)))))

(declare-fun lt!141472 () Unit!5962)

(assert (=> d!30684 (= lt!141472 e!64061)))

(declare-fun c!6173 () Bool)

(assert (=> d!30684 (= c!6173 (not (= (size!2096 (buf!2444 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!141464 () Unit!5962)

(declare-fun lt!141463 () Unit!5962)

(assert (=> d!30684 (= lt!141464 lt!141463)))

(assert (=> d!30684 (isPrefixOf!0 (_2!4180 lt!141371) (_2!4180 lt!141371))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3666) Unit!5962)

(assert (=> d!30684 (= lt!141463 (lemmaIsPrefixRefl!0 (_2!4180 lt!141371)))))

(declare-fun lt!141465 () Unit!5962)

(declare-fun lt!141457 () Unit!5962)

(assert (=> d!30684 (= lt!141465 lt!141457)))

(assert (=> d!30684 (= lt!141457 (lemmaIsPrefixRefl!0 (_2!4180 lt!141371)))))

(declare-fun lt!141461 () Unit!5962)

(declare-fun lt!141469 () Unit!5962)

(assert (=> d!30684 (= lt!141461 lt!141469)))

(assert (=> d!30684 (isPrefixOf!0 lt!141471 lt!141471)))

(assert (=> d!30684 (= lt!141469 (lemmaIsPrefixRefl!0 lt!141471))))

(declare-fun lt!141456 () Unit!5962)

(declare-fun lt!141468 () Unit!5962)

(assert (=> d!30684 (= lt!141456 lt!141468)))

(assert (=> d!30684 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30684 (= lt!141468 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30684 (= lt!141471 (BitStream!3667 (buf!2444 (_2!4180 lt!141371)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)))))

(assert (=> d!30684 (isPrefixOf!0 thiss!1288 (_2!4180 lt!141371))))

(assert (=> d!30684 (= (reader!0 thiss!1288 (_2!4180 lt!141371)) lt!141458)))

(declare-fun b!97836 () Bool)

(declare-fun res!80279 () Bool)

(assert (=> b!97836 (=> (not res!80279) (not e!64062))))

(assert (=> b!97836 (= res!80279 (isPrefixOf!0 (_1!4181 lt!141458) thiss!1288))))

(declare-fun b!97837 () Bool)

(declare-fun Unit!5966 () Unit!5962)

(assert (=> b!97837 (= e!64061 Unit!5966)))

(assert (= (and d!30684 c!6173) b!97834))

(assert (= (and d!30684 (not c!6173)) b!97837))

(assert (= (and d!30684 res!80277) b!97836))

(assert (= (and b!97836 res!80279) b!97835))

(assert (= (and b!97835 res!80278) b!97833))

(assert (=> b!97834 m!142041))

(declare-fun m!142107 () Bool)

(assert (=> b!97834 m!142107))

(declare-fun m!142109 () Bool)

(assert (=> b!97834 m!142109))

(assert (=> d!30684 m!142055))

(declare-fun m!142111 () Bool)

(assert (=> d!30684 m!142111))

(declare-fun m!142113 () Bool)

(assert (=> d!30684 m!142113))

(declare-fun m!142115 () Bool)

(assert (=> d!30684 m!142115))

(declare-fun m!142117 () Bool)

(assert (=> d!30684 m!142117))

(declare-fun m!142119 () Bool)

(assert (=> d!30684 m!142119))

(declare-fun m!142121 () Bool)

(assert (=> d!30684 m!142121))

(declare-fun m!142123 () Bool)

(assert (=> d!30684 m!142123))

(declare-fun m!142125 () Bool)

(assert (=> d!30684 m!142125))

(declare-fun m!142127 () Bool)

(assert (=> d!30684 m!142127))

(declare-fun m!142129 () Bool)

(assert (=> d!30684 m!142129))

(declare-fun m!142131 () Bool)

(assert (=> b!97836 m!142131))

(declare-fun m!142133 () Bool)

(assert (=> b!97835 m!142133))

(declare-fun m!142135 () Bool)

(assert (=> b!97833 m!142135))

(assert (=> b!97833 m!142039))

(assert (=> b!97833 m!142041))

(assert (=> b!97778 d!30684))

(declare-fun b!97927 () Bool)

(declare-fun e!64113 () Bool)

(declare-datatypes ((tuple2!7864 0))(
  ( (tuple2!7865 (_1!4184 BitStream!3666) (_2!4184 Bool)) )
))
(declare-fun lt!141778 () tuple2!7864)

(declare-fun lt!141757 () tuple2!7864)

(assert (=> b!97927 (= e!64113 (= (_2!4184 lt!141778) (_2!4184 lt!141757)))))

(declare-fun bm!1206 () Bool)

(declare-fun lt!141796 () tuple2!7856)

(declare-fun call!1209 () Bool)

(declare-fun c!6188 () Bool)

(declare-fun lt!141785 () BitStream!3666)

(assert (=> bm!1206 (= call!1209 (isPrefixOf!0 (ite c!6188 thiss!1288 lt!141785) (ite c!6188 (_2!4180 lt!141796) lt!141785)))))

(declare-fun b!97928 () Bool)

(declare-fun e!64111 () tuple2!7856)

(declare-fun lt!141786 () Unit!5962)

(assert (=> b!97928 (= e!64111 (tuple2!7857 lt!141786 thiss!1288))))

(assert (=> b!97928 (= lt!141785 thiss!1288)))

(assert (=> b!97928 (= lt!141786 (lemmaIsPrefixRefl!0 lt!141785))))

(assert (=> b!97928 call!1209))

(declare-fun b!97929 () Bool)

(declare-fun lt!141767 () tuple2!7864)

(declare-fun lt!141770 () tuple2!7856)

(declare-fun readBitPure!0 (BitStream!3666) tuple2!7864)

(declare-fun readerFrom!0 (BitStream!3666 (_ BitVec 32) (_ BitVec 32)) BitStream!3666)

(assert (=> b!97929 (= lt!141767 (readBitPure!0 (readerFrom!0 (_2!4180 lt!141770) (currentBit!4860 thiss!1288) (currentByte!4865 thiss!1288))))))

(declare-fun lt!141777 () Bool)

(declare-fun res!80344 () Bool)

(assert (=> b!97929 (= res!80344 (and (= (_2!4184 lt!141767) lt!141777) (= (_1!4184 lt!141767) (_2!4180 lt!141770))))))

(declare-fun e!64110 () Bool)

(assert (=> b!97929 (=> (not res!80344) (not e!64110))))

(declare-fun e!64115 () Bool)

(assert (=> b!97929 (= e!64115 e!64110)))

(declare-fun b!97930 () Bool)

(declare-fun e!64112 () Bool)

(declare-fun lt!141752 () tuple2!7858)

(declare-datatypes ((tuple2!7866 0))(
  ( (tuple2!7867 (_1!4185 BitStream!3666) (_2!4185 (_ BitVec 64))) )
))
(declare-fun lt!141773 () tuple2!7866)

(assert (=> b!97930 (= e!64112 (and (= (_2!4185 lt!141773) v!196) (= (_1!4185 lt!141773) (_2!4181 lt!141752))))))

(declare-fun lt!141753 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7866)

(assert (=> b!97930 (= lt!141773 (readNLeastSignificantBitsLoopPure!0 (_1!4181 lt!141752) nBits!388 #b00000000000000000000000000000000 lt!141753))))

(declare-fun lt!141754 () Unit!5962)

(declare-fun lt!141765 () Unit!5962)

(assert (=> b!97930 (= lt!141754 lt!141765)))

(declare-fun lt!141775 () tuple2!7856)

(declare-fun lt!141762 () (_ BitVec 64))

(assert (=> b!97930 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141775)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) lt!141762)))

(assert (=> b!97930 (= lt!141765 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2444 (_2!4180 lt!141775)) lt!141762))))

(declare-fun e!64114 () Bool)

(assert (=> b!97930 e!64114))

(declare-fun res!80343 () Bool)

(assert (=> b!97930 (=> (not res!80343) (not e!64114))))

(assert (=> b!97930 (= res!80343 (and (= (size!2096 (buf!2444 thiss!1288)) (size!2096 (buf!2444 (_2!4180 lt!141775)))) (bvsge lt!141762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97930 (= lt!141762 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97930 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97930 (= lt!141753 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97930 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97930 (= lt!141752 (reader!0 thiss!1288 (_2!4180 lt!141775)))))

(declare-fun b!97931 () Bool)

(declare-fun e!64109 () (_ BitVec 64))

(assert (=> b!97931 (= e!64109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97932 () Bool)

(assert (=> b!97932 (= e!64114 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) lt!141762))))

(declare-fun b!97933 () Bool)

(assert (=> b!97933 (= e!64109 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97934 () Bool)

(declare-fun res!80345 () Bool)

(assert (=> b!97934 (= res!80345 (isPrefixOf!0 thiss!1288 (_2!4180 lt!141770)))))

(assert (=> b!97934 (=> (not res!80345) (not e!64115))))

(declare-fun b!97935 () Bool)

(declare-fun res!80348 () Bool)

(assert (=> b!97935 (=> (not res!80348) (not e!64112))))

(declare-fun lt!141790 () (_ BitVec 64))

(declare-fun lt!141792 () (_ BitVec 64))

(assert (=> b!97935 (= res!80348 (= (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141775))) (currentByte!4865 (_2!4180 lt!141775)) (currentBit!4860 (_2!4180 lt!141775))) (bvadd lt!141790 lt!141792)))))

(assert (=> b!97935 (or (not (= (bvand lt!141790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141792 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141790 lt!141792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97935 (= lt!141792 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97935 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97935 (= lt!141790 (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)))))

(declare-fun b!97936 () Bool)

(assert (=> b!97936 (= e!64110 (= (bitIndex!0 (size!2096 (buf!2444 (_1!4184 lt!141767))) (currentByte!4865 (_1!4184 lt!141767)) (currentBit!4860 (_1!4184 lt!141767))) (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141770))) (currentByte!4865 (_2!4180 lt!141770)) (currentBit!4860 (_2!4180 lt!141770)))))))

(declare-fun b!97937 () Bool)

(declare-fun res!80349 () Bool)

(assert (=> b!97937 (=> (not res!80349) (not e!64112))))

(assert (=> b!97937 (= res!80349 (isPrefixOf!0 thiss!1288 (_2!4180 lt!141775)))))

(declare-fun b!97938 () Bool)

(declare-fun res!80346 () Bool)

(assert (=> b!97938 (= res!80346 (= (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141770))) (currentByte!4865 (_2!4180 lt!141770)) (currentBit!4860 (_2!4180 lt!141770))) (bvadd (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97938 (=> (not res!80346) (not e!64115))))

(declare-fun d!30710 () Bool)

(assert (=> d!30710 e!64112))

(declare-fun res!80347 () Bool)

(assert (=> d!30710 (=> (not res!80347) (not e!64112))))

(assert (=> d!30710 (= res!80347 (= (size!2096 (buf!2444 thiss!1288)) (size!2096 (buf!2444 (_2!4180 lt!141775)))))))

(assert (=> d!30710 (= lt!141775 e!64111)))

(assert (=> d!30710 (= c!6188 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30710 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30710 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!141775)))

(declare-fun b!97939 () Bool)

(declare-fun Unit!5968 () Unit!5962)

(assert (=> b!97939 (= e!64111 (tuple2!7857 Unit!5968 (_2!4180 lt!141796)))))

(assert (=> b!97939 (= lt!141777 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3666 Bool) tuple2!7856)

(assert (=> b!97939 (= lt!141770 (appendBit!0 thiss!1288 lt!141777))))

(declare-fun res!80350 () Bool)

(assert (=> b!97939 (= res!80350 (= (size!2096 (buf!2444 thiss!1288)) (size!2096 (buf!2444 (_2!4180 lt!141770)))))))

(assert (=> b!97939 (=> (not res!80350) (not e!64115))))

(assert (=> b!97939 e!64115))

(declare-fun lt!141784 () tuple2!7856)

(assert (=> b!97939 (= lt!141784 lt!141770)))

(assert (=> b!97939 (= lt!141796 (appendNLeastSignificantBitsLoop!0 (_2!4180 lt!141784) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!141791 () Unit!5962)

(assert (=> b!97939 (= lt!141791 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4180 lt!141784) (_2!4180 lt!141796)))))

(assert (=> b!97939 call!1209))

(declare-fun lt!141789 () Unit!5962)

(assert (=> b!97939 (= lt!141789 lt!141791)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!97939 (invariant!0 (currentBit!4860 thiss!1288) (currentByte!4865 thiss!1288) (size!2096 (buf!2444 (_2!4180 lt!141784))))))

(declare-fun lt!141756 () BitStream!3666)

(assert (=> b!97939 (= lt!141756 (BitStream!3667 (buf!2444 (_2!4180 lt!141784)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)))))

(assert (=> b!97939 (invariant!0 (currentBit!4860 lt!141756) (currentByte!4865 lt!141756) (size!2096 (buf!2444 (_2!4180 lt!141796))))))

(declare-fun lt!141776 () BitStream!3666)

(assert (=> b!97939 (= lt!141776 (BitStream!3667 (buf!2444 (_2!4180 lt!141796)) (currentByte!4865 lt!141756) (currentBit!4860 lt!141756)))))

(assert (=> b!97939 (= lt!141778 (readBitPure!0 lt!141756))))

(assert (=> b!97939 (= lt!141757 (readBitPure!0 lt!141776))))

(declare-fun lt!141774 () Unit!5962)

(declare-fun readBitPrefixLemma!0 (BitStream!3666 BitStream!3666) Unit!5962)

(assert (=> b!97939 (= lt!141774 (readBitPrefixLemma!0 lt!141756 (_2!4180 lt!141796)))))

(declare-fun res!80351 () Bool)

(assert (=> b!97939 (= res!80351 (= (bitIndex!0 (size!2096 (buf!2444 (_1!4184 lt!141778))) (currentByte!4865 (_1!4184 lt!141778)) (currentBit!4860 (_1!4184 lt!141778))) (bitIndex!0 (size!2096 (buf!2444 (_1!4184 lt!141757))) (currentByte!4865 (_1!4184 lt!141757)) (currentBit!4860 (_1!4184 lt!141757)))))))

(assert (=> b!97939 (=> (not res!80351) (not e!64113))))

(assert (=> b!97939 e!64113))

(declare-fun lt!141758 () Unit!5962)

(assert (=> b!97939 (= lt!141758 lt!141774)))

(declare-fun lt!141780 () tuple2!7858)

(assert (=> b!97939 (= lt!141780 (reader!0 thiss!1288 (_2!4180 lt!141796)))))

(declare-fun lt!141794 () tuple2!7858)

(assert (=> b!97939 (= lt!141794 (reader!0 (_2!4180 lt!141784) (_2!4180 lt!141796)))))

(declare-fun lt!141763 () tuple2!7864)

(assert (=> b!97939 (= lt!141763 (readBitPure!0 (_1!4181 lt!141780)))))

(assert (=> b!97939 (= (_2!4184 lt!141763) lt!141777)))

(declare-fun lt!141771 () Unit!5962)

(declare-fun Unit!5969 () Unit!5962)

(assert (=> b!97939 (= lt!141771 Unit!5969)))

(declare-fun lt!141760 () (_ BitVec 64))

(assert (=> b!97939 (= lt!141760 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!141764 () (_ BitVec 64))

(assert (=> b!97939 (= lt!141764 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!141768 () Unit!5962)

(assert (=> b!97939 (= lt!141768 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2444 (_2!4180 lt!141796)) lt!141764))))

(assert (=> b!97939 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141796)))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) lt!141764)))

(declare-fun lt!141795 () Unit!5962)

(assert (=> b!97939 (= lt!141795 lt!141768)))

(declare-fun lt!141782 () tuple2!7866)

(assert (=> b!97939 (= lt!141782 (readNLeastSignificantBitsLoopPure!0 (_1!4181 lt!141780) nBits!388 #b00000000000000000000000000000000 lt!141760))))

(declare-fun lt!141769 () (_ BitVec 64))

(assert (=> b!97939 (= lt!141769 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!141781 () Unit!5962)

(assert (=> b!97939 (= lt!141781 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4180 lt!141784) (buf!2444 (_2!4180 lt!141796)) lt!141769))))

(assert (=> b!97939 (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141796)))) ((_ sign_extend 32) (currentByte!4865 (_2!4180 lt!141784))) ((_ sign_extend 32) (currentBit!4860 (_2!4180 lt!141784))) lt!141769)))

(declare-fun lt!141788 () Unit!5962)

(assert (=> b!97939 (= lt!141788 lt!141781)))

(declare-fun lt!141761 () tuple2!7866)

(assert (=> b!97939 (= lt!141761 (readNLeastSignificantBitsLoopPure!0 (_1!4181 lt!141794) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141760 (ite (_2!4184 lt!141763) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!141772 () tuple2!7866)

(assert (=> b!97939 (= lt!141772 (readNLeastSignificantBitsLoopPure!0 (_1!4181 lt!141780) nBits!388 #b00000000000000000000000000000000 lt!141760))))

(declare-fun c!6189 () Bool)

(assert (=> b!97939 (= c!6189 (_2!4184 (readBitPure!0 (_1!4181 lt!141780))))))

(declare-fun lt!141755 () tuple2!7866)

(assert (=> b!97939 (= lt!141755 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4181 lt!141780) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141760 e!64109)))))

(declare-fun lt!141759 () Unit!5962)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5962)

(assert (=> b!97939 (= lt!141759 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4181 lt!141780) nBits!388 #b00000000000000000000000000000000 lt!141760))))

(assert (=> b!97939 (and (= (_2!4185 lt!141772) (_2!4185 lt!141755)) (= (_1!4185 lt!141772) (_1!4185 lt!141755)))))

(declare-fun lt!141787 () Unit!5962)

(assert (=> b!97939 (= lt!141787 lt!141759)))

(assert (=> b!97939 (= (_1!4181 lt!141780) (withMovedBitIndex!0 (_2!4181 lt!141780) (bvsub (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141796))) (currentByte!4865 (_2!4180 lt!141796)) (currentBit!4860 (_2!4180 lt!141796))))))))

(declare-fun lt!141783 () Unit!5962)

(declare-fun Unit!5971 () Unit!5962)

(assert (=> b!97939 (= lt!141783 Unit!5971)))

(assert (=> b!97939 (= (_1!4181 lt!141794) (withMovedBitIndex!0 (_2!4181 lt!141794) (bvsub (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141784))) (currentByte!4865 (_2!4180 lt!141784)) (currentBit!4860 (_2!4180 lt!141784))) (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141796))) (currentByte!4865 (_2!4180 lt!141796)) (currentBit!4860 (_2!4180 lt!141796))))))))

(declare-fun lt!141766 () Unit!5962)

(declare-fun Unit!5972 () Unit!5962)

(assert (=> b!97939 (= lt!141766 Unit!5972)))

(assert (=> b!97939 (= (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) (bvsub (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141784))) (currentByte!4865 (_2!4180 lt!141784)) (currentBit!4860 (_2!4180 lt!141784))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!141779 () Unit!5962)

(declare-fun Unit!5973 () Unit!5962)

(assert (=> b!97939 (= lt!141779 Unit!5973)))

(assert (=> b!97939 (= (_2!4185 lt!141782) (_2!4185 lt!141761))))

(declare-fun lt!141793 () Unit!5962)

(declare-fun Unit!5974 () Unit!5962)

(assert (=> b!97939 (= lt!141793 Unit!5974)))

(assert (=> b!97939 (= (_1!4185 lt!141782) (_2!4181 lt!141780))))

(assert (= (and d!30710 c!6188) b!97939))

(assert (= (and d!30710 (not c!6188)) b!97928))

(assert (= (and b!97939 res!80350) b!97938))

(assert (= (and b!97938 res!80346) b!97934))

(assert (= (and b!97934 res!80345) b!97929))

(assert (= (and b!97929 res!80344) b!97936))

(assert (= (and b!97939 res!80351) b!97927))

(assert (= (and b!97939 c!6189) b!97933))

(assert (= (and b!97939 (not c!6189)) b!97931))

(assert (= (or b!97939 b!97928) bm!1206))

(assert (= (and d!30710 res!80347) b!97935))

(assert (= (and b!97935 res!80348) b!97937))

(assert (= (and b!97937 res!80349) b!97930))

(assert (= (and b!97930 res!80343) b!97932))

(declare-fun m!142199 () Bool)

(assert (=> b!97932 m!142199))

(declare-fun m!142201 () Bool)

(assert (=> b!97936 m!142201))

(declare-fun m!142203 () Bool)

(assert (=> b!97936 m!142203))

(declare-fun m!142205 () Bool)

(assert (=> b!97935 m!142205))

(assert (=> b!97935 m!142041))

(declare-fun m!142207 () Bool)

(assert (=> b!97929 m!142207))

(assert (=> b!97929 m!142207))

(declare-fun m!142209 () Bool)

(assert (=> b!97929 m!142209))

(declare-fun m!142211 () Bool)

(assert (=> b!97939 m!142211))

(declare-fun m!142213 () Bool)

(assert (=> b!97939 m!142213))

(declare-fun m!142215 () Bool)

(assert (=> b!97939 m!142215))

(declare-fun m!142217 () Bool)

(assert (=> b!97939 m!142217))

(declare-fun m!142219 () Bool)

(assert (=> b!97939 m!142219))

(declare-fun m!142221 () Bool)

(assert (=> b!97939 m!142221))

(declare-fun m!142223 () Bool)

(assert (=> b!97939 m!142223))

(declare-fun m!142225 () Bool)

(assert (=> b!97939 m!142225))

(declare-fun m!142227 () Bool)

(assert (=> b!97939 m!142227))

(declare-fun m!142229 () Bool)

(assert (=> b!97939 m!142229))

(declare-fun m!142231 () Bool)

(assert (=> b!97939 m!142231))

(declare-fun m!142233 () Bool)

(assert (=> b!97939 m!142233))

(declare-fun m!142235 () Bool)

(assert (=> b!97939 m!142235))

(declare-fun m!142237 () Bool)

(assert (=> b!97939 m!142237))

(declare-fun m!142239 () Bool)

(assert (=> b!97939 m!142239))

(declare-fun m!142241 () Bool)

(assert (=> b!97939 m!142241))

(declare-fun m!142243 () Bool)

(assert (=> b!97939 m!142243))

(declare-fun m!142245 () Bool)

(assert (=> b!97939 m!142245))

(declare-fun m!142247 () Bool)

(assert (=> b!97939 m!142247))

(declare-fun m!142249 () Bool)

(assert (=> b!97939 m!142249))

(declare-fun m!142251 () Bool)

(assert (=> b!97939 m!142251))

(declare-fun m!142253 () Bool)

(assert (=> b!97939 m!142253))

(declare-fun m!142255 () Bool)

(assert (=> b!97939 m!142255))

(assert (=> b!97939 m!142041))

(declare-fun m!142257 () Bool)

(assert (=> b!97939 m!142257))

(declare-fun m!142259 () Bool)

(assert (=> b!97939 m!142259))

(assert (=> b!97939 m!142227))

(declare-fun m!142261 () Bool)

(assert (=> b!97939 m!142261))

(declare-fun m!142263 () Bool)

(assert (=> b!97939 m!142263))

(declare-fun m!142265 () Bool)

(assert (=> bm!1206 m!142265))

(declare-fun m!142267 () Bool)

(assert (=> b!97928 m!142267))

(assert (=> b!97938 m!142203))

(assert (=> b!97938 m!142041))

(declare-fun m!142269 () Bool)

(assert (=> b!97934 m!142269))

(declare-fun m!142271 () Bool)

(assert (=> b!97937 m!142271))

(assert (=> b!97930 m!142211))

(declare-fun m!142273 () Bool)

(assert (=> b!97930 m!142273))

(declare-fun m!142275 () Bool)

(assert (=> b!97930 m!142275))

(declare-fun m!142277 () Bool)

(assert (=> b!97930 m!142277))

(declare-fun m!142279 () Bool)

(assert (=> b!97930 m!142279))

(assert (=> b!97777 d!30710))

(declare-fun d!30720 () Bool)

(assert (=> d!30720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7522 () Bool)

(assert (= bs!7522 d!30720))

(declare-fun m!142281 () Bool)

(assert (=> bs!7522 m!142281))

(assert (=> b!97776 d!30720))

(declare-fun d!30722 () Bool)

(assert (=> d!30722 (= (array_inv!1898 (buf!2444 thiss!1288)) (bvsge (size!2096 (buf!2444 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!97781 d!30722))

(declare-fun d!30724 () Bool)

(assert (=> d!30724 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!97775 d!30724))

(declare-fun d!30726 () Bool)

(declare-fun e!64125 () Bool)

(assert (=> d!30726 e!64125))

(declare-fun res!80365 () Bool)

(assert (=> d!30726 (=> (not res!80365) (not e!64125))))

(declare-fun lt!141859 () (_ BitVec 64))

(declare-fun lt!141858 () (_ BitVec 64))

(declare-fun lt!141857 () (_ BitVec 64))

(assert (=> d!30726 (= res!80365 (= lt!141858 (bvsub lt!141857 lt!141859)))))

(assert (=> d!30726 (or (= (bvand lt!141857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141857 lt!141859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30726 (= lt!141859 (remainingBits!0 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))) ((_ sign_extend 32) (currentByte!4865 (_2!4180 lt!141371))) ((_ sign_extend 32) (currentBit!4860 (_2!4180 lt!141371)))))))

(declare-fun lt!141854 () (_ BitVec 64))

(declare-fun lt!141855 () (_ BitVec 64))

(assert (=> d!30726 (= lt!141857 (bvmul lt!141854 lt!141855))))

(assert (=> d!30726 (or (= lt!141854 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!141855 (bvsdiv (bvmul lt!141854 lt!141855) lt!141854)))))

(assert (=> d!30726 (= lt!141855 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30726 (= lt!141854 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))))))

(assert (=> d!30726 (= lt!141858 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4865 (_2!4180 lt!141371))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4860 (_2!4180 lt!141371)))))))

(assert (=> d!30726 (invariant!0 (currentBit!4860 (_2!4180 lt!141371)) (currentByte!4865 (_2!4180 lt!141371)) (size!2096 (buf!2444 (_2!4180 lt!141371))))))

(assert (=> d!30726 (= (bitIndex!0 (size!2096 (buf!2444 (_2!4180 lt!141371))) (currentByte!4865 (_2!4180 lt!141371)) (currentBit!4860 (_2!4180 lt!141371))) lt!141858)))

(declare-fun b!97957 () Bool)

(declare-fun res!80366 () Bool)

(assert (=> b!97957 (=> (not res!80366) (not e!64125))))

(assert (=> b!97957 (= res!80366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!141858))))

(declare-fun b!97958 () Bool)

(declare-fun lt!141856 () (_ BitVec 64))

(assert (=> b!97958 (= e!64125 (bvsle lt!141858 (bvmul lt!141856 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97958 (or (= lt!141856 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!141856 #b0000000000000000000000000000000000000000000000000000000000001000) lt!141856)))))

(assert (=> b!97958 (= lt!141856 ((_ sign_extend 32) (size!2096 (buf!2444 (_2!4180 lt!141371)))))))

(assert (= (and d!30726 res!80365) b!97957))

(assert (= (and b!97957 res!80366) b!97958))

(declare-fun m!142365 () Bool)

(assert (=> d!30726 m!142365))

(declare-fun m!142367 () Bool)

(assert (=> d!30726 m!142367))

(assert (=> b!97780 d!30726))

(declare-fun d!30734 () Bool)

(declare-fun e!64126 () Bool)

(assert (=> d!30734 e!64126))

(declare-fun res!80367 () Bool)

(assert (=> d!30734 (=> (not res!80367) (not e!64126))))

(declare-fun lt!141865 () (_ BitVec 64))

(declare-fun lt!141863 () (_ BitVec 64))

(declare-fun lt!141864 () (_ BitVec 64))

(assert (=> d!30734 (= res!80367 (= lt!141864 (bvsub lt!141863 lt!141865)))))

(assert (=> d!30734 (or (= (bvand lt!141863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141863 lt!141865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30734 (= lt!141865 (remainingBits!0 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))) ((_ sign_extend 32) (currentByte!4865 thiss!1288)) ((_ sign_extend 32) (currentBit!4860 thiss!1288))))))

(declare-fun lt!141860 () (_ BitVec 64))

(declare-fun lt!141861 () (_ BitVec 64))

(assert (=> d!30734 (= lt!141863 (bvmul lt!141860 lt!141861))))

(assert (=> d!30734 (or (= lt!141860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!141861 (bvsdiv (bvmul lt!141860 lt!141861) lt!141860)))))

(assert (=> d!30734 (= lt!141861 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30734 (= lt!141860 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))))))

(assert (=> d!30734 (= lt!141864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4865 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4860 thiss!1288))))))

(assert (=> d!30734 (invariant!0 (currentBit!4860 thiss!1288) (currentByte!4865 thiss!1288) (size!2096 (buf!2444 thiss!1288)))))

(assert (=> d!30734 (= (bitIndex!0 (size!2096 (buf!2444 thiss!1288)) (currentByte!4865 thiss!1288) (currentBit!4860 thiss!1288)) lt!141864)))

(declare-fun b!97959 () Bool)

(declare-fun res!80368 () Bool)

(assert (=> b!97959 (=> (not res!80368) (not e!64126))))

(assert (=> b!97959 (= res!80368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!141864))))

(declare-fun b!97960 () Bool)

(declare-fun lt!141862 () (_ BitVec 64))

(assert (=> b!97960 (= e!64126 (bvsle lt!141864 (bvmul lt!141862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97960 (or (= lt!141862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!141862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!141862)))))

(assert (=> b!97960 (= lt!141862 ((_ sign_extend 32) (size!2096 (buf!2444 thiss!1288))))))

(assert (= (and d!30734 res!80367) b!97959))

(assert (= (and b!97959 res!80368) b!97960))

(assert (=> d!30734 m!142281))

(declare-fun m!142369 () Bool)

(assert (=> d!30734 m!142369))

(assert (=> b!97780 d!30734))

(declare-fun d!30736 () Bool)

(assert (=> d!30736 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4860 thiss!1288) (currentByte!4865 thiss!1288) (size!2096 (buf!2444 thiss!1288))))))

(declare-fun bs!7523 () Bool)

(assert (= bs!7523 d!30736))

(assert (=> bs!7523 m!142369))

(assert (=> start!19580 d!30736))

(check-sat (not b!97930) (not d!30682) (not b!97939) (not d!30720) (not b!97932) (not b!97833) (not b!97811) (not b!97835) (not b!97936) (not d!30678) (not d!30734) (not d!30680) (not b!97935) (not d!30726) (not b!97934) (not b!97836) (not b!97928) (not d!30736) (not b!97937) (not d!30684) (not b!97809) (not b!97929) (not b!97938) (not bm!1206) (not b!97834))
(check-sat)
