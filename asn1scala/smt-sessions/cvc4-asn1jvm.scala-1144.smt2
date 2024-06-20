; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32354 () Bool)

(assert start!32354)

(declare-fun b!159686 () Bool)

(declare-fun e!109149 () Bool)

(declare-datatypes ((array!7615 0))(
  ( (array!7616 (arr!4368 (Array (_ BitVec 32) (_ BitVec 8))) (size!3447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6062 0))(
  ( (BitStream!6063 (buf!3905 array!7615) (currentByte!7142 (_ BitVec 32)) (currentBit!7137 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6062)

(declare-fun array_inv!3194 (array!7615) Bool)

(assert (=> b!159686 (= e!109149 (array_inv!3194 (buf!3905 thiss!1602)))))

(declare-fun b!159687 () Bool)

(declare-fun e!109145 () Bool)

(declare-datatypes ((Unit!10883 0))(
  ( (Unit!10884) )
))
(declare-datatypes ((tuple3!796 0))(
  ( (tuple3!797 (_1!7746 Unit!10883) (_2!7746 (_ BitVec 8)) (_3!515 BitStream!6062)) )
))
(declare-fun lt!252093 () tuple3!796)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159687 (= e!109145 (invariant!0 (currentBit!7137 (_3!515 lt!252093)) (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 (_3!515 lt!252093)))))))

(declare-fun b!159688 () Bool)

(declare-fun e!109148 () Unit!10883)

(declare-fun Unit!10885 () Unit!10883)

(assert (=> b!159688 (= e!109148 Unit!10885)))

(declare-fun call!2696 () Bool)

(assert (=> b!159688 call!2696))

(declare-fun b!159689 () Bool)

(declare-fun e!109146 () Bool)

(declare-fun e!109150 () Bool)

(assert (=> b!159689 (= e!109146 (not e!109150))))

(declare-fun res!133289 () Bool)

(assert (=> b!159689 (=> res!133289 e!109150)))

(declare-fun lt!252099 () array!7615)

(declare-fun arrayRangesEq!498 (array!7615 array!7615 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159689 (= res!133289 (not (arrayRangesEq!498 (buf!3905 thiss!1602) lt!252099 #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001))))))

(declare-fun lt!252098 () (_ BitVec 8))

(assert (=> b!159689 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001))))

(declare-fun lt!252089 () Unit!10883)

(declare-fun arrayUpdatedAtPrefixLemma!106 (array!7615 (_ BitVec 32) (_ BitVec 8)) Unit!10883)

(assert (=> b!159689 (= lt!252089 (arrayUpdatedAtPrefixLemma!106 (buf!3905 thiss!1602) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098))))

(assert (=> b!159689 (= lt!252098 (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252092 () (_ BitVec 8))

(declare-fun lt!252097 () Bool)

(declare-fun lt!252096 () (_ BitVec 32))

(declare-fun lt!252091 () (_ BitVec 8))

(declare-fun lt!252094 () (_ BitVec 32))

(declare-fun lt!252100 () (_ BitVec 8))

(declare-fun Unit!10886 () Unit!10883)

(declare-fun Unit!10887 () Unit!10883)

(assert (=> b!159689 (= lt!252093 (ite lt!252097 (let ((bdg!9420 ((_ extract 7 0) (bvnot lt!252096)))) (let ((bdg!9421 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)))) ((_ sign_extend 24) bdg!9420))))) (tuple3!797 Unit!10886 bdg!9420 (BitStream!6063 (array!7616 (store (arr!4368 (array!7616 (store (arr!4368 lt!252099) (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)) bdg!9421) (size!3447 lt!252099))) (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9421) (bvshl ((_ sign_extend 24) v!222) lt!252094)))) (size!3447 (array!7616 (store (arr!4368 lt!252099) (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)) bdg!9421) (size!3447 lt!252099)))) (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)) (currentBit!7137 thiss!1602))))) (tuple3!797 Unit!10887 lt!252092 (BitStream!6063 lt!252099 (bvadd #b00000000000000000000000000000001 (currentByte!7142 thiss!1602)) (currentBit!7137 thiss!1602)))))))

(declare-fun lt!252101 () (_ BitVec 32))

(assert (=> b!159689 (= lt!252097 (bvsgt lt!252101 #b00000000000000000000000000000000))))

(declare-fun e!109151 () Bool)

(assert (=> b!159689 e!109151))

(declare-fun res!133288 () Bool)

(assert (=> b!159689 (=> res!133288 e!109151)))

(assert (=> b!159689 (= res!133288 (bvsge (currentByte!7142 thiss!1602) (size!3447 (buf!3905 thiss!1602))))))

(assert (=> b!159689 (= lt!252099 (array!7616 (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (size!3447 (buf!3905 thiss!1602))))))

(assert (=> b!159689 (= lt!252100 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252091) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252101))))))

(assert (=> b!159689 (= lt!252091 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602))) lt!252096)))))

(assert (=> b!159689 (= lt!252096 ((_ sign_extend 24) lt!252092))))

(assert (=> b!159689 (= lt!252092 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252094)))))))

(assert (=> b!159689 (= lt!252094 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252101))))))

(assert (=> b!159689 (= lt!252101 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7137 thiss!1602))))))

(declare-fun b!159690 () Bool)

(declare-fun Unit!10888 () Unit!10883)

(assert (=> b!159690 (= e!109148 Unit!10888)))

(declare-fun lt!252095 () Unit!10883)

(assert (=> b!159690 (= lt!252095 (arrayUpdatedAtPrefixLemma!106 (buf!3905 thiss!1602) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))))))

(assert (=> b!159690 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093)))))

(declare-fun lt!252102 () Unit!10883)

(assert (=> b!159690 (= lt!252102 (arrayUpdatedAtPrefixLemma!106 lt!252099 (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))))))

(assert (=> b!159690 (arrayRangesEq!498 lt!252099 (array!7616 (store (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093)))))

(declare-fun lt!252088 () Unit!10883)

(declare-fun arrayRangesEqTransitive!132 (array!7615 array!7615 array!7615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10883)

(assert (=> b!159690 (= lt!252088 (arrayRangesEqTransitive!132 (buf!3905 thiss!1602) lt!252099 (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))))))

(declare-fun res!133287 () Bool)

(assert (=> b!159690 (= res!133287 call!2696)))

(declare-fun e!109147 () Bool)

(assert (=> b!159690 (=> (not res!133287) (not e!109147))))

(assert (=> b!159690 e!109147))

(declare-fun b!159691 () Bool)

(assert (=> b!159691 (= e!109147 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (currentByte!7142 thiss!1602)))))

(declare-fun c!8426 () Bool)

(declare-fun bm!2693 () Bool)

(assert (=> bm!2693 (= call!2696 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (ite c!8426 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 thiss!1602))))))

(declare-fun b!159692 () Bool)

(assert (=> b!159692 (= e!109150 e!109145)))

(declare-fun res!133286 () Bool)

(assert (=> b!159692 (=> res!133286 e!109145)))

(assert (=> b!159692 (= res!133286 (not (= (size!3447 (buf!3905 thiss!1602)) (size!3447 (buf!3905 (_3!515 lt!252093))))))))

(declare-fun lt!252090 () Unit!10883)

(assert (=> b!159692 (= lt!252090 e!109148)))

(assert (=> b!159692 (= c!8426 lt!252097)))

(declare-fun b!159693 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159693 (= e!109151 (byteRangesEq!0 (select (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602)) lt!252100 #b00000000000000000000000000000000 (currentBit!7137 thiss!1602)))))

(declare-fun res!133285 () Bool)

(assert (=> start!32354 (=> (not res!133285) (not e!109146))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32354 (= res!133285 (validate_offset_byte!0 ((_ sign_extend 32) (size!3447 (buf!3905 thiss!1602))) ((_ sign_extend 32) (currentByte!7142 thiss!1602)) ((_ sign_extend 32) (currentBit!7137 thiss!1602))))))

(assert (=> start!32354 e!109146))

(declare-fun inv!12 (BitStream!6062) Bool)

(assert (=> start!32354 (and (inv!12 thiss!1602) e!109149)))

(assert (=> start!32354 true))

(assert (= (and start!32354 res!133285) b!159689))

(assert (= (and b!159689 (not res!133288)) b!159693))

(assert (= (and b!159689 (not res!133289)) b!159692))

(assert (= (and b!159692 c!8426) b!159690))

(assert (= (and b!159692 (not c!8426)) b!159688))

(assert (= (and b!159690 res!133287) b!159691))

(assert (= (or b!159690 b!159688) bm!2693))

(assert (= (and b!159692 (not res!133286)) b!159687))

(assert (= start!32354 b!159686))

(declare-fun m!251815 () Bool)

(assert (=> start!32354 m!251815))

(declare-fun m!251817 () Bool)

(assert (=> start!32354 m!251817))

(declare-fun m!251819 () Bool)

(assert (=> b!159690 m!251819))

(declare-fun m!251821 () Bool)

(assert (=> b!159690 m!251821))

(declare-fun m!251823 () Bool)

(assert (=> b!159690 m!251823))

(declare-fun m!251825 () Bool)

(assert (=> b!159690 m!251825))

(declare-fun m!251827 () Bool)

(assert (=> b!159690 m!251827))

(declare-fun m!251829 () Bool)

(assert (=> b!159690 m!251829))

(declare-fun m!251831 () Bool)

(assert (=> b!159690 m!251831))

(assert (=> b!159690 m!251827))

(assert (=> b!159690 m!251827))

(declare-fun m!251833 () Bool)

(assert (=> b!159690 m!251833))

(declare-fun m!251835 () Bool)

(assert (=> b!159690 m!251835))

(declare-fun m!251837 () Bool)

(assert (=> b!159690 m!251837))

(declare-fun m!251839 () Bool)

(assert (=> b!159693 m!251839))

(assert (=> b!159693 m!251839))

(declare-fun m!251841 () Bool)

(assert (=> b!159693 m!251841))

(declare-fun m!251843 () Bool)

(assert (=> b!159691 m!251843))

(declare-fun m!251845 () Bool)

(assert (=> bm!2693 m!251845))

(declare-fun m!251847 () Bool)

(assert (=> b!159687 m!251847))

(declare-fun m!251849 () Bool)

(assert (=> b!159686 m!251849))

(declare-fun m!251851 () Bool)

(assert (=> b!159689 m!251851))

(declare-fun m!251853 () Bool)

(assert (=> b!159689 m!251853))

(declare-fun m!251855 () Bool)

(assert (=> b!159689 m!251855))

(declare-fun m!251857 () Bool)

(assert (=> b!159689 m!251857))

(assert (=> b!159689 m!251835))

(assert (=> b!159689 m!251837))

(declare-fun m!251859 () Bool)

(assert (=> b!159689 m!251859))

(declare-fun m!251861 () Bool)

(assert (=> b!159689 m!251861))

(assert (=> b!159689 m!251839))

(declare-fun m!251863 () Bool)

(assert (=> b!159689 m!251863))

(declare-fun m!251865 () Bool)

(assert (=> b!159689 m!251865))

(declare-fun m!251867 () Bool)

(assert (=> b!159689 m!251867))

(push 1)

(assert (not bm!2693))

(assert (not b!159689))

(assert (not b!159687))

(assert (not b!159693))

(assert (not b!159686))

(assert (not b!159690))

(assert (not b!159691))

(assert (not start!32354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53743 () Bool)

(declare-fun res!133315 () Bool)

(declare-fun e!109178 () Bool)

(assert (=> d!53743 (=> res!133315 e!109178)))

(assert (=> d!53743 (= res!133315 (= #b00000000000000000000000000000000 (currentByte!7142 thiss!1602)))))

(assert (=> d!53743 (= (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (currentByte!7142 thiss!1602)) e!109178)))

(declare-fun b!159719 () Bool)

(declare-fun e!109179 () Bool)

(assert (=> b!159719 (= e!109178 e!109179)))

(declare-fun res!133316 () Bool)

(assert (=> b!159719 (=> (not res!133316) (not e!109179))))

(assert (=> b!159719 (= res!133316 (= (select (arr!4368 (buf!3905 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) #b00000000000000000000000000000000)))))

(declare-fun b!159720 () Bool)

(assert (=> b!159720 (= e!109179 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7142 thiss!1602)))))

(assert (= (and d!53743 (not res!133315)) b!159719))

(assert (= (and b!159719 res!133316) b!159720))

(declare-fun m!251913 () Bool)

(assert (=> b!159719 m!251913))

(declare-fun m!251915 () Bool)

(assert (=> b!159719 m!251915))

(declare-fun m!251917 () Bool)

(assert (=> b!159720 m!251917))

(assert (=> b!159691 d!53743))

(declare-fun d!53745 () Bool)

(assert (=> d!53745 (= (array_inv!3194 (buf!3905 thiss!1602)) (bvsge (size!3447 (buf!3905 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159686 d!53745))

(declare-fun d!53747 () Bool)

(declare-fun res!133317 () Bool)

(declare-fun e!109180 () Bool)

(assert (=> d!53747 (=> res!133317 e!109180)))

(assert (=> d!53747 (= res!133317 (= #b00000000000000000000000000000000 (ite c!8426 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 thiss!1602))))))

(assert (=> d!53747 (= (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (ite c!8426 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 thiss!1602))) e!109180)))

(declare-fun b!159721 () Bool)

(declare-fun e!109181 () Bool)

(assert (=> b!159721 (= e!109180 e!109181)))

(declare-fun res!133318 () Bool)

(assert (=> b!159721 (=> (not res!133318) (not e!109181))))

(assert (=> b!159721 (= res!133318 (= (select (arr!4368 (buf!3905 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) #b00000000000000000000000000000000)))))

(declare-fun b!159722 () Bool)

(assert (=> b!159722 (= e!109181 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8426 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 thiss!1602))))))

(assert (= (and d!53747 (not res!133317)) b!159721))

(assert (= (and b!159721 res!133318) b!159722))

(assert (=> b!159721 m!251913))

(assert (=> b!159721 m!251915))

(declare-fun m!251919 () Bool)

(assert (=> b!159722 m!251919))

(assert (=> bm!2693 d!53747))

(declare-fun d!53749 () Bool)

(declare-fun res!133319 () Bool)

(declare-fun e!109182 () Bool)

(assert (=> d!53749 (=> res!133319 e!109182)))

(assert (=> d!53749 (= res!133319 (= #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))))))

(assert (=> d!53749 (= (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))) e!109182)))

(declare-fun b!159723 () Bool)

(declare-fun e!109183 () Bool)

(assert (=> b!159723 (= e!109182 e!109183)))

(declare-fun res!133320 () Bool)

(assert (=> b!159723 (=> (not res!133320) (not e!109183))))

(assert (=> b!159723 (= res!133320 (= (select (arr!4368 (buf!3905 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4368 (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159724 () Bool)

(assert (=> b!159724 (= e!109183 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))))))

(assert (= (and d!53749 (not res!133319)) b!159723))

(assert (= (and b!159723 res!133320) b!159724))

(assert (=> b!159723 m!251913))

(declare-fun m!251921 () Bool)

(assert (=> b!159723 m!251921))

(declare-fun m!251923 () Bool)

(assert (=> b!159724 m!251923))

(assert (=> b!159690 d!53749))

(declare-fun d!53751 () Bool)

(assert (=> d!53751 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001))))

(declare-fun lt!252113 () Unit!10883)

(declare-fun choose!139 (array!7615 array!7615 array!7615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10883)

(assert (=> d!53751 (= lt!252113 (choose!139 (buf!3905 thiss!1602) lt!252099 (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))))))

(assert (=> d!53751 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))))))

(assert (=> d!53751 (= (arrayRangesEqTransitive!132 (buf!3905 thiss!1602) lt!252099 (buf!3905 (_3!515 lt!252093)) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))) lt!252113)))

(declare-fun bs!13322 () Bool)

(assert (= bs!13322 d!53751))

(declare-fun m!251925 () Bool)

(assert (=> bs!13322 m!251925))

(declare-fun m!251927 () Bool)

(assert (=> bs!13322 m!251927))

(assert (=> b!159690 d!53751))

(declare-fun d!53753 () Bool)

(declare-fun e!109186 () Bool)

(assert (=> d!53753 e!109186))

(declare-fun res!133323 () Bool)

(assert (=> d!53753 (=> (not res!133323) (not e!109186))))

(assert (=> d!53753 (= res!133323 (and (bvsge (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000000) (bvslt (currentByte!7142 (_3!515 lt!252093)) (size!3447 lt!252099))))))

(declare-fun lt!252116 () Unit!10883)

(declare-fun choose!140 (array!7615 (_ BitVec 32) (_ BitVec 8)) Unit!10883)

(assert (=> d!53753 (= lt!252116 (choose!140 lt!252099 (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))))))

(assert (=> d!53753 (and (bvsle #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))) (bvslt (currentByte!7142 (_3!515 lt!252093)) (size!3447 lt!252099)))))

(assert (=> d!53753 (= (arrayUpdatedAtPrefixLemma!106 lt!252099 (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) lt!252116)))

(declare-fun b!159727 () Bool)

(assert (=> b!159727 (= e!109186 (arrayRangesEq!498 lt!252099 (array!7616 (store (arr!4368 lt!252099) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 lt!252099)) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))))))

(assert (= (and d!53753 res!133323) b!159727))

(assert (=> d!53753 m!251827))

(declare-fun m!251929 () Bool)

(assert (=> d!53753 m!251929))

(declare-fun m!251931 () Bool)

(assert (=> b!159727 m!251931))

(declare-fun m!251933 () Bool)

(assert (=> b!159727 m!251933))

(assert (=> b!159690 d!53753))

(declare-fun d!53755 () Bool)

(declare-fun e!109187 () Bool)

(assert (=> d!53755 e!109187))

(declare-fun res!133324 () Bool)

(assert (=> d!53755 (=> (not res!133324) (not e!109187))))

(assert (=> d!53755 (= res!133324 (and (bvsge (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000000) (bvslt (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 thiss!1602)))))))

(declare-fun lt!252117 () Unit!10883)

(assert (=> d!53755 (= lt!252117 (choose!140 (buf!3905 thiss!1602) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))))))

(assert (=> d!53755 (and (bvsle #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))) (bvslt (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 thiss!1602))))))

(assert (=> d!53755 (= (arrayUpdatedAtPrefixLemma!106 (buf!3905 thiss!1602) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) lt!252117)))

(declare-fun b!159728 () Bool)

(assert (=> b!159728 (= e!109187 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))))))

(assert (= (and d!53755 res!133324) b!159728))

(assert (=> d!53755 m!251827))

(declare-fun m!251935 () Bool)

(assert (=> d!53755 m!251935))

(assert (=> b!159728 m!251825))

(assert (=> b!159728 m!251819))

(assert (=> b!159690 d!53755))

(declare-fun d!53757 () Bool)

(declare-fun res!133325 () Bool)

(declare-fun e!109188 () Bool)

(assert (=> d!53757 (=> res!133325 e!109188)))

(assert (=> d!53757 (= res!133325 (= #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))))))

(assert (=> d!53757 (= (arrayRangesEq!498 lt!252099 (array!7616 (store (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093))) e!109188)))

(declare-fun b!159729 () Bool)

(declare-fun e!109189 () Bool)

(assert (=> b!159729 (= e!109188 e!109189)))

(declare-fun res!133326 () Bool)

(assert (=> b!159729 (=> (not res!133326) (not e!109189))))

(assert (=> b!159729 (= res!133326 (= (select (arr!4368 lt!252099) #b00000000000000000000000000000000) (select (arr!4368 (array!7616 (store (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159730 () Bool)

(assert (=> b!159730 (= e!109189 (arrayRangesEq!498 lt!252099 (array!7616 (store (store (store (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602) lt!252091) (currentByte!7142 thiss!1602) lt!252100) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 (buf!3905 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7142 (_3!515 lt!252093))))))

(assert (= (and d!53757 (not res!133325)) b!159729))

(assert (= (and b!159729 res!133326) b!159730))

(declare-fun m!251937 () Bool)

(assert (=> b!159729 m!251937))

(declare-fun m!251939 () Bool)

(assert (=> b!159729 m!251939))

(declare-fun m!251941 () Bool)

(assert (=> b!159730 m!251941))

(assert (=> b!159690 d!53757))

(declare-fun d!53759 () Bool)

(assert (=> d!53759 (= (byteRangesEq!0 (select (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602)) lt!252100 #b00000000000000000000000000000000 (currentBit!7137 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7137 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4368 (buf!3905 thiss!1602)) (currentByte!7142 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7137 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252100) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7137 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13323 () Bool)

(assert (= bs!13323 d!53759))

(declare-fun m!251943 () Bool)

(assert (=> bs!13323 m!251943))

(declare-fun m!251945 () Bool)

(assert (=> bs!13323 m!251945))

(assert (=> b!159693 d!53759))

(declare-fun d!53761 () Bool)

(declare-fun res!133327 () Bool)

(declare-fun e!109190 () Bool)

(assert (=> d!53761 (=> res!133327 e!109190)))

(assert (=> d!53761 (= res!133327 (= #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(assert (=> d!53761 (= (arrayRangesEq!498 (buf!3905 thiss!1602) lt!252099 #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)) e!109190)))

(declare-fun b!159731 () Bool)

(declare-fun e!109191 () Bool)

(assert (=> b!159731 (= e!109190 e!109191)))

(declare-fun res!133328 () Bool)

(assert (=> b!159731 (=> (not res!133328) (not e!109191))))

(assert (=> b!159731 (= res!133328 (= (select (arr!4368 (buf!3905 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4368 lt!252099) #b00000000000000000000000000000000)))))

(declare-fun b!159732 () Bool)

(assert (=> b!159732 (= e!109191 (arrayRangesEq!498 (buf!3905 thiss!1602) lt!252099 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(assert (= (and d!53761 (not res!133327)) b!159731))

(assert (= (and b!159731 res!133328) b!159732))

(assert (=> b!159731 m!251913))

(assert (=> b!159731 m!251937))

(declare-fun m!251947 () Bool)

(assert (=> b!159732 m!251947))

(assert (=> b!159689 d!53761))

(declare-fun d!53763 () Bool)

(declare-fun res!133329 () Bool)

(declare-fun e!109192 () Bool)

(assert (=> d!53763 (=> res!133329 e!109192)))

(assert (=> d!53763 (= res!133329 (= #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(assert (=> d!53763 (= (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)) e!109192)))

(declare-fun b!159733 () Bool)

(declare-fun e!109193 () Bool)

(assert (=> b!159733 (= e!109192 e!109193)))

(declare-fun res!133330 () Bool)

(assert (=> b!159733 (=> (not res!133330) (not e!109193))))

(assert (=> b!159733 (= res!133330 (= (select (arr!4368 (buf!3905 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4368 (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) (size!3447 (buf!3905 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159734 () Bool)

(assert (=> b!159734 (= e!109193 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) (size!3447 (buf!3905 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(assert (= (and d!53763 (not res!133329)) b!159733))

(assert (= (and b!159733 res!133330) b!159734))

(assert (=> b!159733 m!251913))

(declare-fun m!251949 () Bool)

(assert (=> b!159733 m!251949))

(declare-fun m!251951 () Bool)

(assert (=> b!159734 m!251951))

(assert (=> b!159689 d!53763))

(declare-fun d!53765 () Bool)

(declare-fun e!109194 () Bool)

(assert (=> d!53765 e!109194))

(declare-fun res!133331 () Bool)

(assert (=> d!53765 (=> (not res!133331) (not e!109194))))

(assert (=> d!53765 (= res!133331 (and (bvsge (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (size!3447 (buf!3905 thiss!1602)))))))

(declare-fun lt!252118 () Unit!10883)

(assert (=> d!53765 (= lt!252118 (choose!140 (buf!3905 thiss!1602) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098))))

(assert (=> d!53765 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) (size!3447 (buf!3905 thiss!1602))))))

(assert (=> d!53765 (= (arrayUpdatedAtPrefixLemma!106 (buf!3905 thiss!1602) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) lt!252118)))

(declare-fun b!159735 () Bool)

(assert (=> b!159735 (= e!109194 (arrayRangesEq!498 (buf!3905 thiss!1602) (array!7616 (store (arr!4368 (buf!3905 thiss!1602)) (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001) lt!252098) (size!3447 (buf!3905 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

(assert (= (and d!53765 res!133331) b!159735))

(declare-fun m!251953 () Bool)

(assert (=> d!53765 m!251953))

(assert (=> b!159735 m!251857))

(assert (=> b!159735 m!251863))

(assert (=> b!159689 d!53765))

(declare-fun d!53767 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53767 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3447 (buf!3905 thiss!1602))) ((_ sign_extend 32) (currentByte!7142 thiss!1602)) ((_ sign_extend 32) (currentBit!7137 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3447 (buf!3905 thiss!1602))) ((_ sign_extend 32) (currentByte!7142 thiss!1602)) ((_ sign_extend 32) (currentBit!7137 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13324 () Bool)

(assert (= bs!13324 d!53767))

(declare-fun m!251955 () Bool)

(assert (=> bs!13324 m!251955))

(assert (=> start!32354 d!53767))

(declare-fun d!53769 () Bool)

(assert (=> d!53769 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7137 thiss!1602) (currentByte!7142 thiss!1602) (size!3447 (buf!3905 thiss!1602))))))

(declare-fun bs!13325 () Bool)

(assert (= bs!13325 d!53769))

(declare-fun m!251957 () Bool)

(assert (=> bs!13325 m!251957))

(assert (=> start!32354 d!53769))

(declare-fun d!53771 () Bool)

(assert (=> d!53771 (= (invariant!0 (currentBit!7137 (_3!515 lt!252093)) (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 (_3!515 lt!252093)))) (and (bvsge (currentBit!7137 (_3!515 lt!252093)) #b00000000000000000000000000000000) (bvslt (currentBit!7137 (_3!515 lt!252093)) #b00000000000000000000000000001000) (bvsge (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 (_3!515 lt!252093)))) (and (= (currentBit!7137 (_3!515 lt!252093)) #b00000000000000000000000000000000) (= (currentByte!7142 (_3!515 lt!252093)) (size!3447 (buf!3905 (_3!515 lt!252093))))))))))

(assert (=> b!159687 d!53771))

(push 1)

(assert (not b!159734))

(assert (not d!53751))

(assert (not b!159730))

(assert (not d!53753))

(assert (not b!159727))

(assert (not b!159724))

(assert (not d!53769))

(assert (not b!159722))

(assert (not b!159720))

(assert (not b!159728))

(assert (not d!53767))

(assert (not d!53765))

(assert (not d!53755))

(assert (not b!159735))

(assert (not b!159732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53829 () Bool)

(declare-fun res!133367 () Bool)

(declare-fun e!109230 () Bool)

(assert (=> d!53829 (=> res!133367 e!109230)))

(assert (=> d!53829 (= res!133367 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7142 thiss!1602)))))

(assert (=> d!53829 (= (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7142 thiss!1602)) e!109230)))

(declare-fun b!159771 () Bool)

(declare-fun e!109231 () Bool)

(assert (=> b!159771 (= e!109230 e!109231)))

(declare-fun res!133368 () Bool)

(assert (=> b!159771 (=> (not res!133368) (not e!109231))))

(assert (=> b!159771 (= res!133368 (= (select (arr!4368 (buf!3905 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!159772 () Bool)

(assert (=> b!159772 (= e!109231 (arrayRangesEq!498 (buf!3905 thiss!1602) (buf!3905 (_3!515 lt!252093)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7142 thiss!1602)))))

(assert (= (and d!53829 (not res!133367)) b!159771))

(assert (= (and b!159771 res!133368) b!159772))

(declare-fun m!252033 () Bool)

(assert (=> b!159771 m!252033))

(declare-fun m!252035 () Bool)

(assert (=> b!159771 m!252035))

(declare-fun m!252037 () Bool)

(assert (=> b!159772 m!252037))

(assert (=> b!159720 d!53829))

(declare-fun d!53831 () Bool)

(assert (=> d!53831 (= (remainingBits!0 ((_ sign_extend 32) (size!3447 (buf!3905 thiss!1602))) ((_ sign_extend 32) (currentByte!7142 thiss!1602)) ((_ sign_extend 32) (currentBit!7137 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3447 (buf!3905 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7142 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7137 thiss!1602)))))))

(assert (=> d!53767 d!53831))

(declare-fun d!53833 () Bool)

(assert (=> d!53833 (arrayRangesEq!498 lt!252099 (array!7616 (store (arr!4368 lt!252099) (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) (size!3447 lt!252099)) #b00000000000000000000000000000000 (currentByte!7142 (_3!515 lt!252093)))))

(assert (=> d!53833 true))

(declare-fun _$8!110 () Unit!10883)

(assert (=> d!53833 (= (choose!140 lt!252099 (currentByte!7142 (_3!515 lt!252093)) (select (arr!4368 (buf!3905 (_3!515 lt!252093))) (currentByte!7142 (_3!515 lt!252093)))) _$8!110)))

(declare-fun bs!13334 () Bool)

(assert (= bs!13334 d!53833))

(assert (=> bs!13334 m!251931))

(assert (=> bs!13334 m!251933))

(assert (=> d!53753 d!53833))

(declare-fun d!53835 () Bool)

(declare-fun res!133369 () Bool)

(declare-fun e!109232 () Bool)

(assert (=> d!53835 (=> res!133369 e!109232)))

(assert (=> d!53835 (= res!133369 (= #b00000000000000000000000000000000 (bvsub (currentByte!7142 (_3!515 lt!252093)) #b00000000000000000000000000000001)))))

