; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66428 () Bool)

(assert start!66428)

(declare-fun res!245663 () Bool)

(declare-fun e!213132 () Bool)

(assert (=> start!66428 (=> (not res!245663) (not e!213132))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17826 0))(
  ( (array!17827 (arr!8805 (Array (_ BitVec 32) (_ BitVec 8))) (size!7725 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17826)

(assert (=> start!66428 (= res!245663 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7725 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66428 e!213132))

(declare-datatypes ((BitStream!13454 0))(
  ( (BitStream!13455 (buf!7788 array!17826) (currentByte!14336 (_ BitVec 32)) (currentBit!14331 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13454)

(declare-fun e!213131 () Bool)

(declare-fun inv!12 (BitStream!13454) Bool)

(assert (=> start!66428 (and (inv!12 thiss!1728) e!213131)))

(assert (=> start!66428 true))

(declare-fun array_inv!7337 (array!17826) Bool)

(assert (=> start!66428 (array_inv!7337 arr!273)))

(declare-fun b!297660 () Bool)

(declare-fun res!245661 () Bool)

(assert (=> b!297660 (=> (not res!245661) (not e!213132))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297660 (= res!245661 (validate_offset_bits!1 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))) ((_ sign_extend 32) (currentByte!14336 thiss!1728)) ((_ sign_extend 32) (currentBit!14331 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297663 () Bool)

(assert (=> b!297663 (= e!213131 (array_inv!7337 (buf!7788 thiss!1728)))))

(declare-fun b!297661 () Bool)

(declare-fun res!245662 () Bool)

(assert (=> b!297661 (=> (not res!245662) (not e!213132))))

(assert (=> b!297661 (= res!245662 (bvsge from!505 to!474))))

(declare-fun lt!433913 () (_ BitVec 64))

(declare-fun b!297662 () Bool)

(declare-fun lt!433910 () (_ BitVec 64))

(assert (=> b!297662 (= e!213132 (not (or (= lt!433910 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!433910 (bvand (bvsub lt!433913 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297662 (= lt!433910 (bvand lt!433913 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297662 (= lt!433913 (bvadd (bitIndex!0 (size!7725 (buf!7788 thiss!1728)) (currentByte!14336 thiss!1728) (currentBit!14331 thiss!1728)) to!474))))

(declare-fun arrayBitRangesEq!0 (array!17826 array!17826 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297662 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433914 () (_ BitVec 64))

(declare-datatypes ((Unit!20771 0))(
  ( (Unit!20772) )
))
(declare-fun lt!433912 () Unit!20771)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17826 array!17826 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20771)

(assert (=> b!297662 (= lt!433912 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297662 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914)))

(assert (=> b!297662 (= lt!433914 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7725 arr!273))))))

(declare-fun lt!433911 () Unit!20771)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17826) Unit!20771)

(assert (=> b!297662 (= lt!433911 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66428 res!245663) b!297660))

(assert (= (and b!297660 res!245661) b!297661))

(assert (= (and b!297661 res!245662) b!297662))

(assert (= start!66428 b!297663))

(declare-fun m!436501 () Bool)

(assert (=> start!66428 m!436501))

(declare-fun m!436503 () Bool)

(assert (=> start!66428 m!436503))

(declare-fun m!436505 () Bool)

(assert (=> b!297660 m!436505))

(declare-fun m!436507 () Bool)

(assert (=> b!297663 m!436507))

(declare-fun m!436509 () Bool)

(assert (=> b!297662 m!436509))

(declare-fun m!436511 () Bool)

(assert (=> b!297662 m!436511))

(declare-fun m!436513 () Bool)

(assert (=> b!297662 m!436513))

(declare-fun m!436515 () Bool)

(assert (=> b!297662 m!436515))

(declare-fun m!436517 () Bool)

(assert (=> b!297662 m!436517))

(push 1)

(assert (not b!297662))

(assert (not b!297660))

(assert (not b!297663))

(assert (not start!66428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100260 () Bool)

(assert (=> d!100260 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433971 () Unit!20771)

(declare-fun choose!4 (array!17826 array!17826 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20771)

(assert (=> d!100260 (= lt!433971 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100260 (bvsle (size!7725 arr!273) (size!7725 arr!273))))

(assert (=> d!100260 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!433971)))

(declare-fun bs!25650 () Bool)

(assert (= bs!25650 d!100260))

(assert (=> bs!25650 m!436515))

(declare-fun m!436569 () Bool)

(assert (=> bs!25650 m!436569))

(assert (=> b!297662 d!100260))

(declare-fun d!100262 () Bool)

(declare-fun e!213188 () Bool)

(assert (=> d!100262 e!213188))

(declare-fun res!245717 () Bool)

(assert (=> d!100262 (=> (not res!245717) (not e!213188))))

(declare-fun lt!433989 () (_ BitVec 64))

(assert (=> d!100262 (= res!245717 (or (= lt!433989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433989))))))

(assert (=> d!100262 (= lt!433989 ((_ sign_extend 32) (size!7725 arr!273)))))

(declare-fun lt!433988 () Unit!20771)

(declare-fun choose!59 (array!17826) Unit!20771)

(assert (=> d!100262 (= lt!433988 (choose!59 arr!273))))

(assert (=> d!100262 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433988)))

(declare-fun b!297731 () Bool)

(assert (=> b!297731 (= e!213188 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7725 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100262 res!245717) b!297731))

(declare-fun m!436571 () Bool)

(assert (=> d!100262 m!436571))

(declare-fun m!436573 () Bool)

(assert (=> b!297731 m!436573))

(assert (=> b!297662 d!100262))

(declare-fun d!100264 () Bool)

(declare-fun e!213198 () Bool)

(assert (=> d!100264 e!213198))

(declare-fun res!245730 () Bool)

(assert (=> d!100264 (=> (not res!245730) (not e!213198))))

(declare-fun lt!434017 () (_ BitVec 64))

(declare-fun lt!434015 () (_ BitVec 64))

(declare-fun lt!434014 () (_ BitVec 64))

(assert (=> d!100264 (= res!245730 (= lt!434017 (bvsub lt!434015 lt!434014)))))

(assert (=> d!100264 (or (= (bvand lt!434015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!434014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!434015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!434015 lt!434014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100264 (= lt!434014 (remainingBits!0 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))) ((_ sign_extend 32) (currentByte!14336 thiss!1728)) ((_ sign_extend 32) (currentBit!14331 thiss!1728))))))

(declare-fun lt!434016 () (_ BitVec 64))

(declare-fun lt!434019 () (_ BitVec 64))

(assert (=> d!100264 (= lt!434015 (bvmul lt!434016 lt!434019))))

(assert (=> d!100264 (or (= lt!434016 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!434019 (bvsdiv (bvmul lt!434016 lt!434019) lt!434016)))))

(assert (=> d!100264 (= lt!434019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100264 (= lt!434016 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))))))

(assert (=> d!100264 (= lt!434017 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14336 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14331 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100264 (invariant!0 (currentBit!14331 thiss!1728) (currentByte!14336 thiss!1728) (size!7725 (buf!7788 thiss!1728)))))

(assert (=> d!100264 (= (bitIndex!0 (size!7725 (buf!7788 thiss!1728)) (currentByte!14336 thiss!1728) (currentBit!14331 thiss!1728)) lt!434017)))

(declare-fun b!297745 () Bool)

(declare-fun res!245729 () Bool)

(assert (=> b!297745 (=> (not res!245729) (not e!213198))))

(assert (=> b!297745 (= res!245729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!434017))))

(declare-fun b!297746 () Bool)

(declare-fun lt!434018 () (_ BitVec 64))

(assert (=> b!297746 (= e!213198 (bvsle lt!434017 (bvmul lt!434018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297746 (or (= lt!434018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434018)))))

(assert (=> b!297746 (= lt!434018 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))))))

(assert (= (and d!100264 res!245730) b!297745))

(assert (= (and b!297745 res!245729) b!297746))

(declare-fun m!436593 () Bool)

(assert (=> d!100264 m!436593))

(declare-fun m!436595 () Bool)

(assert (=> d!100264 m!436595))

(assert (=> b!297662 d!100264))

(declare-fun b!297761 () Bool)

(declare-fun e!213214 () Bool)

(declare-datatypes ((tuple4!928 0))(
  ( (tuple4!929 (_1!13113 (_ BitVec 32)) (_2!13113 (_ BitVec 32)) (_3!1421 (_ BitVec 32)) (_4!464 (_ BitVec 32))) )
))
(declare-fun lt!434027 () tuple4!928)

(declare-fun arrayRangesEq!1522 (array!17826 array!17826 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297761 (= e!213214 (arrayRangesEq!1522 arr!273 arr!273 (_1!13113 lt!434027) (_2!13113 lt!434027)))))

(declare-fun b!297762 () Bool)

(declare-fun e!213211 () Bool)

(declare-fun call!5266 () Bool)

(assert (=> b!297762 (= e!213211 call!5266)))

(declare-fun d!100278 () Bool)

(declare-fun res!245745 () Bool)

(declare-fun e!213212 () Bool)

(assert (=> d!100278 (=> res!245745 e!213212)))

(assert (=> d!100278 (= res!245745 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914))))

(assert (=> d!100278 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914) e!213212)))

(declare-fun b!297763 () Bool)

(declare-fun res!245742 () Bool)

(declare-fun lt!434026 () (_ BitVec 32))

(assert (=> b!297763 (= res!245742 (= lt!434026 #b00000000000000000000000000000000))))

(declare-fun e!213215 () Bool)

(assert (=> b!297763 (=> res!245742 e!213215)))

(declare-fun e!213213 () Bool)

(assert (=> b!297763 (= e!213213 e!213215)))

(declare-fun b!297764 () Bool)

(declare-fun e!213216 () Bool)

(assert (=> b!297764 (= e!213216 e!213211)))

(declare-fun c!13628 () Bool)

(assert (=> b!297764 (= c!13628 (= (_3!1421 lt!434027) (_4!464 lt!434027)))))

(declare-fun bm!5263 () Bool)

(declare-fun lt!434028 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5263 (= call!5266 (byteRangesEq!0 (ite c!13628 (select (arr!8805 arr!273) (_3!1421 lt!434027)) (select (arr!8805 arr!273) (_4!464 lt!434027))) (ite c!13628 (select (arr!8805 arr!273) (_3!1421 lt!434027)) (select (arr!8805 arr!273) (_4!464 lt!434027))) (ite c!13628 lt!434028 #b00000000000000000000000000000000) lt!434026))))

(declare-fun b!297765 () Bool)

(assert (=> b!297765 (= e!213212 e!213216)))

(declare-fun res!245741 () Bool)

(assert (=> b!297765 (=> (not res!245741) (not e!213216))))

(assert (=> b!297765 (= res!245741 e!213214)))

(declare-fun res!245743 () Bool)

(assert (=> b!297765 (=> res!245743 e!213214)))

(assert (=> b!297765 (= res!245743 (bvsge (_1!13113 lt!434027) (_2!13113 lt!434027)))))

(assert (=> b!297765 (= lt!434026 ((_ extract 31 0) (bvsrem lt!433914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297765 (= lt!434028 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!928)

(assert (=> b!297765 (= lt!434027 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433914))))

(declare-fun b!297766 () Bool)

(assert (=> b!297766 (= e!213215 call!5266)))

(declare-fun b!297767 () Bool)

(assert (=> b!297767 (= e!213211 e!213213)))

(declare-fun res!245744 () Bool)

(assert (=> b!297767 (= res!245744 (byteRangesEq!0 (select (arr!8805 arr!273) (_3!1421 lt!434027)) (select (arr!8805 arr!273) (_3!1421 lt!434027)) lt!434028 #b00000000000000000000000000001000))))

(assert (=> b!297767 (=> (not res!245744) (not e!213213))))

(assert (= (and d!100278 (not res!245745)) b!297765))

(assert (= (and b!297765 (not res!245743)) b!297761))

(assert (= (and b!297765 res!245741) b!297764))

(assert (= (and b!297764 c!13628) b!297762))

(assert (= (and b!297764 (not c!13628)) b!297767))

(assert (= (and b!297767 res!245744) b!297763))

(assert (= (and b!297763 (not res!245742)) b!297766))

(assert (= (or b!297762 b!297766) bm!5263))

(declare-fun m!436597 () Bool)

(assert (=> b!297761 m!436597))

(declare-fun m!436599 () Bool)

(assert (=> bm!5263 m!436599))

(declare-fun m!436601 () Bool)

(assert (=> bm!5263 m!436601))

(declare-fun m!436603 () Bool)

(assert (=> bm!5263 m!436603))

(assert (=> bm!5263 m!436603))

(assert (=> bm!5263 m!436601))

(declare-fun m!436605 () Bool)

(assert (=> b!297765 m!436605))

(assert (=> b!297767 m!436603))

(assert (=> b!297767 m!436603))

(assert (=> b!297767 m!436603))

(assert (=> b!297767 m!436603))

(declare-fun m!436607 () Bool)

(assert (=> b!297767 m!436607))

(assert (=> b!297662 d!100278))

(declare-fun b!297768 () Bool)

(declare-fun e!213220 () Bool)

(declare-fun lt!434030 () tuple4!928)

(assert (=> b!297768 (= e!213220 (arrayRangesEq!1522 arr!273 arr!273 (_1!13113 lt!434030) (_2!13113 lt!434030)))))

(declare-fun b!297769 () Bool)

(declare-fun e!213217 () Bool)

(declare-fun call!5267 () Bool)

(assert (=> b!297769 (= e!213217 call!5267)))

(declare-fun d!100280 () Bool)

(declare-fun res!245750 () Bool)

(declare-fun e!213218 () Bool)

(assert (=> d!100280 (=> res!245750 e!213218)))

(assert (=> d!100280 (= res!245750 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100280 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213218)))

(declare-fun b!297770 () Bool)

(declare-fun res!245747 () Bool)

(declare-fun lt!434029 () (_ BitVec 32))

(assert (=> b!297770 (= res!245747 (= lt!434029 #b00000000000000000000000000000000))))

(declare-fun e!213221 () Bool)

(assert (=> b!297770 (=> res!245747 e!213221)))

(declare-fun e!213219 () Bool)

(assert (=> b!297770 (= e!213219 e!213221)))

(declare-fun b!297771 () Bool)

(declare-fun e!213222 () Bool)

(assert (=> b!297771 (= e!213222 e!213217)))

(declare-fun c!13629 () Bool)

(assert (=> b!297771 (= c!13629 (= (_3!1421 lt!434030) (_4!464 lt!434030)))))

(declare-fun bm!5264 () Bool)

(declare-fun lt!434031 () (_ BitVec 32))

(assert (=> bm!5264 (= call!5267 (byteRangesEq!0 (ite c!13629 (select (arr!8805 arr!273) (_3!1421 lt!434030)) (select (arr!8805 arr!273) (_4!464 lt!434030))) (ite c!13629 (select (arr!8805 arr!273) (_3!1421 lt!434030)) (select (arr!8805 arr!273) (_4!464 lt!434030))) (ite c!13629 lt!434031 #b00000000000000000000000000000000) lt!434029))))

(declare-fun b!297772 () Bool)

(assert (=> b!297772 (= e!213218 e!213222)))

(declare-fun res!245746 () Bool)

(assert (=> b!297772 (=> (not res!245746) (not e!213222))))

(assert (=> b!297772 (= res!245746 e!213220)))

(declare-fun res!245748 () Bool)

(assert (=> b!297772 (=> res!245748 e!213220)))

(assert (=> b!297772 (= res!245748 (bvsge (_1!13113 lt!434030) (_2!13113 lt!434030)))))

(assert (=> b!297772 (= lt!434029 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297772 (= lt!434031 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297772 (= lt!434030 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297773 () Bool)

(assert (=> b!297773 (= e!213221 call!5267)))

(declare-fun b!297774 () Bool)

(assert (=> b!297774 (= e!213217 e!213219)))

(declare-fun res!245749 () Bool)

(assert (=> b!297774 (= res!245749 (byteRangesEq!0 (select (arr!8805 arr!273) (_3!1421 lt!434030)) (select (arr!8805 arr!273) (_3!1421 lt!434030)) lt!434031 #b00000000000000000000000000001000))))

(assert (=> b!297774 (=> (not res!245749) (not e!213219))))

(assert (= (and d!100280 (not res!245750)) b!297772))

(assert (= (and b!297772 (not res!245748)) b!297768))

(assert (= (and b!297772 res!245746) b!297771))

(assert (= (and b!297771 c!13629) b!297769))

(assert (= (and b!297771 (not c!13629)) b!297774))

(assert (= (and b!297774 res!245749) b!297770))

(assert (= (and b!297770 (not res!245747)) b!297773))

(assert (= (or b!297769 b!297773) bm!5264))

(declare-fun m!436609 () Bool)

(assert (=> b!297768 m!436609))

(declare-fun m!436611 () Bool)

(assert (=> bm!5264 m!436611))

(declare-fun m!436613 () Bool)

(assert (=> bm!5264 m!436613))

(declare-fun m!436615 () Bool)

(assert (=> bm!5264 m!436615))

(assert (=> bm!5264 m!436615))

(assert (=> bm!5264 m!436613))

(declare-fun m!436617 () Bool)

(assert (=> b!297772 m!436617))

(assert (=> b!297774 m!436615))

(assert (=> b!297774 m!436615))

(assert (=> b!297774 m!436615))

(assert (=> b!297774 m!436615))

(declare-fun m!436619 () Bool)

(assert (=> b!297774 m!436619))

(assert (=> b!297662 d!100280))

(declare-fun d!100282 () Bool)

(assert (=> d!100282 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))) ((_ sign_extend 32) (currentByte!14336 thiss!1728)) ((_ sign_extend 32) (currentBit!14331 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7725 (buf!7788 thiss!1728))) ((_ sign_extend 32) (currentByte!14336 thiss!1728)) ((_ sign_extend 32) (currentBit!14331 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25654 () Bool)

(assert (= bs!25654 d!100282))

(assert (=> bs!25654 m!436593))

(assert (=> b!297660 d!100282))

(declare-fun d!100284 () Bool)

(assert (=> d!100284 (= (array_inv!7337 (buf!7788 thiss!1728)) (bvsge (size!7725 (buf!7788 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297663 d!100284))

(declare-fun d!100286 () Bool)

(assert (=> d!100286 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14331 thiss!1728) (currentByte!14336 thiss!1728) (size!7725 (buf!7788 thiss!1728))))))

(declare-fun bs!25655 () Bool)

(assert (= bs!25655 d!100286))

(assert (=> bs!25655 m!436595))

(assert (=> start!66428 d!100286))

(declare-fun d!100288 () Bool)

(assert (=> d!100288 (= (array_inv!7337 arr!273) (bvsge (size!7725 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66428 d!100288))

(push 1)

(assert (not d!100264))

(assert (not d!100262))

(assert (not b!297768))

(assert (not bm!5264))

(assert (not b!297761))

(assert (not d!100260))

(assert (not b!297731))

(assert (not b!297765))

(assert (not d!100286))

(assert (not b!297767))

(assert (not b!297772))

(assert (not b!297774))

(assert (not bm!5263))

(assert (not d!100282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

