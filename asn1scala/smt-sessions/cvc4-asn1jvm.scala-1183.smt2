; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33554 () Bool)

(assert start!33554)

(declare-fun b!161076 () Bool)

(declare-fun e!110783 () Bool)

(declare-datatypes ((array!7935 0))(
  ( (array!7936 (arr!4485 (Array (_ BitVec 32) (_ BitVec 8))) (size!3564 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6296 0))(
  ( (BitStream!6297 (buf!4022 array!7935) (currentByte!7485 (_ BitVec 32)) (currentBit!7480 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6296)

(declare-fun array_inv!3311 (array!7935) Bool)

(assert (=> b!161076 (= e!110783 (array_inv!3311 (buf!4022 thiss!1602)))))

(declare-fun b!161073 () Bool)

(declare-fun e!110782 () Bool)

(declare-fun e!110780 () Bool)

(assert (=> b!161073 (= e!110782 (not e!110780))))

(declare-fun res!134247 () Bool)

(assert (=> b!161073 (=> res!134247 e!110780)))

(declare-fun lt!253664 () array!7935)

(declare-datatypes ((Unit!11026 0))(
  ( (Unit!11027) )
))
(declare-datatypes ((tuple3!856 0))(
  ( (tuple3!857 (_1!7779 Unit!11026) (_2!7779 (_ BitVec 8)) (_3!545 BitStream!6296)) )
))
(declare-fun lt!253660 () tuple3!856)

(declare-fun arrayRangesEq!516 (array!7935 array!7935 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161073 (= res!134247 (not (arrayRangesEq!516 (buf!4022 thiss!1602) lt!253664 #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001))))))

(declare-fun lt!253661 () (_ BitVec 8))

(assert (=> b!161073 (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001))))

(declare-fun lt!253663 () Unit!11026)

(declare-fun arrayUpdatedAtPrefixLemma!124 (array!7935 (_ BitVec 32) (_ BitVec 8)) Unit!11026)

(assert (=> b!161073 (= lt!253663 (arrayUpdatedAtPrefixLemma!124 (buf!4022 thiss!1602) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661))))

(assert (=> b!161073 (= lt!253661 (select (arr!4485 (buf!4022 (_3!545 lt!253660))) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(declare-fun lt!253666 () (_ BitVec 32))

(declare-fun lt!253659 () (_ BitVec 8))

(declare-fun lt!253667 () (_ BitVec 32))

(declare-fun lt!253668 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253665 () (_ BitVec 32))

(declare-fun lt!253662 () (_ BitVec 8))

(declare-fun Unit!11028 () Unit!11026)

(declare-fun Unit!11029 () Unit!11026)

(assert (=> b!161073 (= lt!253660 (ite (bvsgt lt!253667 #b00000000000000000000000000000000) (let ((bdg!9585 ((_ extract 7 0) (bvnot lt!253665)))) (let ((bdg!9586 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602) lt!253668) (currentByte!7485 thiss!1602) lt!253659) (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)))) ((_ sign_extend 24) bdg!9585))))) (tuple3!857 Unit!11028 bdg!9585 (BitStream!6297 (array!7936 (store (arr!4485 (array!7936 (store (arr!4485 lt!253664) (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)) bdg!9586) (size!3564 lt!253664))) (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9586) (bvshl ((_ sign_extend 24) v!222) lt!253666)))) (size!3564 (array!7936 (store (arr!4485 lt!253664) (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)) bdg!9586) (size!3564 lt!253664)))) (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)) (currentBit!7480 thiss!1602))))) (tuple3!857 Unit!11029 lt!253662 (BitStream!6297 lt!253664 (bvadd #b00000000000000000000000000000001 (currentByte!7485 thiss!1602)) (currentBit!7480 thiss!1602)))))))

(declare-fun e!110781 () Bool)

(assert (=> b!161073 e!110781))

(declare-fun res!134249 () Bool)

(assert (=> b!161073 (=> res!134249 e!110781)))

(assert (=> b!161073 (= res!134249 (bvsge (currentByte!7485 thiss!1602) (size!3564 (buf!4022 thiss!1602))))))

(assert (=> b!161073 (= lt!253664 (array!7936 (store (store (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602) lt!253668) (currentByte!7485 thiss!1602) lt!253659) (size!3564 (buf!4022 thiss!1602))))))

(assert (=> b!161073 (= lt!253659 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253668) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253667))))))

(assert (=> b!161073 (= lt!253668 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602))) lt!253665)))))

(assert (=> b!161073 (= lt!253665 ((_ sign_extend 24) lt!253662))))

(assert (=> b!161073 (= lt!253662 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253666)))))))

(assert (=> b!161073 (= lt!253666 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253667))))))

(assert (=> b!161073 (= lt!253667 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7480 thiss!1602))))))

(declare-fun b!161074 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161074 (= e!110781 (byteRangesEq!0 (select (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602)) lt!253659 #b00000000000000000000000000000000 (currentBit!7480 thiss!1602)))))

(declare-fun res!134248 () Bool)

(assert (=> start!33554 (=> (not res!134248) (not e!110782))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33554 (= res!134248 (validate_offset_byte!0 ((_ sign_extend 32) (size!3564 (buf!4022 thiss!1602))) ((_ sign_extend 32) (currentByte!7485 thiss!1602)) ((_ sign_extend 32) (currentBit!7480 thiss!1602))))))

(assert (=> start!33554 e!110782))

(declare-fun inv!12 (BitStream!6296) Bool)

(assert (=> start!33554 (and (inv!12 thiss!1602) e!110783)))

(assert (=> start!33554 true))

(declare-fun b!161075 () Bool)

(assert (=> b!161075 (= e!110780 (or (bvsle lt!253667 #b00000000000000000000000000000000) (and (bvsge (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000000) (bvslt (currentByte!7485 (_3!545 lt!253660)) (size!3564 (buf!4022 (_3!545 lt!253660)))))))))

(assert (= (and start!33554 res!134248) b!161073))

(assert (= (and b!161073 (not res!134249)) b!161074))

(assert (= (and b!161073 (not res!134247)) b!161075))

(assert (= start!33554 b!161076))

(declare-fun m!254795 () Bool)

(assert (=> b!161076 m!254795))

(declare-fun m!254797 () Bool)

(assert (=> b!161073 m!254797))

(declare-fun m!254799 () Bool)

(assert (=> b!161073 m!254799))

(declare-fun m!254801 () Bool)

(assert (=> b!161073 m!254801))

(declare-fun m!254803 () Bool)

(assert (=> b!161073 m!254803))

(declare-fun m!254805 () Bool)

(assert (=> b!161073 m!254805))

(declare-fun m!254807 () Bool)

(assert (=> b!161073 m!254807))

(declare-fun m!254809 () Bool)

(assert (=> b!161073 m!254809))

(declare-fun m!254811 () Bool)

(assert (=> b!161073 m!254811))

(declare-fun m!254813 () Bool)

(assert (=> b!161073 m!254813))

(declare-fun m!254815 () Bool)

(assert (=> b!161073 m!254815))

(declare-fun m!254817 () Bool)

(assert (=> b!161073 m!254817))

(declare-fun m!254819 () Bool)

(assert (=> b!161073 m!254819))

(assert (=> b!161074 m!254817))

(assert (=> b!161074 m!254817))

(declare-fun m!254821 () Bool)

(assert (=> b!161074 m!254821))

(declare-fun m!254823 () Bool)

(assert (=> start!33554 m!254823))

(declare-fun m!254825 () Bool)

(assert (=> start!33554 m!254825))

(push 1)

(assert (not b!161073))

(assert (not b!161074))

(assert (not start!33554))

(assert (not b!161076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54971 () Bool)

(declare-fun res!134265 () Bool)

(declare-fun e!110800 () Bool)

(assert (=> d!54971 (=> res!134265 e!110800)))

(assert (=> d!54971 (= res!134265 (= #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (=> d!54971 (= (arrayRangesEq!516 (buf!4022 thiss!1602) lt!253664 #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)) e!110800)))

(declare-fun b!161092 () Bool)

(declare-fun e!110801 () Bool)

(assert (=> b!161092 (= e!110800 e!110801)))

(declare-fun res!134266 () Bool)

(assert (=> b!161092 (=> (not res!134266) (not e!110801))))

(assert (=> b!161092 (= res!134266 (= (select (arr!4485 (buf!4022 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4485 lt!253664) #b00000000000000000000000000000000)))))

(declare-fun b!161093 () Bool)

(assert (=> b!161093 (= e!110801 (arrayRangesEq!516 (buf!4022 thiss!1602) lt!253664 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (= (and d!54971 (not res!134265)) b!161092))

(assert (= (and b!161092 res!134266) b!161093))

(declare-fun m!254847 () Bool)

(assert (=> b!161092 m!254847))

(declare-fun m!254849 () Bool)

(assert (=> b!161092 m!254849))

(declare-fun m!254851 () Bool)

(assert (=> b!161093 m!254851))

(assert (=> b!161073 d!54971))

(declare-fun d!54973 () Bool)

(declare-fun res!134267 () Bool)

(declare-fun e!110802 () Bool)

(assert (=> d!54973 (=> res!134267 e!110802)))

(assert (=> d!54973 (= res!134267 (= #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (=> d!54973 (= (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)) e!110802)))

(declare-fun b!161094 () Bool)

(declare-fun e!110803 () Bool)

(assert (=> b!161094 (= e!110802 e!110803)))

(declare-fun res!134268 () Bool)

(assert (=> b!161094 (=> (not res!134268) (not e!110803))))

(assert (=> b!161094 (= res!134268 (= (select (arr!4485 (buf!4022 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4485 (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161095 () Bool)

(assert (=> b!161095 (= e!110803 (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (= (and d!54973 (not res!134267)) b!161094))

(assert (= (and b!161094 res!134268) b!161095))

(assert (=> b!161094 m!254847))

(declare-fun m!254853 () Bool)

(assert (=> b!161094 m!254853))

(declare-fun m!254855 () Bool)

(assert (=> b!161095 m!254855))

(assert (=> b!161073 d!54973))

(declare-fun d!54975 () Bool)

(declare-fun e!110806 () Bool)

(assert (=> d!54975 e!110806))

(declare-fun res!134271 () Bool)

(assert (=> d!54975 (=> (not res!134271) (not e!110806))))

(assert (=> d!54975 (= res!134271 (and (bvsge (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) (size!3564 (buf!4022 thiss!1602)))))))

(declare-fun lt!253674 () Unit!11026)

(declare-fun choose!154 (array!7935 (_ BitVec 32) (_ BitVec 8)) Unit!11026)

(assert (=> d!54975 (= lt!253674 (choose!154 (buf!4022 thiss!1602) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661))))

(assert (=> d!54975 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) (size!3564 (buf!4022 thiss!1602))))))

(assert (=> d!54975 (= (arrayUpdatedAtPrefixLemma!124 (buf!4022 thiss!1602) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) lt!253674)))

(declare-fun b!161098 () Bool)

(assert (=> b!161098 (= e!110806 (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (= (and d!54975 res!134271) b!161098))

(declare-fun m!254857 () Bool)

(assert (=> d!54975 m!254857))

(assert (=> b!161098 m!254819))

(assert (=> b!161098 m!254809))

(assert (=> b!161073 d!54975))

(declare-fun d!54977 () Bool)

(assert (=> d!54977 (= (byteRangesEq!0 (select (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602)) lt!253659 #b00000000000000000000000000000000 (currentBit!7480 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7480 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4485 (buf!4022 thiss!1602)) (currentByte!7485 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7480 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253659) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7480 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13687 () Bool)

(assert (= bs!13687 d!54977))

(declare-fun m!254859 () Bool)

(assert (=> bs!13687 m!254859))

(declare-fun m!254861 () Bool)

(assert (=> bs!13687 m!254861))

(assert (=> b!161074 d!54977))

(declare-fun d!54979 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54979 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3564 (buf!4022 thiss!1602))) ((_ sign_extend 32) (currentByte!7485 thiss!1602)) ((_ sign_extend 32) (currentBit!7480 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3564 (buf!4022 thiss!1602))) ((_ sign_extend 32) (currentByte!7485 thiss!1602)) ((_ sign_extend 32) (currentBit!7480 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13688 () Bool)

(assert (= bs!13688 d!54979))

(declare-fun m!254863 () Bool)

(assert (=> bs!13688 m!254863))

(assert (=> start!33554 d!54979))

(declare-fun d!54981 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54981 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7480 thiss!1602) (currentByte!7485 thiss!1602) (size!3564 (buf!4022 thiss!1602))))))

(declare-fun bs!13689 () Bool)

(assert (= bs!13689 d!54981))

(declare-fun m!254865 () Bool)

(assert (=> bs!13689 m!254865))

(assert (=> start!33554 d!54981))

(declare-fun d!54983 () Bool)

(assert (=> d!54983 (= (array_inv!3311 (buf!4022 thiss!1602)) (bvsge (size!3564 (buf!4022 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161076 d!54983))

(push 1)

(assert (not d!54975))

(assert (not b!161098))

(assert (not b!161095))

(assert (not b!161093))

(assert (not d!54981))

(assert (not d!54979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55019 () Bool)

(declare-fun res!134291 () Bool)

(declare-fun e!110826 () Bool)

(assert (=> d!55019 (=> res!134291 e!110826)))

(assert (=> d!55019 (= res!134291 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (=> d!55019 (= (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)) e!110826)))

(declare-fun b!161118 () Bool)

(declare-fun e!110827 () Bool)

(assert (=> b!161118 (= e!110826 e!110827)))

(declare-fun res!134292 () Bool)

(assert (=> b!161118 (=> (not res!134292) (not e!110827))))

(assert (=> b!161118 (= res!134292 (= (select (arr!4485 (buf!4022 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4485 (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161119 () Bool)

(assert (=> b!161119 (= e!110827 (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (= (and d!55019 (not res!134291)) b!161118))

(assert (= (and b!161118 res!134292) b!161119))

(declare-fun m!254907 () Bool)

(assert (=> b!161118 m!254907))

(declare-fun m!254909 () Bool)

(assert (=> b!161118 m!254909))

(declare-fun m!254911 () Bool)

(assert (=> b!161119 m!254911))

(assert (=> b!161095 d!55019))

(declare-fun d!55021 () Bool)

(assert (=> d!55021 (arrayRangesEq!516 (buf!4022 thiss!1602) (array!7936 (store (arr!4485 (buf!4022 thiss!1602)) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) (size!3564 (buf!4022 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001))))

(assert (=> d!55021 true))

(declare-fun _$8!121 () Unit!11026)

(assert (=> d!55021 (= (choose!154 (buf!4022 thiss!1602) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001) lt!253661) _$8!121)))

(declare-fun bs!13695 () Bool)

(assert (= bs!13695 d!55021))

(assert (=> bs!13695 m!254819))

(assert (=> bs!13695 m!254809))

(assert (=> d!54975 d!55021))

(declare-fun d!55023 () Bool)

(assert (=> d!55023 (= (invariant!0 (currentBit!7480 thiss!1602) (currentByte!7485 thiss!1602) (size!3564 (buf!4022 thiss!1602))) (and (bvsge (currentBit!7480 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7480 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7485 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7485 thiss!1602) (size!3564 (buf!4022 thiss!1602))) (and (= (currentBit!7480 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7485 thiss!1602) (size!3564 (buf!4022 thiss!1602)))))))))

(assert (=> d!54981 d!55023))

(assert (=> b!161098 d!54973))

(declare-fun d!55025 () Bool)

(declare-fun res!134293 () Bool)

(declare-fun e!110828 () Bool)

(assert (=> d!55025 (=> res!134293 e!110828)))

(assert (=> d!55025 (= res!134293 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (=> d!55025 (= (arrayRangesEq!516 (buf!4022 thiss!1602) lt!253664 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)) e!110828)))

(declare-fun b!161120 () Bool)

(declare-fun e!110829 () Bool)

(assert (=> b!161120 (= e!110828 e!110829)))

(declare-fun res!134294 () Bool)

(assert (=> b!161120 (=> (not res!134294) (not e!110829))))

(assert (=> b!161120 (= res!134294 (= (select (arr!4485 (buf!4022 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4485 lt!253664) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161121 () Bool)

(assert (=> b!161121 (= e!110829 (arrayRangesEq!516 (buf!4022 thiss!1602) lt!253664 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7485 (_3!545 lt!253660)) #b00000000000000000000000000000001)))))

(assert (= (and d!55025 (not res!134293)) b!161120))

(assert (= (and b!161120 res!134294) b!161121))

(assert (=> b!161120 m!254907))

(declare-fun m!254913 () Bool)

(assert (=> b!161120 m!254913))

(declare-fun m!254915 () Bool)

(assert (=> b!161121 m!254915))

(assert (=> b!161093 d!55025))

(declare-fun d!55027 () Bool)

(assert (=> d!55027 (= (remainingBits!0 ((_ sign_extend 32) (size!3564 (buf!4022 thiss!1602))) ((_ sign_extend 32) (currentByte!7485 thiss!1602)) ((_ sign_extend 32) (currentBit!7480 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3564 (buf!4022 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7485 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7480 thiss!1602)))))))

(assert (=> d!54979 d!55027))

(push 1)

(assert (not d!55021))

(assert (not b!161121))

(assert (not b!161119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

