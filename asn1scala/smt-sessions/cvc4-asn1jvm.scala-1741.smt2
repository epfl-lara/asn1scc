; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47850 () Bool)

(assert start!47850)

(declare-fun b!227735 () Bool)

(declare-fun res!191041 () Bool)

(declare-fun e!155936 () Bool)

(assert (=> b!227735 (=> (not res!191041) (not e!155936))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227735 (= res!191041 (bvslt i!761 to!496))))

(declare-fun res!191044 () Bool)

(assert (=> start!47850 (=> (not res!191044) (not e!155936))))

(declare-datatypes ((array!11466 0))(
  ( (array!11467 (arr!6009 (Array (_ BitVec 32) (_ BitVec 8))) (size!5031 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11466)

(assert (=> start!47850 (= res!191044 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5031 arr!308))))))

(assert (=> start!47850 e!155936))

(assert (=> start!47850 true))

(declare-fun array_inv!4772 (array!11466) Bool)

(assert (=> start!47850 (array_inv!4772 arr!308)))

(declare-datatypes ((BitStream!9158 0))(
  ( (BitStream!9159 (buf!5572 array!11466) (currentByte!10416 (_ BitVec 32)) (currentBit!10411 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9158)

(declare-fun e!155938 () Bool)

(declare-fun inv!12 (BitStream!9158) Bool)

(assert (=> start!47850 (and (inv!12 thiss!1870) e!155938)))

(declare-fun b!227736 () Bool)

(declare-fun res!191043 () Bool)

(assert (=> b!227736 (=> (not res!191043) (not e!155936))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227736 (= res!191043 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))) ((_ sign_extend 32) (currentByte!10416 thiss!1870)) ((_ sign_extend 32) (currentBit!10411 thiss!1870)) (bvsub to!496 i!761)))))

(declare-datatypes ((Unit!17036 0))(
  ( (Unit!17037) )
))
(declare-datatypes ((tuple3!1444 0))(
  ( (tuple3!1445 (_1!10662 Unit!17036) (_2!10662 BitStream!9158) (_3!864 array!11466)) )
))
(declare-fun lt!364398 () tuple3!1444)

(declare-fun b!227737 () Bool)

(declare-fun e!155935 () Bool)

(declare-fun lt!364407 () array!11466)

(declare-fun arrayRangesEq!867 (array!11466 array!11466 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227737 (= e!155935 (arrayRangesEq!867 lt!364407 (_3!864 lt!364398) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227738 () Bool)

(assert (=> b!227738 (= e!155938 (array_inv!4772 (buf!5572 thiss!1870)))))

(declare-fun b!227739 () Bool)

(assert (=> b!227739 (= e!155936 (not e!155935))))

(declare-fun res!191042 () Bool)

(assert (=> b!227739 (=> res!191042 e!155935)))

(assert (=> b!227739 (= res!191042 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5031 arr!308)) (bvsge i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> b!227739 (arrayRangesEq!867 arr!308 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364401 () Unit!17036)

(declare-fun arrayRangesEqTransitive!290 (array!11466 array!11466 array!11466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17036)

(assert (=> b!227739 (= lt!364401 (arrayRangesEqTransitive!290 arr!308 lt!364407 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227739 (arrayRangesEq!867 arr!308 lt!364407 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19596 0))(
  ( (tuple2!19597 (_1!10663 (_ BitVec 8)) (_2!10663 BitStream!9158)) )
))
(declare-fun lt!364403 () tuple2!19596)

(declare-fun lt!364399 () Unit!17036)

(declare-fun arrayUpdatedAtPrefixLemma!426 (array!11466 (_ BitVec 32) (_ BitVec 8)) Unit!17036)

(assert (=> b!227739 (= lt!364399 (arrayUpdatedAtPrefixLemma!426 arr!308 i!761 (_1!10663 lt!364403)))))

(declare-fun lt!364405 () (_ BitVec 64))

(declare-fun lt!364404 () (_ BitVec 64))

(declare-fun lt!364406 () (_ BitVec 32))

(declare-fun lt!364402 () (_ BitVec 64))

(assert (=> b!227739 (and (= (bvadd lt!364404 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364406))) lt!364405) (= (bvadd lt!364402 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364405) (= (buf!5572 thiss!1870) (buf!5572 (_2!10662 lt!364398))) (= (size!5031 arr!308) (size!5031 (_3!864 lt!364398))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227739 (= lt!364405 (bitIndex!0 (size!5031 (buf!5572 (_2!10662 lt!364398))) (currentByte!10416 (_2!10662 lt!364398)) (currentBit!10411 (_2!10662 lt!364398))))))

(assert (=> b!227739 (= lt!364404 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364402))))

(assert (=> b!227739 (= lt!364404 (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364403))) (currentByte!10416 (_2!10663 lt!364403)) (currentBit!10411 (_2!10663 lt!364403))))))

(assert (=> b!227739 (= lt!364402 (bitIndex!0 (size!5031 (buf!5572 thiss!1870)) (currentByte!10416 thiss!1870) (currentBit!10411 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9158 array!11466 (_ BitVec 32) (_ BitVec 32)) tuple3!1444)

(assert (=> b!227739 (= lt!364398 (readByteArrayLoop!0 (_2!10663 lt!364403) lt!364407 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403))) lt!364406)))

(assert (=> b!227739 (= lt!364406 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364400 () Unit!17036)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9158 BitStream!9158 (_ BitVec 64) (_ BitVec 32)) Unit!17036)

(assert (=> b!227739 (= lt!364400 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10663 lt!364403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227739 (= lt!364407 (array!11467 (store (arr!6009 arr!308) i!761 (_1!10663 lt!364403)) (size!5031 arr!308)))))

(declare-fun readByte!0 (BitStream!9158) tuple2!19596)

(assert (=> b!227739 (= lt!364403 (readByte!0 thiss!1870))))

(assert (= (and start!47850 res!191044) b!227736))

(assert (= (and b!227736 res!191043) b!227735))

(assert (= (and b!227735 res!191041) b!227739))

(assert (= (and b!227739 (not res!191042)) b!227737))

(assert (= start!47850 b!227738))

(declare-fun m!350529 () Bool)

(assert (=> start!47850 m!350529))

(declare-fun m!350531 () Bool)

(assert (=> start!47850 m!350531))

(declare-fun m!350533 () Bool)

(assert (=> b!227738 m!350533))

(declare-fun m!350535 () Bool)

(assert (=> b!227739 m!350535))

(declare-fun m!350537 () Bool)

(assert (=> b!227739 m!350537))

(declare-fun m!350539 () Bool)

(assert (=> b!227739 m!350539))

(declare-fun m!350541 () Bool)

(assert (=> b!227739 m!350541))

(declare-fun m!350543 () Bool)

(assert (=> b!227739 m!350543))

(declare-fun m!350545 () Bool)

(assert (=> b!227739 m!350545))

(declare-fun m!350547 () Bool)

(assert (=> b!227739 m!350547))

(declare-fun m!350549 () Bool)

(assert (=> b!227739 m!350549))

(declare-fun m!350551 () Bool)

(assert (=> b!227739 m!350551))

(declare-fun m!350553 () Bool)

(assert (=> b!227739 m!350553))

(declare-fun m!350555 () Bool)

(assert (=> b!227739 m!350555))

(declare-fun m!350557 () Bool)

(assert (=> b!227739 m!350557))

(declare-fun m!350559 () Bool)

(assert (=> b!227736 m!350559))

(declare-fun m!350561 () Bool)

(assert (=> b!227737 m!350561))

(push 1)

(assert (not b!227736))

(assert (not b!227739))

(assert (not start!47850))

(assert (not b!227738))

(assert (not b!227737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77252 () Bool)

(assert (=> d!77252 (= (array_inv!4772 (buf!5572 thiss!1870)) (bvsge (size!5031 (buf!5572 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227738 d!77252))

(declare-fun d!77254 () Bool)

(declare-fun res!191068 () Bool)

(declare-fun e!155962 () Bool)

(assert (=> d!77254 (=> res!191068 e!155962)))

(assert (=> d!77254 (= res!191068 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77254 (= (arrayRangesEq!867 lt!364407 (_3!864 lt!364398) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!155962)))

(declare-fun b!227763 () Bool)

(declare-fun e!155963 () Bool)

(assert (=> b!227763 (= e!155962 e!155963)))

(declare-fun res!191069 () Bool)

(assert (=> b!227763 (=> (not res!191069) (not e!155963))))

(assert (=> b!227763 (= res!191069 (= (select (arr!6009 lt!364407) #b00000000000000000000000000000000) (select (arr!6009 (_3!864 lt!364398)) #b00000000000000000000000000000000)))))

(declare-fun b!227764 () Bool)

(assert (=> b!227764 (= e!155963 (arrayRangesEq!867 lt!364407 (_3!864 lt!364398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77254 (not res!191068)) b!227763))

(assert (= (and b!227763 res!191069) b!227764))

(declare-fun m!350591 () Bool)

(assert (=> b!227763 m!350591))

(declare-fun m!350593 () Bool)

(assert (=> b!227763 m!350593))

(declare-fun m!350595 () Bool)

(assert (=> b!227764 m!350595))

(assert (=> b!227737 d!77254))

(declare-fun d!77256 () Bool)

(assert (=> d!77256 (= (array_inv!4772 arr!308) (bvsge (size!5031 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47850 d!77256))

(declare-fun d!77258 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77258 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10411 thiss!1870) (currentByte!10416 thiss!1870) (size!5031 (buf!5572 thiss!1870))))))

(declare-fun bs!18893 () Bool)

(assert (= bs!18893 d!77258))

(declare-fun m!350597 () Bool)

(assert (=> bs!18893 m!350597))

(assert (=> start!47850 d!77258))

(declare-fun d!77260 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77260 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))) ((_ sign_extend 32) (currentByte!10416 thiss!1870)) ((_ sign_extend 32) (currentBit!10411 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))) ((_ sign_extend 32) (currentByte!10416 thiss!1870)) ((_ sign_extend 32) (currentBit!10411 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18894 () Bool)

(assert (= bs!18894 d!77260))

(declare-fun m!350599 () Bool)

(assert (=> bs!18894 m!350599))

(assert (=> b!227736 d!77260))

(declare-fun d!77262 () Bool)

(declare-fun res!191071 () Bool)

(declare-fun e!155964 () Bool)

(assert (=> d!77262 (=> res!191071 e!155964)))

(assert (=> d!77262 (= res!191071 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77262 (= (arrayRangesEq!867 arr!308 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761) e!155964)))

(declare-fun b!227765 () Bool)

(declare-fun e!155965 () Bool)

(assert (=> b!227765 (= e!155964 e!155965)))

(declare-fun res!191072 () Bool)

(assert (=> b!227765 (=> (not res!191072) (not e!155965))))

(assert (=> b!227765 (= res!191072 (= (select (arr!6009 arr!308) #b00000000000000000000000000000000) (select (arr!6009 (_3!864 lt!364398)) #b00000000000000000000000000000000)))))

(declare-fun b!227766 () Bool)

(assert (=> b!227766 (= e!155965 (arrayRangesEq!867 arr!308 (_3!864 lt!364398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77262 (not res!191071)) b!227765))

(assert (= (and b!227765 res!191072) b!227766))

(declare-fun m!350601 () Bool)

(assert (=> b!227765 m!350601))

(assert (=> b!227765 m!350593))

(declare-fun m!350603 () Bool)

(assert (=> b!227766 m!350603))

(assert (=> b!227739 d!77262))

(declare-fun d!77264 () Bool)

(declare-fun lt!364456 () (_ BitVec 8))

(declare-fun lt!364460 () (_ BitVec 8))

(assert (=> d!77264 (= lt!364456 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6009 (buf!5572 thiss!1870)) (currentByte!10416 thiss!1870))) ((_ sign_extend 24) lt!364460))))))

(assert (=> d!77264 (= lt!364460 ((_ extract 7 0) (currentBit!10411 thiss!1870)))))

(declare-fun e!155977 () Bool)

(assert (=> d!77264 e!155977))

(declare-fun res!191084 () Bool)

(assert (=> d!77264 (=> (not res!191084) (not e!155977))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77264 (= res!191084 (validate_offset_bits!1 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))) ((_ sign_extend 32) (currentByte!10416 thiss!1870)) ((_ sign_extend 32) (currentBit!10411 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19602 0))(
  ( (tuple2!19603 (_1!10666 Unit!17036) (_2!10666 (_ BitVec 8))) )
))
(declare-fun Unit!17049 () Unit!17036)

(declare-fun Unit!17050 () Unit!17036)

(assert (=> d!77264 (= (readByte!0 thiss!1870) (tuple2!19597 (_2!10666 (ite (bvsgt ((_ sign_extend 24) lt!364460) #b00000000000000000000000000000000) (tuple2!19603 Unit!17049 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364456) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6009 (buf!5572 thiss!1870)) (bvadd (currentByte!10416 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364460)))))))) (tuple2!19603 Unit!17050 lt!364456))) (BitStream!9159 (buf!5572 thiss!1870) (bvadd (currentByte!10416 thiss!1870) #b00000000000000000000000000000001) (currentBit!10411 thiss!1870))))))

(declare-fun b!227777 () Bool)

(declare-fun e!155976 () Bool)

(assert (=> b!227777 (= e!155977 e!155976)))

(declare-fun res!191085 () Bool)

(assert (=> b!227777 (=> (not res!191085) (not e!155976))))

(declare-fun lt!364455 () tuple2!19596)

(assert (=> b!227777 (= res!191085 (= (buf!5572 (_2!10663 lt!364455)) (buf!5572 thiss!1870)))))

(declare-fun lt!364461 () (_ BitVec 8))

(declare-fun lt!364459 () (_ BitVec 8))

(declare-fun Unit!17051 () Unit!17036)

(declare-fun Unit!17052 () Unit!17036)

(assert (=> b!227777 (= lt!364455 (tuple2!19597 (_2!10666 (ite (bvsgt ((_ sign_extend 24) lt!364461) #b00000000000000000000000000000000) (tuple2!19603 Unit!17051 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364459) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6009 (buf!5572 thiss!1870)) (bvadd (currentByte!10416 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364461)))))))) (tuple2!19603 Unit!17052 lt!364459))) (BitStream!9159 (buf!5572 thiss!1870) (bvadd (currentByte!10416 thiss!1870) #b00000000000000000000000000000001) (currentBit!10411 thiss!1870))))))

(assert (=> b!227777 (= lt!364459 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6009 (buf!5572 thiss!1870)) (currentByte!10416 thiss!1870))) ((_ sign_extend 24) lt!364461))))))

(assert (=> b!227777 (= lt!364461 ((_ extract 7 0) (currentBit!10411 thiss!1870)))))

(declare-fun b!227778 () Bool)

(declare-fun lt!364457 () (_ BitVec 64))

(declare-fun lt!364458 () (_ BitVec 64))

(assert (=> b!227778 (= e!155976 (= (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364455))) (currentByte!10416 (_2!10663 lt!364455)) (currentBit!10411 (_2!10663 lt!364455))) (bvadd lt!364457 lt!364458)))))

(assert (=> b!227778 (or (not (= (bvand lt!364457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364458 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364457 lt!364458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227778 (= lt!364458 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227778 (= lt!364457 (bitIndex!0 (size!5031 (buf!5572 thiss!1870)) (currentByte!10416 thiss!1870) (currentBit!10411 thiss!1870)))))

(assert (= (and d!77264 res!191084) b!227777))

(assert (= (and b!227777 res!191085) b!227778))

(declare-fun m!350615 () Bool)

(assert (=> d!77264 m!350615))

(declare-fun m!350617 () Bool)

(assert (=> d!77264 m!350617))

(declare-fun m!350619 () Bool)

(assert (=> d!77264 m!350619))

(assert (=> b!227777 m!350619))

(assert (=> b!227777 m!350615))

(declare-fun m!350621 () Bool)

(assert (=> b!227778 m!350621))

(assert (=> b!227778 m!350551))

(assert (=> b!227739 d!77264))

(declare-fun d!77270 () Bool)

(declare-fun e!155983 () Bool)

(assert (=> d!77270 e!155983))

(declare-fun res!191096 () Bool)

(assert (=> d!77270 (=> (not res!191096) (not e!155983))))

(declare-fun lt!364495 () (_ BitVec 64))

(declare-fun lt!364492 () (_ BitVec 64))

(declare-fun lt!364494 () (_ BitVec 64))

(assert (=> d!77270 (= res!191096 (= lt!364495 (bvsub lt!364492 lt!364494)))))

(assert (=> d!77270 (or (= (bvand lt!364492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364492 lt!364494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77270 (= lt!364494 (remainingBits!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403)))))))

(declare-fun lt!364496 () (_ BitVec 64))

(declare-fun lt!364497 () (_ BitVec 64))

(assert (=> d!77270 (= lt!364492 (bvmul lt!364496 lt!364497))))

(assert (=> d!77270 (or (= lt!364496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364497 (bvsdiv (bvmul lt!364496 lt!364497) lt!364496)))))

(assert (=> d!77270 (= lt!364497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77270 (= lt!364496 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))))))

(assert (=> d!77270 (= lt!364495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403)))))))

(assert (=> d!77270 (invariant!0 (currentBit!10411 (_2!10663 lt!364403)) (currentByte!10416 (_2!10663 lt!364403)) (size!5031 (buf!5572 (_2!10663 lt!364403))))))

(assert (=> d!77270 (= (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364403))) (currentByte!10416 (_2!10663 lt!364403)) (currentBit!10411 (_2!10663 lt!364403))) lt!364495)))

(declare-fun b!227789 () Bool)

(declare-fun res!191097 () Bool)

(assert (=> b!227789 (=> (not res!191097) (not e!155983))))

(assert (=> b!227789 (= res!191097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364495))))

(declare-fun b!227790 () Bool)

(declare-fun lt!364493 () (_ BitVec 64))

(assert (=> b!227790 (= e!155983 (bvsle lt!364495 (bvmul lt!364493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227790 (or (= lt!364493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364493)))))

(assert (=> b!227790 (= lt!364493 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))))))

(assert (= (and d!77270 res!191096) b!227789))

(assert (= (and b!227789 res!191097) b!227790))

(declare-fun m!350623 () Bool)

(assert (=> d!77270 m!350623))

(declare-fun m!350625 () Bool)

(assert (=> d!77270 m!350625))

(assert (=> b!227739 d!77270))

(declare-fun d!77274 () Bool)

(assert (=> d!77274 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403))) lt!364406) (bvsle ((_ sign_extend 32) lt!364406) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18896 () Bool)

(assert (= bs!18896 d!77274))

(assert (=> bs!18896 m!350623))

(assert (=> b!227739 d!77274))

(declare-fun d!77276 () Bool)

(declare-fun e!155986 () Bool)

(assert (=> d!77276 e!155986))

(declare-fun res!191100 () Bool)

(assert (=> d!77276 (=> (not res!191100) (not e!155986))))

(assert (=> d!77276 (= res!191100 (and (or (let ((rhs!3985 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3985 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3985) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77277 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77277 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77277 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3984 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3984 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3984) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!364504 () Unit!17036)

(declare-fun choose!57 (BitStream!9158 BitStream!9158 (_ BitVec 64) (_ BitVec 32)) Unit!17036)

(assert (=> d!77276 (= lt!364504 (choose!57 thiss!1870 (_2!10663 lt!364403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77276 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10663 lt!364403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!364504)))

(declare-fun lt!364505 () (_ BitVec 32))

(declare-fun b!227793 () Bool)

(assert (=> b!227793 (= e!155986 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364403)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364403))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364403))) (bvsub (bvsub to!496 i!761) lt!364505)))))

(assert (=> b!227793 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!364505 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!364505) #b10000000000000000000000000000000)))))

(declare-fun lt!364506 () (_ BitVec 64))

(assert (=> b!227793 (= lt!364505 ((_ extract 31 0) lt!364506))))

(assert (=> b!227793 (and (bvslt lt!364506 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!364506 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227793 (= lt!364506 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77276 res!191100) b!227793))

(declare-fun m!350627 () Bool)

(assert (=> d!77276 m!350627))

(declare-fun m!350629 () Bool)

(assert (=> b!227793 m!350629))

(assert (=> b!227739 d!77276))

(declare-fun lt!364900 () array!11466)

(declare-fun lt!364899 () tuple3!1444)

(declare-fun c!11221 () Bool)

(declare-fun call!3881 () Bool)

(declare-fun bm!3877 () Bool)

(declare-fun lt!364903 () (_ BitVec 32))

(declare-fun lt!364893 () (_ BitVec 32))

(declare-fun lt!364908 () array!11466)

(assert (=> bm!3877 (= call!3881 (arrayRangesEq!867 (ite c!11221 lt!364407 lt!364900) (ite c!11221 (_3!864 lt!364899) lt!364908) (ite c!11221 #b00000000000000000000000000000000 lt!364903) (ite c!11221 (bvadd #b00000000000000000000000000000001 i!761) lt!364893)))))

(declare-fun lt!364904 () tuple3!1444)

(declare-fun b!227867 () Bool)

(declare-fun e!156039 () Bool)

(declare-datatypes ((tuple2!19608 0))(
  ( (tuple2!19609 (_1!10669 BitStream!9158) (_2!10669 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9158) tuple2!19608)

(assert (=> b!227867 (= e!156039 (= (select (arr!6009 (_3!864 lt!364904)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10669 (readBytePure!0 (_2!10663 lt!364403)))))))

(assert (=> b!227867 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5031 (_3!864 lt!364904))))))

(declare-fun e!156038 () Bool)

(declare-fun b!227868 () Bool)

(assert (=> b!227868 (= e!156038 (arrayRangesEq!867 lt!364407 (_3!864 lt!364904) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364881 () Unit!17036)

(declare-fun e!156037 () tuple3!1444)

(declare-fun b!227869 () Bool)

(assert (=> b!227869 (= e!156037 (tuple3!1445 lt!364881 (_2!10663 lt!364403) lt!364407))))

(declare-fun call!3880 () (_ BitVec 64))

(assert (=> b!227869 (= call!3880 call!3880)))

(declare-fun lt!364879 () Unit!17036)

(declare-fun Unit!17064 () Unit!17036)

(assert (=> b!227869 (= lt!364879 Unit!17064)))

(declare-fun lt!364909 () Unit!17036)

(declare-fun arrayRangesEqReflexiveLemma!138 (array!11466) Unit!17036)

(assert (=> b!227869 (= lt!364909 (arrayRangesEqReflexiveLemma!138 lt!364407))))

(declare-fun call!3882 () Bool)

(assert (=> b!227869 call!3882))

(declare-fun lt!364907 () Unit!17036)

(assert (=> b!227869 (= lt!364907 lt!364909)))

(assert (=> b!227869 (= lt!364900 lt!364407)))

(assert (=> b!227869 (= lt!364908 lt!364407)))

(declare-fun lt!364896 () (_ BitVec 32))

(assert (=> b!227869 (= lt!364896 #b00000000000000000000000000000000)))

(declare-fun lt!364911 () (_ BitVec 32))

(assert (=> b!227869 (= lt!364911 (size!5031 lt!364407))))

(assert (=> b!227869 (= lt!364903 #b00000000000000000000000000000000)))

(assert (=> b!227869 (= lt!364893 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!123 (array!11466 array!11466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17036)

(assert (=> b!227869 (= lt!364881 (arrayRangesEqSlicedLemma!123 lt!364900 lt!364908 lt!364896 lt!364911 lt!364903 lt!364893))))

(assert (=> b!227869 call!3881))

(declare-fun b!227870 () Bool)

(declare-fun lt!364890 () Unit!17036)

(assert (=> b!227870 (= e!156037 (tuple3!1445 lt!364890 (_2!10662 lt!364899) (_3!864 lt!364899)))))

(declare-fun lt!364878 () tuple2!19596)

(assert (=> b!227870 (= lt!364878 (readByte!0 (_2!10663 lt!364403)))))

(declare-fun lt!364887 () array!11466)

(assert (=> b!227870 (= lt!364887 (array!11467 (store (arr!6009 lt!364407) (bvadd #b00000000000000000000000000000001 i!761) (_1!10663 lt!364878)) (size!5031 lt!364407)))))

(declare-fun lt!364910 () (_ BitVec 64))

(assert (=> b!227870 (= lt!364910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!364901 () (_ BitVec 32))

(assert (=> b!227870 (= lt!364901 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364898 () Unit!17036)

(assert (=> b!227870 (= lt!364898 (validateOffsetBytesFromBitIndexLemma!0 (_2!10663 lt!364403) (_2!10663 lt!364878) lt!364910 lt!364901))))

(assert (=> b!227870 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10663 lt!364878)))) ((_ sign_extend 32) (currentByte!10416 (_2!10663 lt!364878))) ((_ sign_extend 32) (currentBit!10411 (_2!10663 lt!364878))) (bvsub lt!364901 ((_ extract 31 0) (bvsdiv (bvadd lt!364910 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!364877 () Unit!17036)

(assert (=> b!227870 (= lt!364877 lt!364898)))

(assert (=> b!227870 (= lt!364899 (readByteArrayLoop!0 (_2!10663 lt!364878) lt!364887 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!227870 (= (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364878))) (currentByte!10416 (_2!10663 lt!364878)) (currentBit!10411 (_2!10663 lt!364878))) (bvadd (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364403))) (currentByte!10416 (_2!10663 lt!364403)) (currentBit!10411 (_2!10663 lt!364403))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!364897 () Unit!17036)

(declare-fun Unit!17065 () Unit!17036)

(assert (=> b!227870 (= lt!364897 Unit!17065)))

(assert (=> b!227870 (= (bvadd (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364878))) (currentByte!10416 (_2!10663 lt!364878)) (currentBit!10411 (_2!10663 lt!364878))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3880)))

(declare-fun lt!364906 () Unit!17036)

(declare-fun Unit!17066 () Unit!17036)

(assert (=> b!227870 (= lt!364906 Unit!17066)))

(assert (=> b!227870 (= (bvadd (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364403))) (currentByte!10416 (_2!10663 lt!364403)) (currentBit!10411 (_2!10663 lt!364403))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3880)))

(declare-fun lt!364884 () Unit!17036)

(declare-fun Unit!17067 () Unit!17036)

(assert (=> b!227870 (= lt!364884 Unit!17067)))

(assert (=> b!227870 (and (= (buf!5572 (_2!10663 lt!364403)) (buf!5572 (_2!10662 lt!364899))) (= (size!5031 lt!364407) (size!5031 (_3!864 lt!364899))))))

(declare-fun lt!364886 () Unit!17036)

(declare-fun Unit!17068 () Unit!17036)

(assert (=> b!227870 (= lt!364886 Unit!17068)))

(declare-fun lt!364882 () Unit!17036)

(assert (=> b!227870 (= lt!364882 (arrayUpdatedAtPrefixLemma!426 lt!364407 (bvadd #b00000000000000000000000000000001 i!761) (_1!10663 lt!364878)))))

(assert (=> b!227870 (arrayRangesEq!867 lt!364407 (array!11467 (store (arr!6009 lt!364407) (bvadd #b00000000000000000000000000000001 i!761) (_1!10663 lt!364878)) (size!5031 lt!364407)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!364905 () Unit!17036)

(assert (=> b!227870 (= lt!364905 lt!364882)))

(declare-fun lt!364889 () (_ BitVec 32))

(assert (=> b!227870 (= lt!364889 #b00000000000000000000000000000000)))

(declare-fun lt!364895 () Unit!17036)

(assert (=> b!227870 (= lt!364895 (arrayRangesEqTransitive!290 lt!364407 lt!364887 (_3!864 lt!364899) lt!364889 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227870 call!3882))

(declare-fun lt!364902 () Unit!17036)

(assert (=> b!227870 (= lt!364902 lt!364895)))

(assert (=> b!227870 call!3881))

(declare-fun lt!364885 () Unit!17036)

(declare-fun Unit!17069 () Unit!17036)

(assert (=> b!227870 (= lt!364885 Unit!17069)))

(declare-fun lt!364880 () Unit!17036)

(declare-fun arrayRangesEqImpliesEq!123 (array!11466 array!11466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17036)

(assert (=> b!227870 (= lt!364880 (arrayRangesEqImpliesEq!123 lt!364887 (_3!864 lt!364899) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227870 (= (select (store (arr!6009 lt!364407) (bvadd #b00000000000000000000000000000001 i!761) (_1!10663 lt!364878)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6009 (_3!864 lt!364899)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364892 () Unit!17036)

(assert (=> b!227870 (= lt!364892 lt!364880)))

(declare-fun lt!364883 () Bool)

(assert (=> b!227870 (= lt!364883 (= (select (arr!6009 (_3!864 lt!364899)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10663 lt!364878)))))

(declare-fun Unit!17070 () Unit!17036)

(assert (=> b!227870 (= lt!364890 Unit!17070)))

(assert (=> b!227870 lt!364883))

(declare-fun b!227871 () Bool)

(declare-fun res!191161 () Bool)

(assert (=> b!227871 (=> (not res!191161) (not e!156038))))

(assert (=> b!227871 (= res!191161 (and (= (buf!5572 (_2!10663 lt!364403)) (buf!5572 (_2!10662 lt!364904))) (= (size!5031 lt!364407) (size!5031 (_3!864 lt!364904)))))))

(declare-fun bm!3879 () Bool)

(assert (=> bm!3879 (= call!3882 (arrayRangesEq!867 lt!364407 (ite c!11221 (_3!864 lt!364899) lt!364407) (ite c!11221 lt!364889 #b00000000000000000000000000000000) (ite c!11221 (bvadd #b00000000000000000000000000000001 i!761) (size!5031 lt!364407))))))

(declare-fun bm!3878 () Bool)

(assert (=> bm!3878 (= call!3880 (bitIndex!0 (ite c!11221 (size!5031 (buf!5572 (_2!10662 lt!364899))) (size!5031 (buf!5572 (_2!10663 lt!364403)))) (ite c!11221 (currentByte!10416 (_2!10662 lt!364899)) (currentByte!10416 (_2!10663 lt!364403))) (ite c!11221 (currentBit!10411 (_2!10662 lt!364899)) (currentBit!10411 (_2!10663 lt!364403)))))))

(declare-fun d!77279 () Bool)

(assert (=> d!77279 e!156039))

(declare-fun res!191160 () Bool)

(assert (=> d!77279 (=> res!191160 e!156039)))

(assert (=> d!77279 (= res!191160 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!364888 () Bool)

(assert (=> d!77279 (= lt!364888 e!156038)))

(declare-fun res!191159 () Bool)

(assert (=> d!77279 (=> (not res!191159) (not e!156038))))

(declare-fun lt!364891 () (_ BitVec 64))

(declare-fun lt!364876 () (_ BitVec 64))

(assert (=> d!77279 (= res!191159 (= (bvadd lt!364876 lt!364891) (bitIndex!0 (size!5031 (buf!5572 (_2!10662 lt!364904))) (currentByte!10416 (_2!10662 lt!364904)) (currentBit!10411 (_2!10662 lt!364904)))))))

(assert (=> d!77279 (or (not (= (bvand lt!364876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364876 lt!364891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!364894 () (_ BitVec 64))

(assert (=> d!77279 (= lt!364891 (bvmul lt!364894 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77279 (or (= lt!364894 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364894 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364894)))))

(assert (=> d!77279 (= lt!364894 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77279 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77279 (= lt!364876 (bitIndex!0 (size!5031 (buf!5572 (_2!10663 lt!364403))) (currentByte!10416 (_2!10663 lt!364403)) (currentBit!10411 (_2!10663 lt!364403))))))

(assert (=> d!77279 (= lt!364904 e!156037)))

(assert (=> d!77279 (= c!11221 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77279 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5031 lt!364407)))))

(assert (=> d!77279 (= (readByteArrayLoop!0 (_2!10663 lt!364403) lt!364407 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!364904)))

(assert (= (and d!77279 c!11221) b!227870))

(assert (= (and d!77279 (not c!11221)) b!227869))

(assert (= (or b!227870 b!227869) bm!3877))

(assert (= (or b!227870 b!227869) bm!3879))

(assert (= (or b!227870 b!227869) bm!3878))

(assert (= (and d!77279 res!191159) b!227871))

(assert (= (and b!227871 res!191161) b!227868))

(assert (= (and d!77279 (not res!191160)) b!227867))

(declare-fun m!350761 () Bool)

(assert (=> b!227869 m!350761))

(declare-fun m!350763 () Bool)

(assert (=> b!227869 m!350763))

(declare-fun m!350765 () Bool)

(assert (=> bm!3877 m!350765))

(declare-fun m!350767 () Bool)

(assert (=> bm!3879 m!350767))

(declare-fun m!350769 () Bool)

(assert (=> d!77279 m!350769))

(assert (=> d!77279 m!350557))

(declare-fun m!350771 () Bool)

(assert (=> b!227870 m!350771))

(declare-fun m!350773 () Bool)

(assert (=> b!227870 m!350773))

(declare-fun m!350775 () Bool)

(assert (=> b!227870 m!350775))

(declare-fun m!350777 () Bool)

(assert (=> b!227870 m!350777))

(declare-fun m!350779 () Bool)

(assert (=> b!227870 m!350779))

(declare-fun m!350781 () Bool)

(assert (=> b!227870 m!350781))

(declare-fun m!350783 () Bool)

(assert (=> b!227870 m!350783))

(declare-fun m!350785 () Bool)

(assert (=> b!227870 m!350785))

(declare-fun m!350787 () Bool)

(assert (=> b!227870 m!350787))

(declare-fun m!350789 () Bool)

(assert (=> b!227870 m!350789))

(assert (=> b!227870 m!350557))

(declare-fun m!350791 () Bool)

(assert (=> b!227870 m!350791))

(declare-fun m!350793 () Bool)

(assert (=> b!227870 m!350793))

(declare-fun m!350795 () Bool)

(assert (=> b!227867 m!350795))

(declare-fun m!350797 () Bool)

(assert (=> b!227867 m!350797))

(declare-fun m!350799 () Bool)

(assert (=> b!227868 m!350799))

(declare-fun m!350801 () Bool)

(assert (=> bm!3878 m!350801))

(assert (=> b!227739 d!77279))

(declare-fun d!77316 () Bool)

(declare-fun e!156040 () Bool)

(assert (=> d!77316 e!156040))

(declare-fun res!191162 () Bool)

(assert (=> d!77316 (=> (not res!191162) (not e!156040))))

(declare-fun lt!364914 () (_ BitVec 64))

(declare-fun lt!364915 () (_ BitVec 64))

(declare-fun lt!364912 () (_ BitVec 64))

(assert (=> d!77316 (= res!191162 (= lt!364915 (bvsub lt!364912 lt!364914)))))

(assert (=> d!77316 (or (= (bvand lt!364912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364914 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364912 lt!364914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77316 (= lt!364914 (remainingBits!0 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))) ((_ sign_extend 32) (currentByte!10416 thiss!1870)) ((_ sign_extend 32) (currentBit!10411 thiss!1870))))))

(declare-fun lt!364916 () (_ BitVec 64))

(declare-fun lt!364917 () (_ BitVec 64))

(assert (=> d!77316 (= lt!364912 (bvmul lt!364916 lt!364917))))

(assert (=> d!77316 (or (= lt!364916 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364917 (bvsdiv (bvmul lt!364916 lt!364917) lt!364916)))))

(assert (=> d!77316 (= lt!364917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77316 (= lt!364916 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))))))

(assert (=> d!77316 (= lt!364915 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10416 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10411 thiss!1870))))))

(assert (=> d!77316 (invariant!0 (currentBit!10411 thiss!1870) (currentByte!10416 thiss!1870) (size!5031 (buf!5572 thiss!1870)))))

(assert (=> d!77316 (= (bitIndex!0 (size!5031 (buf!5572 thiss!1870)) (currentByte!10416 thiss!1870) (currentBit!10411 thiss!1870)) lt!364915)))

(declare-fun b!227872 () Bool)

(declare-fun res!191163 () Bool)

(assert (=> b!227872 (=> (not res!191163) (not e!156040))))

(assert (=> b!227872 (= res!191163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364915))))

(declare-fun b!227873 () Bool)

(declare-fun lt!364913 () (_ BitVec 64))

(assert (=> b!227873 (= e!156040 (bvsle lt!364915 (bvmul lt!364913 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227873 (or (= lt!364913 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364913 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364913)))))

(assert (=> b!227873 (= lt!364913 ((_ sign_extend 32) (size!5031 (buf!5572 thiss!1870))))))

(assert (= (and d!77316 res!191162) b!227872))

(assert (= (and b!227872 res!191163) b!227873))

(assert (=> d!77316 m!350599))

(assert (=> d!77316 m!350597))

(assert (=> b!227739 d!77316))

(declare-fun d!77318 () Bool)

(declare-fun e!156041 () Bool)

(assert (=> d!77318 e!156041))

(declare-fun res!191164 () Bool)

(assert (=> d!77318 (=> (not res!191164) (not e!156041))))

(declare-fun lt!364921 () (_ BitVec 64))

(declare-fun lt!364920 () (_ BitVec 64))

(declare-fun lt!364918 () (_ BitVec 64))

(assert (=> d!77318 (= res!191164 (= lt!364921 (bvsub lt!364918 lt!364920)))))

(assert (=> d!77318 (or (= (bvand lt!364918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364918 lt!364920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77318 (= lt!364920 (remainingBits!0 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10662 lt!364398)))) ((_ sign_extend 32) (currentByte!10416 (_2!10662 lt!364398))) ((_ sign_extend 32) (currentBit!10411 (_2!10662 lt!364398)))))))

(declare-fun lt!364922 () (_ BitVec 64))

(declare-fun lt!364923 () (_ BitVec 64))

(assert (=> d!77318 (= lt!364918 (bvmul lt!364922 lt!364923))))

(assert (=> d!77318 (or (= lt!364922 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364923 (bvsdiv (bvmul lt!364922 lt!364923) lt!364922)))))

(assert (=> d!77318 (= lt!364923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77318 (= lt!364922 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10662 lt!364398)))))))

(assert (=> d!77318 (= lt!364921 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10416 (_2!10662 lt!364398))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10411 (_2!10662 lt!364398)))))))

(assert (=> d!77318 (invariant!0 (currentBit!10411 (_2!10662 lt!364398)) (currentByte!10416 (_2!10662 lt!364398)) (size!5031 (buf!5572 (_2!10662 lt!364398))))))

(assert (=> d!77318 (= (bitIndex!0 (size!5031 (buf!5572 (_2!10662 lt!364398))) (currentByte!10416 (_2!10662 lt!364398)) (currentBit!10411 (_2!10662 lt!364398))) lt!364921)))

(declare-fun b!227874 () Bool)

(declare-fun res!191165 () Bool)

(assert (=> b!227874 (=> (not res!191165) (not e!156041))))

(assert (=> b!227874 (= res!191165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364921))))

(declare-fun b!227875 () Bool)

(declare-fun lt!364919 () (_ BitVec 64))

(assert (=> b!227875 (= e!156041 (bvsle lt!364921 (bvmul lt!364919 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227875 (or (= lt!364919 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364919 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364919)))))

(assert (=> b!227875 (= lt!364919 ((_ sign_extend 32) (size!5031 (buf!5572 (_2!10662 lt!364398)))))))

(assert (= (and d!77318 res!191164) b!227874))

(assert (= (and b!227874 res!191165) b!227875))

(declare-fun m!350803 () Bool)

(assert (=> d!77318 m!350803))

(declare-fun m!350805 () Bool)

(assert (=> d!77318 m!350805))

(assert (=> b!227739 d!77318))

(declare-fun d!77320 () Bool)

(declare-fun res!191166 () Bool)

(declare-fun e!156042 () Bool)

(assert (=> d!77320 (=> res!191166 e!156042)))

(assert (=> d!77320 (= res!191166 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77320 (= (arrayRangesEq!867 arr!308 lt!364407 #b00000000000000000000000000000000 i!761) e!156042)))

(declare-fun b!227876 () Bool)

(declare-fun e!156043 () Bool)

(assert (=> b!227876 (= e!156042 e!156043)))

(declare-fun res!191167 () Bool)

(assert (=> b!227876 (=> (not res!191167) (not e!156043))))

(assert (=> b!227876 (= res!191167 (= (select (arr!6009 arr!308) #b00000000000000000000000000000000) (select (arr!6009 lt!364407) #b00000000000000000000000000000000)))))

(declare-fun b!227877 () Bool)

(assert (=> b!227877 (= e!156043 (arrayRangesEq!867 arr!308 lt!364407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77320 (not res!191166)) b!227876))

(assert (= (and b!227876 res!191167) b!227877))

(assert (=> b!227876 m!350601))

(assert (=> b!227876 m!350591))

(declare-fun m!350807 () Bool)

(assert (=> b!227877 m!350807))

(assert (=> b!227739 d!77320))

(declare-fun d!77322 () Bool)

(assert (=> d!77322 (arrayRangesEq!867 arr!308 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364926 () Unit!17036)

(declare-fun choose!322 (array!11466 array!11466 array!11466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17036)

(assert (=> d!77322 (= lt!364926 (choose!322 arr!308 lt!364407 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77322 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77322 (= (arrayRangesEqTransitive!290 arr!308 lt!364407 (_3!864 lt!364398) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!364926)))

(declare-fun bs!18902 () Bool)

(assert (= bs!18902 d!77322))

(assert (=> bs!18902 m!350555))

(declare-fun m!350809 () Bool)

(assert (=> bs!18902 m!350809))

(assert (=> b!227739 d!77322))

(declare-fun d!77324 () Bool)

(declare-fun e!156046 () Bool)

(assert (=> d!77324 e!156046))

(declare-fun res!191170 () Bool)

(assert (=> d!77324 (=> (not res!191170) (not e!156046))))

(assert (=> d!77324 (= res!191170 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5031 arr!308))))))

(declare-fun lt!364929 () Unit!17036)

(declare-fun choose!323 (array!11466 (_ BitVec 32) (_ BitVec 8)) Unit!17036)

(assert (=> d!77324 (= lt!364929 (choose!323 arr!308 i!761 (_1!10663 lt!364403)))))

(assert (=> d!77324 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5031 arr!308)))))

(assert (=> d!77324 (= (arrayUpdatedAtPrefixLemma!426 arr!308 i!761 (_1!10663 lt!364403)) lt!364929)))

(declare-fun b!227880 () Bool)

(assert (=> b!227880 (= e!156046 (arrayRangesEq!867 arr!308 (array!11467 (store (arr!6009 arr!308) i!761 (_1!10663 lt!364403)) (size!5031 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77324 res!191170) b!227880))

(declare-fun m!350811 () Bool)

(assert (=> d!77324 m!350811))

(assert (=> b!227880 m!350539))

(declare-fun m!350813 () Bool)

(assert (=> b!227880 m!350813))

(assert (=> b!227739 d!77324))

(push 1)

