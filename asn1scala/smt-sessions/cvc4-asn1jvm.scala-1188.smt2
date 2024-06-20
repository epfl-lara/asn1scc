; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33774 () Bool)

(assert start!33774)

(declare-fun b!161478 () Bool)

(declare-fun e!111196 () Bool)

(declare-datatypes ((array!7978 0))(
  ( (array!7979 (arr!4500 (Array (_ BitVec 32) (_ BitVec 8))) (size!3579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6326 0))(
  ( (BitStream!6327 (buf!4037 array!7978) (currentByte!7525 (_ BitVec 32)) (currentBit!7520 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6326)

(declare-fun lt!254207 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161478 (= e!111196 (byteRangesEq!0 (select (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602)) lt!254207 #b00000000000000000000000000000000 (currentBit!7520 thiss!1602)))))

(declare-fun b!161479 () Bool)

(declare-fun e!111194 () Bool)

(declare-fun array_inv!3326 (array!7978) Bool)

(assert (=> b!161479 (= e!111194 (array_inv!3326 (buf!4037 thiss!1602)))))

(declare-fun b!161480 () Bool)

(declare-fun e!111198 () Bool)

(declare-datatypes ((Unit!11086 0))(
  ( (Unit!11087) )
))
(declare-datatypes ((tuple3!886 0))(
  ( (tuple3!887 (_1!7794 Unit!11086) (_2!7794 (_ BitVec 8)) (_3!560 BitStream!6326)) )
))
(declare-fun lt!254216 () tuple3!886)

(assert (=> b!161480 (= e!111198 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) (currentByte!7525 (_3!560 lt!254216)))))))

(declare-fun lt!254215 () array!7978)

(declare-fun lt!254209 () (_ BitVec 8))

(declare-fun arrayRangesEq!531 (array!7978 array!7978 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161480 (arrayRangesEq!531 lt!254215 (array!7979 (store (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216)))))

(declare-fun lt!254208 () Unit!11086)

(declare-fun arrayUpdatedAtPrefixLemma!139 (array!7978 (_ BitVec 32) (_ BitVec 8)) Unit!11086)

(assert (=> b!161480 (= lt!254208 (arrayUpdatedAtPrefixLemma!139 lt!254215 (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))))))

(assert (=> b!161480 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216)))))

(declare-fun lt!254210 () Unit!11086)

(assert (=> b!161480 (= lt!254210 (arrayUpdatedAtPrefixLemma!139 (buf!4037 thiss!1602) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))))))

(declare-fun b!161481 () Bool)

(declare-fun res!134608 () Bool)

(assert (=> b!161481 (=> res!134608 e!111198)))

(declare-fun lt!254217 () (_ BitVec 32))

(assert (=> b!161481 (= res!134608 (bvsle lt!254217 #b00000000000000000000000000000000))))

(declare-fun b!161477 () Bool)

(declare-fun e!111195 () Bool)

(assert (=> b!161477 (= e!111195 (not e!111198))))

(declare-fun res!134607 () Bool)

(assert (=> b!161477 (=> res!134607 e!111198)))

(assert (=> b!161477 (= res!134607 (not (arrayRangesEq!531 (buf!4037 thiss!1602) lt!254215 #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001))))))

(declare-fun lt!254206 () (_ BitVec 8))

(assert (=> b!161477 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001))))

(declare-fun lt!254212 () Unit!11086)

(assert (=> b!161477 (= lt!254212 (arrayUpdatedAtPrefixLemma!139 (buf!4037 thiss!1602) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206))))

(assert (=> b!161477 (= lt!254206 (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(declare-fun lt!254214 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254213 () (_ BitVec 8))

(declare-fun lt!254211 () (_ BitVec 32))

(declare-fun Unit!11088 () Unit!11086)

(declare-fun Unit!11089 () Unit!11086)

(assert (=> b!161477 (= lt!254216 (ite (bvsgt lt!254217 #b00000000000000000000000000000000) (let ((bdg!9649 ((_ extract 7 0) (bvnot lt!254211)))) (let ((bdg!9650 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)))) ((_ sign_extend 24) bdg!9649))))) (tuple3!887 Unit!11088 bdg!9649 (BitStream!6327 (array!7979 (store (arr!4500 (array!7979 (store (arr!4500 lt!254215) (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)) bdg!9650) (size!3579 lt!254215))) (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9650) (bvshl ((_ sign_extend 24) v!222) lt!254214)))) (size!3579 (array!7979 (store (arr!4500 lt!254215) (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)) bdg!9650) (size!3579 lt!254215)))) (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)) (currentBit!7520 thiss!1602))))) (tuple3!887 Unit!11089 lt!254213 (BitStream!6327 lt!254215 (bvadd #b00000000000000000000000000000001 (currentByte!7525 thiss!1602)) (currentBit!7520 thiss!1602)))))))

(assert (=> b!161477 e!111196))

(declare-fun res!134606 () Bool)

(assert (=> b!161477 (=> res!134606 e!111196)))

(assert (=> b!161477 (= res!134606 (bvsge (currentByte!7525 thiss!1602) (size!3579 (buf!4037 thiss!1602))))))

(assert (=> b!161477 (= lt!254215 (array!7979 (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (size!3579 (buf!4037 thiss!1602))))))

(assert (=> b!161477 (= lt!254207 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254209) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254217))))))

(assert (=> b!161477 (= lt!254209 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602))) lt!254211)))))

(assert (=> b!161477 (= lt!254211 ((_ sign_extend 24) lt!254213))))

(assert (=> b!161477 (= lt!254213 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254214)))))))

(assert (=> b!161477 (= lt!254214 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254217))))))

(assert (=> b!161477 (= lt!254217 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7520 thiss!1602))))))

(declare-fun res!134609 () Bool)

(assert (=> start!33774 (=> (not res!134609) (not e!111195))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33774 (= res!134609 (validate_offset_byte!0 ((_ sign_extend 32) (size!3579 (buf!4037 thiss!1602))) ((_ sign_extend 32) (currentByte!7525 thiss!1602)) ((_ sign_extend 32) (currentBit!7520 thiss!1602))))))

(assert (=> start!33774 e!111195))

(declare-fun inv!12 (BitStream!6326) Bool)

(assert (=> start!33774 (and (inv!12 thiss!1602) e!111194)))

(assert (=> start!33774 true))

(assert (= (and start!33774 res!134609) b!161477))

(assert (= (and b!161477 (not res!134606)) b!161478))

(assert (= (and b!161477 (not res!134607)) b!161481))

(assert (= (and b!161481 (not res!134608)) b!161480))

(assert (= start!33774 b!161479))

(declare-fun m!255767 () Bool)

(assert (=> b!161480 m!255767))

(declare-fun m!255769 () Bool)

(assert (=> b!161480 m!255769))

(declare-fun m!255771 () Bool)

(assert (=> b!161480 m!255771))

(assert (=> b!161480 m!255769))

(declare-fun m!255773 () Bool)

(assert (=> b!161480 m!255773))

(declare-fun m!255775 () Bool)

(assert (=> b!161480 m!255775))

(declare-fun m!255777 () Bool)

(assert (=> b!161480 m!255777))

(declare-fun m!255779 () Bool)

(assert (=> b!161480 m!255779))

(assert (=> b!161480 m!255769))

(declare-fun m!255781 () Bool)

(assert (=> b!161480 m!255781))

(declare-fun m!255783 () Bool)

(assert (=> b!161480 m!255783))

(declare-fun m!255785 () Bool)

(assert (=> b!161478 m!255785))

(assert (=> b!161478 m!255785))

(declare-fun m!255787 () Bool)

(assert (=> b!161478 m!255787))

(declare-fun m!255789 () Bool)

(assert (=> start!33774 m!255789))

(declare-fun m!255791 () Bool)

(assert (=> start!33774 m!255791))

(assert (=> b!161477 m!255781))

(declare-fun m!255793 () Bool)

(assert (=> b!161477 m!255793))

(declare-fun m!255795 () Bool)

(assert (=> b!161477 m!255795))

(declare-fun m!255797 () Bool)

(assert (=> b!161477 m!255797))

(assert (=> b!161477 m!255775))

(declare-fun m!255799 () Bool)

(assert (=> b!161477 m!255799))

(declare-fun m!255801 () Bool)

(assert (=> b!161477 m!255801))

(assert (=> b!161477 m!255785))

(declare-fun m!255803 () Bool)

(assert (=> b!161477 m!255803))

(declare-fun m!255805 () Bool)

(assert (=> b!161477 m!255805))

(declare-fun m!255807 () Bool)

(assert (=> b!161477 m!255807))

(declare-fun m!255809 () Bool)

(assert (=> b!161477 m!255809))

(declare-fun m!255811 () Bool)

(assert (=> b!161479 m!255811))

(push 1)

(assert (not b!161478))

(assert (not start!33774))

(assert (not b!161477))

(assert (not b!161479))

(assert (not b!161480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55263 () Bool)

(declare-fun res!134631 () Bool)

(declare-fun e!111220 () Bool)

(assert (=> d!55263 (=> res!134631 e!111220)))

(assert (=> d!55263 (= res!134631 (= #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))))))

(assert (=> d!55263 (= (arrayRangesEq!531 lt!254215 (array!7979 (store (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))) e!111220)))

(declare-fun b!161503 () Bool)

(declare-fun e!111221 () Bool)

(assert (=> b!161503 (= e!111220 e!111221)))

(declare-fun res!134632 () Bool)

(assert (=> b!161503 (=> (not res!134632) (not e!111221))))

(assert (=> b!161503 (= res!134632 (= (select (arr!4500 lt!254215) #b00000000000000000000000000000000) (select (arr!4500 (array!7979 (store (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161504 () Bool)

(assert (=> b!161504 (= e!111221 (arrayRangesEq!531 lt!254215 (array!7979 (store (store (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 thiss!1602) lt!254209) (currentByte!7525 thiss!1602) lt!254207) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7525 (_3!560 lt!254216))))))

(assert (= (and d!55263 (not res!134631)) b!161503))

(assert (= (and b!161503 res!134632) b!161504))

(declare-fun m!255849 () Bool)

(assert (=> b!161503 m!255849))

(declare-fun m!255851 () Bool)

(assert (=> b!161503 m!255851))

(declare-fun m!255853 () Bool)

(assert (=> b!161504 m!255853))

(assert (=> b!161480 d!55263))

(declare-fun d!55267 () Bool)

(declare-fun e!111230 () Bool)

(assert (=> d!55267 e!111230))

(declare-fun res!134641 () Bool)

(assert (=> d!55267 (=> (not res!134641) (not e!111230))))

(assert (=> d!55267 (= res!134641 (and (bvsge (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000000) (bvslt (currentByte!7525 (_3!560 lt!254216)) (size!3579 lt!254215))))))

(declare-fun lt!254225 () Unit!11086)

(declare-fun choose!166 (array!7978 (_ BitVec 32) (_ BitVec 8)) Unit!11086)

(assert (=> d!55267 (= lt!254225 (choose!166 lt!254215 (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))))))

(assert (=> d!55267 (and (bvsle #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))) (bvslt (currentByte!7525 (_3!560 lt!254216)) (size!3579 lt!254215)))))

(assert (=> d!55267 (= (arrayUpdatedAtPrefixLemma!139 lt!254215 (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) lt!254225)))

(declare-fun b!161513 () Bool)

(assert (=> b!161513 (= e!111230 (arrayRangesEq!531 lt!254215 (array!7979 (store (arr!4500 lt!254215) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 lt!254215)) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))))))

(assert (= (and d!55267 res!134641) b!161513))

(assert (=> d!55267 m!255769))

(declare-fun m!255861 () Bool)

(assert (=> d!55267 m!255861))

(declare-fun m!255863 () Bool)

(assert (=> b!161513 m!255863))

(declare-fun m!255865 () Bool)

(assert (=> b!161513 m!255865))

(assert (=> b!161480 d!55267))

(declare-fun d!55271 () Bool)

(declare-fun res!134642 () Bool)

(declare-fun e!111231 () Bool)

(assert (=> d!55271 (=> res!134642 e!111231)))

(assert (=> d!55271 (= res!134642 (= #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))))))

(assert (=> d!55271 (= (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))) e!111231)))

(declare-fun b!161514 () Bool)

(declare-fun e!111232 () Bool)

(assert (=> b!161514 (= e!111231 e!111232)))

(declare-fun res!134643 () Bool)

(assert (=> b!161514 (=> (not res!134643) (not e!111232))))

(assert (=> b!161514 (= res!134643 (= (select (arr!4500 (buf!4037 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4500 (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161515 () Bool)

(assert (=> b!161515 (= e!111232 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7525 (_3!560 lt!254216))))))

(assert (= (and d!55271 (not res!134642)) b!161514))

(assert (= (and b!161514 res!134643) b!161515))

(declare-fun m!255867 () Bool)

(assert (=> b!161514 m!255867))

(declare-fun m!255869 () Bool)

(assert (=> b!161514 m!255869))

(declare-fun m!255871 () Bool)

(assert (=> b!161515 m!255871))

(assert (=> b!161480 d!55271))

(declare-fun d!55273 () Bool)

(declare-fun e!111235 () Bool)

(assert (=> d!55273 e!111235))

(declare-fun res!134646 () Bool)

(assert (=> d!55273 (=> (not res!134646) (not e!111235))))

(assert (=> d!55273 (= res!134646 (and (bvsge (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000000) (bvslt (currentByte!7525 (_3!560 lt!254216)) (size!3579 (buf!4037 thiss!1602)))))))

(declare-fun lt!254228 () Unit!11086)

(assert (=> d!55273 (= lt!254228 (choose!166 (buf!4037 thiss!1602) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))))))

(assert (=> d!55273 (and (bvsle #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))) (bvslt (currentByte!7525 (_3!560 lt!254216)) (size!3579 (buf!4037 thiss!1602))))))

(assert (=> d!55273 (= (arrayUpdatedAtPrefixLemma!139 (buf!4037 thiss!1602) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) lt!254228)))

(declare-fun b!161518 () Bool)

(assert (=> b!161518 (= e!111235 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (currentByte!7525 (_3!560 lt!254216)) (select (arr!4500 (buf!4037 (_3!560 lt!254216))) (currentByte!7525 (_3!560 lt!254216)))) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7525 (_3!560 lt!254216))))))

(assert (= (and d!55273 res!134646) b!161518))

(assert (=> d!55273 m!255769))

(declare-fun m!255873 () Bool)

(assert (=> d!55273 m!255873))

(assert (=> b!161518 m!255767))

(assert (=> b!161518 m!255783))

(assert (=> b!161480 d!55273))

(declare-fun d!55275 () Bool)

(assert (=> d!55275 (= (array_inv!3326 (buf!4037 thiss!1602)) (bvsge (size!3579 (buf!4037 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161479 d!55275))

(declare-fun d!55277 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55277 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3579 (buf!4037 thiss!1602))) ((_ sign_extend 32) (currentByte!7525 thiss!1602)) ((_ sign_extend 32) (currentBit!7520 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3579 (buf!4037 thiss!1602))) ((_ sign_extend 32) (currentByte!7525 thiss!1602)) ((_ sign_extend 32) (currentBit!7520 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13747 () Bool)

(assert (= bs!13747 d!55277))

(declare-fun m!255887 () Bool)

(assert (=> bs!13747 m!255887))

(assert (=> start!33774 d!55277))

(declare-fun d!55283 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55283 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7520 thiss!1602) (currentByte!7525 thiss!1602) (size!3579 (buf!4037 thiss!1602))))))

(declare-fun bs!13749 () Bool)

(assert (= bs!13749 d!55283))

(declare-fun m!255893 () Bool)

(assert (=> bs!13749 m!255893))

(assert (=> start!33774 d!55283))

(declare-fun d!55289 () Bool)

(declare-fun res!134651 () Bool)

(declare-fun e!111240 () Bool)

(assert (=> d!55289 (=> res!134651 e!111240)))

(assert (=> d!55289 (= res!134651 (= #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(assert (=> d!55289 (= (arrayRangesEq!531 (buf!4037 thiss!1602) lt!254215 #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)) e!111240)))

(declare-fun b!161523 () Bool)

(declare-fun e!111241 () Bool)

(assert (=> b!161523 (= e!111240 e!111241)))

(declare-fun res!134652 () Bool)

(assert (=> b!161523 (=> (not res!134652) (not e!111241))))

(assert (=> b!161523 (= res!134652 (= (select (arr!4500 (buf!4037 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4500 lt!254215) #b00000000000000000000000000000000)))))

(declare-fun b!161524 () Bool)

(assert (=> b!161524 (= e!111241 (arrayRangesEq!531 (buf!4037 thiss!1602) lt!254215 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(assert (= (and d!55289 (not res!134651)) b!161523))

(assert (= (and b!161523 res!134652) b!161524))

(assert (=> b!161523 m!255867))

(assert (=> b!161523 m!255849))

(declare-fun m!255895 () Bool)

(assert (=> b!161524 m!255895))

(assert (=> b!161477 d!55289))

(declare-fun d!55291 () Bool)

(declare-fun res!134653 () Bool)

(declare-fun e!111242 () Bool)

(assert (=> d!55291 (=> res!134653 e!111242)))

(assert (=> d!55291 (= res!134653 (= #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(assert (=> d!55291 (= (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)) e!111242)))

(declare-fun b!161525 () Bool)

(declare-fun e!111243 () Bool)

(assert (=> b!161525 (= e!111242 e!111243)))

(declare-fun res!134654 () Bool)

(assert (=> b!161525 (=> (not res!134654) (not e!111243))))

(assert (=> b!161525 (= res!134654 (= (select (arr!4500 (buf!4037 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4500 (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) (size!3579 (buf!4037 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161526 () Bool)

(assert (=> b!161526 (= e!111243 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) (size!3579 (buf!4037 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(assert (= (and d!55291 (not res!134653)) b!161525))

(assert (= (and b!161525 res!134654) b!161526))

(assert (=> b!161525 m!255867))

(declare-fun m!255897 () Bool)

(assert (=> b!161525 m!255897))

(declare-fun m!255899 () Bool)

(assert (=> b!161526 m!255899))

(assert (=> b!161477 d!55291))

(declare-fun d!55293 () Bool)

(declare-fun e!111244 () Bool)

(assert (=> d!55293 e!111244))

(declare-fun res!134655 () Bool)

(assert (=> d!55293 (=> (not res!134655) (not e!111244))))

(assert (=> d!55293 (= res!134655 (and (bvsge (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) (size!3579 (buf!4037 thiss!1602)))))))

(declare-fun lt!254231 () Unit!11086)

(assert (=> d!55293 (= lt!254231 (choose!166 (buf!4037 thiss!1602) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206))))

(assert (=> d!55293 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) (size!3579 (buf!4037 thiss!1602))))))

(assert (=> d!55293 (= (arrayUpdatedAtPrefixLemma!139 (buf!4037 thiss!1602) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) lt!254231)))

(declare-fun b!161527 () Bool)

(assert (=> b!161527 (= e!111244 (arrayRangesEq!531 (buf!4037 thiss!1602) (array!7979 (store (arr!4500 (buf!4037 thiss!1602)) (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001) lt!254206) (size!3579 (buf!4037 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7525 (_3!560 lt!254216)) #b00000000000000000000000000000001)))))

(assert (= (and d!55293 res!134655) b!161527))

(declare-fun m!255903 () Bool)

(assert (=> d!55293 m!255903))

(assert (=> b!161527 m!255805))

(assert (=> b!161527 m!255793))

(assert (=> b!161477 d!55293))

