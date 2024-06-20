; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20114 () Bool)

(assert start!20114)

(declare-fun b!100641 () Bool)

(declare-fun e!65837 () Bool)

(declare-datatypes ((array!4732 0))(
  ( (array!4733 (arr!2753 (Array (_ BitVec 32) (_ BitVec 8))) (size!2160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3794 0))(
  ( (BitStream!3795 (buf!2517 array!4732) (currentByte!4972 (_ BitVec 32)) (currentBit!4967 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8128 0))(
  ( (tuple2!8129 (_1!4319 BitStream!3794) (_2!4319 Bool)) )
))
(declare-fun lt!145821 () tuple2!8128)

(declare-fun lt!145810 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100641 (= e!65837 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145821))) (currentByte!4972 (_1!4319 lt!145821)) (currentBit!4967 (_1!4319 lt!145821))) lt!145810))))

(declare-fun b!100642 () Bool)

(declare-fun e!65833 () Bool)

(declare-datatypes ((tuple2!8130 0))(
  ( (tuple2!8131 (_1!4320 BitStream!3794) (_2!4320 BitStream!3794)) )
))
(declare-fun lt!145822 () tuple2!8130)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100642 (= e!65833 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4320 lt!145822)))) ((_ sign_extend 32) (currentByte!4972 (_1!4320 lt!145822))) ((_ sign_extend 32) (currentBit!4967 (_1!4320 lt!145822))))))))

(declare-fun lt!145819 () tuple2!8130)

(declare-datatypes ((Unit!6168 0))(
  ( (Unit!6169) )
))
(declare-datatypes ((tuple2!8132 0))(
  ( (tuple2!8133 (_1!4321 Unit!6168) (_2!4321 BitStream!3794)) )
))
(declare-fun lt!145813 () tuple2!8132)

(declare-fun lt!145811 () tuple2!8132)

(declare-fun reader!0 (BitStream!3794 BitStream!3794) tuple2!8130)

(assert (=> b!100642 (= lt!145819 (reader!0 (_2!4321 lt!145813) (_2!4321 lt!145811)))))

(declare-fun thiss!1305 () BitStream!3794)

(assert (=> b!100642 (= lt!145822 (reader!0 thiss!1305 (_2!4321 lt!145811)))))

(declare-fun e!65836 () Bool)

(assert (=> b!100642 e!65836))

(declare-fun res!82658 () Bool)

(assert (=> b!100642 (=> (not res!82658) (not e!65836))))

(declare-fun lt!145814 () tuple2!8128)

(declare-fun lt!145816 () tuple2!8128)

(assert (=> b!100642 (= res!82658 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145814))) (currentByte!4972 (_1!4319 lt!145814)) (currentBit!4967 (_1!4319 lt!145814))) (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145816))) (currentByte!4972 (_1!4319 lt!145816)) (currentBit!4967 (_1!4319 lt!145816)))))))

(declare-fun lt!145818 () Unit!6168)

(declare-fun lt!145820 () BitStream!3794)

(declare-fun readBitPrefixLemma!0 (BitStream!3794 BitStream!3794) Unit!6168)

(assert (=> b!100642 (= lt!145818 (readBitPrefixLemma!0 lt!145820 (_2!4321 lt!145811)))))

(declare-fun readBitPure!0 (BitStream!3794) tuple2!8128)

(assert (=> b!100642 (= lt!145816 (readBitPure!0 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305))))))

(assert (=> b!100642 (= lt!145814 (readBitPure!0 lt!145820))))

(assert (=> b!100642 (= lt!145820 (BitStream!3795 (buf!2517 (_2!4321 lt!145813)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(declare-fun e!65835 () Bool)

(assert (=> b!100642 e!65835))

(declare-fun res!82659 () Bool)

(assert (=> b!100642 (=> (not res!82659) (not e!65835))))

(declare-fun isPrefixOf!0 (BitStream!3794 BitStream!3794) Bool)

(assert (=> b!100642 (= res!82659 (isPrefixOf!0 thiss!1305 (_2!4321 lt!145811)))))

(declare-fun lt!145817 () Unit!6168)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3794 BitStream!3794 BitStream!3794) Unit!6168)

(assert (=> b!100642 (= lt!145817 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4321 lt!145813) (_2!4321 lt!145811)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3794 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8132)

(assert (=> b!100642 (= lt!145811 (appendNLeastSignificantBitsLoop!0 (_2!4321 lt!145813) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65831 () Bool)

(assert (=> b!100642 e!65831))

(declare-fun res!82661 () Bool)

(assert (=> b!100642 (=> (not res!82661) (not e!65831))))

(assert (=> b!100642 (= res!82661 (= (size!2160 (buf!2517 thiss!1305)) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(declare-fun lt!145815 () Bool)

(declare-fun appendBit!0 (BitStream!3794 Bool) tuple2!8132)

(assert (=> b!100642 (= lt!145813 (appendBit!0 thiss!1305 lt!145815))))

(assert (=> b!100642 (= lt!145815 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100643 () Bool)

(declare-fun res!82657 () Bool)

(assert (=> b!100643 (=> (not res!82657) (not e!65835))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100643 (= res!82657 (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(declare-fun b!100645 () Bool)

(assert (=> b!100645 (= e!65835 (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145811)))))))

(declare-fun b!100646 () Bool)

(declare-fun e!65834 () Bool)

(assert (=> b!100646 (= e!65831 e!65834)))

(declare-fun res!82651 () Bool)

(assert (=> b!100646 (=> (not res!82651) (not e!65834))))

(declare-fun lt!145812 () (_ BitVec 64))

(assert (=> b!100646 (= res!82651 (= lt!145810 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!145812)))))

(assert (=> b!100646 (= lt!145810 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(assert (=> b!100646 (= lt!145812 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(declare-fun b!100647 () Bool)

(assert (=> b!100647 (= e!65834 e!65837)))

(declare-fun res!82652 () Bool)

(assert (=> b!100647 (=> (not res!82652) (not e!65837))))

(assert (=> b!100647 (= res!82652 (and (= (_2!4319 lt!145821) lt!145815) (= (_1!4319 lt!145821) (_2!4321 lt!145813))))))

(declare-fun readerFrom!0 (BitStream!3794 (_ BitVec 32) (_ BitVec 32)) BitStream!3794)

(assert (=> b!100647 (= lt!145821 (readBitPure!0 (readerFrom!0 (_2!4321 lt!145813) (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305))))))

(declare-fun b!100648 () Bool)

(declare-fun res!82660 () Bool)

(assert (=> b!100648 (=> (not res!82660) (not e!65833))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100648 (= res!82660 (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))) ((_ sign_extend 32) (currentByte!4972 thiss!1305)) ((_ sign_extend 32) (currentBit!4967 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100649 () Bool)

(assert (=> b!100649 (= e!65836 (= (_2!4319 lt!145814) (_2!4319 lt!145816)))))

(declare-fun b!100650 () Bool)

(declare-fun res!82653 () Bool)

(assert (=> b!100650 (=> (not res!82653) (not e!65834))))

(assert (=> b!100650 (= res!82653 (isPrefixOf!0 thiss!1305 (_2!4321 lt!145813)))))

(declare-fun b!100651 () Bool)

(declare-fun res!82655 () Bool)

(assert (=> b!100651 (=> (not res!82655) (not e!65833))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100651 (= res!82655 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100652 () Bool)

(declare-fun e!65838 () Bool)

(declare-fun array_inv!1962 (array!4732) Bool)

(assert (=> b!100652 (= e!65838 (array_inv!1962 (buf!2517 thiss!1305)))))

(declare-fun b!100644 () Bool)

(declare-fun res!82654 () Bool)

(assert (=> b!100644 (=> (not res!82654) (not e!65833))))

(assert (=> b!100644 (= res!82654 (bvslt i!615 nBits!396))))

(declare-fun res!82656 () Bool)

(assert (=> start!20114 (=> (not res!82656) (not e!65833))))

(assert (=> start!20114 (= res!82656 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20114 e!65833))

(assert (=> start!20114 true))

(declare-fun inv!12 (BitStream!3794) Bool)

(assert (=> start!20114 (and (inv!12 thiss!1305) e!65838)))

(assert (= (and start!20114 res!82656) b!100648))

(assert (= (and b!100648 res!82660) b!100651))

(assert (= (and b!100651 res!82655) b!100644))

(assert (= (and b!100644 res!82654) b!100642))

(assert (= (and b!100642 res!82661) b!100646))

(assert (= (and b!100646 res!82651) b!100650))

(assert (= (and b!100650 res!82653) b!100647))

(assert (= (and b!100647 res!82652) b!100641))

(assert (= (and b!100642 res!82659) b!100643))

(assert (= (and b!100643 res!82657) b!100645))

(assert (= (and b!100642 res!82658) b!100649))

(assert (= start!20114 b!100652))

(declare-fun m!146275 () Bool)

(assert (=> b!100648 m!146275))

(declare-fun m!146277 () Bool)

(assert (=> b!100651 m!146277))

(declare-fun m!146279 () Bool)

(assert (=> b!100647 m!146279))

(assert (=> b!100647 m!146279))

(declare-fun m!146281 () Bool)

(assert (=> b!100647 m!146281))

(declare-fun m!146283 () Bool)

(assert (=> b!100641 m!146283))

(declare-fun m!146285 () Bool)

(assert (=> b!100646 m!146285))

(declare-fun m!146287 () Bool)

(assert (=> b!100646 m!146287))

(declare-fun m!146289 () Bool)

(assert (=> b!100642 m!146289))

(declare-fun m!146291 () Bool)

(assert (=> b!100642 m!146291))

(declare-fun m!146293 () Bool)

(assert (=> b!100642 m!146293))

(declare-fun m!146295 () Bool)

(assert (=> b!100642 m!146295))

(declare-fun m!146297 () Bool)

(assert (=> b!100642 m!146297))

(declare-fun m!146299 () Bool)

(assert (=> b!100642 m!146299))

(declare-fun m!146301 () Bool)

(assert (=> b!100642 m!146301))

(declare-fun m!146303 () Bool)

(assert (=> b!100642 m!146303))

(declare-fun m!146305 () Bool)

(assert (=> b!100642 m!146305))

(declare-fun m!146307 () Bool)

(assert (=> b!100642 m!146307))

(declare-fun m!146309 () Bool)

(assert (=> b!100642 m!146309))

(declare-fun m!146311 () Bool)

(assert (=> b!100642 m!146311))

(declare-fun m!146313 () Bool)

(assert (=> b!100645 m!146313))

(declare-fun m!146315 () Bool)

(assert (=> b!100650 m!146315))

(declare-fun m!146317 () Bool)

(assert (=> start!20114 m!146317))

(declare-fun m!146319 () Bool)

(assert (=> b!100643 m!146319))

(declare-fun m!146321 () Bool)

(assert (=> b!100652 m!146321))

(push 1)

(assert (not b!100645))

(assert (not start!20114))

(assert (not b!100650))

(assert (not b!100641))

(assert (not b!100643))

(assert (not b!100646))

(assert (not b!100651))

(assert (not b!100652))

(assert (not b!100648))

(assert (not b!100642))

(assert (not b!100647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31548 () Bool)

(declare-fun res!82701 () Bool)

(declare-fun e!65864 () Bool)

(assert (=> d!31548 (=> (not res!82701) (not e!65864))))

(assert (=> d!31548 (= res!82701 (= (size!2160 (buf!2517 thiss!1305)) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(assert (=> d!31548 (= (isPrefixOf!0 thiss!1305 (_2!4321 lt!145813)) e!65864)))

(declare-fun b!100690 () Bool)

(declare-fun res!82700 () Bool)

(assert (=> b!100690 (=> (not res!82700) (not e!65864))))

(assert (=> b!100690 (= res!82700 (bvsle (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813)))))))

(declare-fun b!100691 () Bool)

(declare-fun e!65863 () Bool)

(assert (=> b!100691 (= e!65864 e!65863)))

(declare-fun res!82702 () Bool)

(assert (=> b!100691 (=> res!82702 e!65863)))

(assert (=> b!100691 (= res!82702 (= (size!2160 (buf!2517 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100692 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4732 array!4732 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100692 (= e!65863 (arrayBitRangesEq!0 (buf!2517 thiss!1305) (buf!2517 (_2!4321 lt!145813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305))))))

(assert (= (and d!31548 res!82701) b!100690))

(assert (= (and b!100690 res!82700) b!100691))

(assert (= (and b!100691 (not res!82702)) b!100692))

(assert (=> b!100690 m!146287))

(assert (=> b!100690 m!146285))

(assert (=> b!100692 m!146287))

(assert (=> b!100692 m!146287))

(declare-fun m!146343 () Bool)

(assert (=> b!100692 m!146343))

(assert (=> b!100650 d!31548))

(declare-fun d!31550 () Bool)

(assert (=> d!31550 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100651 d!31550))

(declare-fun d!31552 () Bool)

(declare-datatypes ((tuple2!8136 0))(
  ( (tuple2!8137 (_1!4323 Bool) (_2!4323 BitStream!3794)) )
))
(declare-fun lt!145858 () tuple2!8136)

(declare-fun readBit!0 (BitStream!3794) tuple2!8136)

(assert (=> d!31552 (= lt!145858 (readBit!0 (readerFrom!0 (_2!4321 lt!145813) (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305))))))

(assert (=> d!31552 (= (readBitPure!0 (readerFrom!0 (_2!4321 lt!145813) (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305))) (tuple2!8129 (_2!4323 lt!145858) (_1!4323 lt!145858)))))

(declare-fun bs!7728 () Bool)

(assert (= bs!7728 d!31552))

(assert (=> bs!7728 m!146279))

(declare-fun m!146345 () Bool)

(assert (=> bs!7728 m!146345))

(assert (=> b!100647 d!31552))

(declare-fun d!31554 () Bool)

(declare-fun e!65867 () Bool)

(assert (=> d!31554 e!65867))

(declare-fun res!82706 () Bool)

(assert (=> d!31554 (=> (not res!82706) (not e!65867))))

(assert (=> d!31554 (= res!82706 (invariant!0 (currentBit!4967 (_2!4321 lt!145813)) (currentByte!4972 (_2!4321 lt!145813)) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(assert (=> d!31554 (= (readerFrom!0 (_2!4321 lt!145813) (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305)) (BitStream!3795 (buf!2517 (_2!4321 lt!145813)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(declare-fun b!100695 () Bool)

(assert (=> b!100695 (= e!65867 (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(assert (= (and d!31554 res!82706) b!100695))

(declare-fun m!146347 () Bool)

(assert (=> d!31554 m!146347))

(assert (=> b!100695 m!146319))

(assert (=> b!100647 d!31554))

(declare-fun d!31556 () Bool)

(assert (=> d!31556 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 thiss!1305))))))

(declare-fun bs!7729 () Bool)

(assert (= bs!7729 d!31556))

(declare-fun m!146349 () Bool)

(assert (=> bs!7729 m!146349))

(assert (=> start!20114 d!31556))

(declare-fun d!31558 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31558 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))) ((_ sign_extend 32) (currentByte!4972 thiss!1305)) ((_ sign_extend 32) (currentBit!4967 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))) ((_ sign_extend 32) (currentByte!4972 thiss!1305)) ((_ sign_extend 32) (currentBit!4967 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7730 () Bool)

(assert (= bs!7730 d!31558))

(declare-fun m!146351 () Bool)

(assert (=> bs!7730 m!146351))

(assert (=> b!100648 d!31558))

(declare-fun d!31560 () Bool)

(declare-fun e!65870 () Bool)

(assert (=> d!31560 e!65870))

(declare-fun res!82711 () Bool)

(assert (=> d!31560 (=> (not res!82711) (not e!65870))))

(declare-fun lt!145873 () (_ BitVec 64))

(declare-fun lt!145875 () (_ BitVec 64))

(declare-fun lt!145876 () (_ BitVec 64))

(assert (=> d!31560 (= res!82711 (= lt!145876 (bvsub lt!145875 lt!145873)))))

(assert (=> d!31560 (or (= (bvand lt!145875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145875 lt!145873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31560 (= lt!145873 (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!145813)))) ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!145813))) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!145813)))))))

(declare-fun lt!145872 () (_ BitVec 64))

(declare-fun lt!145874 () (_ BitVec 64))

(assert (=> d!31560 (= lt!145875 (bvmul lt!145872 lt!145874))))

(assert (=> d!31560 (or (= lt!145872 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145874 (bvsdiv (bvmul lt!145872 lt!145874) lt!145872)))))

(assert (=> d!31560 (= lt!145874 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31560 (= lt!145872 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(assert (=> d!31560 (= lt!145876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!145813))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!145813)))))))

(assert (=> d!31560 (invariant!0 (currentBit!4967 (_2!4321 lt!145813)) (currentByte!4972 (_2!4321 lt!145813)) (size!2160 (buf!2517 (_2!4321 lt!145813))))))

(assert (=> d!31560 (= (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))) lt!145876)))

(declare-fun b!100700 () Bool)

(declare-fun res!82712 () Bool)

(assert (=> b!100700 (=> (not res!82712) (not e!65870))))

(assert (=> b!100700 (= res!82712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145876))))

(declare-fun b!100701 () Bool)

(declare-fun lt!145871 () (_ BitVec 64))

(assert (=> b!100701 (= e!65870 (bvsle lt!145876 (bvmul lt!145871 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100701 (or (= lt!145871 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145871 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145871)))))

(assert (=> b!100701 (= lt!145871 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!145813)))))))

(assert (= (and d!31560 res!82711) b!100700))

(assert (= (and b!100700 res!82712) b!100701))

(declare-fun m!146353 () Bool)

(assert (=> d!31560 m!146353))

(assert (=> d!31560 m!146347))

(assert (=> b!100646 d!31560))

(declare-fun d!31562 () Bool)

(declare-fun e!65871 () Bool)

(assert (=> d!31562 e!65871))

(declare-fun res!82713 () Bool)

(assert (=> d!31562 (=> (not res!82713) (not e!65871))))

(declare-fun lt!145881 () (_ BitVec 64))

(declare-fun lt!145879 () (_ BitVec 64))

(declare-fun lt!145882 () (_ BitVec 64))

(assert (=> d!31562 (= res!82713 (= lt!145882 (bvsub lt!145881 lt!145879)))))

(assert (=> d!31562 (or (= (bvand lt!145881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145881 lt!145879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31562 (= lt!145879 (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))) ((_ sign_extend 32) (currentByte!4972 thiss!1305)) ((_ sign_extend 32) (currentBit!4967 thiss!1305))))))

(declare-fun lt!145878 () (_ BitVec 64))

(declare-fun lt!145880 () (_ BitVec 64))

(assert (=> d!31562 (= lt!145881 (bvmul lt!145878 lt!145880))))

(assert (=> d!31562 (or (= lt!145878 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145880 (bvsdiv (bvmul lt!145878 lt!145880) lt!145878)))))

(assert (=> d!31562 (= lt!145880 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31562 (= lt!145878 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))))))

(assert (=> d!31562 (= lt!145882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4972 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4967 thiss!1305))))))

(assert (=> d!31562 (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 thiss!1305)))))

(assert (=> d!31562 (= (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)) lt!145882)))

(declare-fun b!100702 () Bool)

(declare-fun res!82714 () Bool)

(assert (=> b!100702 (=> (not res!82714) (not e!65871))))

(assert (=> b!100702 (= res!82714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145882))))

(declare-fun b!100703 () Bool)

(declare-fun lt!145877 () (_ BitVec 64))

(assert (=> b!100703 (= e!65871 (bvsle lt!145882 (bvmul lt!145877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100703 (or (= lt!145877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145877)))))

(assert (=> b!100703 (= lt!145877 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))))))

(assert (= (and d!31562 res!82713) b!100702))

(assert (= (and b!100702 res!82714) b!100703))

(assert (=> d!31562 m!146351))

(assert (=> d!31562 m!146349))

(assert (=> b!100646 d!31562))

(declare-fun d!31564 () Bool)

(assert (=> d!31564 (= (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145811)))) (and (bvsge (currentBit!4967 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4967 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4972 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145811)))) (and (= (currentBit!4967 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145811))))))))))

(assert (=> b!100645 d!31564))

(declare-fun d!31566 () Bool)

(declare-fun e!65872 () Bool)

(assert (=> d!31566 e!65872))

(declare-fun res!82715 () Bool)

(assert (=> d!31566 (=> (not res!82715) (not e!65872))))

(declare-fun lt!145885 () (_ BitVec 64))

(declare-fun lt!145887 () (_ BitVec 64))

(declare-fun lt!145888 () (_ BitVec 64))

(assert (=> d!31566 (= res!82715 (= lt!145888 (bvsub lt!145887 lt!145885)))))

(assert (=> d!31566 (or (= (bvand lt!145887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145887 lt!145885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31566 (= lt!145885 (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145816)))) ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145816))) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145816)))))))

(declare-fun lt!145884 () (_ BitVec 64))

(declare-fun lt!145886 () (_ BitVec 64))

(assert (=> d!31566 (= lt!145887 (bvmul lt!145884 lt!145886))))

(assert (=> d!31566 (or (= lt!145884 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145886 (bvsdiv (bvmul lt!145884 lt!145886) lt!145884)))))

(assert (=> d!31566 (= lt!145886 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31566 (= lt!145884 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145816)))))))

(assert (=> d!31566 (= lt!145888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145816))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145816)))))))

(assert (=> d!31566 (invariant!0 (currentBit!4967 (_1!4319 lt!145816)) (currentByte!4972 (_1!4319 lt!145816)) (size!2160 (buf!2517 (_1!4319 lt!145816))))))

(assert (=> d!31566 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145816))) (currentByte!4972 (_1!4319 lt!145816)) (currentBit!4967 (_1!4319 lt!145816))) lt!145888)))

(declare-fun b!100704 () Bool)

(declare-fun res!82716 () Bool)

(assert (=> b!100704 (=> (not res!82716) (not e!65872))))

(assert (=> b!100704 (= res!82716 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145888))))

(declare-fun b!100705 () Bool)

(declare-fun lt!145883 () (_ BitVec 64))

(assert (=> b!100705 (= e!65872 (bvsle lt!145888 (bvmul lt!145883 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100705 (or (= lt!145883 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145883 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145883)))))

(assert (=> b!100705 (= lt!145883 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145816)))))))

(assert (= (and d!31566 res!82715) b!100704))

(assert (= (and b!100704 res!82716) b!100705))

(declare-fun m!146355 () Bool)

(assert (=> d!31566 m!146355))

(declare-fun m!146357 () Bool)

(assert (=> d!31566 m!146357))

(assert (=> b!100642 d!31566))

(declare-fun d!31568 () Bool)

(declare-fun e!65873 () Bool)

(assert (=> d!31568 e!65873))

(declare-fun res!82717 () Bool)

(assert (=> d!31568 (=> (not res!82717) (not e!65873))))

(declare-fun lt!145893 () (_ BitVec 64))

(declare-fun lt!145891 () (_ BitVec 64))

(declare-fun lt!145894 () (_ BitVec 64))

(assert (=> d!31568 (= res!82717 (= lt!145894 (bvsub lt!145893 lt!145891)))))

(assert (=> d!31568 (or (= (bvand lt!145893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145893 lt!145891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31568 (= lt!145891 (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145814)))) ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145814))) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145814)))))))

(declare-fun lt!145890 () (_ BitVec 64))

(declare-fun lt!145892 () (_ BitVec 64))

(assert (=> d!31568 (= lt!145893 (bvmul lt!145890 lt!145892))))

(assert (=> d!31568 (or (= lt!145890 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145892 (bvsdiv (bvmul lt!145890 lt!145892) lt!145890)))))

(assert (=> d!31568 (= lt!145892 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31568 (= lt!145890 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145814)))))))

(assert (=> d!31568 (= lt!145894 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145814)))))))

(assert (=> d!31568 (invariant!0 (currentBit!4967 (_1!4319 lt!145814)) (currentByte!4972 (_1!4319 lt!145814)) (size!2160 (buf!2517 (_1!4319 lt!145814))))))

(assert (=> d!31568 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145814))) (currentByte!4972 (_1!4319 lt!145814)) (currentBit!4967 (_1!4319 lt!145814))) lt!145894)))

(declare-fun b!100706 () Bool)

(declare-fun res!82718 () Bool)

(assert (=> b!100706 (=> (not res!82718) (not e!65873))))

(assert (=> b!100706 (= res!82718 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145894))))

(declare-fun b!100707 () Bool)

(declare-fun lt!145889 () (_ BitVec 64))

(assert (=> b!100707 (= e!65873 (bvsle lt!145894 (bvmul lt!145889 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100707 (or (= lt!145889 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145889 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145889)))))

(assert (=> b!100707 (= lt!145889 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145814)))))))

(assert (= (and d!31568 res!82717) b!100706))

(assert (= (and b!100706 res!82718) b!100707))

(declare-fun m!146359 () Bool)

(assert (=> d!31568 m!146359))

(declare-fun m!146361 () Bool)

(assert (=> d!31568 m!146361))

(assert (=> b!100642 d!31568))

(declare-fun d!31570 () Bool)

(assert (=> d!31570 (isPrefixOf!0 thiss!1305 (_2!4321 lt!145811))))

(declare-fun lt!145897 () Unit!6168)

(declare-fun choose!30 (BitStream!3794 BitStream!3794 BitStream!3794) Unit!6168)

(assert (=> d!31570 (= lt!145897 (choose!30 thiss!1305 (_2!4321 lt!145813) (_2!4321 lt!145811)))))

(assert (=> d!31570 (isPrefixOf!0 thiss!1305 (_2!4321 lt!145813))))

(assert (=> d!31570 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4321 lt!145813) (_2!4321 lt!145811)) lt!145897)))

(declare-fun bs!7731 () Bool)

(assert (= bs!7731 d!31570))

(assert (=> bs!7731 m!146295))

(declare-fun m!146363 () Bool)

(assert (=> bs!7731 m!146363))

(assert (=> bs!7731 m!146315))

(assert (=> b!100642 d!31570))

(declare-fun b!100718 () Bool)

(declare-fun res!82725 () Bool)

(declare-fun e!65879 () Bool)

(assert (=> b!100718 (=> (not res!82725) (not e!65879))))

(declare-fun lt!145941 () tuple2!8130)

(assert (=> b!100718 (= res!82725 (isPrefixOf!0 (_1!4320 lt!145941) (_2!4321 lt!145813)))))

(declare-fun b!100719 () Bool)

(declare-fun e!65878 () Unit!6168)

(declare-fun lt!145953 () Unit!6168)

(assert (=> b!100719 (= e!65878 lt!145953)))

(declare-fun lt!145942 () (_ BitVec 64))

(assert (=> b!100719 (= lt!145942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!145949 () (_ BitVec 64))

(assert (=> b!100719 (= lt!145949 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4732 array!4732 (_ BitVec 64) (_ BitVec 64)) Unit!6168)

(assert (=> b!100719 (= lt!145953 (arrayBitRangesEqSymmetric!0 (buf!2517 (_2!4321 lt!145813)) (buf!2517 (_2!4321 lt!145811)) lt!145942 lt!145949))))

(assert (=> b!100719 (arrayBitRangesEq!0 (buf!2517 (_2!4321 lt!145811)) (buf!2517 (_2!4321 lt!145813)) lt!145942 lt!145949)))

(declare-fun b!100721 () Bool)

(declare-fun res!82727 () Bool)

(assert (=> b!100721 (=> (not res!82727) (not e!65879))))

(assert (=> b!100721 (= res!82727 (isPrefixOf!0 (_2!4320 lt!145941) (_2!4321 lt!145811)))))

(declare-fun b!100722 () Bool)

(declare-fun lt!145956 () (_ BitVec 64))

(declare-fun lt!145951 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3794 (_ BitVec 64)) BitStream!3794)

(assert (=> b!100722 (= e!65879 (= (_1!4320 lt!145941) (withMovedBitIndex!0 (_2!4320 lt!145941) (bvsub lt!145956 lt!145951))))))

(assert (=> b!100722 (or (= (bvand lt!145956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145951 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145956 lt!145951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100722 (= lt!145951 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145811))) (currentByte!4972 (_2!4321 lt!145811)) (currentBit!4967 (_2!4321 lt!145811))))))

(assert (=> b!100722 (= lt!145956 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(declare-fun d!31572 () Bool)

(assert (=> d!31572 e!65879))

(declare-fun res!82726 () Bool)

(assert (=> d!31572 (=> (not res!82726) (not e!65879))))

(assert (=> d!31572 (= res!82726 (isPrefixOf!0 (_1!4320 lt!145941) (_2!4320 lt!145941)))))

(declare-fun lt!145939 () BitStream!3794)

(assert (=> d!31572 (= lt!145941 (tuple2!8131 lt!145939 (_2!4321 lt!145811)))))

(declare-fun lt!145955 () Unit!6168)

(declare-fun lt!145952 () Unit!6168)

(assert (=> d!31572 (= lt!145955 lt!145952)))

(assert (=> d!31572 (isPrefixOf!0 lt!145939 (_2!4321 lt!145811))))

(assert (=> d!31572 (= lt!145952 (lemmaIsPrefixTransitive!0 lt!145939 (_2!4321 lt!145811) (_2!4321 lt!145811)))))

(declare-fun lt!145944 () Unit!6168)

(declare-fun lt!145946 () Unit!6168)

(assert (=> d!31572 (= lt!145944 lt!145946)))

(assert (=> d!31572 (isPrefixOf!0 lt!145939 (_2!4321 lt!145811))))

(assert (=> d!31572 (= lt!145946 (lemmaIsPrefixTransitive!0 lt!145939 (_2!4321 lt!145813) (_2!4321 lt!145811)))))

(declare-fun lt!145938 () Unit!6168)

(assert (=> d!31572 (= lt!145938 e!65878)))

(declare-fun c!6299 () Bool)

(assert (=> d!31572 (= c!6299 (not (= (size!2160 (buf!2517 (_2!4321 lt!145813))) #b00000000000000000000000000000000)))))

(declare-fun lt!145943 () Unit!6168)

(declare-fun lt!145947 () Unit!6168)

(assert (=> d!31572 (= lt!145943 lt!145947)))

(assert (=> d!31572 (isPrefixOf!0 (_2!4321 lt!145811) (_2!4321 lt!145811))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3794) Unit!6168)

(assert (=> d!31572 (= lt!145947 (lemmaIsPrefixRefl!0 (_2!4321 lt!145811)))))

(declare-fun lt!145950 () Unit!6168)

(declare-fun lt!145945 () Unit!6168)

(assert (=> d!31572 (= lt!145950 lt!145945)))

(assert (=> d!31572 (= lt!145945 (lemmaIsPrefixRefl!0 (_2!4321 lt!145811)))))

(declare-fun lt!145954 () Unit!6168)

(declare-fun lt!145957 () Unit!6168)

(assert (=> d!31572 (= lt!145954 lt!145957)))

(assert (=> d!31572 (isPrefixOf!0 lt!145939 lt!145939)))

(assert (=> d!31572 (= lt!145957 (lemmaIsPrefixRefl!0 lt!145939))))

(declare-fun lt!145948 () Unit!6168)

(declare-fun lt!145940 () Unit!6168)

(assert (=> d!31572 (= lt!145948 lt!145940)))

(assert (=> d!31572 (isPrefixOf!0 (_2!4321 lt!145813) (_2!4321 lt!145813))))

(assert (=> d!31572 (= lt!145940 (lemmaIsPrefixRefl!0 (_2!4321 lt!145813)))))

(assert (=> d!31572 (= lt!145939 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(assert (=> d!31572 (isPrefixOf!0 (_2!4321 lt!145813) (_2!4321 lt!145811))))

(assert (=> d!31572 (= (reader!0 (_2!4321 lt!145813) (_2!4321 lt!145811)) lt!145941)))

(declare-fun b!100720 () Bool)

(declare-fun Unit!6183 () Unit!6168)

(assert (=> b!100720 (= e!65878 Unit!6183)))

(assert (= (and d!31572 c!6299) b!100719))

(assert (= (and d!31572 (not c!6299)) b!100720))

(assert (= (and d!31572 res!82726) b!100718))

(assert (= (and b!100718 res!82725) b!100721))

(assert (= (and b!100721 res!82727) b!100722))

(declare-fun m!146365 () Bool)

(assert (=> b!100722 m!146365))

(declare-fun m!146367 () Bool)

(assert (=> b!100722 m!146367))

(assert (=> b!100722 m!146285))

(assert (=> b!100719 m!146285))

(declare-fun m!146369 () Bool)

(assert (=> b!100719 m!146369))

(declare-fun m!146371 () Bool)

(assert (=> b!100719 m!146371))

(declare-fun m!146373 () Bool)

(assert (=> d!31572 m!146373))

(declare-fun m!146375 () Bool)

(assert (=> d!31572 m!146375))

(declare-fun m!146377 () Bool)

(assert (=> d!31572 m!146377))

(declare-fun m!146379 () Bool)

(assert (=> d!31572 m!146379))

(declare-fun m!146381 () Bool)

(assert (=> d!31572 m!146381))

(declare-fun m!146383 () Bool)

(assert (=> d!31572 m!146383))

(declare-fun m!146385 () Bool)

(assert (=> d!31572 m!146385))

(declare-fun m!146387 () Bool)

(assert (=> d!31572 m!146387))

(declare-fun m!146389 () Bool)

(assert (=> d!31572 m!146389))

(declare-fun m!146391 () Bool)

(assert (=> d!31572 m!146391))

(declare-fun m!146393 () Bool)

(assert (=> d!31572 m!146393))

(declare-fun m!146395 () Bool)

(assert (=> b!100721 m!146395))

(declare-fun m!146397 () Bool)

(assert (=> b!100718 m!146397))

(assert (=> b!100642 d!31572))

(declare-fun b!100856 () Bool)

(declare-fun e!65952 () Bool)

(declare-fun lt!146430 () tuple2!8128)

(declare-fun lt!146411 () tuple2!8132)

(assert (=> b!100856 (= e!65952 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146430))) (currentByte!4972 (_1!4319 lt!146430)) (currentBit!4967 (_1!4319 lt!146430))) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146411))) (currentByte!4972 (_2!4321 lt!146411)) (currentBit!4967 (_2!4321 lt!146411)))))))

(declare-fun b!100857 () Bool)

(declare-fun res!82824 () Bool)

(assert (=> b!100857 (= res!82824 (= (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146411))) (currentByte!4972 (_2!4321 lt!146411)) (currentBit!4967 (_2!4321 lt!146411))) (bvadd (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!65955 () Bool)

(assert (=> b!100857 (=> (not res!82824) (not e!65955))))

(declare-fun b!100858 () Bool)

(declare-fun e!65953 () Bool)

(declare-fun lt!146415 () (_ BitVec 64))

(assert (=> b!100858 (= e!65953 (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!145813)))) ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!145813))) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!145813))) lt!146415))))

(declare-fun b!100859 () Bool)

(declare-fun res!82831 () Bool)

(declare-fun e!65954 () Bool)

(assert (=> b!100859 (=> (not res!82831) (not e!65954))))

(declare-fun lt!146400 () tuple2!8132)

(assert (=> b!100859 (= res!82831 (isPrefixOf!0 (_2!4321 lt!145813) (_2!4321 lt!146400)))))

(declare-fun b!100860 () Bool)

(declare-fun res!82826 () Bool)

(assert (=> b!100860 (=> (not res!82826) (not e!65954))))

(declare-fun lt!146438 () (_ BitVec 64))

(declare-fun lt!146418 () (_ BitVec 64))

(assert (=> b!100860 (= res!82826 (= (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146400))) (currentByte!4972 (_2!4321 lt!146400)) (currentBit!4967 (_2!4321 lt!146400))) (bvadd lt!146418 lt!146438)))))

(assert (=> b!100860 (or (not (= (bvand lt!146418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146438 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146418 lt!146438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100860 (= lt!146438 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100860 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100860 (= lt!146418 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(declare-fun c!6319 () Bool)

(declare-fun bm!1261 () Bool)

(declare-fun lt!146436 () tuple2!8132)

(declare-fun call!1264 () Bool)

(declare-fun lt!146402 () BitStream!3794)

(assert (=> bm!1261 (= call!1264 (isPrefixOf!0 (ite c!6319 (_2!4321 lt!145813) lt!146402) (ite c!6319 (_2!4321 lt!146436) lt!146402)))))

(declare-fun b!100861 () Bool)

(assert (=> b!100861 (= lt!146430 (readBitPure!0 (readerFrom!0 (_2!4321 lt!146411) (currentBit!4967 (_2!4321 lt!145813)) (currentByte!4972 (_2!4321 lt!145813)))))))

(declare-fun res!82825 () Bool)

(declare-fun lt!146421 () Bool)

(assert (=> b!100861 (= res!82825 (and (= (_2!4319 lt!146430) lt!146421) (= (_1!4319 lt!146430) (_2!4321 lt!146411))))))

(assert (=> b!100861 (=> (not res!82825) (not e!65952))))

(assert (=> b!100861 (= e!65955 e!65952)))

(declare-fun b!100862 () Bool)

(declare-fun e!65957 () tuple2!8132)

(declare-fun lt!146420 () Unit!6168)

(assert (=> b!100862 (= e!65957 (tuple2!8133 lt!146420 (_2!4321 lt!145813)))))

(assert (=> b!100862 (= lt!146402 (_2!4321 lt!145813))))

(assert (=> b!100862 (= lt!146420 (lemmaIsPrefixRefl!0 lt!146402))))

(assert (=> b!100862 call!1264))

(declare-fun b!100864 () Bool)

(declare-fun e!65958 () Bool)

(declare-fun lt!146413 () tuple2!8128)

(declare-fun lt!146392 () tuple2!8128)

(assert (=> b!100864 (= e!65958 (= (_2!4319 lt!146413) (_2!4319 lt!146392)))))

(declare-fun b!100865 () Bool)

(declare-fun res!82830 () Bool)

(assert (=> b!100865 (= res!82830 (isPrefixOf!0 (_2!4321 lt!145813) (_2!4321 lt!146411)))))

(assert (=> b!100865 (=> (not res!82830) (not e!65955))))

(declare-fun b!100866 () Bool)

(declare-fun e!65956 () (_ BitVec 64))

(assert (=> b!100866 (= e!65956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!100867 () Bool)

(declare-fun Unit!6186 () Unit!6168)

(assert (=> b!100867 (= e!65957 (tuple2!8133 Unit!6186 (_2!4321 lt!146436)))))

(assert (=> b!100867 (= lt!146421 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100867 (= lt!146411 (appendBit!0 (_2!4321 lt!145813) lt!146421))))

(declare-fun res!82832 () Bool)

(assert (=> b!100867 (= res!82832 (= (size!2160 (buf!2517 (_2!4321 lt!145813))) (size!2160 (buf!2517 (_2!4321 lt!146411)))))))

(assert (=> b!100867 (=> (not res!82832) (not e!65955))))

(assert (=> b!100867 e!65955))

(declare-fun lt!146410 () tuple2!8132)

(assert (=> b!100867 (= lt!146410 lt!146411)))

(assert (=> b!100867 (= lt!146436 (appendNLeastSignificantBitsLoop!0 (_2!4321 lt!146410) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!146433 () Unit!6168)

(assert (=> b!100867 (= lt!146433 (lemmaIsPrefixTransitive!0 (_2!4321 lt!145813) (_2!4321 lt!146410) (_2!4321 lt!146436)))))

(assert (=> b!100867 call!1264))

(declare-fun lt!146406 () Unit!6168)

(assert (=> b!100867 (= lt!146406 lt!146433)))

(assert (=> b!100867 (invariant!0 (currentBit!4967 (_2!4321 lt!145813)) (currentByte!4972 (_2!4321 lt!145813)) (size!2160 (buf!2517 (_2!4321 lt!146410))))))

(declare-fun lt!146391 () BitStream!3794)

(assert (=> b!100867 (= lt!146391 (BitStream!3795 (buf!2517 (_2!4321 lt!146410)) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))))))

(assert (=> b!100867 (invariant!0 (currentBit!4967 lt!146391) (currentByte!4972 lt!146391) (size!2160 (buf!2517 (_2!4321 lt!146436))))))

(declare-fun lt!146416 () BitStream!3794)

(assert (=> b!100867 (= lt!146416 (BitStream!3795 (buf!2517 (_2!4321 lt!146436)) (currentByte!4972 lt!146391) (currentBit!4967 lt!146391)))))

(assert (=> b!100867 (= lt!146413 (readBitPure!0 lt!146391))))

(assert (=> b!100867 (= lt!146392 (readBitPure!0 lt!146416))))

(declare-fun lt!146422 () Unit!6168)

(assert (=> b!100867 (= lt!146422 (readBitPrefixLemma!0 lt!146391 (_2!4321 lt!146436)))))

(declare-fun res!82828 () Bool)

(assert (=> b!100867 (= res!82828 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146413))) (currentByte!4972 (_1!4319 lt!146413)) (currentBit!4967 (_1!4319 lt!146413))) (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146392))) (currentByte!4972 (_1!4319 lt!146392)) (currentBit!4967 (_1!4319 lt!146392)))))))

(assert (=> b!100867 (=> (not res!82828) (not e!65958))))

(assert (=> b!100867 e!65958))

(declare-fun lt!146403 () Unit!6168)

(assert (=> b!100867 (= lt!146403 lt!146422)))

(declare-fun lt!146397 () tuple2!8130)

(assert (=> b!100867 (= lt!146397 (reader!0 (_2!4321 lt!145813) (_2!4321 lt!146436)))))

(declare-fun lt!146404 () tuple2!8130)

(assert (=> b!100867 (= lt!146404 (reader!0 (_2!4321 lt!146410) (_2!4321 lt!146436)))))

(declare-fun lt!146426 () tuple2!8128)

(assert (=> b!100867 (= lt!146426 (readBitPure!0 (_1!4320 lt!146397)))))

(assert (=> b!100867 (= (_2!4319 lt!146426) lt!146421)))

(declare-fun lt!146423 () Unit!6168)

(declare-fun Unit!6187 () Unit!6168)

(assert (=> b!100867 (= lt!146423 Unit!6187)))

(declare-fun lt!146435 () (_ BitVec 64))

(assert (=> b!100867 (= lt!146435 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!146408 () (_ BitVec 64))

(assert (=> b!100867 (= lt!146408 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!146419 () Unit!6168)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3794 array!4732 (_ BitVec 64)) Unit!6168)

(assert (=> b!100867 (= lt!146419 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4321 lt!145813) (buf!2517 (_2!4321 lt!146436)) lt!146408))))

(assert (=> b!100867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!146436)))) ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!145813))) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!145813))) lt!146408)))

(declare-fun lt!146398 () Unit!6168)

(assert (=> b!100867 (= lt!146398 lt!146419)))

(declare-datatypes ((tuple2!8144 0))(
  ( (tuple2!8145 (_1!4327 BitStream!3794) (_2!4327 (_ BitVec 64))) )
))
(declare-fun lt!146424 () tuple2!8144)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8144)

(assert (=> b!100867 (= lt!146424 (readNLeastSignificantBitsLoopPure!0 (_1!4320 lt!146397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146435))))

(declare-fun lt!146417 () (_ BitVec 64))

(assert (=> b!100867 (= lt!146417 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!146427 () Unit!6168)

(assert (=> b!100867 (= lt!146427 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4321 lt!146410) (buf!2517 (_2!4321 lt!146436)) lt!146417))))

(assert (=> b!100867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!146436)))) ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!146410))) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!146410))) lt!146417)))

(declare-fun lt!146396 () Unit!6168)

(assert (=> b!100867 (= lt!146396 lt!146427)))

(declare-fun lt!146409 () tuple2!8144)

(assert (=> b!100867 (= lt!146409 (readNLeastSignificantBitsLoopPure!0 (_1!4320 lt!146404) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146435 (ite (_2!4319 lt!146426) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!146431 () tuple2!8144)

(assert (=> b!100867 (= lt!146431 (readNLeastSignificantBitsLoopPure!0 (_1!4320 lt!146397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146435))))

(declare-fun c!6318 () Bool)

(assert (=> b!100867 (= c!6318 (_2!4319 (readBitPure!0 (_1!4320 lt!146397))))))

(declare-fun lt!146414 () tuple2!8144)

(assert (=> b!100867 (= lt!146414 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4320 lt!146397) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146435 e!65956)))))

(declare-fun lt!146401 () Unit!6168)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6168)

(assert (=> b!100867 (= lt!146401 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4320 lt!146397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146435))))

(assert (=> b!100867 (and (= (_2!4327 lt!146431) (_2!4327 lt!146414)) (= (_1!4327 lt!146431) (_1!4327 lt!146414)))))

(declare-fun lt!146439 () Unit!6168)

(assert (=> b!100867 (= lt!146439 lt!146401)))

(assert (=> b!100867 (= (_1!4320 lt!146397) (withMovedBitIndex!0 (_2!4320 lt!146397) (bvsub (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146436))) (currentByte!4972 (_2!4321 lt!146436)) (currentBit!4967 (_2!4321 lt!146436))))))))

(declare-fun lt!146407 () Unit!6168)

(declare-fun Unit!6188 () Unit!6168)

(assert (=> b!100867 (= lt!146407 Unit!6188)))

(assert (=> b!100867 (= (_1!4320 lt!146404) (withMovedBitIndex!0 (_2!4320 lt!146404) (bvsub (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146410))) (currentByte!4972 (_2!4321 lt!146410)) (currentBit!4967 (_2!4321 lt!146410))) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146436))) (currentByte!4972 (_2!4321 lt!146436)) (currentBit!4967 (_2!4321 lt!146436))))))))

(declare-fun lt!146432 () Unit!6168)

(declare-fun Unit!6189 () Unit!6168)

(assert (=> b!100867 (= lt!146432 Unit!6189)))

(assert (=> b!100867 (= (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145813))) (currentByte!4972 (_2!4321 lt!145813)) (currentBit!4967 (_2!4321 lt!145813))) (bvsub (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146410))) (currentByte!4972 (_2!4321 lt!146410)) (currentBit!4967 (_2!4321 lt!146410))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!146405 () Unit!6168)

(declare-fun Unit!6190 () Unit!6168)

(assert (=> b!100867 (= lt!146405 Unit!6190)))

(assert (=> b!100867 (= (_2!4327 lt!146424) (_2!4327 lt!146409))))

(declare-fun lt!146425 () Unit!6168)

(declare-fun Unit!6191 () Unit!6168)

(assert (=> b!100867 (= lt!146425 Unit!6191)))

(assert (=> b!100867 (= (_1!4327 lt!146424) (_2!4320 lt!146397))))

(declare-fun b!100868 () Bool)

(assert (=> b!100868 (= e!65956 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun d!31574 () Bool)

(assert (=> d!31574 e!65954))

(declare-fun res!82829 () Bool)

(assert (=> d!31574 (=> (not res!82829) (not e!65954))))

(assert (=> d!31574 (= res!82829 (= (size!2160 (buf!2517 (_2!4321 lt!145813))) (size!2160 (buf!2517 (_2!4321 lt!146400)))))))

(assert (=> d!31574 (= lt!146400 e!65957)))

(assert (=> d!31574 (= c!6319 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31574 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31574 (= (appendNLeastSignificantBitsLoop!0 (_2!4321 lt!145813) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!146400)))

(declare-fun lt!146412 () tuple2!8130)

(declare-fun lt!146399 () tuple2!8144)

(declare-fun b!100863 () Bool)

(assert (=> b!100863 (= e!65954 (and (= (_2!4327 lt!146399) v!199) (= (_1!4327 lt!146399) (_2!4320 lt!146412))))))

(declare-fun lt!146437 () (_ BitVec 64))

(assert (=> b!100863 (= lt!146399 (readNLeastSignificantBitsLoopPure!0 (_1!4320 lt!146412) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146437))))

(declare-fun lt!146395 () Unit!6168)

(declare-fun lt!146434 () Unit!6168)

(assert (=> b!100863 (= lt!146395 lt!146434)))

(assert (=> b!100863 (validate_offset_bits!1 ((_ sign_extend 32) (size!2160 (buf!2517 (_2!4321 lt!146400)))) ((_ sign_extend 32) (currentByte!4972 (_2!4321 lt!145813))) ((_ sign_extend 32) (currentBit!4967 (_2!4321 lt!145813))) lt!146415)))

(assert (=> b!100863 (= lt!146434 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4321 lt!145813) (buf!2517 (_2!4321 lt!146400)) lt!146415))))

(assert (=> b!100863 e!65953))

(declare-fun res!82827 () Bool)

(assert (=> b!100863 (=> (not res!82827) (not e!65953))))

(assert (=> b!100863 (= res!82827 (and (= (size!2160 (buf!2517 (_2!4321 lt!145813))) (size!2160 (buf!2517 (_2!4321 lt!146400)))) (bvsge lt!146415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100863 (= lt!146415 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100863 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100863 (= lt!146437 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100863 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100863 (= lt!146412 (reader!0 (_2!4321 lt!145813) (_2!4321 lt!146400)))))

(assert (= (and d!31574 c!6319) b!100867))

(assert (= (and d!31574 (not c!6319)) b!100862))

(assert (= (and b!100867 res!82832) b!100857))

(assert (= (and b!100857 res!82824) b!100865))

(assert (= (and b!100865 res!82830) b!100861))

(assert (= (and b!100861 res!82825) b!100856))

(assert (= (and b!100867 res!82828) b!100864))

(assert (= (and b!100867 c!6318) b!100868))

(assert (= (and b!100867 (not c!6318)) b!100866))

(assert (= (or b!100867 b!100862) bm!1261))

(assert (= (and d!31574 res!82829) b!100860))

(assert (= (and b!100860 res!82826) b!100859))

(assert (= (and b!100859 res!82831) b!100863))

(assert (= (and b!100863 res!82827) b!100858))

(declare-fun m!146603 () Bool)

(assert (=> b!100860 m!146603))

(assert (=> b!100860 m!146285))

(declare-fun m!146605 () Bool)

(assert (=> b!100865 m!146605))

(declare-fun m!146607 () Bool)

(assert (=> b!100859 m!146607))

(declare-fun m!146609 () Bool)

(assert (=> b!100867 m!146609))

(declare-fun m!146611 () Bool)

(assert (=> b!100867 m!146611))

(declare-fun m!146613 () Bool)

(assert (=> b!100867 m!146613))

(declare-fun m!146615 () Bool)

(assert (=> b!100867 m!146615))

(declare-fun m!146617 () Bool)

(assert (=> b!100867 m!146617))

(declare-fun m!146619 () Bool)

(assert (=> b!100867 m!146619))

(declare-fun m!146621 () Bool)

(assert (=> b!100867 m!146621))

(declare-fun m!146623 () Bool)

(assert (=> b!100867 m!146623))

(declare-fun m!146625 () Bool)

(assert (=> b!100867 m!146625))

(declare-fun m!146627 () Bool)

(assert (=> b!100867 m!146627))

(declare-fun m!146629 () Bool)

(assert (=> b!100867 m!146629))

(declare-fun m!146631 () Bool)

(assert (=> b!100867 m!146631))

(declare-fun m!146633 () Bool)

(assert (=> b!100867 m!146633))

(declare-fun m!146635 () Bool)

(assert (=> b!100867 m!146635))

(declare-fun m!146637 () Bool)

(assert (=> b!100867 m!146637))

(assert (=> b!100867 m!146285))

(assert (=> b!100867 m!146617))

(declare-fun m!146639 () Bool)

(assert (=> b!100867 m!146639))

(declare-fun m!146641 () Bool)

(assert (=> b!100867 m!146641))

(declare-fun m!146643 () Bool)

(assert (=> b!100867 m!146643))

(declare-fun m!146645 () Bool)

(assert (=> b!100867 m!146645))

(declare-fun m!146647 () Bool)

(assert (=> b!100867 m!146647))

(declare-fun m!146649 () Bool)

(assert (=> b!100867 m!146649))

(declare-fun m!146651 () Bool)

(assert (=> b!100867 m!146651))

(declare-fun m!146653 () Bool)

(assert (=> b!100867 m!146653))

(declare-fun m!146655 () Bool)

(assert (=> b!100867 m!146655))

(declare-fun m!146657 () Bool)

(assert (=> b!100867 m!146657))

(declare-fun m!146659 () Bool)

(assert (=> b!100867 m!146659))

(declare-fun m!146661 () Bool)

(assert (=> b!100867 m!146661))

(declare-fun m!146663 () Bool)

(assert (=> b!100861 m!146663))

(assert (=> b!100861 m!146663))

(declare-fun m!146665 () Bool)

(assert (=> b!100861 m!146665))

(declare-fun m!146667 () Bool)

(assert (=> b!100862 m!146667))

(declare-fun m!146669 () Bool)

(assert (=> b!100858 m!146669))

(declare-fun m!146671 () Bool)

(assert (=> bm!1261 m!146671))

(declare-fun m!146673 () Bool)

(assert (=> b!100856 m!146673))

(declare-fun m!146675 () Bool)

(assert (=> b!100856 m!146675))

(assert (=> b!100857 m!146675))

(assert (=> b!100857 m!146285))

(declare-fun m!146679 () Bool)

(assert (=> b!100863 m!146679))

(declare-fun m!146683 () Bool)

(assert (=> b!100863 m!146683))

(declare-fun m!146685 () Bool)

(assert (=> b!100863 m!146685))

(declare-fun m!146689 () Bool)

(assert (=> b!100863 m!146689))

(assert (=> b!100863 m!146625))

(assert (=> b!100642 d!31574))

(declare-fun d!31596 () Bool)

(declare-fun e!65984 () Bool)

(assert (=> d!31596 e!65984))

(declare-fun res!82878 () Bool)

(assert (=> d!31596 (=> (not res!82878) (not e!65984))))

(declare-fun lt!146589 () tuple2!8132)

(assert (=> d!31596 (= res!82878 (= (size!2160 (buf!2517 thiss!1305)) (size!2160 (buf!2517 (_2!4321 lt!146589)))))))

(declare-fun choose!16 (BitStream!3794 Bool) tuple2!8132)

(assert (=> d!31596 (= lt!146589 (choose!16 thiss!1305 lt!145815))))

(assert (=> d!31596 (validate_offset_bit!0 ((_ sign_extend 32) (size!2160 (buf!2517 thiss!1305))) ((_ sign_extend 32) (currentByte!4972 thiss!1305)) ((_ sign_extend 32) (currentBit!4967 thiss!1305)))))

(assert (=> d!31596 (= (appendBit!0 thiss!1305 lt!145815) lt!146589)))

(declare-fun b!100925 () Bool)

(declare-fun e!65985 () Bool)

(assert (=> b!100925 (= e!65984 e!65985)))

(declare-fun res!82877 () Bool)

(assert (=> b!100925 (=> (not res!82877) (not e!65985))))

(declare-fun lt!146587 () tuple2!8128)

(assert (=> b!100925 (= res!82877 (and (= (_2!4319 lt!146587) lt!145815) (= (_1!4319 lt!146587) (_2!4321 lt!146589))))))

(assert (=> b!100925 (= lt!146587 (readBitPure!0 (readerFrom!0 (_2!4321 lt!146589) (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305))))))

(declare-fun b!100926 () Bool)

(assert (=> b!100926 (= e!65985 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146587))) (currentByte!4972 (_1!4319 lt!146587)) (currentBit!4967 (_1!4319 lt!146587))) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146589))) (currentByte!4972 (_2!4321 lt!146589)) (currentBit!4967 (_2!4321 lt!146589)))))))

(declare-fun b!100923 () Bool)

(declare-fun res!82879 () Bool)

(assert (=> b!100923 (=> (not res!82879) (not e!65984))))

(declare-fun lt!146586 () (_ BitVec 64))

(declare-fun lt!146588 () (_ BitVec 64))

(assert (=> b!100923 (= res!82879 (= (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!146589))) (currentByte!4972 (_2!4321 lt!146589)) (currentBit!4967 (_2!4321 lt!146589))) (bvadd lt!146588 lt!146586)))))

(assert (=> b!100923 (or (not (= (bvand lt!146588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146588 lt!146586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100923 (= lt!146586 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100923 (= lt!146588 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(declare-fun b!100924 () Bool)

(declare-fun res!82880 () Bool)

(assert (=> b!100924 (=> (not res!82880) (not e!65984))))

(assert (=> b!100924 (= res!82880 (isPrefixOf!0 thiss!1305 (_2!4321 lt!146589)))))

(assert (= (and d!31596 res!82878) b!100923))

(assert (= (and b!100923 res!82879) b!100924))

(assert (= (and b!100924 res!82880) b!100925))

(assert (= (and b!100925 res!82877) b!100926))

(declare-fun m!146795 () Bool)

(assert (=> d!31596 m!146795))

(declare-fun m!146797 () Bool)

(assert (=> d!31596 m!146797))

(declare-fun m!146799 () Bool)

(assert (=> b!100925 m!146799))

(assert (=> b!100925 m!146799))

(declare-fun m!146801 () Bool)

(assert (=> b!100925 m!146801))

(declare-fun m!146803 () Bool)

(assert (=> b!100923 m!146803))

(assert (=> b!100923 m!146287))

(declare-fun m!146805 () Bool)

(assert (=> b!100924 m!146805))

(declare-fun m!146807 () Bool)

(assert (=> b!100926 m!146807))

(assert (=> b!100926 m!146803))

(assert (=> b!100642 d!31596))

(declare-fun d!31626 () Bool)

(declare-fun lt!146590 () tuple2!8136)

(assert (=> d!31626 (= lt!146590 (readBit!0 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305))))))

(assert (=> d!31626 (= (readBitPure!0 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305))) (tuple2!8129 (_2!4323 lt!146590) (_1!4323 lt!146590)))))

(declare-fun bs!7739 () Bool)

(assert (= bs!7739 d!31626))

(declare-fun m!146809 () Bool)

(assert (=> bs!7739 m!146809))

(assert (=> b!100642 d!31626))

(declare-fun d!31628 () Bool)

(assert (=> d!31628 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4320 lt!145822)))) ((_ sign_extend 32) (currentByte!4972 (_1!4320 lt!145822))) ((_ sign_extend 32) (currentBit!4967 (_1!4320 lt!145822)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4320 lt!145822)))) ((_ sign_extend 32) (currentByte!4972 (_1!4320 lt!145822))) ((_ sign_extend 32) (currentBit!4967 (_1!4320 lt!145822)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7740 () Bool)

(assert (= bs!7740 d!31628))

(declare-fun m!146811 () Bool)

(assert (=> bs!7740 m!146811))

(assert (=> b!100642 d!31628))

(declare-fun d!31630 () Bool)

(declare-fun lt!146591 () tuple2!8136)

(assert (=> d!31630 (= lt!146591 (readBit!0 lt!145820))))

(assert (=> d!31630 (= (readBitPure!0 lt!145820) (tuple2!8129 (_2!4323 lt!146591) (_1!4323 lt!146591)))))

(declare-fun bs!7741 () Bool)

(assert (= bs!7741 d!31630))

(declare-fun m!146813 () Bool)

(assert (=> bs!7741 m!146813))

(assert (=> b!100642 d!31630))

(declare-fun b!100927 () Bool)

(declare-fun res!82881 () Bool)

(declare-fun e!65987 () Bool)

(assert (=> b!100927 (=> (not res!82881) (not e!65987))))

(declare-fun lt!146595 () tuple2!8130)

(assert (=> b!100927 (= res!82881 (isPrefixOf!0 (_1!4320 lt!146595) thiss!1305))))

(declare-fun b!100928 () Bool)

(declare-fun e!65986 () Unit!6168)

(declare-fun lt!146607 () Unit!6168)

(assert (=> b!100928 (= e!65986 lt!146607)))

(declare-fun lt!146596 () (_ BitVec 64))

(assert (=> b!100928 (= lt!146596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!146603 () (_ BitVec 64))

(assert (=> b!100928 (= lt!146603 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(assert (=> b!100928 (= lt!146607 (arrayBitRangesEqSymmetric!0 (buf!2517 thiss!1305) (buf!2517 (_2!4321 lt!145811)) lt!146596 lt!146603))))

(assert (=> b!100928 (arrayBitRangesEq!0 (buf!2517 (_2!4321 lt!145811)) (buf!2517 thiss!1305) lt!146596 lt!146603)))

(declare-fun b!100930 () Bool)

(declare-fun res!82883 () Bool)

(assert (=> b!100930 (=> (not res!82883) (not e!65987))))

(assert (=> b!100930 (= res!82883 (isPrefixOf!0 (_2!4320 lt!146595) (_2!4321 lt!145811)))))

(declare-fun lt!146610 () (_ BitVec 64))

(declare-fun b!100931 () Bool)

(declare-fun lt!146605 () (_ BitVec 64))

(assert (=> b!100931 (= e!65987 (= (_1!4320 lt!146595) (withMovedBitIndex!0 (_2!4320 lt!146595) (bvsub lt!146610 lt!146605))))))

(assert (=> b!100931 (or (= (bvand lt!146610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146610 lt!146605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100931 (= lt!146605 (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145811))) (currentByte!4972 (_2!4321 lt!145811)) (currentBit!4967 (_2!4321 lt!145811))))))

(assert (=> b!100931 (= lt!146610 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(declare-fun d!31632 () Bool)

(assert (=> d!31632 e!65987))

(declare-fun res!82882 () Bool)

(assert (=> d!31632 (=> (not res!82882) (not e!65987))))

(assert (=> d!31632 (= res!82882 (isPrefixOf!0 (_1!4320 lt!146595) (_2!4320 lt!146595)))))

(declare-fun lt!146593 () BitStream!3794)

(assert (=> d!31632 (= lt!146595 (tuple2!8131 lt!146593 (_2!4321 lt!145811)))))

(declare-fun lt!146609 () Unit!6168)

(declare-fun lt!146606 () Unit!6168)

(assert (=> d!31632 (= lt!146609 lt!146606)))

(assert (=> d!31632 (isPrefixOf!0 lt!146593 (_2!4321 lt!145811))))

(assert (=> d!31632 (= lt!146606 (lemmaIsPrefixTransitive!0 lt!146593 (_2!4321 lt!145811) (_2!4321 lt!145811)))))

(declare-fun lt!146598 () Unit!6168)

(declare-fun lt!146600 () Unit!6168)

(assert (=> d!31632 (= lt!146598 lt!146600)))

(assert (=> d!31632 (isPrefixOf!0 lt!146593 (_2!4321 lt!145811))))

(assert (=> d!31632 (= lt!146600 (lemmaIsPrefixTransitive!0 lt!146593 thiss!1305 (_2!4321 lt!145811)))))

(declare-fun lt!146592 () Unit!6168)

(assert (=> d!31632 (= lt!146592 e!65986)))

(declare-fun c!6325 () Bool)

(assert (=> d!31632 (= c!6325 (not (= (size!2160 (buf!2517 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!146597 () Unit!6168)

(declare-fun lt!146601 () Unit!6168)

(assert (=> d!31632 (= lt!146597 lt!146601)))

(assert (=> d!31632 (isPrefixOf!0 (_2!4321 lt!145811) (_2!4321 lt!145811))))

(assert (=> d!31632 (= lt!146601 (lemmaIsPrefixRefl!0 (_2!4321 lt!145811)))))

(declare-fun lt!146604 () Unit!6168)

(declare-fun lt!146599 () Unit!6168)

(assert (=> d!31632 (= lt!146604 lt!146599)))

(assert (=> d!31632 (= lt!146599 (lemmaIsPrefixRefl!0 (_2!4321 lt!145811)))))

(declare-fun lt!146608 () Unit!6168)

(declare-fun lt!146611 () Unit!6168)

(assert (=> d!31632 (= lt!146608 lt!146611)))

(assert (=> d!31632 (isPrefixOf!0 lt!146593 lt!146593)))

(assert (=> d!31632 (= lt!146611 (lemmaIsPrefixRefl!0 lt!146593))))

(declare-fun lt!146602 () Unit!6168)

(declare-fun lt!146594 () Unit!6168)

(assert (=> d!31632 (= lt!146602 lt!146594)))

(assert (=> d!31632 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31632 (= lt!146594 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31632 (= lt!146593 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)))))

(assert (=> d!31632 (isPrefixOf!0 thiss!1305 (_2!4321 lt!145811))))

(assert (=> d!31632 (= (reader!0 thiss!1305 (_2!4321 lt!145811)) lt!146595)))

(declare-fun b!100929 () Bool)

(declare-fun Unit!6193 () Unit!6168)

(assert (=> b!100929 (= e!65986 Unit!6193)))

(assert (= (and d!31632 c!6325) b!100928))

(assert (= (and d!31632 (not c!6325)) b!100929))

(assert (= (and d!31632 res!82882) b!100927))

(assert (= (and b!100927 res!82881) b!100930))

(assert (= (and b!100930 res!82883) b!100931))

(declare-fun m!146815 () Bool)

(assert (=> b!100931 m!146815))

(assert (=> b!100931 m!146367))

(assert (=> b!100931 m!146287))

(assert (=> b!100928 m!146287))

(declare-fun m!146817 () Bool)

(assert (=> b!100928 m!146817))

(declare-fun m!146819 () Bool)

(assert (=> b!100928 m!146819))

(declare-fun m!146821 () Bool)

(assert (=> d!31632 m!146821))

(declare-fun m!146823 () Bool)

(assert (=> d!31632 m!146823))

(declare-fun m!146825 () Bool)

(assert (=> d!31632 m!146825))

(assert (=> d!31632 m!146379))

(declare-fun m!146827 () Bool)

(assert (=> d!31632 m!146827))

(declare-fun m!146829 () Bool)

(assert (=> d!31632 m!146829))

(assert (=> d!31632 m!146385))

(declare-fun m!146831 () Bool)

(assert (=> d!31632 m!146831))

(declare-fun m!146833 () Bool)

(assert (=> d!31632 m!146833))

(declare-fun m!146835 () Bool)

(assert (=> d!31632 m!146835))

(assert (=> d!31632 m!146295))

(declare-fun m!146837 () Bool)

(assert (=> b!100930 m!146837))

(declare-fun m!146839 () Bool)

(assert (=> b!100927 m!146839))

(assert (=> b!100642 d!31632))

(declare-fun d!31634 () Bool)

(declare-fun res!82885 () Bool)

(declare-fun e!65989 () Bool)

(assert (=> d!31634 (=> (not res!82885) (not e!65989))))

(assert (=> d!31634 (= res!82885 (= (size!2160 (buf!2517 thiss!1305)) (size!2160 (buf!2517 (_2!4321 lt!145811)))))))

(assert (=> d!31634 (= (isPrefixOf!0 thiss!1305 (_2!4321 lt!145811)) e!65989)))

(declare-fun b!100932 () Bool)

(declare-fun res!82884 () Bool)

(assert (=> b!100932 (=> (not res!82884) (not e!65989))))

(assert (=> b!100932 (= res!82884 (bvsle (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305)) (bitIndex!0 (size!2160 (buf!2517 (_2!4321 lt!145811))) (currentByte!4972 (_2!4321 lt!145811)) (currentBit!4967 (_2!4321 lt!145811)))))))

(declare-fun b!100933 () Bool)

(declare-fun e!65988 () Bool)

(assert (=> b!100933 (= e!65989 e!65988)))

(declare-fun res!82886 () Bool)

(assert (=> b!100933 (=> res!82886 e!65988)))

(assert (=> b!100933 (= res!82886 (= (size!2160 (buf!2517 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100934 () Bool)

(assert (=> b!100934 (= e!65988 (arrayBitRangesEq!0 (buf!2517 thiss!1305) (buf!2517 (_2!4321 lt!145811)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2160 (buf!2517 thiss!1305)) (currentByte!4972 thiss!1305) (currentBit!4967 thiss!1305))))))

(assert (= (and d!31634 res!82885) b!100932))

(assert (= (and b!100932 res!82884) b!100933))

(assert (= (and b!100933 (not res!82886)) b!100934))

(assert (=> b!100932 m!146287))

(assert (=> b!100932 m!146367))

(assert (=> b!100934 m!146287))

(assert (=> b!100934 m!146287))

(declare-fun m!146841 () Bool)

(assert (=> b!100934 m!146841))

(assert (=> b!100642 d!31634))

(declare-fun d!31636 () Bool)

(declare-fun e!65998 () Bool)

(assert (=> d!31636 e!65998))

(declare-fun res!82901 () Bool)

(assert (=> d!31636 (=> (not res!82901) (not e!65998))))

(declare-fun lt!146633 () tuple2!8128)

(declare-fun lt!146634 () tuple2!8128)

(assert (=> d!31636 (= res!82901 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146633))) (currentByte!4972 (_1!4319 lt!146633)) (currentBit!4967 (_1!4319 lt!146633))) (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!146634))) (currentByte!4972 (_1!4319 lt!146634)) (currentBit!4967 (_1!4319 lt!146634)))))))

(declare-fun lt!146635 () Unit!6168)

(declare-fun lt!146636 () BitStream!3794)

(declare-fun choose!50 (BitStream!3794 BitStream!3794 BitStream!3794 tuple2!8128 tuple2!8128 BitStream!3794 Bool tuple2!8128 tuple2!8128 BitStream!3794 Bool) Unit!6168)

(assert (=> d!31636 (= lt!146635 (choose!50 lt!145820 (_2!4321 lt!145811) lt!146636 lt!146633 (tuple2!8129 (_1!4319 lt!146633) (_2!4319 lt!146633)) (_1!4319 lt!146633) (_2!4319 lt!146633) lt!146634 (tuple2!8129 (_1!4319 lt!146634) (_2!4319 lt!146634)) (_1!4319 lt!146634) (_2!4319 lt!146634)))))

(assert (=> d!31636 (= lt!146634 (readBitPure!0 lt!146636))))

(assert (=> d!31636 (= lt!146633 (readBitPure!0 lt!145820))))

(assert (=> d!31636 (= lt!146636 (BitStream!3795 (buf!2517 (_2!4321 lt!145811)) (currentByte!4972 lt!145820) (currentBit!4967 lt!145820)))))

(assert (=> d!31636 (invariant!0 (currentBit!4967 lt!145820) (currentByte!4972 lt!145820) (size!2160 (buf!2517 (_2!4321 lt!145811))))))

(assert (=> d!31636 (= (readBitPrefixLemma!0 lt!145820 (_2!4321 lt!145811)) lt!146635)))

(declare-fun b!100950 () Bool)

(assert (=> b!100950 (= e!65998 (= (_2!4319 lt!146633) (_2!4319 lt!146634)))))

(assert (= (and d!31636 res!82901) b!100950))

(declare-fun m!146859 () Bool)

(assert (=> d!31636 m!146859))

(declare-fun m!146861 () Bool)

(assert (=> d!31636 m!146861))

(assert (=> d!31636 m!146291))

(declare-fun m!146863 () Bool)

(assert (=> d!31636 m!146863))

(declare-fun m!146865 () Bool)

(assert (=> d!31636 m!146865))

(declare-fun m!146867 () Bool)

(assert (=> d!31636 m!146867))

(assert (=> b!100642 d!31636))

(declare-fun d!31642 () Bool)

(declare-fun e!65999 () Bool)

(assert (=> d!31642 e!65999))

(declare-fun res!82902 () Bool)

(assert (=> d!31642 (=> (not res!82902) (not e!65999))))

(declare-fun lt!146642 () (_ BitVec 64))

(declare-fun lt!146639 () (_ BitVec 64))

(declare-fun lt!146641 () (_ BitVec 64))

(assert (=> d!31642 (= res!82902 (= lt!146642 (bvsub lt!146641 lt!146639)))))

(assert (=> d!31642 (or (= (bvand lt!146641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146641 lt!146639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31642 (= lt!146639 (remainingBits!0 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145821)))) ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145821))) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145821)))))))

(declare-fun lt!146638 () (_ BitVec 64))

(declare-fun lt!146640 () (_ BitVec 64))

(assert (=> d!31642 (= lt!146641 (bvmul lt!146638 lt!146640))))

(assert (=> d!31642 (or (= lt!146638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146640 (bvsdiv (bvmul lt!146638 lt!146640) lt!146638)))))

(assert (=> d!31642 (= lt!146640 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31642 (= lt!146638 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145821)))))))

(assert (=> d!31642 (= lt!146642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4972 (_1!4319 lt!145821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4967 (_1!4319 lt!145821)))))))

(assert (=> d!31642 (invariant!0 (currentBit!4967 (_1!4319 lt!145821)) (currentByte!4972 (_1!4319 lt!145821)) (size!2160 (buf!2517 (_1!4319 lt!145821))))))

(assert (=> d!31642 (= (bitIndex!0 (size!2160 (buf!2517 (_1!4319 lt!145821))) (currentByte!4972 (_1!4319 lt!145821)) (currentBit!4967 (_1!4319 lt!145821))) lt!146642)))

(declare-fun b!100951 () Bool)

(declare-fun res!82903 () Bool)

(assert (=> b!100951 (=> (not res!82903) (not e!65999))))

(assert (=> b!100951 (= res!82903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146642))))

(declare-fun b!100952 () Bool)

(declare-fun lt!146637 () (_ BitVec 64))

(assert (=> b!100952 (= e!65999 (bvsle lt!146642 (bvmul lt!146637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100952 (or (= lt!146637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146637)))))

(assert (=> b!100952 (= lt!146637 ((_ sign_extend 32) (size!2160 (buf!2517 (_1!4319 lt!145821)))))))

(assert (= (and d!31642 res!82902) b!100951))

(assert (= (and b!100951 res!82903) b!100952))

(declare-fun m!146869 () Bool)

(assert (=> d!31642 m!146869))

(declare-fun m!146871 () Bool)

(assert (=> d!31642 m!146871))

(assert (=> b!100641 d!31642))

(declare-fun d!31644 () Bool)

(assert (=> d!31644 (= (array_inv!1962 (buf!2517 thiss!1305)) (bvsge (size!2160 (buf!2517 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100652 d!31644))

(declare-fun d!31646 () Bool)

(assert (=> d!31646 (= (invariant!0 (currentBit!4967 thiss!1305) (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145813)))) (and (bvsge (currentBit!4967 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4967 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4972 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145813)))) (and (= (currentBit!4967 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4972 thiss!1305) (size!2160 (buf!2517 (_2!4321 lt!145813))))))))))

(assert (=> b!100643 d!31646))

(push 1)

(assert (not d!31636))

(assert (not b!100857))

(assert (not d!31554))

(assert (not b!100722))

(assert (not d!31566))

(assert (not d!31568))

(assert (not d!31572))

(assert (not b!100865))

(assert (not b!100924))

(assert (not d!31556))

(assert (not d!31552))

(assert (not b!100932))

(assert (not b!100925))

(assert (not d!31570))

(assert (not b!100923))

(assert (not b!100692))

(assert (not b!100858))

(assert (not d!31628))

(assert (not b!100856))

(assert (not b!100861))

(assert (not b!100863))

(assert (not b!100930))

(assert (not b!100719))

(assert (not bm!1261))

(assert (not b!100860))

(assert (not b!100718))

(assert (not b!100867))

(assert (not d!31632))

(assert (not b!100926))

(assert (not b!100690))

(assert (not b!100928))

(assert (not d!31630))

(assert (not b!100859))

(assert (not b!100695))

(assert (not b!100862))

(assert (not b!100927))

(assert (not d!31642))

(assert (not b!100934))

(assert (not d!31626))

(assert (not d!31596))

(assert (not b!100721))

(assert (not d!31562))

(assert (not d!31560))

(assert (not b!100931))

(assert (not d!31558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

