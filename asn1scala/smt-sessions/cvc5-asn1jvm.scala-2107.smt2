; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53412 () Bool)

(assert start!53412)

(declare-fun b!248016 () Bool)

(declare-fun e!171835 () Bool)

(declare-fun e!171838 () Bool)

(assert (=> b!248016 (= e!171835 (not e!171838))))

(declare-fun res!207568 () Bool)

(assert (=> b!248016 (=> res!207568 e!171838)))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13537 0))(
  ( (array!13538 (arr!6922 (Array (_ BitVec 32) (_ BitVec 8))) (size!5935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10792 0))(
  ( (BitStream!10793 (buf!6422 array!13537) (currentByte!11838 (_ BitVec 32)) (currentBit!11833 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21270 0))(
  ( (tuple2!21271 (_1!11557 BitStream!10792) (_2!11557 BitStream!10792)) )
))
(declare-fun lt!386542 () tuple2!21270)

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-datatypes ((tuple2!21272 0))(
  ( (tuple2!21273 (_1!11558 BitStream!10792) (_2!11558 Bool)) )
))
(declare-fun checkBitsLoopPure!0 (BitStream!10792 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21272)

(assert (=> b!248016 (= res!207568 (not (= (_1!11558 (checkBitsLoopPure!0 (_1!11557 lt!386542) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11557 lt!386542))))))

(declare-datatypes ((Unit!17991 0))(
  ( (Unit!17992) )
))
(declare-datatypes ((tuple2!21274 0))(
  ( (tuple2!21275 (_1!11559 Unit!17991) (_2!11559 BitStream!10792)) )
))
(declare-fun lt!386531 () tuple2!21274)

(declare-fun lt!386539 () tuple2!21274)

(declare-fun lt!386530 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248016 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530)))

(declare-fun lt!386532 () Unit!17991)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10792 array!13537 (_ BitVec 64)) Unit!17991)

(assert (=> b!248016 (= lt!386532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386530))))

(declare-fun lt!386544 () tuple2!21270)

(declare-fun lt!386540 () tuple2!21272)

(assert (=> b!248016 (= lt!386540 (checkBitsLoopPure!0 (_1!11557 lt!386544) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10792)

(assert (=> b!248016 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386525 () Unit!17991)

(assert (=> b!248016 (= lt!386525 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6422 (_2!11559 lt!386531)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10792) tuple2!21272)

(assert (=> b!248016 (= (_2!11558 (readBitPure!0 (_1!11557 lt!386544))) bit!26)))

(declare-fun reader!0 (BitStream!10792 BitStream!10792) tuple2!21270)

(assert (=> b!248016 (= lt!386542 (reader!0 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(assert (=> b!248016 (= lt!386544 (reader!0 thiss!1005 (_2!11559 lt!386531)))))

(declare-fun e!171844 () Bool)

(assert (=> b!248016 e!171844))

(declare-fun res!207569 () Bool)

(assert (=> b!248016 (=> (not res!207569) (not e!171844))))

(declare-fun lt!386529 () tuple2!21272)

(declare-fun lt!386536 () tuple2!21272)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!248016 (= res!207569 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386529))) (currentByte!11838 (_1!11558 lt!386529)) (currentBit!11833 (_1!11558 lt!386529))) (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386536))) (currentByte!11838 (_1!11558 lt!386536)) (currentBit!11833 (_1!11558 lt!386536)))))))

(declare-fun lt!386528 () Unit!17991)

(declare-fun lt!386526 () BitStream!10792)

(declare-fun readBitPrefixLemma!0 (BitStream!10792 BitStream!10792) Unit!17991)

(assert (=> b!248016 (= lt!386528 (readBitPrefixLemma!0 lt!386526 (_2!11559 lt!386531)))))

(assert (=> b!248016 (= lt!386536 (readBitPure!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (=> b!248016 (= lt!386529 (readBitPure!0 lt!386526))))

(assert (=> b!248016 (= lt!386526 (BitStream!10793 (buf!6422 (_2!11559 lt!386539)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun e!171843 () Bool)

(assert (=> b!248016 e!171843))

(declare-fun res!207576 () Bool)

(assert (=> b!248016 (=> (not res!207576) (not e!171843))))

(declare-fun isPrefixOf!0 (BitStream!10792 BitStream!10792) Bool)

(assert (=> b!248016 (= res!207576 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386531)))))

(declare-fun lt!386533 () Unit!17991)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10792 BitStream!10792 BitStream!10792) Unit!17991)

(assert (=> b!248016 (= lt!386533 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(declare-fun e!171836 () Bool)

(assert (=> b!248016 e!171836))

(declare-fun res!207575 () Bool)

(assert (=> b!248016 (=> (not res!207575) (not e!171836))))

(assert (=> b!248016 (= res!207575 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10792 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21274)

(assert (=> b!248016 (= lt!386531 (appendNBitsLoop!0 (_2!11559 lt!386539) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248016 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530)))

(assert (=> b!248016 (= lt!386530 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386537 () Unit!17991)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10792 BitStream!10792 (_ BitVec 64) (_ BitVec 64)) Unit!17991)

(assert (=> b!248016 (= lt!386537 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11559 lt!386539) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171842 () Bool)

(assert (=> b!248016 e!171842))

(declare-fun res!207577 () Bool)

(assert (=> b!248016 (=> (not res!207577) (not e!171842))))

(assert (=> b!248016 (= res!207577 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(declare-fun appendBit!0 (BitStream!10792 Bool) tuple2!21274)

(assert (=> b!248016 (= lt!386539 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!248017 () Bool)

(declare-fun e!171837 () Bool)

(assert (=> b!248017 (= e!171836 e!171837)))

(declare-fun res!207566 () Bool)

(assert (=> b!248017 (=> (not res!207566) (not e!171837))))

(declare-fun lt!386538 () (_ BitVec 64))

(assert (=> b!248017 (= res!207566 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531))) (bvadd (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) lt!386538)))))

(assert (=> b!248017 (= lt!386538 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!248018 () Bool)

(declare-fun res!207571 () Bool)

(declare-fun e!171840 () Bool)

(assert (=> b!248018 (=> (not res!207571) (not e!171840))))

(assert (=> b!248018 (= res!207571 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386539)))))

(declare-fun b!248019 () Bool)

(declare-fun e!171839 () Bool)

(declare-fun array_inv!5676 (array!13537) Bool)

(assert (=> b!248019 (= e!171839 (array_inv!5676 (buf!6422 thiss!1005)))))

(declare-fun res!207570 () Bool)

(assert (=> start!53412 (=> (not res!207570) (not e!171835))))

(assert (=> start!53412 (= res!207570 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53412 e!171835))

(assert (=> start!53412 true))

(declare-fun inv!12 (BitStream!10792) Bool)

(assert (=> start!53412 (and (inv!12 thiss!1005) e!171839)))

(declare-fun b!248020 () Bool)

(assert (=> b!248020 (= e!171844 (= (_2!11558 lt!386529) (_2!11558 lt!386536)))))

(declare-fun b!248021 () Bool)

(declare-fun e!171845 () Bool)

(declare-fun lt!386534 () tuple2!21272)

(declare-fun lt!386541 () (_ BitVec 64))

(assert (=> b!248021 (= e!171845 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386534))) (currentByte!11838 (_1!11558 lt!386534)) (currentBit!11833 (_1!11558 lt!386534))) lt!386541))))

(declare-fun b!248022 () Bool)

(declare-fun res!207578 () Bool)

(assert (=> b!248022 (=> (not res!207578) (not e!171835))))

(assert (=> b!248022 (= res!207578 (bvslt from!289 nBits!297))))

(declare-fun b!248023 () Bool)

(assert (=> b!248023 (= e!171842 e!171840)))

(declare-fun res!207573 () Bool)

(assert (=> b!248023 (=> (not res!207573) (not e!171840))))

(declare-fun lt!386535 () (_ BitVec 64))

(assert (=> b!248023 (= res!207573 (= lt!386541 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386535)))))

(assert (=> b!248023 (= lt!386541 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(assert (=> b!248023 (= lt!386535 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun b!248024 () Bool)

(declare-fun res!207574 () Bool)

(assert (=> b!248024 (=> (not res!207574) (not e!171835))))

(assert (=> b!248024 (= res!207574 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!248025 () Bool)

(declare-fun res!207572 () Bool)

(assert (=> b!248025 (=> (not res!207572) (not e!171837))))

(assert (=> b!248025 (= res!207572 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(declare-fun b!248026 () Bool)

(declare-fun res!207567 () Bool)

(assert (=> b!248026 (=> (not res!207567) (not e!171843))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248026 (= res!207567 (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(declare-fun b!248027 () Bool)

(declare-fun lt!386527 () tuple2!21272)

(declare-fun lt!386524 () tuple2!21270)

(assert (=> b!248027 (= e!171837 (not (or (not (_2!11558 lt!386527)) (not (= (_1!11558 lt!386527) (_2!11557 lt!386524))))))))

(assert (=> b!248027 (= lt!386527 (checkBitsLoopPure!0 (_1!11557 lt!386524) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248027 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386538)))

(declare-fun lt!386543 () Unit!17991)

(assert (=> b!248027 (= lt!386543 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386538))))

(assert (=> b!248027 (= lt!386524 (reader!0 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(declare-fun b!248028 () Bool)

(assert (=> b!248028 (= e!171840 e!171845)))

(declare-fun res!207579 () Bool)

(assert (=> b!248028 (=> (not res!207579) (not e!171845))))

(assert (=> b!248028 (= res!207579 (and (= (_2!11558 lt!386534) bit!26) (= (_1!11558 lt!386534) (_2!11559 lt!386539))))))

(declare-fun readerFrom!0 (BitStream!10792 (_ BitVec 32) (_ BitVec 32)) BitStream!10792)

(assert (=> b!248028 (= lt!386534 (readBitPure!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))

(declare-fun b!248029 () Bool)

(assert (=> b!248029 (= e!171843 (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(declare-fun b!248030 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10792 (_ BitVec 64)) BitStream!10792)

(assert (=> b!248030 (= e!171838 (= (_1!11557 lt!386542) (withMovedBitIndex!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!53412 res!207570) b!248024))

(assert (= (and b!248024 res!207574) b!248022))

(assert (= (and b!248022 res!207578) b!248016))

(assert (= (and b!248016 res!207577) b!248023))

(assert (= (and b!248023 res!207573) b!248018))

(assert (= (and b!248018 res!207571) b!248028))

(assert (= (and b!248028 res!207579) b!248021))

(assert (= (and b!248016 res!207575) b!248017))

(assert (= (and b!248017 res!207566) b!248025))

(assert (= (and b!248025 res!207572) b!248027))

(assert (= (and b!248016 res!207576) b!248026))

(assert (= (and b!248026 res!207567) b!248029))

(assert (= (and b!248016 res!207569) b!248020))

(assert (= (and b!248016 (not res!207568)) b!248030))

(assert (= start!53412 b!248019))

(declare-fun m!373755 () Bool)

(assert (=> b!248026 m!373755))

(declare-fun m!373757 () Bool)

(assert (=> b!248023 m!373757))

(declare-fun m!373759 () Bool)

(assert (=> b!248023 m!373759))

(declare-fun m!373761 () Bool)

(assert (=> start!53412 m!373761))

(declare-fun m!373763 () Bool)

(assert (=> b!248021 m!373763))

(declare-fun m!373765 () Bool)

(assert (=> b!248017 m!373765))

(assert (=> b!248017 m!373757))

(declare-fun m!373767 () Bool)

(assert (=> b!248018 m!373767))

(declare-fun m!373769 () Bool)

(assert (=> b!248030 m!373769))

(declare-fun m!373771 () Bool)

(assert (=> b!248027 m!373771))

(declare-fun m!373773 () Bool)

(assert (=> b!248027 m!373773))

(declare-fun m!373775 () Bool)

(assert (=> b!248027 m!373775))

(declare-fun m!373777 () Bool)

(assert (=> b!248027 m!373777))

(declare-fun m!373779 () Bool)

(assert (=> b!248029 m!373779))

(assert (=> b!248016 m!373777))

(declare-fun m!373781 () Bool)

(assert (=> b!248016 m!373781))

(declare-fun m!373783 () Bool)

(assert (=> b!248016 m!373783))

(declare-fun m!373785 () Bool)

(assert (=> b!248016 m!373785))

(declare-fun m!373787 () Bool)

(assert (=> b!248016 m!373787))

(declare-fun m!373789 () Bool)

(assert (=> b!248016 m!373789))

(declare-fun m!373791 () Bool)

(assert (=> b!248016 m!373791))

(declare-fun m!373793 () Bool)

(assert (=> b!248016 m!373793))

(declare-fun m!373795 () Bool)

(assert (=> b!248016 m!373795))

(declare-fun m!373797 () Bool)

(assert (=> b!248016 m!373797))

(declare-fun m!373799 () Bool)

(assert (=> b!248016 m!373799))

(declare-fun m!373801 () Bool)

(assert (=> b!248016 m!373801))

(declare-fun m!373803 () Bool)

(assert (=> b!248016 m!373803))

(declare-fun m!373805 () Bool)

(assert (=> b!248016 m!373805))

(declare-fun m!373807 () Bool)

(assert (=> b!248016 m!373807))

(declare-fun m!373809 () Bool)

(assert (=> b!248016 m!373809))

(declare-fun m!373811 () Bool)

(assert (=> b!248016 m!373811))

(declare-fun m!373813 () Bool)

(assert (=> b!248016 m!373813))

(declare-fun m!373815 () Bool)

(assert (=> b!248016 m!373815))

(declare-fun m!373817 () Bool)

(assert (=> b!248016 m!373817))

(declare-fun m!373819 () Bool)

(assert (=> b!248025 m!373819))

(declare-fun m!373821 () Bool)

(assert (=> b!248024 m!373821))

(declare-fun m!373823 () Bool)

(assert (=> b!248019 m!373823))

(declare-fun m!373825 () Bool)

(assert (=> b!248028 m!373825))

(assert (=> b!248028 m!373825))

(declare-fun m!373827 () Bool)

(assert (=> b!248028 m!373827))

(push 1)

(assert (not b!248017))

(assert (not b!248024))

(assert (not b!248027))

(assert (not b!248023))

(assert (not b!248030))

(assert (not b!248028))

(assert (not b!248016))

(assert (not b!248019))

(assert (not b!248025))

(assert (not start!53412))

(assert (not b!248021))

(assert (not b!248026))

(assert (not b!248029))

(assert (not b!248018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82978 () Bool)

(declare-fun e!171914 () Bool)

(assert (=> d!82978 e!171914))

(declare-fun res!207666 () Bool)

(assert (=> d!82978 (=> (not res!207666) (not e!171914))))

(declare-fun lt!386676 () (_ BitVec 64))

(declare-fun lt!386675 () BitStream!10792)

(assert (=> d!82978 (= res!207666 (= (bvadd lt!386676 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5935 (buf!6422 lt!386675)) (currentByte!11838 lt!386675) (currentBit!11833 lt!386675))))))

(assert (=> d!82978 (or (not (= (bvand lt!386676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!386676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!386676 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82978 (= lt!386676 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))))))

(declare-fun moveBitIndex!0 (BitStream!10792 (_ BitVec 64)) tuple2!21274)

(assert (=> d!82978 (= lt!386675 (_2!11559 (moveBitIndex!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10792 (_ BitVec 64)) Bool)

(assert (=> d!82978 (moveBitIndexPrecond!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82978 (= (withMovedBitIndex!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001) lt!386675)))

(declare-fun b!248123 () Bool)

(assert (=> b!248123 (= e!171914 (= (size!5935 (buf!6422 (_1!11557 lt!386544))) (size!5935 (buf!6422 lt!386675))))))

(assert (= (and d!82978 res!207666) b!248123))

(declare-fun m!373977 () Bool)

(assert (=> d!82978 m!373977))

(declare-fun m!373979 () Bool)

(assert (=> d!82978 m!373979))

(declare-fun m!373981 () Bool)

(assert (=> d!82978 m!373981))

(declare-fun m!373983 () Bool)

(assert (=> d!82978 m!373983))

(assert (=> b!248030 d!82978))

(declare-fun d!82980 () Bool)

(assert (=> d!82980 (= (array_inv!5676 (buf!6422 thiss!1005)) (bvsge (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!248019 d!82980))

(declare-fun d!82982 () Bool)

(assert (=> d!82982 (= (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (bvsge (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11833 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11838 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (= (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386531))))))))))

(assert (=> b!248029 d!82982))

(declare-fun d!82984 () Bool)

(declare-fun res!207675 () Bool)

(declare-fun e!171919 () Bool)

(assert (=> d!82984 (=> (not res!207675) (not e!171919))))

(assert (=> d!82984 (= res!207675 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (=> d!82984 (= (isPrefixOf!0 thiss!1005 (_2!11559 lt!386539)) e!171919)))

(declare-fun b!248130 () Bool)

(declare-fun res!207674 () Bool)

(assert (=> b!248130 (=> (not res!207674) (not e!171919))))

(assert (=> b!248130 (= res!207674 (bvsle (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(declare-fun b!248131 () Bool)

(declare-fun e!171920 () Bool)

(assert (=> b!248131 (= e!171919 e!171920)))

(declare-fun res!207673 () Bool)

(assert (=> b!248131 (=> res!207673 e!171920)))

(assert (=> b!248131 (= res!207673 (= (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248132 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13537 array!13537 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!248132 (= e!171920 (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (= (and d!82984 res!207675) b!248130))

(assert (= (and b!248130 res!207674) b!248131))

(assert (= (and b!248131 (not res!207673)) b!248132))

(assert (=> b!248130 m!373759))

(assert (=> b!248130 m!373757))

(assert (=> b!248132 m!373759))

(assert (=> b!248132 m!373759))

(declare-fun m!373985 () Bool)

(assert (=> b!248132 m!373985))

(assert (=> b!248018 d!82984))

(declare-fun d!82986 () Bool)

(declare-datatypes ((tuple2!21288 0))(
  ( (tuple2!21289 (_1!11566 Bool) (_2!11566 BitStream!10792)) )
))
(declare-fun lt!386679 () tuple2!21288)

(declare-fun readBit!0 (BitStream!10792) tuple2!21288)

(assert (=> d!82986 (= lt!386679 (readBit!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))

(assert (=> d!82986 (= (readBitPure!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))) (tuple2!21273 (_2!11566 lt!386679) (_1!11566 lt!386679)))))

(declare-fun bs!21041 () Bool)

(assert (= bs!21041 d!82986))

(assert (=> bs!21041 m!373825))

(declare-fun m!373987 () Bool)

(assert (=> bs!21041 m!373987))

(assert (=> b!248028 d!82986))

(declare-fun d!82988 () Bool)

(declare-fun e!171923 () Bool)

(assert (=> d!82988 e!171923))

(declare-fun res!207679 () Bool)

(assert (=> d!82988 (=> (not res!207679) (not e!171923))))

(assert (=> d!82988 (= res!207679 (invariant!0 (currentBit!11833 (_2!11559 lt!386539)) (currentByte!11838 (_2!11559 lt!386539)) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (=> d!82988 (= (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)) (BitStream!10793 (buf!6422 (_2!11559 lt!386539)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun b!248135 () Bool)

(assert (=> b!248135 (= e!171923 (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (= (and d!82988 res!207679) b!248135))

(declare-fun m!373989 () Bool)

(assert (=> d!82988 m!373989))

(assert (=> b!248135 m!373755))

(assert (=> b!248028 d!82988))

(declare-fun d!82990 () Bool)

(declare-fun e!171926 () Bool)

(assert (=> d!82990 e!171926))

(declare-fun res!207685 () Bool)

(assert (=> d!82990 (=> (not res!207685) (not e!171926))))

(declare-fun lt!386692 () (_ BitVec 64))

(declare-fun lt!386696 () (_ BitVec 64))

(declare-fun lt!386694 () (_ BitVec 64))

(assert (=> d!82990 (= res!207685 (= lt!386696 (bvsub lt!386694 lt!386692)))))

(assert (=> d!82990 (or (= (bvand lt!386694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386692 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386694 lt!386692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82990 (= lt!386692 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386534)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386534))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386534)))))))

(declare-fun lt!386695 () (_ BitVec 64))

(declare-fun lt!386693 () (_ BitVec 64))

(assert (=> d!82990 (= lt!386694 (bvmul lt!386695 lt!386693))))

(assert (=> d!82990 (or (= lt!386695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386693 (bvsdiv (bvmul lt!386695 lt!386693) lt!386695)))))

(assert (=> d!82990 (= lt!386693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82990 (= lt!386695 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386534)))))))

(assert (=> d!82990 (= lt!386696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386534))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386534)))))))

(assert (=> d!82990 (invariant!0 (currentBit!11833 (_1!11558 lt!386534)) (currentByte!11838 (_1!11558 lt!386534)) (size!5935 (buf!6422 (_1!11558 lt!386534))))))

(assert (=> d!82990 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386534))) (currentByte!11838 (_1!11558 lt!386534)) (currentBit!11833 (_1!11558 lt!386534))) lt!386696)))

(declare-fun b!248140 () Bool)

(declare-fun res!207684 () Bool)

(assert (=> b!248140 (=> (not res!207684) (not e!171926))))

(assert (=> b!248140 (= res!207684 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386696))))

(declare-fun b!248141 () Bool)

(declare-fun lt!386697 () (_ BitVec 64))

(assert (=> b!248141 (= e!171926 (bvsle lt!386696 (bvmul lt!386697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248141 (or (= lt!386697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386697)))))

(assert (=> b!248141 (= lt!386697 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386534)))))))

(assert (= (and d!82990 res!207685) b!248140))

(assert (= (and b!248140 res!207684) b!248141))

(declare-fun m!373991 () Bool)

(assert (=> d!82990 m!373991))

(declare-fun m!373993 () Bool)

(assert (=> d!82990 m!373993))

(assert (=> b!248021 d!82990))

(declare-fun d!82992 () Bool)

(declare-fun res!207688 () Bool)

(declare-fun e!171927 () Bool)

(assert (=> d!82992 (=> (not res!207688) (not e!171927))))

(assert (=> d!82992 (= res!207688 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!82992 (= (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386531)) e!171927)))

(declare-fun b!248142 () Bool)

(declare-fun res!207687 () Bool)

(assert (=> b!248142 (=> (not res!207687) (not e!171927))))

(assert (=> b!248142 (= res!207687 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248143 () Bool)

(declare-fun e!171928 () Bool)

(assert (=> b!248143 (= e!171927 e!171928)))

(declare-fun res!207686 () Bool)

(assert (=> b!248143 (=> res!207686 e!171928)))

(assert (=> b!248143 (= res!207686 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) #b00000000000000000000000000000000))))

(declare-fun b!248144 () Bool)

(assert (=> b!248144 (= e!171928 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (= (and d!82992 res!207688) b!248142))

(assert (= (and b!248142 res!207687) b!248143))

(assert (= (and b!248143 (not res!207686)) b!248144))

(assert (=> b!248142 m!373757))

(assert (=> b!248142 m!373765))

(assert (=> b!248144 m!373757))

(assert (=> b!248144 m!373757))

(declare-fun m!373995 () Bool)

(assert (=> b!248144 m!373995))

(assert (=> b!248025 d!82992))

(declare-fun d!82994 () Bool)

(assert (=> d!82994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21042 () Bool)

(assert (= bs!21042 d!82994))

(declare-fun m!373997 () Bool)

(assert (=> bs!21042 m!373997))

(assert (=> b!248024 d!82994))

(declare-fun d!82996 () Bool)

(declare-fun e!171929 () Bool)

(assert (=> d!82996 e!171929))

(declare-fun res!207690 () Bool)

(assert (=> d!82996 (=> (not res!207690) (not e!171929))))

(declare-fun lt!386702 () (_ BitVec 64))

(declare-fun lt!386700 () (_ BitVec 64))

(declare-fun lt!386698 () (_ BitVec 64))

(assert (=> d!82996 (= res!207690 (= lt!386702 (bvsub lt!386700 lt!386698)))))

(assert (=> d!82996 (or (= (bvand lt!386700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386700 lt!386698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82996 (= lt!386698 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))))))

(declare-fun lt!386701 () (_ BitVec 64))

(declare-fun lt!386699 () (_ BitVec 64))

(assert (=> d!82996 (= lt!386700 (bvmul lt!386701 lt!386699))))

(assert (=> d!82996 (or (= lt!386701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386699 (bvsdiv (bvmul lt!386701 lt!386699) lt!386701)))))

(assert (=> d!82996 (= lt!386699 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82996 (= lt!386701 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (=> d!82996 (= lt!386702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (=> d!82996 (invariant!0 (currentBit!11833 (_2!11559 lt!386539)) (currentByte!11838 (_2!11559 lt!386539)) (size!5935 (buf!6422 (_2!11559 lt!386539))))))

(assert (=> d!82996 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) lt!386702)))

(declare-fun b!248145 () Bool)

(declare-fun res!207689 () Bool)

(assert (=> b!248145 (=> (not res!207689) (not e!171929))))

(assert (=> b!248145 (= res!207689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386702))))

(declare-fun b!248146 () Bool)

(declare-fun lt!386703 () (_ BitVec 64))

(assert (=> b!248146 (= e!171929 (bvsle lt!386702 (bvmul lt!386703 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248146 (or (= lt!386703 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386703 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386703)))))

(assert (=> b!248146 (= lt!386703 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (= (and d!82996 res!207690) b!248145))

(assert (= (and b!248145 res!207689) b!248146))

(declare-fun m!373999 () Bool)

(assert (=> d!82996 m!373999))

(assert (=> d!82996 m!373989))

(assert (=> b!248023 d!82996))

(declare-fun d!82998 () Bool)

(declare-fun e!171930 () Bool)

(assert (=> d!82998 e!171930))

(declare-fun res!207692 () Bool)

(assert (=> d!82998 (=> (not res!207692) (not e!171930))))

(declare-fun lt!386708 () (_ BitVec 64))

(declare-fun lt!386706 () (_ BitVec 64))

(declare-fun lt!386704 () (_ BitVec 64))

(assert (=> d!82998 (= res!207692 (= lt!386708 (bvsub lt!386706 lt!386704)))))

(assert (=> d!82998 (or (= (bvand lt!386706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386706 lt!386704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82998 (= lt!386704 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))))))

(declare-fun lt!386707 () (_ BitVec 64))

(declare-fun lt!386705 () (_ BitVec 64))

(assert (=> d!82998 (= lt!386706 (bvmul lt!386707 lt!386705))))

(assert (=> d!82998 (or (= lt!386707 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386705 (bvsdiv (bvmul lt!386707 lt!386705) lt!386707)))))

(assert (=> d!82998 (= lt!386705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82998 (= lt!386707 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))))))

(assert (=> d!82998 (= lt!386708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 thiss!1005))))))

(assert (=> d!82998 (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 thiss!1005)))))

(assert (=> d!82998 (= (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) lt!386708)))

(declare-fun b!248147 () Bool)

(declare-fun res!207691 () Bool)

(assert (=> b!248147 (=> (not res!207691) (not e!171930))))

(assert (=> b!248147 (= res!207691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386708))))

(declare-fun b!248148 () Bool)

(declare-fun lt!386709 () (_ BitVec 64))

(assert (=> b!248148 (= e!171930 (bvsle lt!386708 (bvmul lt!386709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248148 (or (= lt!386709 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386709 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386709)))))

(assert (=> b!248148 (= lt!386709 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))))))

(assert (= (and d!82998 res!207692) b!248147))

(assert (= (and b!248147 res!207691) b!248148))

(assert (=> d!82998 m!373997))

(declare-fun m!374001 () Bool)

(assert (=> d!82998 m!374001))

(assert (=> b!248023 d!82998))

(declare-fun d!83000 () Bool)

(declare-fun e!171931 () Bool)

(assert (=> d!83000 e!171931))

(declare-fun res!207694 () Bool)

(assert (=> d!83000 (=> (not res!207694) (not e!171931))))

(declare-fun lt!386712 () (_ BitVec 64))

(declare-fun lt!386710 () (_ BitVec 64))

(declare-fun lt!386714 () (_ BitVec 64))

(assert (=> d!83000 (= res!207694 (= lt!386714 (bvsub lt!386712 lt!386710)))))

(assert (=> d!83000 (or (= (bvand lt!386712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386712 lt!386710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83000 (= lt!386710 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386531))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun lt!386713 () (_ BitVec 64))

(declare-fun lt!386711 () (_ BitVec 64))

(assert (=> d!83000 (= lt!386712 (bvmul lt!386713 lt!386711))))

(assert (=> d!83000 (or (= lt!386713 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386711 (bvsdiv (bvmul lt!386713 lt!386711) lt!386713)))))

(assert (=> d!83000 (= lt!386711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83000 (= lt!386713 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83000 (= lt!386714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386531))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386531)))))))

(assert (=> d!83000 (invariant!0 (currentBit!11833 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386531)) (size!5935 (buf!6422 (_2!11559 lt!386531))))))

(assert (=> d!83000 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531))) lt!386714)))

(declare-fun b!248149 () Bool)

(declare-fun res!207693 () Bool)

(assert (=> b!248149 (=> (not res!207693) (not e!171931))))

(assert (=> b!248149 (= res!207693 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386714))))

(declare-fun b!248150 () Bool)

(declare-fun lt!386715 () (_ BitVec 64))

(assert (=> b!248150 (= e!171931 (bvsle lt!386714 (bvmul lt!386715 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248150 (or (= lt!386715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386715)))))

(assert (=> b!248150 (= lt!386715 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (= (and d!83000 res!207694) b!248149))

(assert (= (and b!248149 res!207693) b!248150))

(declare-fun m!374003 () Bool)

(assert (=> d!83000 m!374003))

(declare-fun m!374005 () Bool)

(assert (=> d!83000 m!374005))

(assert (=> b!248017 d!83000))

(assert (=> b!248017 d!82996))

(declare-fun d!83002 () Bool)

(assert (=> d!83002 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 thiss!1005))))))

(declare-fun bs!21043 () Bool)

(assert (= bs!21043 d!83002))

(assert (=> bs!21043 m!374001))

(assert (=> start!53412 d!83002))

(declare-fun d!83004 () Bool)

(declare-fun lt!386718 () tuple2!21288)

(declare-fun checkBitsLoop!0 (BitStream!10792 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21288)

(assert (=> d!83004 (= lt!386718 (checkBitsLoop!0 (_1!11557 lt!386524) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83004 (= (checkBitsLoopPure!0 (_1!11557 lt!386524) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21273 (_2!11566 lt!386718) (_1!11566 lt!386718)))))

(declare-fun bs!21044 () Bool)

(assert (= bs!21044 d!83004))

(declare-fun m!374007 () Bool)

(assert (=> bs!21044 m!374007))

(assert (=> b!248027 d!83004))

(declare-fun d!83006 () Bool)

(assert (=> d!83006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386538) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) lt!386538))))

(declare-fun bs!21045 () Bool)

(assert (= bs!21045 d!83006))

(declare-fun m!374009 () Bool)

(assert (=> bs!21045 m!374009))

(assert (=> b!248027 d!83006))

(declare-fun d!83008 () Bool)

(assert (=> d!83008 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386538)))

(declare-fun lt!386721 () Unit!17991)

(declare-fun choose!9 (BitStream!10792 array!13537 (_ BitVec 64) BitStream!10792) Unit!17991)

(assert (=> d!83008 (= lt!386721 (choose!9 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386538 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (=> d!83008 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386538) lt!386721)))

(declare-fun bs!21046 () Bool)

(assert (= bs!21046 d!83008))

(assert (=> bs!21046 m!373773))

(declare-fun m!374011 () Bool)

(assert (=> bs!21046 m!374011))

(assert (=> b!248027 d!83008))

(declare-fun b!248161 () Bool)

(declare-fun res!207703 () Bool)

(declare-fun e!171937 () Bool)

(assert (=> b!248161 (=> (not res!207703) (not e!171937))))

(declare-fun lt!386770 () tuple2!21270)

(assert (=> b!248161 (= res!207703 (isPrefixOf!0 (_2!11557 lt!386770) (_2!11559 lt!386531)))))

(declare-fun lt!386764 () (_ BitVec 64))

(declare-fun lt!386779 () (_ BitVec 64))

(declare-fun b!248162 () Bool)

(assert (=> b!248162 (= e!171937 (= (_1!11557 lt!386770) (withMovedBitIndex!0 (_2!11557 lt!386770) (bvsub lt!386764 lt!386779))))))

(assert (=> b!248162 (or (= (bvand lt!386764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386764 lt!386779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248162 (= lt!386779 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531))))))

(assert (=> b!248162 (= lt!386764 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(declare-fun b!248163 () Bool)

(declare-fun e!171936 () Unit!17991)

(declare-fun lt!386778 () Unit!17991)

(assert (=> b!248163 (= e!171936 lt!386778)))

(declare-fun lt!386766 () (_ BitVec 64))

(assert (=> b!248163 (= lt!386766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386762 () (_ BitVec 64))

(assert (=> b!248163 (= lt!386762 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13537 array!13537 (_ BitVec 64) (_ BitVec 64)) Unit!17991)

(assert (=> b!248163 (= lt!386778 (arrayBitRangesEqSymmetric!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) lt!386766 lt!386762))))

(assert (=> b!248163 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 (_2!11559 lt!386539)) lt!386766 lt!386762)))

(declare-fun b!248164 () Bool)

(declare-fun Unit!17997 () Unit!17991)

(assert (=> b!248164 (= e!171936 Unit!17997)))

(declare-fun b!248165 () Bool)

(declare-fun res!207701 () Bool)

(assert (=> b!248165 (=> (not res!207701) (not e!171937))))

(assert (=> b!248165 (= res!207701 (isPrefixOf!0 (_1!11557 lt!386770) (_2!11559 lt!386539)))))

(declare-fun d!83010 () Bool)

(assert (=> d!83010 e!171937))

(declare-fun res!207702 () Bool)

(assert (=> d!83010 (=> (not res!207702) (not e!171937))))

(assert (=> d!83010 (= res!207702 (isPrefixOf!0 (_1!11557 lt!386770) (_2!11557 lt!386770)))))

(declare-fun lt!386775 () BitStream!10792)

(assert (=> d!83010 (= lt!386770 (tuple2!21271 lt!386775 (_2!11559 lt!386531)))))

(declare-fun lt!386768 () Unit!17991)

(declare-fun lt!386777 () Unit!17991)

(assert (=> d!83010 (= lt!386768 lt!386777)))

(assert (=> d!83010 (isPrefixOf!0 lt!386775 (_2!11559 lt!386531))))

(assert (=> d!83010 (= lt!386777 (lemmaIsPrefixTransitive!0 lt!386775 (_2!11559 lt!386531) (_2!11559 lt!386531)))))

(declare-fun lt!386767 () Unit!17991)

(declare-fun lt!386776 () Unit!17991)

(assert (=> d!83010 (= lt!386767 lt!386776)))

(assert (=> d!83010 (isPrefixOf!0 lt!386775 (_2!11559 lt!386531))))

(assert (=> d!83010 (= lt!386776 (lemmaIsPrefixTransitive!0 lt!386775 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(declare-fun lt!386765 () Unit!17991)

(assert (=> d!83010 (= lt!386765 e!171936)))

(declare-fun c!11524 () Bool)

(assert (=> d!83010 (= c!11524 (not (= (size!5935 (buf!6422 (_2!11559 lt!386539))) #b00000000000000000000000000000000)))))

(declare-fun lt!386781 () Unit!17991)

(declare-fun lt!386780 () Unit!17991)

(assert (=> d!83010 (= lt!386781 lt!386780)))

(assert (=> d!83010 (isPrefixOf!0 (_2!11559 lt!386531) (_2!11559 lt!386531))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10792) Unit!17991)

(assert (=> d!83010 (= lt!386780 (lemmaIsPrefixRefl!0 (_2!11559 lt!386531)))))

(declare-fun lt!386773 () Unit!17991)

(declare-fun lt!386769 () Unit!17991)

(assert (=> d!83010 (= lt!386773 lt!386769)))

(assert (=> d!83010 (= lt!386769 (lemmaIsPrefixRefl!0 (_2!11559 lt!386531)))))

(declare-fun lt!386771 () Unit!17991)

(declare-fun lt!386763 () Unit!17991)

(assert (=> d!83010 (= lt!386771 lt!386763)))

(assert (=> d!83010 (isPrefixOf!0 lt!386775 lt!386775)))

(assert (=> d!83010 (= lt!386763 (lemmaIsPrefixRefl!0 lt!386775))))

(declare-fun lt!386772 () Unit!17991)

(declare-fun lt!386774 () Unit!17991)

(assert (=> d!83010 (= lt!386772 lt!386774)))

(assert (=> d!83010 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386539))))

(assert (=> d!83010 (= lt!386774 (lemmaIsPrefixRefl!0 (_2!11559 lt!386539)))))

(assert (=> d!83010 (= lt!386775 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(assert (=> d!83010 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386531))))

(assert (=> d!83010 (= (reader!0 (_2!11559 lt!386539) (_2!11559 lt!386531)) lt!386770)))

(assert (= (and d!83010 c!11524) b!248163))

(assert (= (and d!83010 (not c!11524)) b!248164))

(assert (= (and d!83010 res!207702) b!248165))

(assert (= (and b!248165 res!207701) b!248161))

(assert (= (and b!248161 res!207703) b!248162))

(declare-fun m!374013 () Bool)

(assert (=> b!248161 m!374013))

(declare-fun m!374015 () Bool)

(assert (=> b!248165 m!374015))

(declare-fun m!374017 () Bool)

(assert (=> b!248162 m!374017))

(assert (=> b!248162 m!373765))

(assert (=> b!248162 m!373757))

(assert (=> b!248163 m!373757))

(declare-fun m!374019 () Bool)

(assert (=> b!248163 m!374019))

(declare-fun m!374021 () Bool)

(assert (=> b!248163 m!374021))

(declare-fun m!374023 () Bool)

(assert (=> d!83010 m!374023))

(declare-fun m!374025 () Bool)

(assert (=> d!83010 m!374025))

(declare-fun m!374027 () Bool)

(assert (=> d!83010 m!374027))

(declare-fun m!374029 () Bool)

(assert (=> d!83010 m!374029))

(declare-fun m!374031 () Bool)

(assert (=> d!83010 m!374031))

(declare-fun m!374033 () Bool)

(assert (=> d!83010 m!374033))

(declare-fun m!374035 () Bool)

(assert (=> d!83010 m!374035))

(assert (=> d!83010 m!373819))

(declare-fun m!374037 () Bool)

(assert (=> d!83010 m!374037))

(declare-fun m!374039 () Bool)

(assert (=> d!83010 m!374039))

(declare-fun m!374041 () Bool)

(assert (=> d!83010 m!374041))

(assert (=> b!248027 d!83010))

(declare-fun d!83012 () Bool)

(declare-fun lt!386782 () tuple2!21288)

(assert (=> d!83012 (= lt!386782 (readBit!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (=> d!83012 (= (readBitPure!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) (tuple2!21273 (_2!11566 lt!386782) (_1!11566 lt!386782)))))

(declare-fun bs!21047 () Bool)

(assert (= bs!21047 d!83012))

(declare-fun m!374043 () Bool)

(assert (=> bs!21047 m!374043))

(assert (=> b!248016 d!83012))

(declare-fun b!248166 () Bool)

(declare-fun res!207706 () Bool)

(declare-fun e!171939 () Bool)

(assert (=> b!248166 (=> (not res!207706) (not e!171939))))

(declare-fun lt!386791 () tuple2!21270)

(assert (=> b!248166 (= res!207706 (isPrefixOf!0 (_2!11557 lt!386791) (_2!11559 lt!386531)))))

(declare-fun lt!386800 () (_ BitVec 64))

(declare-fun b!248167 () Bool)

(declare-fun lt!386785 () (_ BitVec 64))

(assert (=> b!248167 (= e!171939 (= (_1!11557 lt!386791) (withMovedBitIndex!0 (_2!11557 lt!386791) (bvsub lt!386785 lt!386800))))))

(assert (=> b!248167 (or (= (bvand lt!386785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386785 lt!386800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248167 (= lt!386800 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531))))))

(assert (=> b!248167 (= lt!386785 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun b!248168 () Bool)

(declare-fun e!171938 () Unit!17991)

(declare-fun lt!386799 () Unit!17991)

(assert (=> b!248168 (= e!171938 lt!386799)))

(declare-fun lt!386787 () (_ BitVec 64))

(assert (=> b!248168 (= lt!386787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386783 () (_ BitVec 64))

(assert (=> b!248168 (= lt!386783 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(assert (=> b!248168 (= lt!386799 (arrayBitRangesEqSymmetric!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) lt!386787 lt!386783))))

(assert (=> b!248168 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 thiss!1005) lt!386787 lt!386783)))

(declare-fun b!248169 () Bool)

(declare-fun Unit!17998 () Unit!17991)

(assert (=> b!248169 (= e!171938 Unit!17998)))

(declare-fun b!248170 () Bool)

(declare-fun res!207704 () Bool)

(assert (=> b!248170 (=> (not res!207704) (not e!171939))))

(assert (=> b!248170 (= res!207704 (isPrefixOf!0 (_1!11557 lt!386791) thiss!1005))))

(declare-fun d!83014 () Bool)

(assert (=> d!83014 e!171939))

(declare-fun res!207705 () Bool)

(assert (=> d!83014 (=> (not res!207705) (not e!171939))))

(assert (=> d!83014 (= res!207705 (isPrefixOf!0 (_1!11557 lt!386791) (_2!11557 lt!386791)))))

(declare-fun lt!386796 () BitStream!10792)

(assert (=> d!83014 (= lt!386791 (tuple2!21271 lt!386796 (_2!11559 lt!386531)))))

(declare-fun lt!386789 () Unit!17991)

(declare-fun lt!386798 () Unit!17991)

(assert (=> d!83014 (= lt!386789 lt!386798)))

(assert (=> d!83014 (isPrefixOf!0 lt!386796 (_2!11559 lt!386531))))

(assert (=> d!83014 (= lt!386798 (lemmaIsPrefixTransitive!0 lt!386796 (_2!11559 lt!386531) (_2!11559 lt!386531)))))

(declare-fun lt!386788 () Unit!17991)

(declare-fun lt!386797 () Unit!17991)

(assert (=> d!83014 (= lt!386788 lt!386797)))

(assert (=> d!83014 (isPrefixOf!0 lt!386796 (_2!11559 lt!386531))))

(assert (=> d!83014 (= lt!386797 (lemmaIsPrefixTransitive!0 lt!386796 thiss!1005 (_2!11559 lt!386531)))))

(declare-fun lt!386786 () Unit!17991)

(assert (=> d!83014 (= lt!386786 e!171938)))

(declare-fun c!11525 () Bool)

(assert (=> d!83014 (= c!11525 (not (= (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!386802 () Unit!17991)

(declare-fun lt!386801 () Unit!17991)

(assert (=> d!83014 (= lt!386802 lt!386801)))

(assert (=> d!83014 (isPrefixOf!0 (_2!11559 lt!386531) (_2!11559 lt!386531))))

(assert (=> d!83014 (= lt!386801 (lemmaIsPrefixRefl!0 (_2!11559 lt!386531)))))

(declare-fun lt!386794 () Unit!17991)

(declare-fun lt!386790 () Unit!17991)

(assert (=> d!83014 (= lt!386794 lt!386790)))

(assert (=> d!83014 (= lt!386790 (lemmaIsPrefixRefl!0 (_2!11559 lt!386531)))))

(declare-fun lt!386792 () Unit!17991)

(declare-fun lt!386784 () Unit!17991)

(assert (=> d!83014 (= lt!386792 lt!386784)))

(assert (=> d!83014 (isPrefixOf!0 lt!386796 lt!386796)))

(assert (=> d!83014 (= lt!386784 (lemmaIsPrefixRefl!0 lt!386796))))

(declare-fun lt!386793 () Unit!17991)

(declare-fun lt!386795 () Unit!17991)

(assert (=> d!83014 (= lt!386793 lt!386795)))

(assert (=> d!83014 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!83014 (= lt!386795 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!83014 (= lt!386796 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(assert (=> d!83014 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386531))))

(assert (=> d!83014 (= (reader!0 thiss!1005 (_2!11559 lt!386531)) lt!386791)))

(assert (= (and d!83014 c!11525) b!248168))

(assert (= (and d!83014 (not c!11525)) b!248169))

(assert (= (and d!83014 res!207705) b!248170))

(assert (= (and b!248170 res!207704) b!248166))

(assert (= (and b!248166 res!207706) b!248167))

(declare-fun m!374045 () Bool)

(assert (=> b!248166 m!374045))

(declare-fun m!374047 () Bool)

(assert (=> b!248170 m!374047))

(declare-fun m!374049 () Bool)

(assert (=> b!248167 m!374049))

(assert (=> b!248167 m!373765))

(assert (=> b!248167 m!373759))

(assert (=> b!248168 m!373759))

(declare-fun m!374051 () Bool)

(assert (=> b!248168 m!374051))

(declare-fun m!374053 () Bool)

(assert (=> b!248168 m!374053))

(declare-fun m!374055 () Bool)

(assert (=> d!83014 m!374055))

(declare-fun m!374057 () Bool)

(assert (=> d!83014 m!374057))

(declare-fun m!374059 () Bool)

(assert (=> d!83014 m!374059))

(declare-fun m!374061 () Bool)

(assert (=> d!83014 m!374061))

(declare-fun m!374063 () Bool)

(assert (=> d!83014 m!374063))

(assert (=> d!83014 m!374033))

(declare-fun m!374065 () Bool)

(assert (=> d!83014 m!374065))

(assert (=> d!83014 m!373781))

(assert (=> d!83014 m!374037))

(declare-fun m!374067 () Bool)

(assert (=> d!83014 m!374067))

(declare-fun m!374069 () Bool)

(assert (=> d!83014 m!374069))

(assert (=> b!248016 d!83014))

(declare-fun b!248180 () Bool)

(declare-fun res!207718 () Bool)

(declare-fun e!171945 () Bool)

(assert (=> b!248180 (=> (not res!207718) (not e!171945))))

(declare-fun lt!386814 () (_ BitVec 64))

(declare-fun lt!386813 () tuple2!21274)

(declare-fun lt!386812 () (_ BitVec 64))

(assert (=> b!248180 (= res!207718 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386813))) (currentByte!11838 (_2!11559 lt!386813)) (currentBit!11833 (_2!11559 lt!386813))) (bvadd lt!386812 lt!386814)))))

(assert (=> b!248180 (or (not (= (bvand lt!386812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386814 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!386812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!386812 lt!386814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248180 (= lt!386814 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248180 (= lt!386812 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun b!248182 () Bool)

(declare-fun e!171944 () Bool)

(assert (=> b!248182 (= e!171945 e!171944)))

(declare-fun res!207715 () Bool)

(assert (=> b!248182 (=> (not res!207715) (not e!171944))))

(declare-fun lt!386811 () tuple2!21272)

(assert (=> b!248182 (= res!207715 (and (= (_2!11558 lt!386811) bit!26) (= (_1!11558 lt!386811) (_2!11559 lt!386813))))))

(assert (=> b!248182 (= lt!386811 (readBitPure!0 (readerFrom!0 (_2!11559 lt!386813) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))

(declare-fun d!83016 () Bool)

(assert (=> d!83016 e!171945))

(declare-fun res!207716 () Bool)

(assert (=> d!83016 (=> (not res!207716) (not e!171945))))

(assert (=> d!83016 (= res!207716 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(declare-fun choose!16 (BitStream!10792 Bool) tuple2!21274)

(assert (=> d!83016 (= lt!386813 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!83016 (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)))))

(assert (=> d!83016 (= (appendBit!0 thiss!1005 bit!26) lt!386813)))

(declare-fun b!248183 () Bool)

(assert (=> b!248183 (= e!171944 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386811))) (currentByte!11838 (_1!11558 lt!386811)) (currentBit!11833 (_1!11558 lt!386811))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386813))) (currentByte!11838 (_2!11559 lt!386813)) (currentBit!11833 (_2!11559 lt!386813)))))))

(declare-fun b!248181 () Bool)

(declare-fun res!207717 () Bool)

(assert (=> b!248181 (=> (not res!207717) (not e!171945))))

(assert (=> b!248181 (= res!207717 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386813)))))

(assert (= (and d!83016 res!207716) b!248180))

(assert (= (and b!248180 res!207718) b!248181))

(assert (= (and b!248181 res!207717) b!248182))

(assert (= (and b!248182 res!207715) b!248183))

(declare-fun m!374071 () Bool)

(assert (=> d!83016 m!374071))

(declare-fun m!374073 () Bool)

(assert (=> d!83016 m!374073))

(declare-fun m!374075 () Bool)

(assert (=> b!248182 m!374075))

(assert (=> b!248182 m!374075))

(declare-fun m!374077 () Bool)

(assert (=> b!248182 m!374077))

(declare-fun m!374079 () Bool)

(assert (=> b!248181 m!374079))

(declare-fun m!374081 () Bool)

(assert (=> b!248183 m!374081))

(declare-fun m!374083 () Bool)

(assert (=> b!248183 m!374083))

(assert (=> b!248180 m!374083))

(assert (=> b!248180 m!373759))

(assert (=> b!248016 d!83016))

(declare-fun d!83018 () Bool)

(assert (=> d!83018 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386531))))

(declare-fun lt!386817 () Unit!17991)

(declare-fun choose!30 (BitStream!10792 BitStream!10792 BitStream!10792) Unit!17991)

(assert (=> d!83018 (= lt!386817 (choose!30 thiss!1005 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(assert (=> d!83018 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386539))))

(assert (=> d!83018 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11559 lt!386539) (_2!11559 lt!386531)) lt!386817)))

(declare-fun bs!21048 () Bool)

(assert (= bs!21048 d!83018))

(assert (=> bs!21048 m!373781))

(declare-fun m!374085 () Bool)

(assert (=> bs!21048 m!374085))

(assert (=> bs!21048 m!373767))

(assert (=> b!248016 d!83018))

(declare-fun lt!386818 () tuple2!21288)

(declare-fun d!83020 () Bool)

(assert (=> d!83020 (= lt!386818 (checkBitsLoop!0 (_1!11557 lt!386542) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83020 (= (checkBitsLoopPure!0 (_1!11557 lt!386542) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21273 (_2!11566 lt!386818) (_1!11566 lt!386818)))))

(declare-fun bs!21049 () Bool)

(assert (= bs!21049 d!83020))

(declare-fun m!374087 () Bool)

(assert (=> bs!21049 m!374087))

(assert (=> b!248016 d!83020))

(declare-fun d!83022 () Bool)

(assert (=> d!83022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21050 () Bool)

(assert (= bs!21050 d!83022))

(declare-fun m!374089 () Bool)

(assert (=> bs!21050 m!374089))

(assert (=> b!248016 d!83022))

(declare-fun d!83024 () Bool)

(declare-fun lt!386819 () tuple2!21288)

(assert (=> d!83024 (= lt!386819 (checkBitsLoop!0 (_1!11557 lt!386544) nBits!297 bit!26 from!289))))

(assert (=> d!83024 (= (checkBitsLoopPure!0 (_1!11557 lt!386544) nBits!297 bit!26 from!289) (tuple2!21273 (_2!11566 lt!386819) (_1!11566 lt!386819)))))

(declare-fun bs!21051 () Bool)

(assert (= bs!21051 d!83024))

(declare-fun m!374091 () Bool)

(assert (=> bs!21051 m!374091))

(assert (=> b!248016 d!83024))

(declare-fun d!83026 () Bool)

(declare-fun e!171946 () Bool)

(assert (=> d!83026 e!171946))

(declare-fun res!207720 () Bool)

(assert (=> d!83026 (=> (not res!207720) (not e!171946))))

(declare-fun lt!386824 () (_ BitVec 64))

(declare-fun lt!386822 () (_ BitVec 64))

(declare-fun lt!386820 () (_ BitVec 64))

(assert (=> d!83026 (= res!207720 (= lt!386824 (bvsub lt!386822 lt!386820)))))

(assert (=> d!83026 (or (= (bvand lt!386822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386822 lt!386820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83026 (= lt!386820 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386529)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386529))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386529)))))))

(declare-fun lt!386823 () (_ BitVec 64))

(declare-fun lt!386821 () (_ BitVec 64))

(assert (=> d!83026 (= lt!386822 (bvmul lt!386823 lt!386821))))

(assert (=> d!83026 (or (= lt!386823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386821 (bvsdiv (bvmul lt!386823 lt!386821) lt!386823)))))

(assert (=> d!83026 (= lt!386821 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83026 (= lt!386823 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386529)))))))

(assert (=> d!83026 (= lt!386824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386529)))))))

(assert (=> d!83026 (invariant!0 (currentBit!11833 (_1!11558 lt!386529)) (currentByte!11838 (_1!11558 lt!386529)) (size!5935 (buf!6422 (_1!11558 lt!386529))))))

(assert (=> d!83026 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386529))) (currentByte!11838 (_1!11558 lt!386529)) (currentBit!11833 (_1!11558 lt!386529))) lt!386824)))

(declare-fun b!248184 () Bool)

(declare-fun res!207719 () Bool)

(assert (=> b!248184 (=> (not res!207719) (not e!171946))))

(assert (=> b!248184 (= res!207719 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386824))))

(declare-fun b!248185 () Bool)

(declare-fun lt!386825 () (_ BitVec 64))

(assert (=> b!248185 (= e!171946 (bvsle lt!386824 (bvmul lt!386825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248185 (or (= lt!386825 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386825 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386825)))))

(assert (=> b!248185 (= lt!386825 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386529)))))))

(assert (= (and d!83026 res!207720) b!248184))

(assert (= (and b!248184 res!207719) b!248185))

(declare-fun m!374093 () Bool)

(assert (=> d!83026 m!374093))

(declare-fun m!374095 () Bool)

(assert (=> d!83026 m!374095))

(assert (=> b!248016 d!83026))

(declare-fun d!83028 () Bool)

(declare-fun lt!386826 () tuple2!21288)

(assert (=> d!83028 (= lt!386826 (readBit!0 (_1!11557 lt!386544)))))

(assert (=> d!83028 (= (readBitPure!0 (_1!11557 lt!386544)) (tuple2!21273 (_2!11566 lt!386826) (_1!11566 lt!386826)))))

(declare-fun bs!21052 () Bool)

(assert (= bs!21052 d!83028))

(declare-fun m!374097 () Bool)

(assert (=> bs!21052 m!374097))

(assert (=> b!248016 d!83028))

(declare-fun d!83030 () Bool)

(declare-fun e!171947 () Bool)

(assert (=> d!83030 e!171947))

(declare-fun res!207722 () Bool)

(assert (=> d!83030 (=> (not res!207722) (not e!171947))))

(declare-fun lt!386831 () (_ BitVec 64))

(declare-fun lt!386827 () (_ BitVec 64))

(declare-fun lt!386829 () (_ BitVec 64))

(assert (=> d!83030 (= res!207722 (= lt!386831 (bvsub lt!386829 lt!386827)))))

(assert (=> d!83030 (or (= (bvand lt!386829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386829 lt!386827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83030 (= lt!386827 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386536)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386536))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386536)))))))

(declare-fun lt!386830 () (_ BitVec 64))

(declare-fun lt!386828 () (_ BitVec 64))

(assert (=> d!83030 (= lt!386829 (bvmul lt!386830 lt!386828))))

(assert (=> d!83030 (or (= lt!386830 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386828 (bvsdiv (bvmul lt!386830 lt!386828) lt!386830)))))

(assert (=> d!83030 (= lt!386828 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83030 (= lt!386830 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386536)))))))

(assert (=> d!83030 (= lt!386831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386536)))))))

(assert (=> d!83030 (invariant!0 (currentBit!11833 (_1!11558 lt!386536)) (currentByte!11838 (_1!11558 lt!386536)) (size!5935 (buf!6422 (_1!11558 lt!386536))))))

(assert (=> d!83030 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386536))) (currentByte!11838 (_1!11558 lt!386536)) (currentBit!11833 (_1!11558 lt!386536))) lt!386831)))

(declare-fun b!248186 () Bool)

(declare-fun res!207721 () Bool)

(assert (=> b!248186 (=> (not res!207721) (not e!171947))))

(assert (=> b!248186 (= res!207721 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386831))))

(declare-fun b!248187 () Bool)

(declare-fun lt!386832 () (_ BitVec 64))

(assert (=> b!248187 (= e!171947 (bvsle lt!386831 (bvmul lt!386832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248187 (or (= lt!386832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386832)))))

(assert (=> b!248187 (= lt!386832 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386536)))))))

(assert (= (and d!83030 res!207722) b!248186))

(assert (= (and b!248186 res!207721) b!248187))

(declare-fun m!374099 () Bool)

(assert (=> d!83030 m!374099))

(declare-fun m!374101 () Bool)

(assert (=> d!83030 m!374101))

(assert (=> b!248016 d!83030))

(declare-fun d!83032 () Bool)

(declare-fun e!171953 () Bool)

(assert (=> d!83032 e!171953))

(declare-fun res!207734 () Bool)

(assert (=> d!83032 (=> (not res!207734) (not e!171953))))

(declare-fun lt!386862 () tuple2!21274)

(assert (=> d!83032 (= res!207734 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386862)))))))

(declare-fun choose!51 (BitStream!10792 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21274)

(assert (=> d!83032 (= lt!386862 (choose!51 (_2!11559 lt!386539) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83032 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83032 (= (appendNBitsLoop!0 (_2!11559 lt!386539) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!386862)))

(declare-fun b!248198 () Bool)

(declare-fun lt!386857 () tuple2!21272)

(declare-fun lt!386861 () tuple2!21270)

(assert (=> b!248198 (= e!171953 (and (_2!11558 lt!386857) (= (_1!11558 lt!386857) (_2!11557 lt!386861))))))

(assert (=> b!248198 (= lt!386857 (checkBitsLoopPure!0 (_1!11557 lt!386861) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!386860 () Unit!17991)

(declare-fun lt!386856 () Unit!17991)

(assert (=> b!248198 (= lt!386860 lt!386856)))

(declare-fun lt!386855 () (_ BitVec 64))

(assert (=> b!248198 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386855)))

(assert (=> b!248198 (= lt!386856 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386862)) lt!386855))))

(declare-fun e!171952 () Bool)

(assert (=> b!248198 e!171952))

(declare-fun res!207731 () Bool)

(assert (=> b!248198 (=> (not res!207731) (not e!171952))))

(assert (=> b!248198 (= res!207731 (and (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386862)))) (bvsge lt!386855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248198 (= lt!386855 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248198 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248198 (= lt!386861 (reader!0 (_2!11559 lt!386539) (_2!11559 lt!386862)))))

(declare-fun b!248199 () Bool)

(assert (=> b!248199 (= e!171952 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386855))))

(declare-fun b!248196 () Bool)

(declare-fun res!207733 () Bool)

(assert (=> b!248196 (=> (not res!207733) (not e!171953))))

(declare-fun lt!386858 () (_ BitVec 64))

(declare-fun lt!386859 () (_ BitVec 64))

(assert (=> b!248196 (= res!207733 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386862))) (currentByte!11838 (_2!11559 lt!386862)) (currentBit!11833 (_2!11559 lt!386862))) (bvadd lt!386859 lt!386858)))))

(assert (=> b!248196 (or (not (= (bvand lt!386859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386858 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!386859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!386859 lt!386858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248196 (= lt!386858 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248196 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248196 (= lt!386859 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(declare-fun b!248197 () Bool)

(declare-fun res!207732 () Bool)

(assert (=> b!248197 (=> (not res!207732) (not e!171953))))

(assert (=> b!248197 (= res!207732 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386862)))))

(assert (= (and d!83032 res!207734) b!248196))

(assert (= (and b!248196 res!207733) b!248197))

(assert (= (and b!248197 res!207732) b!248198))

(assert (= (and b!248198 res!207731) b!248199))

(declare-fun m!374111 () Bool)

(assert (=> b!248198 m!374111))

(declare-fun m!374113 () Bool)

(assert (=> b!248198 m!374113))

(declare-fun m!374115 () Bool)

(assert (=> b!248198 m!374115))

(declare-fun m!374117 () Bool)

(assert (=> b!248198 m!374117))

(declare-fun m!374119 () Bool)

(assert (=> b!248199 m!374119))

(declare-fun m!374121 () Bool)

(assert (=> b!248197 m!374121))

(declare-fun m!374123 () Bool)

(assert (=> b!248196 m!374123))

(assert (=> b!248196 m!373757))

(declare-fun m!374125 () Bool)

(assert (=> d!83032 m!374125))

(assert (=> b!248016 d!83032))

(declare-fun d!83044 () Bool)

(declare-fun e!171956 () Bool)

(assert (=> d!83044 e!171956))

(declare-fun res!207737 () Bool)

(assert (=> d!83044 (=> (not res!207737) (not e!171956))))

(assert (=> d!83044 (= res!207737 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!386865 () Unit!17991)

(declare-fun choose!27 (BitStream!10792 BitStream!10792 (_ BitVec 64) (_ BitVec 64)) Unit!17991)

(assert (=> d!83044 (= lt!386865 (choose!27 thiss!1005 (_2!11559 lt!386539) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83044 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83044 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11559 lt!386539) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!386865)))

(declare-fun b!248202 () Bool)

(assert (=> b!248202 (= e!171956 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83044 res!207737) b!248202))

(declare-fun m!374127 () Bool)

(assert (=> d!83044 m!374127))

(declare-fun m!374129 () Bool)

(assert (=> b!248202 m!374129))

(assert (=> b!248016 d!83044))

(declare-fun d!83046 () Bool)

(assert (=> d!83046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) lt!386530))))

(declare-fun bs!21057 () Bool)

(assert (= bs!21057 d!83046))

(assert (=> bs!21057 m!374009))

(assert (=> b!248016 d!83046))

(declare-fun d!83048 () Bool)

(assert (=> d!83048 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) lt!386530))))

(declare-fun bs!21058 () Bool)

(assert (= bs!21058 d!83048))

(assert (=> bs!21058 m!373999))

(assert (=> b!248016 d!83048))

(declare-fun d!83050 () Bool)

(declare-fun lt!386866 () tuple2!21288)

(assert (=> d!83050 (= lt!386866 (readBit!0 lt!386526))))

(assert (=> d!83050 (= (readBitPure!0 lt!386526) (tuple2!21273 (_2!11566 lt!386866) (_1!11566 lt!386866)))))

(declare-fun bs!21059 () Bool)

(assert (= bs!21059 d!83050))

(declare-fun m!374131 () Bool)

(assert (=> bs!21059 m!374131))

(assert (=> b!248016 d!83050))

(declare-fun d!83052 () Bool)

(assert (=> d!83052 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386867 () Unit!17991)

(assert (=> d!83052 (= lt!386867 (choose!9 thiss!1005 (buf!6422 (_2!11559 lt!386531)) (bvsub nBits!297 from!289) (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (=> d!83052 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6422 (_2!11559 lt!386531)) (bvsub nBits!297 from!289)) lt!386867)))

(declare-fun bs!21060 () Bool)

(assert (= bs!21060 d!83052))

(assert (=> bs!21060 m!373791))

(declare-fun m!374133 () Bool)

(assert (=> bs!21060 m!374133))

(assert (=> b!248016 d!83052))

(declare-fun d!83054 () Bool)

(declare-fun res!207740 () Bool)

(declare-fun e!171957 () Bool)

(assert (=> d!83054 (=> (not res!207740) (not e!171957))))

(assert (=> d!83054 (= res!207740 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83054 (= (isPrefixOf!0 thiss!1005 (_2!11559 lt!386531)) e!171957)))

(declare-fun b!248203 () Bool)

(declare-fun res!207739 () Bool)

(assert (=> b!248203 (=> (not res!207739) (not e!171957))))

(assert (=> b!248203 (= res!207739 (bvsle (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248204 () Bool)

(declare-fun e!171958 () Bool)

(assert (=> b!248204 (= e!171957 e!171958)))

(declare-fun res!207738 () Bool)

(assert (=> b!248204 (=> res!207738 e!171958)))

(assert (=> b!248204 (= res!207738 (= (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248205 () Bool)

(assert (=> b!248205 (= e!171958 (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (= (and d!83054 res!207740) b!248203))

(assert (= (and b!248203 res!207739) b!248204))

(assert (= (and b!248204 (not res!207738)) b!248205))

(assert (=> b!248203 m!373759))

(assert (=> b!248203 m!373765))

(assert (=> b!248205 m!373759))

(assert (=> b!248205 m!373759))

(declare-fun m!374135 () Bool)

(assert (=> b!248205 m!374135))

(assert (=> b!248016 d!83054))

(declare-fun d!83056 () Bool)

(declare-fun e!171961 () Bool)

(assert (=> d!83056 e!171961))

(declare-fun res!207743 () Bool)

(assert (=> d!83056 (=> (not res!207743) (not e!171961))))

(declare-fun lt!386876 () tuple2!21272)

(declare-fun lt!386877 () tuple2!21272)

(assert (=> d!83056 (= res!207743 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386876))) (currentByte!11838 (_1!11558 lt!386876)) (currentBit!11833 (_1!11558 lt!386876))) (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386877))) (currentByte!11838 (_1!11558 lt!386877)) (currentBit!11833 (_1!11558 lt!386877)))))))

(declare-fun lt!386878 () Unit!17991)

(declare-fun lt!386879 () BitStream!10792)

(declare-fun choose!50 (BitStream!10792 BitStream!10792 BitStream!10792 tuple2!21272 tuple2!21272 BitStream!10792 Bool tuple2!21272 tuple2!21272 BitStream!10792 Bool) Unit!17991)

(assert (=> d!83056 (= lt!386878 (choose!50 lt!386526 (_2!11559 lt!386531) lt!386879 lt!386876 (tuple2!21273 (_1!11558 lt!386876) (_2!11558 lt!386876)) (_1!11558 lt!386876) (_2!11558 lt!386876) lt!386877 (tuple2!21273 (_1!11558 lt!386877) (_2!11558 lt!386877)) (_1!11558 lt!386877) (_2!11558 lt!386877)))))

(assert (=> d!83056 (= lt!386877 (readBitPure!0 lt!386879))))

(assert (=> d!83056 (= lt!386876 (readBitPure!0 lt!386526))))

(assert (=> d!83056 (= lt!386879 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 lt!386526) (currentBit!11833 lt!386526)))))

(assert (=> d!83056 (invariant!0 (currentBit!11833 lt!386526) (currentByte!11838 lt!386526) (size!5935 (buf!6422 (_2!11559 lt!386531))))))

(assert (=> d!83056 (= (readBitPrefixLemma!0 lt!386526 (_2!11559 lt!386531)) lt!386878)))

(declare-fun b!248208 () Bool)

(assert (=> b!248208 (= e!171961 (= (_2!11558 lt!386876) (_2!11558 lt!386877)))))

(assert (= (and d!83056 res!207743) b!248208))

(declare-fun m!374137 () Bool)

(assert (=> d!83056 m!374137))

(declare-fun m!374139 () Bool)

(assert (=> d!83056 m!374139))

(declare-fun m!374141 () Bool)

(assert (=> d!83056 m!374141))

(assert (=> d!83056 m!373785))

(declare-fun m!374143 () Bool)

(assert (=> d!83056 m!374143))

(declare-fun m!374145 () Bool)

(assert (=> d!83056 m!374145))

(assert (=> b!248016 d!83056))

(declare-fun d!83058 () Bool)

(assert (=> d!83058 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530)))

(declare-fun lt!386880 () Unit!17991)

(assert (=> d!83058 (= lt!386880 (choose!9 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386530 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (=> d!83058 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386530) lt!386880)))

(declare-fun bs!21061 () Bool)

(assert (= bs!21061 d!83058))

(assert (=> bs!21061 m!373813))

(declare-fun m!374147 () Bool)

(assert (=> bs!21061 m!374147))

(assert (=> b!248016 d!83058))

(assert (=> b!248016 d!83010))

(declare-fun d!83060 () Bool)

(assert (=> d!83060 (= (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386539)))) (and (bvsge (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11833 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11838 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386539)))) (and (= (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386539))))))))))

(assert (=> b!248026 d!83060))

(push 1)

(assert (not b!248166))

(assert (not b!248162))

(assert (not b!248202))

(assert (not b!248199))

(assert (not d!83058))

(assert (not b!248181))

(assert (not d!83002))

(assert (not d!83044))

(assert (not d!82994))

(assert (not d!83022))

(assert (not d!83018))

(assert (not b!248144))

(assert (not d!83012))

(assert (not d!83026))

(assert (not d!83048))

(assert (not d!83010))

(assert (not d!83046))

(assert (not d!83024))

(assert (not b!248197))

(assert (not d!83008))

(assert (not d!82986))

(assert (not d!83032))

(assert (not d!83014))

(assert (not b!248170))

(assert (not b!248205))

(assert (not b!248203))

(assert (not d!82988))

(assert (not b!248180))

(assert (not b!248168))

(assert (not d!83004))

(assert (not d!82998))

(assert (not d!82978))

(assert (not b!248161))

(assert (not d!83006))

(assert (not d!83030))

(assert (not d!83056))

(assert (not b!248132))

(assert (not d!82996))

(assert (not b!248135))

(assert (not b!248163))

(assert (not d!83052))

(assert (not b!248167))

(assert (not d!83028))

(assert (not d!83050))

(assert (not b!248142))

(assert (not b!248182))

(assert (not b!248183))

(assert (not b!248165))

(assert (not d!83020))

(assert (not b!248196))

(assert (not d!82990))

(assert (not b!248130))

(assert (not b!248198))

(assert (not d!83016))

(assert (not d!83000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83532 () Bool)

(assert (=> d!83532 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 thiss!1005)))))))

(assert (=> d!82998 d!83532))

(declare-fun d!83534 () Bool)

(assert (=> d!83534 (= (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 thiss!1005))) (and (bvsge (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11833 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11838 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 thiss!1005) (size!5935 (buf!6422 thiss!1005))) (and (= (currentBit!11833 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11838 thiss!1005) (size!5935 (buf!6422 thiss!1005)))))))))

(assert (=> d!82998 d!83534))

(assert (=> b!248135 d!83060))

(declare-fun d!83536 () Bool)

(declare-fun e!172366 () Bool)

(assert (=> d!83536 e!172366))

(declare-fun res!208232 () Bool)

(assert (=> d!83536 (=> (not res!208232) (not e!172366))))

(declare-fun lt!387786 () (_ BitVec 64))

(declare-fun lt!387785 () BitStream!10792)

(assert (=> d!83536 (= res!208232 (= (bvadd lt!387786 (bvsub lt!386785 lt!386800)) (bitIndex!0 (size!5935 (buf!6422 lt!387785)) (currentByte!11838 lt!387785) (currentBit!11833 lt!387785))))))

(assert (=> d!83536 (or (not (= (bvand lt!387786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386785 lt!386800) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387786 (bvsub lt!386785 lt!386800)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83536 (= lt!387786 (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386791))) (currentByte!11838 (_2!11557 lt!386791)) (currentBit!11833 (_2!11557 lt!386791))))))

(assert (=> d!83536 (= lt!387785 (_2!11559 (moveBitIndex!0 (_2!11557 lt!386791) (bvsub lt!386785 lt!386800))))))

(assert (=> d!83536 (moveBitIndexPrecond!0 (_2!11557 lt!386791) (bvsub lt!386785 lt!386800))))

(assert (=> d!83536 (= (withMovedBitIndex!0 (_2!11557 lt!386791) (bvsub lt!386785 lt!386800)) lt!387785)))

(declare-fun b!248801 () Bool)

(assert (=> b!248801 (= e!172366 (= (size!5935 (buf!6422 (_2!11557 lt!386791))) (size!5935 (buf!6422 lt!387785))))))

(assert (= (and d!83536 res!208232) b!248801))

(declare-fun m!375157 () Bool)

(assert (=> d!83536 m!375157))

(declare-fun m!375159 () Bool)

(assert (=> d!83536 m!375159))

(declare-fun m!375161 () Bool)

(assert (=> d!83536 m!375161))

(declare-fun m!375163 () Bool)

(assert (=> d!83536 m!375163))

(assert (=> b!248167 d!83536))

(assert (=> b!248167 d!83000))

(assert (=> b!248167 d!82998))

(declare-fun d!83538 () Bool)

(assert (=> d!83538 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386534)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386534))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386534)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386534)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386534))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386534))))))))

(assert (=> d!82990 d!83538))

(declare-fun d!83540 () Bool)

(assert (=> d!83540 (= (invariant!0 (currentBit!11833 (_1!11558 lt!386534)) (currentByte!11838 (_1!11558 lt!386534)) (size!5935 (buf!6422 (_1!11558 lt!386534)))) (and (bvsge (currentBit!11833 (_1!11558 lt!386534)) #b00000000000000000000000000000000) (bvslt (currentBit!11833 (_1!11558 lt!386534)) #b00000000000000000000000000001000) (bvsge (currentByte!11838 (_1!11558 lt!386534)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 (_1!11558 lt!386534)) (size!5935 (buf!6422 (_1!11558 lt!386534)))) (and (= (currentBit!11833 (_1!11558 lt!386534)) #b00000000000000000000000000000000) (= (currentByte!11838 (_1!11558 lt!386534)) (size!5935 (buf!6422 (_1!11558 lt!386534))))))))))

(assert (=> d!82990 d!83540))

(assert (=> d!83052 d!83022))

(declare-fun d!83542 () Bool)

(assert (=> d!83542 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!83542 true))

(declare-fun _$6!412 () Unit!17991)

(assert (=> d!83542 (= (choose!9 thiss!1005 (buf!6422 (_2!11559 lt!386531)) (bvsub nBits!297 from!289) (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) _$6!412)))

(declare-fun bs!21142 () Bool)

(assert (= bs!21142 d!83542))

(assert (=> bs!21142 m!373791))

(assert (=> d!83052 d!83542))

(declare-fun d!83544 () Bool)

(assert (=> d!83544 (= (invariant!0 (currentBit!11833 (_2!11559 lt!386539)) (currentByte!11838 (_2!11559 lt!386539)) (size!5935 (buf!6422 (_2!11559 lt!386539)))) (and (bvsge (currentBit!11833 (_2!11559 lt!386539)) #b00000000000000000000000000000000) (bvslt (currentBit!11833 (_2!11559 lt!386539)) #b00000000000000000000000000001000) (bvsge (currentByte!11838 (_2!11559 lt!386539)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 (_2!11559 lt!386539)) (size!5935 (buf!6422 (_2!11559 lt!386539)))) (and (= (currentBit!11833 (_2!11559 lt!386539)) #b00000000000000000000000000000000) (= (currentByte!11838 (_2!11559 lt!386539)) (size!5935 (buf!6422 (_2!11559 lt!386539))))))))))

(assert (=> d!82988 d!83544))

(declare-fun lt!387811 () (_ BitVec 64))

(declare-fun lt!387815 () tuple2!21288)

(declare-fun b!248820 () Bool)

(declare-fun e!172379 () Bool)

(assert (=> b!248820 (= e!172379 (= (bvsub lt!387811 from!289) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!387815))) (currentByte!11838 (_2!11566 lt!387815)) (currentBit!11833 (_2!11566 lt!387815)))))))

(assert (=> b!248820 (or (= (bvand lt!387811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387811 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387816 () (_ BitVec 64))

(assert (=> b!248820 (= lt!387811 (bvadd lt!387816 nBits!297))))

(assert (=> b!248820 (or (not (= (bvand lt!387816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387816 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248820 (= lt!387816 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))))))

(declare-fun b!248821 () Bool)

(declare-fun e!172381 () tuple2!21288)

(assert (=> b!248821 (= e!172381 (tuple2!21289 true (_1!11557 lt!386544)))))

(declare-fun b!248823 () Bool)

(declare-fun e!172377 () Bool)

(assert (=> b!248823 (= e!172377 (= bit!26 (_2!11558 (readBitPure!0 (_1!11557 lt!386544)))))))

(declare-fun b!248824 () Bool)

(declare-fun e!172380 () Bool)

(assert (=> b!248824 (= e!172380 e!172377)))

(declare-fun res!208245 () Bool)

(assert (=> b!248824 (=> res!208245 e!172377)))

(assert (=> b!248824 (= res!208245 (or (not (_1!11566 lt!387815)) (bvsge from!289 nBits!297)))))

(declare-fun b!248825 () Bool)

(declare-fun lt!387810 () tuple2!21288)

(declare-fun lt!387819 () tuple2!21288)

(assert (=> b!248825 (= lt!387819 (checkBitsLoop!0 (_2!11566 lt!387810) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387814 () Unit!17991)

(declare-fun lt!387813 () Unit!17991)

(assert (=> b!248825 (= lt!387814 lt!387813)))

(declare-fun lt!387809 () (_ BitVec 64))

(declare-fun lt!387812 () (_ BitVec 64))

(assert (=> b!248825 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11566 lt!387810)))) ((_ sign_extend 32) (currentByte!11838 (_2!11566 lt!387810))) ((_ sign_extend 32) (currentBit!11833 (_2!11566 lt!387810))) (bvsub lt!387809 lt!387812))))

(assert (=> b!248825 (= lt!387813 (validateOffsetBitsIneqLemma!0 (_1!11557 lt!386544) (_2!11566 lt!387810) lt!387809 lt!387812))))

(assert (=> b!248825 (= lt!387812 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248825 (= lt!387809 (bvsub nBits!297 from!289))))

(declare-fun e!172378 () tuple2!21288)

(assert (=> b!248825 (= e!172378 (tuple2!21289 (_1!11566 lt!387819) (_2!11566 lt!387819)))))

(declare-fun b!248826 () Bool)

(assert (=> b!248826 (= e!172381 e!172378)))

(assert (=> b!248826 (= lt!387810 (readBit!0 (_1!11557 lt!386544)))))

(declare-fun c!11575 () Bool)

(assert (=> b!248826 (= c!11575 (not (= (_1!11566 lt!387810) bit!26)))))

(declare-fun d!83546 () Bool)

(assert (=> d!83546 e!172380))

(declare-fun res!208246 () Bool)

(assert (=> d!83546 (=> (not res!208246) (not e!172380))))

(declare-fun lt!387817 () (_ BitVec 64))

(assert (=> d!83546 (= res!208246 (bvsge (bvsub lt!387817 from!289) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!387815))) (currentByte!11838 (_2!11566 lt!387815)) (currentBit!11833 (_2!11566 lt!387815)))))))

(assert (=> d!83546 (or (= (bvand lt!387817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387817 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387818 () (_ BitVec 64))

(assert (=> d!83546 (= lt!387817 (bvadd lt!387818 nBits!297))))

(assert (=> d!83546 (or (not (= (bvand lt!387818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387818 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83546 (= lt!387818 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))))))

(assert (=> d!83546 (= lt!387815 e!172381)))

(declare-fun c!11574 () Bool)

(assert (=> d!83546 (= c!11574 (= from!289 nBits!297))))

(assert (=> d!83546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83546 (= (checkBitsLoop!0 (_1!11557 lt!386544) nBits!297 bit!26 from!289) lt!387815)))

(declare-fun b!248822 () Bool)

(declare-fun res!208243 () Bool)

(assert (=> b!248822 (=> (not res!208243) (not e!172380))))

(assert (=> b!248822 (= res!208243 e!172379)))

(declare-fun res!208244 () Bool)

(assert (=> b!248822 (=> res!208244 e!172379)))

(assert (=> b!248822 (= res!208244 (not (_1!11566 lt!387815)))))

(declare-fun b!248827 () Bool)

(assert (=> b!248827 (= e!172378 (tuple2!21289 false (_2!11566 lt!387810)))))

(declare-fun b!248828 () Bool)

(declare-fun res!208247 () Bool)

(assert (=> b!248828 (=> (not res!208247) (not e!172380))))

(assert (=> b!248828 (= res!208247 (and (= (buf!6422 (_1!11557 lt!386544)) (buf!6422 (_2!11566 lt!387815))) (or (not (= nBits!297 from!289)) (_1!11566 lt!387815))))))

(assert (= (and d!83546 c!11574) b!248821))

(assert (= (and d!83546 (not c!11574)) b!248826))

(assert (= (and b!248826 c!11575) b!248827))

(assert (= (and b!248826 (not c!11575)) b!248825))

(assert (= (and d!83546 res!208246) b!248828))

(assert (= (and b!248828 res!208247) b!248822))

(assert (= (and b!248822 (not res!208244)) b!248820))

(assert (= (and b!248822 res!208243) b!248824))

(assert (= (and b!248824 (not res!208245)) b!248823))

(declare-fun m!375165 () Bool)

(assert (=> b!248820 m!375165))

(assert (=> b!248820 m!373979))

(declare-fun m!375167 () Bool)

(assert (=> b!248825 m!375167))

(declare-fun m!375169 () Bool)

(assert (=> b!248825 m!375169))

(declare-fun m!375171 () Bool)

(assert (=> b!248825 m!375171))

(assert (=> b!248823 m!373783))

(assert (=> b!248826 m!374097))

(assert (=> d!83546 m!375165))

(assert (=> d!83546 m!373979))

(assert (=> d!83024 d!83546))

(declare-fun b!248840 () Bool)

(declare-fun e!172391 () Bool)

(declare-fun _$19!186 () tuple2!21274)

(assert (=> b!248840 (= e!172391 (array_inv!5676 (buf!6422 (_2!11559 _$19!186))))))

(declare-fun b!248841 () Bool)

(declare-fun e!172392 () Bool)

(declare-fun e!172390 () Bool)

(assert (=> b!248841 (= e!172392 e!172390)))

(declare-fun res!208259 () Bool)

(assert (=> b!248841 (=> (not res!208259) (not e!172390))))

(declare-fun lt!387822 () tuple2!21272)

(assert (=> b!248841 (= res!208259 (and (= (_2!11558 lt!387822) bit!26) (= (_1!11558 lt!387822) (_2!11559 _$19!186))))))

(assert (=> b!248841 (= lt!387822 (readBitPure!0 (readerFrom!0 (_2!11559 _$19!186) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))

(declare-fun b!248842 () Bool)

(declare-fun res!208258 () Bool)

(assert (=> b!248842 (=> (not res!208258) (not e!172392))))

(assert (=> b!248842 (= res!208258 (isPrefixOf!0 thiss!1005 (_2!11559 _$19!186)))))

(declare-fun b!248843 () Bool)

(assert (=> b!248843 (= e!172390 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!387822))) (currentByte!11838 (_1!11558 lt!387822)) (currentBit!11833 (_1!11558 lt!387822))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 _$19!186))) (currentByte!11838 (_2!11559 _$19!186)) (currentBit!11833 (_2!11559 _$19!186)))))))

(declare-fun d!83548 () Bool)

(assert (=> d!83548 e!172392))

(declare-fun res!208256 () Bool)

(assert (=> d!83548 (=> (not res!208256) (not e!172392))))

(assert (=> d!83548 (= res!208256 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 _$19!186)))))))

(assert (=> d!83548 (and (inv!12 (_2!11559 _$19!186)) e!172391)))

(assert (=> d!83548 (= (choose!16 thiss!1005 bit!26) _$19!186)))

(declare-fun b!248844 () Bool)

(declare-fun res!208257 () Bool)

(assert (=> b!248844 (=> (not res!208257) (not e!172392))))

(assert (=> b!248844 (= res!208257 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 _$19!186))) (currentByte!11838 (_2!11559 _$19!186)) (currentBit!11833 (_2!11559 _$19!186))) (bvadd (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!83548 b!248840))

(assert (= (and d!83548 res!208256) b!248844))

(assert (= (and b!248844 res!208257) b!248842))

(assert (= (and b!248842 res!208258) b!248841))

(assert (= (and b!248841 res!208259) b!248843))

(declare-fun m!375173 () Bool)

(assert (=> b!248844 m!375173))

(assert (=> b!248844 m!373759))

(declare-fun m!375175 () Bool)

(assert (=> b!248840 m!375175))

(declare-fun m!375177 () Bool)

(assert (=> d!83548 m!375177))

(declare-fun m!375179 () Bool)

(assert (=> b!248842 m!375179))

(declare-fun m!375181 () Bool)

(assert (=> b!248841 m!375181))

(assert (=> b!248841 m!375181))

(declare-fun m!375183 () Bool)

(assert (=> b!248841 m!375183))

(declare-fun m!375185 () Bool)

(assert (=> b!248843 m!375185))

(assert (=> b!248843 m!375173))

(assert (=> d!83016 d!83548))

(declare-fun d!83550 () Bool)

(assert (=> d!83550 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 thiss!1005))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21143 () Bool)

(assert (= bs!21143 d!83550))

(assert (=> bs!21143 m!373997))

(assert (=> d!83016 d!83550))

(declare-fun d!83552 () Bool)

(declare-fun e!172400 () Bool)

(assert (=> d!83552 e!172400))

(declare-fun res!208262 () Bool)

(assert (=> d!83552 (=> (not res!208262) (not e!172400))))

(declare-fun increaseBitIndex!0 (BitStream!10792) tuple2!21274)

(assert (=> d!83552 (= res!208262 (= (buf!6422 (_2!11559 (increaseBitIndex!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))))

(declare-fun lt!387839 () Bool)

(assert (=> d!83552 (= lt!387839 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387842 () tuple2!21288)

(assert (=> d!83552 (= lt!387842 (tuple2!21289 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11559 (increaseBitIndex!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))))

(assert (=> d!83552 (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 32) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) ((_ sign_extend 32) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))))

(assert (=> d!83552 (= (readBit!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) lt!387842)))

(declare-fun b!248847 () Bool)

(declare-fun lt!387840 () (_ BitVec 64))

(declare-fun lt!387843 () (_ BitVec 64))

(assert (=> b!248847 (= e!172400 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 (increaseBitIndex!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) (currentByte!11838 (_2!11559 (increaseBitIndex!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) (currentBit!11833 (_2!11559 (increaseBitIndex!0 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) (bvadd lt!387840 lt!387843)))))

(assert (=> b!248847 (or (not (= (bvand lt!387840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387843 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387840 lt!387843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248847 (= lt!387843 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248847 (= lt!387840 (bitIndex!0 (size!5935 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))))

(declare-fun lt!387838 () Bool)

(assert (=> b!248847 (= lt!387838 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387841 () Bool)

(assert (=> b!248847 (= lt!387841 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387837 () Bool)

(assert (=> b!248847 (= lt!387837 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))) (currentByte!11838 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83552 res!208262) b!248847))

(declare-fun m!375187 () Bool)

(assert (=> d!83552 m!375187))

(declare-fun m!375189 () Bool)

(assert (=> d!83552 m!375189))

(declare-fun m!375191 () Bool)

(assert (=> d!83552 m!375191))

(declare-fun m!375193 () Bool)

(assert (=> d!83552 m!375193))

(assert (=> b!248847 m!375191))

(assert (=> b!248847 m!375189))

(declare-fun m!375195 () Bool)

(assert (=> b!248847 m!375195))

(assert (=> b!248847 m!375187))

(declare-fun m!375197 () Bool)

(assert (=> b!248847 m!375197))

(assert (=> d!83012 d!83552))

(declare-fun d!83554 () Bool)

(declare-fun e!172401 () Bool)

(assert (=> d!83554 e!172401))

(declare-fun res!208264 () Bool)

(assert (=> d!83554 (=> (not res!208264) (not e!172401))))

(declare-fun lt!387846 () (_ BitVec 64))

(declare-fun lt!387848 () (_ BitVec 64))

(declare-fun lt!387844 () (_ BitVec 64))

(assert (=> d!83554 (= res!208264 (= lt!387848 (bvsub lt!387846 lt!387844)))))

(assert (=> d!83554 (or (= (bvand lt!387846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387846 lt!387844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83554 (= lt!387844 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 lt!386675))) ((_ sign_extend 32) (currentByte!11838 lt!386675)) ((_ sign_extend 32) (currentBit!11833 lt!386675))))))

(declare-fun lt!387847 () (_ BitVec 64))

(declare-fun lt!387845 () (_ BitVec 64))

(assert (=> d!83554 (= lt!387846 (bvmul lt!387847 lt!387845))))

(assert (=> d!83554 (or (= lt!387847 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387845 (bvsdiv (bvmul lt!387847 lt!387845) lt!387847)))))

(assert (=> d!83554 (= lt!387845 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83554 (= lt!387847 ((_ sign_extend 32) (size!5935 (buf!6422 lt!386675))))))

(assert (=> d!83554 (= lt!387848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 lt!386675)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 lt!386675))))))

(assert (=> d!83554 (invariant!0 (currentBit!11833 lt!386675) (currentByte!11838 lt!386675) (size!5935 (buf!6422 lt!386675)))))

(assert (=> d!83554 (= (bitIndex!0 (size!5935 (buf!6422 lt!386675)) (currentByte!11838 lt!386675) (currentBit!11833 lt!386675)) lt!387848)))

(declare-fun b!248848 () Bool)

(declare-fun res!208263 () Bool)

(assert (=> b!248848 (=> (not res!208263) (not e!172401))))

(assert (=> b!248848 (= res!208263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387848))))

(declare-fun b!248849 () Bool)

(declare-fun lt!387849 () (_ BitVec 64))

(assert (=> b!248849 (= e!172401 (bvsle lt!387848 (bvmul lt!387849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248849 (or (= lt!387849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387849)))))

(assert (=> b!248849 (= lt!387849 ((_ sign_extend 32) (size!5935 (buf!6422 lt!386675))))))

(assert (= (and d!83554 res!208264) b!248848))

(assert (= (and b!248848 res!208263) b!248849))

(declare-fun m!375199 () Bool)

(assert (=> d!83554 m!375199))

(declare-fun m!375201 () Bool)

(assert (=> d!83554 m!375201))

(assert (=> d!82978 d!83554))

(declare-fun d!83556 () Bool)

(declare-fun e!172402 () Bool)

(assert (=> d!83556 e!172402))

(declare-fun res!208266 () Bool)

(assert (=> d!83556 (=> (not res!208266) (not e!172402))))

(declare-fun lt!387852 () (_ BitVec 64))

(declare-fun lt!387854 () (_ BitVec 64))

(declare-fun lt!387850 () (_ BitVec 64))

(assert (=> d!83556 (= res!208266 (= lt!387854 (bvsub lt!387852 lt!387850)))))

(assert (=> d!83556 (or (= (bvand lt!387852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387852 lt!387850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83556 (= lt!387850 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544)))) ((_ sign_extend 32) (currentByte!11838 (_1!11557 lt!386544))) ((_ sign_extend 32) (currentBit!11833 (_1!11557 lt!386544)))))))

(declare-fun lt!387853 () (_ BitVec 64))

(declare-fun lt!387851 () (_ BitVec 64))

(assert (=> d!83556 (= lt!387852 (bvmul lt!387853 lt!387851))))

(assert (=> d!83556 (or (= lt!387853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387851 (bvsdiv (bvmul lt!387853 lt!387851) lt!387853)))))

(assert (=> d!83556 (= lt!387851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83556 (= lt!387853 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544)))))))

(assert (=> d!83556 (= lt!387854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11557 lt!386544))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11557 lt!386544)))))))

(assert (=> d!83556 (invariant!0 (currentBit!11833 (_1!11557 lt!386544)) (currentByte!11838 (_1!11557 lt!386544)) (size!5935 (buf!6422 (_1!11557 lt!386544))))))

(assert (=> d!83556 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))) lt!387854)))

(declare-fun b!248850 () Bool)

(declare-fun res!208265 () Bool)

(assert (=> b!248850 (=> (not res!208265) (not e!172402))))

(assert (=> b!248850 (= res!208265 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387854))))

(declare-fun b!248851 () Bool)

(declare-fun lt!387855 () (_ BitVec 64))

(assert (=> b!248851 (= e!172402 (bvsle lt!387854 (bvmul lt!387855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248851 (or (= lt!387855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387855)))))

(assert (=> b!248851 (= lt!387855 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544)))))))

(assert (= (and d!83556 res!208266) b!248850))

(assert (= (and b!248850 res!208265) b!248851))

(declare-fun m!375203 () Bool)

(assert (=> d!83556 m!375203))

(declare-fun m!375205 () Bool)

(assert (=> d!83556 m!375205))

(assert (=> d!82978 d!83556))

(declare-fun d!83558 () Bool)

(declare-fun lt!387870 () (_ BitVec 32))

(assert (=> d!83558 (= lt!387870 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387868 () (_ BitVec 32))

(assert (=> d!83558 (= lt!387868 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!172408 () Bool)

(assert (=> d!83558 e!172408))

(declare-fun res!208272 () Bool)

(assert (=> d!83558 (=> (not res!208272) (not e!172408))))

(assert (=> d!83558 (= res!208272 (moveBitIndexPrecond!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18017 () Unit!17991)

(declare-fun Unit!18018 () Unit!17991)

(declare-fun Unit!18019 () Unit!17991)

(assert (=> d!83558 (= (moveBitIndex!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387870) #b00000000000000000000000000000000) (tuple2!21275 Unit!18017 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvsub (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387868) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387870 (currentBit!11833 (_1!11557 lt!386544))))) (ite (bvsge (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387870) #b00000000000000000000000000001000) (tuple2!21275 Unit!18018 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387868 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387870) #b00000000000000000000000000001000))) (tuple2!21275 Unit!18019 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387868) (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387870))))))))

(declare-fun b!248856 () Bool)

(declare-fun e!172407 () Bool)

(assert (=> b!248856 (= e!172408 e!172407)))

(declare-fun res!208271 () Bool)

(assert (=> b!248856 (=> (not res!208271) (not e!172407))))

(declare-fun lt!387871 () (_ BitVec 64))

(declare-fun lt!387869 () tuple2!21274)

(assert (=> b!248856 (= res!208271 (= (bvadd lt!387871 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!387869))) (currentByte!11838 (_2!11559 lt!387869)) (currentBit!11833 (_2!11559 lt!387869)))))))

(assert (=> b!248856 (or (not (= (bvand lt!387871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387871 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248856 (= lt!387871 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))))))

(declare-fun lt!387873 () (_ BitVec 32))

(declare-fun lt!387872 () (_ BitVec 32))

(declare-fun Unit!18020 () Unit!17991)

(declare-fun Unit!18021 () Unit!17991)

(declare-fun Unit!18022 () Unit!17991)

(assert (=> b!248856 (= lt!387869 (ite (bvslt (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387873) #b00000000000000000000000000000000) (tuple2!21275 Unit!18020 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvsub (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387872) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!387873 (currentBit!11833 (_1!11557 lt!386544))))) (ite (bvsge (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387873) #b00000000000000000000000000001000) (tuple2!21275 Unit!18021 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387872 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387873) #b00000000000000000000000000001000))) (tuple2!21275 Unit!18022 (BitStream!10793 (buf!6422 (_1!11557 lt!386544)) (bvadd (currentByte!11838 (_1!11557 lt!386544)) lt!387872) (bvadd (currentBit!11833 (_1!11557 lt!386544)) lt!387873))))))))

(assert (=> b!248856 (= lt!387873 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248856 (= lt!387872 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!248857 () Bool)

(assert (=> b!248857 (= e!172407 (and (= (size!5935 (buf!6422 (_1!11557 lt!386544))) (size!5935 (buf!6422 (_2!11559 lt!387869)))) (= (buf!6422 (_1!11557 lt!386544)) (buf!6422 (_2!11559 lt!387869)))))))

(assert (= (and d!83558 res!208272) b!248856))

(assert (= (and b!248856 res!208271) b!248857))

(assert (=> d!83558 m!373983))

(declare-fun m!375207 () Bool)

(assert (=> b!248856 m!375207))

(assert (=> b!248856 m!373979))

(assert (=> d!82978 d!83558))

(declare-fun d!83562 () Bool)

(declare-fun res!208275 () Bool)

(declare-fun e!172411 () Bool)

(assert (=> d!83562 (=> (not res!208275) (not e!172411))))

(assert (=> d!83562 (= res!208275 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544))))))))))

(assert (=> d!83562 (= (moveBitIndexPrecond!0 (_1!11557 lt!386544) #b0000000000000000000000000000000000000000000000000000000000000001) e!172411)))

(declare-fun b!248861 () Bool)

(declare-fun lt!387876 () (_ BitVec 64))

(assert (=> b!248861 (= e!172411 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387876) (bvsle lt!387876 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544))))))))))

(assert (=> b!248861 (= lt!387876 (bvadd (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!83562 res!208275) b!248861))

(assert (=> b!248861 m!373979))

(assert (=> d!82978 d!83562))

(declare-fun d!83564 () Bool)

(assert (=> d!83564 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))))))))

(assert (=> d!82996 d!83564))

(assert (=> d!82996 d!83544))

(declare-fun d!83566 () Bool)

(declare-fun lt!387877 () tuple2!21288)

(assert (=> d!83566 (= lt!387877 (readBit!0 (readerFrom!0 (_2!11559 lt!386813) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))

(assert (=> d!83566 (= (readBitPure!0 (readerFrom!0 (_2!11559 lt!386813) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))) (tuple2!21273 (_2!11566 lt!387877) (_1!11566 lt!387877)))))

(declare-fun bs!21144 () Bool)

(assert (= bs!21144 d!83566))

(assert (=> bs!21144 m!374075))

(declare-fun m!375209 () Bool)

(assert (=> bs!21144 m!375209))

(assert (=> b!248182 d!83566))

(declare-fun d!83568 () Bool)

(declare-fun e!172412 () Bool)

(assert (=> d!83568 e!172412))

(declare-fun res!208276 () Bool)

(assert (=> d!83568 (=> (not res!208276) (not e!172412))))

(assert (=> d!83568 (= res!208276 (invariant!0 (currentBit!11833 (_2!11559 lt!386813)) (currentByte!11838 (_2!11559 lt!386813)) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(assert (=> d!83568 (= (readerFrom!0 (_2!11559 lt!386813) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)) (BitStream!10793 (buf!6422 (_2!11559 lt!386813)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)))))

(declare-fun b!248862 () Bool)

(assert (=> b!248862 (= e!172412 (invariant!0 (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(assert (= (and d!83568 res!208276) b!248862))

(declare-fun m!375211 () Bool)

(assert (=> d!83568 m!375211))

(declare-fun m!375213 () Bool)

(assert (=> b!248862 m!375213))

(assert (=> b!248182 d!83568))

(declare-fun d!83570 () Bool)

(declare-fun res!208279 () Bool)

(declare-fun e!172413 () Bool)

(assert (=> d!83570 (=> (not res!208279) (not e!172413))))

(assert (=> d!83570 (= res!208279 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386862)))))))

(assert (=> d!83570 (= (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386862)) e!172413)))

(declare-fun b!248863 () Bool)

(declare-fun res!208278 () Bool)

(assert (=> b!248863 (=> (not res!208278) (not e!172413))))

(assert (=> b!248863 (= res!208278 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386862))) (currentByte!11838 (_2!11559 lt!386862)) (currentBit!11833 (_2!11559 lt!386862)))))))

(declare-fun b!248864 () Bool)

(declare-fun e!172414 () Bool)

(assert (=> b!248864 (= e!172413 e!172414)))

(declare-fun res!208277 () Bool)

(assert (=> b!248864 (=> res!208277 e!172414)))

(assert (=> b!248864 (= res!208277 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) #b00000000000000000000000000000000))))

(declare-fun b!248865 () Bool)

(assert (=> b!248865 (= e!172414 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386862)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (= (and d!83570 res!208279) b!248863))

(assert (= (and b!248863 res!208278) b!248864))

(assert (= (and b!248864 (not res!208277)) b!248865))

(assert (=> b!248863 m!373757))

(assert (=> b!248863 m!374123))

(assert (=> b!248865 m!373757))

(assert (=> b!248865 m!373757))

(declare-fun m!375215 () Bool)

(assert (=> b!248865 m!375215))

(assert (=> b!248197 d!83570))

(assert (=> d!83002 d!83534))

(declare-fun d!83572 () Bool)

(assert (=> d!83572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386855) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) lt!386855))))

(declare-fun bs!21145 () Bool)

(assert (= bs!21145 d!83572))

(assert (=> bs!21145 m!373999))

(assert (=> b!248199 d!83572))

(declare-fun d!83574 () Bool)

(assert (=> d!83574 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))))))))

(assert (=> d!83046 d!83574))

(declare-fun b!248866 () Bool)

(declare-fun e!172417 () Bool)

(declare-fun lt!387884 () tuple2!21288)

(declare-fun lt!387880 () (_ BitVec 64))

(assert (=> b!248866 (= e!172417 (= (bvsub lt!387880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!387884))) (currentByte!11838 (_2!11566 lt!387884)) (currentBit!11833 (_2!11566 lt!387884)))))))

(assert (=> b!248866 (or (= (bvand lt!387880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387885 () (_ BitVec 64))

(assert (=> b!248866 (= lt!387880 (bvadd lt!387885 nBits!297))))

(assert (=> b!248866 (or (not (= (bvand lt!387885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387885 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248866 (= lt!387885 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386524))) (currentByte!11838 (_1!11557 lt!386524)) (currentBit!11833 (_1!11557 lt!386524))))))

(declare-fun b!248867 () Bool)

(declare-fun e!172419 () tuple2!21288)

(assert (=> b!248867 (= e!172419 (tuple2!21289 true (_1!11557 lt!386524)))))

(declare-fun b!248869 () Bool)

(declare-fun e!172415 () Bool)

(assert (=> b!248869 (= e!172415 (= bit!26 (_2!11558 (readBitPure!0 (_1!11557 lt!386524)))))))

(declare-fun b!248870 () Bool)

(declare-fun e!172418 () Bool)

(assert (=> b!248870 (= e!172418 e!172415)))

(declare-fun res!208282 () Bool)

(assert (=> b!248870 (=> res!208282 e!172415)))

(assert (=> b!248870 (= res!208282 (or (not (_1!11566 lt!387884)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun lt!387888 () tuple2!21288)

(declare-fun b!248871 () Bool)

(declare-fun lt!387879 () tuple2!21288)

(assert (=> b!248871 (= lt!387888 (checkBitsLoop!0 (_2!11566 lt!387879) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!387883 () Unit!17991)

(declare-fun lt!387882 () Unit!17991)

(assert (=> b!248871 (= lt!387883 lt!387882)))

(declare-fun lt!387878 () (_ BitVec 64))

(declare-fun lt!387881 () (_ BitVec 64))

(assert (=> b!248871 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11566 lt!387879)))) ((_ sign_extend 32) (currentByte!11838 (_2!11566 lt!387879))) ((_ sign_extend 32) (currentBit!11833 (_2!11566 lt!387879))) (bvsub lt!387878 lt!387881))))

(assert (=> b!248871 (= lt!387882 (validateOffsetBitsIneqLemma!0 (_1!11557 lt!386524) (_2!11566 lt!387879) lt!387878 lt!387881))))

(assert (=> b!248871 (= lt!387881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248871 (= lt!387878 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun e!172416 () tuple2!21288)

(assert (=> b!248871 (= e!172416 (tuple2!21289 (_1!11566 lt!387888) (_2!11566 lt!387888)))))

(declare-fun b!248872 () Bool)

(assert (=> b!248872 (= e!172419 e!172416)))

(assert (=> b!248872 (= lt!387879 (readBit!0 (_1!11557 lt!386524)))))

(declare-fun c!11577 () Bool)

(assert (=> b!248872 (= c!11577 (not (= (_1!11566 lt!387879) bit!26)))))

(declare-fun d!83576 () Bool)

(assert (=> d!83576 e!172418))

(declare-fun res!208283 () Bool)

(assert (=> d!83576 (=> (not res!208283) (not e!172418))))

(declare-fun lt!387886 () (_ BitVec 64))

(assert (=> d!83576 (= res!208283 (bvsge (bvsub lt!387886 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!387884))) (currentByte!11838 (_2!11566 lt!387884)) (currentBit!11833 (_2!11566 lt!387884)))))))

(assert (=> d!83576 (or (= (bvand lt!387886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387886 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!387887 () (_ BitVec 64))

(assert (=> d!83576 (= lt!387886 (bvadd lt!387887 nBits!297))))

(assert (=> d!83576 (or (not (= (bvand lt!387887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387887 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83576 (= lt!387887 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386524))) (currentByte!11838 (_1!11557 lt!386524)) (currentBit!11833 (_1!11557 lt!386524))))))

(assert (=> d!83576 (= lt!387884 e!172419)))

(declare-fun c!11576 () Bool)

(assert (=> d!83576 (= c!11576 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83576 (= (checkBitsLoop!0 (_1!11557 lt!386524) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!387884)))

(declare-fun b!248868 () Bool)

(declare-fun res!208280 () Bool)

(assert (=> b!248868 (=> (not res!208280) (not e!172418))))

(assert (=> b!248868 (= res!208280 e!172417)))

(declare-fun res!208281 () Bool)

(assert (=> b!248868 (=> res!208281 e!172417)))

(assert (=> b!248868 (= res!208281 (not (_1!11566 lt!387884)))))

(declare-fun b!248873 () Bool)

(assert (=> b!248873 (= e!172416 (tuple2!21289 false (_2!11566 lt!387879)))))

(declare-fun b!248874 () Bool)

(declare-fun res!208284 () Bool)

(assert (=> b!248874 (=> (not res!208284) (not e!172418))))

(assert (=> b!248874 (= res!208284 (and (= (buf!6422 (_1!11557 lt!386524)) (buf!6422 (_2!11566 lt!387884))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11566 lt!387884))))))

(assert (= (and d!83576 c!11576) b!248867))

(assert (= (and d!83576 (not c!11576)) b!248872))

(assert (= (and b!248872 c!11577) b!248873))

(assert (= (and b!248872 (not c!11577)) b!248871))

(assert (= (and d!83576 res!208283) b!248874))

(assert (= (and b!248874 res!208284) b!248868))

(assert (= (and b!248868 (not res!208281)) b!248866))

(assert (= (and b!248868 res!208280) b!248870))

(assert (= (and b!248870 (not res!208282)) b!248869))

(declare-fun m!375217 () Bool)

(assert (=> b!248866 m!375217))

(declare-fun m!375219 () Bool)

(assert (=> b!248866 m!375219))

(declare-fun m!375221 () Bool)

(assert (=> b!248871 m!375221))

(declare-fun m!375223 () Bool)

(assert (=> b!248871 m!375223))

(declare-fun m!375225 () Bool)

(assert (=> b!248871 m!375225))

(declare-fun m!375227 () Bool)

(assert (=> b!248869 m!375227))

(declare-fun m!375229 () Bool)

(assert (=> b!248872 m!375229))

(assert (=> d!83576 m!375217))

(assert (=> d!83576 m!375219))

(assert (=> d!83004 d!83576))

(assert (=> d!83058 d!83046))

(declare-fun d!83578 () Bool)

(assert (=> d!83578 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386530)))

(assert (=> d!83578 true))

(declare-fun _$6!413 () Unit!17991)

(assert (=> d!83578 (= (choose!9 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386530 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))) _$6!413)))

(declare-fun bs!21146 () Bool)

(assert (= bs!21146 d!83578))

(assert (=> bs!21146 m!373813))

(assert (=> d!83058 d!83578))

(declare-fun d!83580 () Bool)

(assert (=> d!83580 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386531))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386531)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386531))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386531))))))))

(assert (=> d!83000 d!83580))

(declare-fun d!83582 () Bool)

(assert (=> d!83582 (= (invariant!0 (currentBit!11833 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386531)) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (bvsge (currentBit!11833 (_2!11559 lt!386531)) #b00000000000000000000000000000000) (bvslt (currentBit!11833 (_2!11559 lt!386531)) #b00000000000000000000000000001000) (bvsge (currentByte!11838 (_2!11559 lt!386531)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 (_2!11559 lt!386531)) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (= (currentBit!11833 (_2!11559 lt!386531)) #b00000000000000000000000000000000) (= (currentByte!11838 (_2!11559 lt!386531)) (size!5935 (buf!6422 (_2!11559 lt!386531))))))))))

(assert (=> d!83000 d!83582))

(assert (=> d!83008 d!83006))

(declare-fun d!83584 () Bool)

(assert (=> d!83584 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386538)))

(assert (=> d!83584 true))

(declare-fun _$6!414 () Unit!17991)

(assert (=> d!83584 (= (choose!9 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386531)) lt!386538 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))) _$6!414)))

(declare-fun bs!21147 () Bool)

(assert (= bs!21147 d!83584))

(assert (=> bs!21147 m!373773))

(assert (=> d!83008 d!83584))

(declare-fun d!83586 () Bool)

(declare-fun e!172420 () Bool)

(assert (=> d!83586 e!172420))

(declare-fun res!208285 () Bool)

(assert (=> d!83586 (=> (not res!208285) (not e!172420))))

(declare-fun lt!387890 () (_ BitVec 64))

(declare-fun lt!387889 () BitStream!10792)

(assert (=> d!83586 (= res!208285 (= (bvadd lt!387890 (bvsub lt!386764 lt!386779)) (bitIndex!0 (size!5935 (buf!6422 lt!387889)) (currentByte!11838 lt!387889) (currentBit!11833 lt!387889))))))

(assert (=> d!83586 (or (not (= (bvand lt!387890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386764 lt!386779) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387890 (bvsub lt!386764 lt!386779)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83586 (= lt!387890 (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386770))) (currentByte!11838 (_2!11557 lt!386770)) (currentBit!11833 (_2!11557 lt!386770))))))

(assert (=> d!83586 (= lt!387889 (_2!11559 (moveBitIndex!0 (_2!11557 lt!386770) (bvsub lt!386764 lt!386779))))))

(assert (=> d!83586 (moveBitIndexPrecond!0 (_2!11557 lt!386770) (bvsub lt!386764 lt!386779))))

(assert (=> d!83586 (= (withMovedBitIndex!0 (_2!11557 lt!386770) (bvsub lt!386764 lt!386779)) lt!387889)))

(declare-fun b!248875 () Bool)

(assert (=> b!248875 (= e!172420 (= (size!5935 (buf!6422 (_2!11557 lt!386770))) (size!5935 (buf!6422 lt!387889))))))

(assert (= (and d!83586 res!208285) b!248875))

(declare-fun m!375231 () Bool)

(assert (=> d!83586 m!375231))

(declare-fun m!375233 () Bool)

(assert (=> d!83586 m!375233))

(declare-fun m!375235 () Bool)

(assert (=> d!83586 m!375235))

(declare-fun m!375237 () Bool)

(assert (=> d!83586 m!375237))

(assert (=> b!248162 d!83586))

(assert (=> b!248162 d!83000))

(assert (=> b!248162 d!82996))

(declare-fun d!83588 () Bool)

(declare-fun e!172421 () Bool)

(assert (=> d!83588 e!172421))

(declare-fun res!208286 () Bool)

(assert (=> d!83588 (=> (not res!208286) (not e!172421))))

(assert (=> d!83588 (= res!208286 (= (buf!6422 (_2!11559 (increaseBitIndex!0 lt!386526))) (buf!6422 lt!386526)))))

(declare-fun lt!387893 () Bool)

(assert (=> d!83588 (= lt!387893 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 lt!386526)) (currentByte!11838 lt!386526))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 lt!386526)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387896 () tuple2!21288)

(assert (=> d!83588 (= lt!387896 (tuple2!21289 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 lt!386526)) (currentByte!11838 lt!386526))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 lt!386526)))) #b00000000000000000000000000000000)) (_2!11559 (increaseBitIndex!0 lt!386526))))))

(assert (=> d!83588 (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 lt!386526))) ((_ sign_extend 32) (currentByte!11838 lt!386526)) ((_ sign_extend 32) (currentBit!11833 lt!386526)))))

(assert (=> d!83588 (= (readBit!0 lt!386526) lt!387896)))

(declare-fun lt!387897 () (_ BitVec 64))

(declare-fun lt!387894 () (_ BitVec 64))

(declare-fun b!248876 () Bool)

(assert (=> b!248876 (= e!172421 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 (increaseBitIndex!0 lt!386526)))) (currentByte!11838 (_2!11559 (increaseBitIndex!0 lt!386526))) (currentBit!11833 (_2!11559 (increaseBitIndex!0 lt!386526)))) (bvadd lt!387894 lt!387897)))))

(assert (=> b!248876 (or (not (= (bvand lt!387894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387897 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387894 lt!387897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248876 (= lt!387897 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248876 (= lt!387894 (bitIndex!0 (size!5935 (buf!6422 lt!386526)) (currentByte!11838 lt!386526) (currentBit!11833 lt!386526)))))

(declare-fun lt!387892 () Bool)

(assert (=> b!248876 (= lt!387892 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 lt!386526)) (currentByte!11838 lt!386526))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 lt!386526)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387895 () Bool)

(assert (=> b!248876 (= lt!387895 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 lt!386526)) (currentByte!11838 lt!386526))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 lt!386526)))) #b00000000000000000000000000000000)))))

(declare-fun lt!387891 () Bool)

(assert (=> b!248876 (= lt!387891 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 lt!386526)) (currentByte!11838 lt!386526))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 lt!386526)))) #b00000000000000000000000000000000)))))

(assert (= (and d!83588 res!208286) b!248876))

(declare-fun m!375239 () Bool)

(assert (=> d!83588 m!375239))

(declare-fun m!375241 () Bool)

(assert (=> d!83588 m!375241))

(declare-fun m!375243 () Bool)

(assert (=> d!83588 m!375243))

(declare-fun m!375245 () Bool)

(assert (=> d!83588 m!375245))

(assert (=> b!248876 m!375243))

(assert (=> b!248876 m!375241))

(declare-fun m!375247 () Bool)

(assert (=> b!248876 m!375247))

(assert (=> b!248876 m!375239))

(declare-fun m!375249 () Bool)

(assert (=> b!248876 m!375249))

(assert (=> d!83050 d!83588))

(declare-fun d!83590 () Bool)

(declare-fun e!172422 () Bool)

(assert (=> d!83590 e!172422))

(declare-fun res!208288 () Bool)

(assert (=> d!83590 (=> (not res!208288) (not e!172422))))

(declare-fun lt!387902 () (_ BitVec 64))

(declare-fun lt!387898 () (_ BitVec 64))

(declare-fun lt!387900 () (_ BitVec 64))

(assert (=> d!83590 (= res!208288 (= lt!387902 (bvsub lt!387900 lt!387898)))))

(assert (=> d!83590 (or (= (bvand lt!387900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387900 lt!387898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83590 (= lt!387898 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386877)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386877))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386877)))))))

(declare-fun lt!387901 () (_ BitVec 64))

(declare-fun lt!387899 () (_ BitVec 64))

(assert (=> d!83590 (= lt!387900 (bvmul lt!387901 lt!387899))))

(assert (=> d!83590 (or (= lt!387901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387899 (bvsdiv (bvmul lt!387901 lt!387899) lt!387901)))))

(assert (=> d!83590 (= lt!387899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83590 (= lt!387901 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386877)))))))

(assert (=> d!83590 (= lt!387902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386877)))))))

(assert (=> d!83590 (invariant!0 (currentBit!11833 (_1!11558 lt!386877)) (currentByte!11838 (_1!11558 lt!386877)) (size!5935 (buf!6422 (_1!11558 lt!386877))))))

(assert (=> d!83590 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386877))) (currentByte!11838 (_1!11558 lt!386877)) (currentBit!11833 (_1!11558 lt!386877))) lt!387902)))

(declare-fun b!248877 () Bool)

(declare-fun res!208287 () Bool)

(assert (=> b!248877 (=> (not res!208287) (not e!172422))))

(assert (=> b!248877 (= res!208287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387902))))

(declare-fun b!248878 () Bool)

(declare-fun lt!387903 () (_ BitVec 64))

(assert (=> b!248878 (= e!172422 (bvsle lt!387902 (bvmul lt!387903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248878 (or (= lt!387903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387903)))))

(assert (=> b!248878 (= lt!387903 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386877)))))))

(assert (= (and d!83590 res!208288) b!248877))

(assert (= (and b!248877 res!208287) b!248878))

(declare-fun m!375251 () Bool)

(assert (=> d!83590 m!375251))

(declare-fun m!375253 () Bool)

(assert (=> d!83590 m!375253))

(assert (=> d!83056 d!83590))

(declare-fun d!83592 () Bool)

(declare-fun e!172423 () Bool)

(assert (=> d!83592 e!172423))

(declare-fun res!208290 () Bool)

(assert (=> d!83592 (=> (not res!208290) (not e!172423))))

(declare-fun lt!387904 () (_ BitVec 64))

(declare-fun lt!387908 () (_ BitVec 64))

(declare-fun lt!387906 () (_ BitVec 64))

(assert (=> d!83592 (= res!208290 (= lt!387908 (bvsub lt!387906 lt!387904)))))

(assert (=> d!83592 (or (= (bvand lt!387906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387906 lt!387904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83592 (= lt!387904 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386876)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386876))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386876)))))))

(declare-fun lt!387907 () (_ BitVec 64))

(declare-fun lt!387905 () (_ BitVec 64))

(assert (=> d!83592 (= lt!387906 (bvmul lt!387907 lt!387905))))

(assert (=> d!83592 (or (= lt!387907 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387905 (bvsdiv (bvmul lt!387907 lt!387905) lt!387907)))))

(assert (=> d!83592 (= lt!387905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83592 (= lt!387907 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386876)))))))

(assert (=> d!83592 (= lt!387908 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386876))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386876)))))))

(assert (=> d!83592 (invariant!0 (currentBit!11833 (_1!11558 lt!386876)) (currentByte!11838 (_1!11558 lt!386876)) (size!5935 (buf!6422 (_1!11558 lt!386876))))))

(assert (=> d!83592 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386876))) (currentByte!11838 (_1!11558 lt!386876)) (currentBit!11833 (_1!11558 lt!386876))) lt!387908)))

(declare-fun b!248879 () Bool)

(declare-fun res!208289 () Bool)

(assert (=> b!248879 (=> (not res!208289) (not e!172423))))

(assert (=> b!248879 (= res!208289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387908))))

(declare-fun b!248880 () Bool)

(declare-fun lt!387909 () (_ BitVec 64))

(assert (=> b!248880 (= e!172423 (bvsle lt!387908 (bvmul lt!387909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248880 (or (= lt!387909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387909)))))

(assert (=> b!248880 (= lt!387909 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386876)))))))

(assert (= (and d!83592 res!208290) b!248879))

(assert (= (and b!248879 res!208289) b!248880))

(declare-fun m!375255 () Bool)

(assert (=> d!83592 m!375255))

(declare-fun m!375257 () Bool)

(assert (=> d!83592 m!375257))

(assert (=> d!83056 d!83592))

(assert (=> d!83056 d!83050))

(declare-fun d!83594 () Bool)

(declare-fun e!172426 () Bool)

(assert (=> d!83594 e!172426))

(declare-fun res!208293 () Bool)

(assert (=> d!83594 (=> (not res!208293) (not e!172426))))

(declare-fun lt!387916 () tuple2!21272)

(declare-fun lt!387917 () tuple2!21272)

(assert (=> d!83594 (= res!208293 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!387916))) (currentByte!11838 (_1!11558 lt!387916)) (currentBit!11833 (_1!11558 lt!387916))) (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!387917))) (currentByte!11838 (_1!11558 lt!387917)) (currentBit!11833 (_1!11558 lt!387917)))))))

(declare-fun lt!387918 () BitStream!10792)

(assert (=> d!83594 (= lt!387917 (readBitPure!0 lt!387918))))

(assert (=> d!83594 (= lt!387916 (readBitPure!0 lt!386526))))

(assert (=> d!83594 (= lt!387918 (BitStream!10793 (buf!6422 (_2!11559 lt!386531)) (currentByte!11838 lt!386526) (currentBit!11833 lt!386526)))))

(assert (=> d!83594 (invariant!0 (currentBit!11833 lt!386526) (currentByte!11838 lt!386526) (size!5935 (buf!6422 (_2!11559 lt!386531))))))

(assert (=> d!83594 true))

(declare-fun _$9!102 () Unit!17991)

(assert (=> d!83594 (= (choose!50 lt!386526 (_2!11559 lt!386531) lt!386879 lt!386876 (tuple2!21273 (_1!11558 lt!386876) (_2!11558 lt!386876)) (_1!11558 lt!386876) (_2!11558 lt!386876) lt!386877 (tuple2!21273 (_1!11558 lt!386877) (_2!11558 lt!386877)) (_1!11558 lt!386877) (_2!11558 lt!386877)) _$9!102)))

(declare-fun b!248883 () Bool)

(assert (=> b!248883 (= e!172426 (= (_2!11558 lt!387916) (_2!11558 lt!387917)))))

(assert (= (and d!83594 res!208293) b!248883))

(assert (=> d!83594 m!373785))

(declare-fun m!375259 () Bool)

(assert (=> d!83594 m!375259))

(declare-fun m!375261 () Bool)

(assert (=> d!83594 m!375261))

(declare-fun m!375263 () Bool)

(assert (=> d!83594 m!375263))

(assert (=> d!83594 m!374145))

(assert (=> d!83056 d!83594))

(declare-fun d!83596 () Bool)

(declare-fun lt!387919 () tuple2!21288)

(assert (=> d!83596 (= lt!387919 (readBit!0 lt!386879))))

(assert (=> d!83596 (= (readBitPure!0 lt!386879) (tuple2!21273 (_2!11566 lt!387919) (_1!11566 lt!387919)))))

(declare-fun bs!21148 () Bool)

(assert (= bs!21148 d!83596))

(declare-fun m!375265 () Bool)

(assert (=> bs!21148 m!375265))

(assert (=> d!83056 d!83596))

(declare-fun d!83598 () Bool)

(assert (=> d!83598 (= (invariant!0 (currentBit!11833 lt!386526) (currentByte!11838 lt!386526) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (bvsge (currentBit!11833 lt!386526) #b00000000000000000000000000000000) (bvslt (currentBit!11833 lt!386526) #b00000000000000000000000000001000) (bvsge (currentByte!11838 lt!386526) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 lt!386526) (size!5935 (buf!6422 (_2!11559 lt!386531)))) (and (= (currentBit!11833 lt!386526) #b00000000000000000000000000000000) (= (currentByte!11838 lt!386526) (size!5935 (buf!6422 (_2!11559 lt!386531))))))))))

(assert (=> d!83056 d!83598))

(assert (=> b!248168 d!82998))

(declare-fun d!83600 () Bool)

(assert (=> d!83600 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 thiss!1005) lt!386787 lt!386783)))

(declare-fun lt!387922 () Unit!17991)

(declare-fun choose!8 (array!13537 array!13537 (_ BitVec 64) (_ BitVec 64)) Unit!17991)

(assert (=> d!83600 (= lt!387922 (choose!8 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) lt!386787 lt!386783))))

(assert (=> d!83600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386787) (bvsle lt!386787 lt!386783))))

(assert (=> d!83600 (= (arrayBitRangesEqSymmetric!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) lt!386787 lt!386783) lt!387922)))

(declare-fun bs!21149 () Bool)

(assert (= bs!21149 d!83600))

(assert (=> bs!21149 m!374053))

(declare-fun m!375267 () Bool)

(assert (=> bs!21149 m!375267))

(assert (=> b!248168 d!83600))

(declare-fun b!248899 () Bool)

(declare-fun e!172440 () Bool)

(declare-fun e!172443 () Bool)

(assert (=> b!248899 (= e!172440 e!172443)))

(declare-fun res!208308 () Bool)

(assert (=> b!248899 (=> (not res!208308) (not e!172443))))

(declare-fun e!172439 () Bool)

(assert (=> b!248899 (= res!208308 e!172439)))

(declare-fun res!208305 () Bool)

(assert (=> b!248899 (=> res!208305 e!172439)))

(declare-datatypes ((tuple4!288 0))(
  ( (tuple4!289 (_1!11571 (_ BitVec 32)) (_2!11571 (_ BitVec 32)) (_3!924 (_ BitVec 32)) (_4!144 (_ BitVec 32))) )
))
(declare-fun lt!387929 () tuple4!288)

(assert (=> b!248899 (= res!208305 (bvsge (_1!11571 lt!387929) (_2!11571 lt!387929)))))

(declare-fun lt!387931 () (_ BitVec 32))

(assert (=> b!248899 (= lt!387931 ((_ extract 31 0) (bvsrem lt!386783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387930 () (_ BitVec 32))

(assert (=> b!248899 (= lt!387930 ((_ extract 31 0) (bvsrem lt!386787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!288)

(assert (=> b!248899 (= lt!387929 (arrayBitIndices!0 lt!386787 lt!386783))))

(declare-fun b!248900 () Bool)

(declare-fun res!208304 () Bool)

(assert (=> b!248900 (= res!208304 (= lt!387931 #b00000000000000000000000000000000))))

(declare-fun e!172442 () Bool)

(assert (=> b!248900 (=> res!208304 e!172442)))

(declare-fun e!172444 () Bool)

(assert (=> b!248900 (= e!172444 e!172442)))

(declare-fun b!248901 () Bool)

(declare-fun arrayRangesEq!921 (array!13537 array!13537 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248901 (= e!172439 (arrayRangesEq!921 (buf!6422 (_2!11559 lt!386531)) (buf!6422 thiss!1005) (_1!11571 lt!387929) (_2!11571 lt!387929)))))

(declare-fun b!248902 () Bool)

(declare-fun e!172441 () Bool)

(assert (=> b!248902 (= e!172441 e!172444)))

(declare-fun res!208306 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248902 (= res!208306 (byteRangesEq!0 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!387929)) (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!387929)) lt!387930 #b00000000000000000000000000001000))))

(assert (=> b!248902 (=> (not res!208306) (not e!172444))))

(declare-fun b!248903 () Bool)

(declare-fun call!3953 () Bool)

(assert (=> b!248903 (= e!172442 call!3953)))

(declare-fun b!248904 () Bool)

(assert (=> b!248904 (= e!172441 call!3953)))

(declare-fun c!11580 () Bool)

(declare-fun bm!3950 () Bool)

(assert (=> bm!3950 (= call!3953 (byteRangesEq!0 (ite c!11580 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!387929)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_4!144 lt!387929))) (ite c!11580 (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!387929)) (select (arr!6922 (buf!6422 thiss!1005)) (_4!144 lt!387929))) (ite c!11580 lt!387930 #b00000000000000000000000000000000) lt!387931))))

(declare-fun b!248898 () Bool)

(assert (=> b!248898 (= e!172443 e!172441)))

(assert (=> b!248898 (= c!11580 (= (_3!924 lt!387929) (_4!144 lt!387929)))))

(declare-fun d!83602 () Bool)

(declare-fun res!208307 () Bool)

(assert (=> d!83602 (=> res!208307 e!172440)))

(assert (=> d!83602 (= res!208307 (bvsge lt!386787 lt!386783))))

(assert (=> d!83602 (= (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 thiss!1005) lt!386787 lt!386783) e!172440)))

(assert (= (and d!83602 (not res!208307)) b!248899))

(assert (= (and b!248899 (not res!208305)) b!248901))

(assert (= (and b!248899 res!208308) b!248898))

(assert (= (and b!248898 c!11580) b!248904))

(assert (= (and b!248898 (not c!11580)) b!248902))

(assert (= (and b!248902 res!208306) b!248900))

(assert (= (and b!248900 (not res!208304)) b!248903))

(assert (= (or b!248904 b!248903) bm!3950))

(declare-fun m!375269 () Bool)

(assert (=> b!248899 m!375269))

(declare-fun m!375271 () Bool)

(assert (=> b!248901 m!375271))

(declare-fun m!375273 () Bool)

(assert (=> b!248902 m!375273))

(declare-fun m!375275 () Bool)

(assert (=> b!248902 m!375275))

(assert (=> b!248902 m!375273))

(assert (=> b!248902 m!375275))

(declare-fun m!375277 () Bool)

(assert (=> b!248902 m!375277))

(assert (=> bm!3950 m!375275))

(declare-fun m!375279 () Bool)

(assert (=> bm!3950 m!375279))

(assert (=> bm!3950 m!375273))

(declare-fun m!375281 () Bool)

(assert (=> bm!3950 m!375281))

(declare-fun m!375283 () Bool)

(assert (=> bm!3950 m!375283))

(assert (=> b!248168 d!83602))

(declare-fun d!83604 () Bool)

(declare-fun res!208311 () Bool)

(declare-fun e!172445 () Bool)

(assert (=> d!83604 (=> (not res!208311) (not e!172445))))

(assert (=> d!83604 (= res!208311 (= (size!5935 (buf!6422 (_1!11557 lt!386791))) (size!5935 (buf!6422 thiss!1005))))))

(assert (=> d!83604 (= (isPrefixOf!0 (_1!11557 lt!386791) thiss!1005) e!172445)))

(declare-fun b!248905 () Bool)

(declare-fun res!208310 () Bool)

(assert (=> b!248905 (=> (not res!208310) (not e!172445))))

(assert (=> b!248905 (= res!208310 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386791))) (currentByte!11838 (_1!11557 lt!386791)) (currentBit!11833 (_1!11557 lt!386791))) (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(declare-fun b!248906 () Bool)

(declare-fun e!172446 () Bool)

(assert (=> b!248906 (= e!172445 e!172446)))

(declare-fun res!208309 () Bool)

(assert (=> b!248906 (=> res!208309 e!172446)))

(assert (=> b!248906 (= res!208309 (= (size!5935 (buf!6422 (_1!11557 lt!386791))) #b00000000000000000000000000000000))))

(declare-fun b!248907 () Bool)

(assert (=> b!248907 (= e!172446 (arrayBitRangesEq!0 (buf!6422 (_1!11557 lt!386791)) (buf!6422 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386791))) (currentByte!11838 (_1!11557 lt!386791)) (currentBit!11833 (_1!11557 lt!386791)))))))

(assert (= (and d!83604 res!208311) b!248905))

(assert (= (and b!248905 res!208310) b!248906))

(assert (= (and b!248906 (not res!208309)) b!248907))

(declare-fun m!375285 () Bool)

(assert (=> b!248905 m!375285))

(assert (=> b!248905 m!373759))

(assert (=> b!248907 m!375285))

(assert (=> b!248907 m!375285))

(declare-fun m!375287 () Bool)

(assert (=> b!248907 m!375287))

(assert (=> b!248170 d!83604))

(assert (=> d!83018 d!83054))

(declare-fun d!83606 () Bool)

(assert (=> d!83606 (isPrefixOf!0 thiss!1005 (_2!11559 lt!386531))))

(assert (=> d!83606 true))

(declare-fun _$15!321 () Unit!17991)

(assert (=> d!83606 (= (choose!30 thiss!1005 (_2!11559 lt!386539) (_2!11559 lt!386531)) _$15!321)))

(declare-fun bs!21150 () Bool)

(assert (= bs!21150 d!83606))

(assert (=> bs!21150 m!373781))

(assert (=> d!83018 d!83606))

(assert (=> d!83018 d!82984))

(declare-fun d!83608 () Bool)

(assert (=> d!83608 (isPrefixOf!0 lt!386775 (_2!11559 lt!386531))))

(declare-fun lt!387932 () Unit!17991)

(assert (=> d!83608 (= lt!387932 (choose!30 lt!386775 (_2!11559 lt!386539) (_2!11559 lt!386531)))))

(assert (=> d!83608 (isPrefixOf!0 lt!386775 (_2!11559 lt!386539))))

(assert (=> d!83608 (= (lemmaIsPrefixTransitive!0 lt!386775 (_2!11559 lt!386539) (_2!11559 lt!386531)) lt!387932)))

(declare-fun bs!21151 () Bool)

(assert (= bs!21151 d!83608))

(assert (=> bs!21151 m!374023))

(declare-fun m!375289 () Bool)

(assert (=> bs!21151 m!375289))

(declare-fun m!375291 () Bool)

(assert (=> bs!21151 m!375291))

(assert (=> d!83010 d!83608))

(assert (=> d!83010 d!82992))

(declare-fun d!83610 () Bool)

(assert (=> d!83610 (isPrefixOf!0 lt!386775 (_2!11559 lt!386531))))

(declare-fun lt!387933 () Unit!17991)

(assert (=> d!83610 (= lt!387933 (choose!30 lt!386775 (_2!11559 lt!386531) (_2!11559 lt!386531)))))

(assert (=> d!83610 (isPrefixOf!0 lt!386775 (_2!11559 lt!386531))))

(assert (=> d!83610 (= (lemmaIsPrefixTransitive!0 lt!386775 (_2!11559 lt!386531) (_2!11559 lt!386531)) lt!387933)))

(declare-fun bs!21152 () Bool)

(assert (= bs!21152 d!83610))

(assert (=> bs!21152 m!374023))

(declare-fun m!375293 () Bool)

(assert (=> bs!21152 m!375293))

(assert (=> bs!21152 m!374023))

(assert (=> d!83010 d!83610))

(declare-fun d!83612 () Bool)

(assert (=> d!83612 (isPrefixOf!0 lt!386775 lt!386775)))

(declare-fun lt!387936 () Unit!17991)

(declare-fun choose!11 (BitStream!10792) Unit!17991)

(assert (=> d!83612 (= lt!387936 (choose!11 lt!386775))))

(assert (=> d!83612 (= (lemmaIsPrefixRefl!0 lt!386775) lt!387936)))

(declare-fun bs!21154 () Bool)

(assert (= bs!21154 d!83612))

(assert (=> bs!21154 m!374041))

(declare-fun m!375295 () Bool)

(assert (=> bs!21154 m!375295))

(assert (=> d!83010 d!83612))

(declare-fun d!83614 () Bool)

(declare-fun res!208314 () Bool)

(declare-fun e!172447 () Bool)

(assert (=> d!83614 (=> (not res!208314) (not e!172447))))

(assert (=> d!83614 (= res!208314 (= (size!5935 (buf!6422 (_2!11559 lt!386531))) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83614 (= (isPrefixOf!0 (_2!11559 lt!386531) (_2!11559 lt!386531)) e!172447)))

(declare-fun b!248908 () Bool)

(declare-fun res!208313 () Bool)

(assert (=> b!248908 (=> (not res!208313) (not e!172447))))

(assert (=> b!248908 (= res!208313 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248909 () Bool)

(declare-fun e!172448 () Bool)

(assert (=> b!248909 (= e!172447 e!172448)))

(declare-fun res!208312 () Bool)

(assert (=> b!248909 (=> res!208312 e!172448)))

(assert (=> b!248909 (= res!208312 (= (size!5935 (buf!6422 (_2!11559 lt!386531))) #b00000000000000000000000000000000))))

(declare-fun b!248910 () Bool)

(assert (=> b!248910 (= e!172448 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(assert (= (and d!83614 res!208314) b!248908))

(assert (= (and b!248908 res!208313) b!248909))

(assert (= (and b!248909 (not res!208312)) b!248910))

(assert (=> b!248908 m!373765))

(assert (=> b!248908 m!373765))

(assert (=> b!248910 m!373765))

(assert (=> b!248910 m!373765))

(declare-fun m!375297 () Bool)

(assert (=> b!248910 m!375297))

(assert (=> d!83010 d!83614))

(declare-fun d!83616 () Bool)

(assert (=> d!83616 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386539))))

(declare-fun lt!387937 () Unit!17991)

(assert (=> d!83616 (= lt!387937 (choose!11 (_2!11559 lt!386539)))))

(assert (=> d!83616 (= (lemmaIsPrefixRefl!0 (_2!11559 lt!386539)) lt!387937)))

(declare-fun bs!21155 () Bool)

(assert (= bs!21155 d!83616))

(assert (=> bs!21155 m!374035))

(declare-fun m!375299 () Bool)

(assert (=> bs!21155 m!375299))

(assert (=> d!83010 d!83616))

(declare-fun d!83618 () Bool)

(assert (=> d!83618 (isPrefixOf!0 (_2!11559 lt!386531) (_2!11559 lt!386531))))

(declare-fun lt!387938 () Unit!17991)

(assert (=> d!83618 (= lt!387938 (choose!11 (_2!11559 lt!386531)))))

(assert (=> d!83618 (= (lemmaIsPrefixRefl!0 (_2!11559 lt!386531)) lt!387938)))

(declare-fun bs!21156 () Bool)

(assert (= bs!21156 d!83618))

(assert (=> bs!21156 m!374033))

(declare-fun m!375301 () Bool)

(assert (=> bs!21156 m!375301))

(assert (=> d!83010 d!83618))

(declare-fun d!83620 () Bool)

(declare-fun res!208317 () Bool)

(declare-fun e!172449 () Bool)

(assert (=> d!83620 (=> (not res!208317) (not e!172449))))

(assert (=> d!83620 (= res!208317 (= (size!5935 (buf!6422 (_1!11557 lt!386770))) (size!5935 (buf!6422 (_2!11557 lt!386770)))))))

(assert (=> d!83620 (= (isPrefixOf!0 (_1!11557 lt!386770) (_2!11557 lt!386770)) e!172449)))

(declare-fun b!248911 () Bool)

(declare-fun res!208316 () Bool)

(assert (=> b!248911 (=> (not res!208316) (not e!172449))))

(assert (=> b!248911 (= res!208316 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386770))) (currentByte!11838 (_1!11557 lt!386770)) (currentBit!11833 (_1!11557 lt!386770))) (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386770))) (currentByte!11838 (_2!11557 lt!386770)) (currentBit!11833 (_2!11557 lt!386770)))))))

(declare-fun b!248912 () Bool)

(declare-fun e!172450 () Bool)

(assert (=> b!248912 (= e!172449 e!172450)))

(declare-fun res!208315 () Bool)

(assert (=> b!248912 (=> res!208315 e!172450)))

(assert (=> b!248912 (= res!208315 (= (size!5935 (buf!6422 (_1!11557 lt!386770))) #b00000000000000000000000000000000))))

(declare-fun b!248913 () Bool)

(assert (=> b!248913 (= e!172450 (arrayBitRangesEq!0 (buf!6422 (_1!11557 lt!386770)) (buf!6422 (_2!11557 lt!386770)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386770))) (currentByte!11838 (_1!11557 lt!386770)) (currentBit!11833 (_1!11557 lt!386770)))))))

(assert (= (and d!83620 res!208317) b!248911))

(assert (= (and b!248911 res!208316) b!248912))

(assert (= (and b!248912 (not res!208315)) b!248913))

(declare-fun m!375303 () Bool)

(assert (=> b!248911 m!375303))

(assert (=> b!248911 m!375233))

(assert (=> b!248913 m!375303))

(assert (=> b!248913 m!375303))

(declare-fun m!375305 () Bool)

(assert (=> b!248913 m!375305))

(assert (=> d!83010 d!83620))

(declare-fun d!83622 () Bool)

(declare-fun res!208320 () Bool)

(declare-fun e!172451 () Bool)

(assert (=> d!83622 (=> (not res!208320) (not e!172451))))

(assert (=> d!83622 (= res!208320 (= (size!5935 (buf!6422 lt!386775)) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83622 (= (isPrefixOf!0 lt!386775 (_2!11559 lt!386531)) e!172451)))

(declare-fun b!248914 () Bool)

(declare-fun res!208319 () Bool)

(assert (=> b!248914 (=> (not res!208319) (not e!172451))))

(assert (=> b!248914 (= res!208319 (bvsle (bitIndex!0 (size!5935 (buf!6422 lt!386775)) (currentByte!11838 lt!386775) (currentBit!11833 lt!386775)) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248915 () Bool)

(declare-fun e!172452 () Bool)

(assert (=> b!248915 (= e!172451 e!172452)))

(declare-fun res!208318 () Bool)

(assert (=> b!248915 (=> res!208318 e!172452)))

(assert (=> b!248915 (= res!208318 (= (size!5935 (buf!6422 lt!386775)) #b00000000000000000000000000000000))))

(declare-fun b!248916 () Bool)

(assert (=> b!248916 (= e!172452 (arrayBitRangesEq!0 (buf!6422 lt!386775) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 lt!386775)) (currentByte!11838 lt!386775) (currentBit!11833 lt!386775))))))

(assert (= (and d!83622 res!208320) b!248914))

(assert (= (and b!248914 res!208319) b!248915))

(assert (= (and b!248915 (not res!208318)) b!248916))

(declare-fun m!375307 () Bool)

(assert (=> b!248914 m!375307))

(assert (=> b!248914 m!373765))

(assert (=> b!248916 m!375307))

(assert (=> b!248916 m!375307))

(declare-fun m!375309 () Bool)

(assert (=> b!248916 m!375309))

(assert (=> d!83010 d!83622))

(declare-fun d!83624 () Bool)

(declare-fun res!208323 () Bool)

(declare-fun e!172453 () Bool)

(assert (=> d!83624 (=> (not res!208323) (not e!172453))))

(assert (=> d!83624 (= res!208323 (= (size!5935 (buf!6422 lt!386775)) (size!5935 (buf!6422 lt!386775))))))

(assert (=> d!83624 (= (isPrefixOf!0 lt!386775 lt!386775) e!172453)))

(declare-fun b!248917 () Bool)

(declare-fun res!208322 () Bool)

(assert (=> b!248917 (=> (not res!208322) (not e!172453))))

(assert (=> b!248917 (= res!208322 (bvsle (bitIndex!0 (size!5935 (buf!6422 lt!386775)) (currentByte!11838 lt!386775) (currentBit!11833 lt!386775)) (bitIndex!0 (size!5935 (buf!6422 lt!386775)) (currentByte!11838 lt!386775) (currentBit!11833 lt!386775))))))

(declare-fun b!248918 () Bool)

(declare-fun e!172454 () Bool)

(assert (=> b!248918 (= e!172453 e!172454)))

(declare-fun res!208321 () Bool)

(assert (=> b!248918 (=> res!208321 e!172454)))

(assert (=> b!248918 (= res!208321 (= (size!5935 (buf!6422 lt!386775)) #b00000000000000000000000000000000))))

(declare-fun b!248919 () Bool)

(assert (=> b!248919 (= e!172454 (arrayBitRangesEq!0 (buf!6422 lt!386775) (buf!6422 lt!386775) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 lt!386775)) (currentByte!11838 lt!386775) (currentBit!11833 lt!386775))))))

(assert (= (and d!83624 res!208323) b!248917))

(assert (= (and b!248917 res!208322) b!248918))

(assert (= (and b!248918 (not res!208321)) b!248919))

(assert (=> b!248917 m!375307))

(assert (=> b!248917 m!375307))

(assert (=> b!248919 m!375307))

(assert (=> b!248919 m!375307))

(declare-fun m!375311 () Bool)

(assert (=> b!248919 m!375311))

(assert (=> d!83010 d!83624))

(declare-fun d!83626 () Bool)

(declare-fun res!208326 () Bool)

(declare-fun e!172455 () Bool)

(assert (=> d!83626 (=> (not res!208326) (not e!172455))))

(assert (=> d!83626 (= res!208326 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (=> d!83626 (= (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386539)) e!172455)))

(declare-fun b!248920 () Bool)

(declare-fun res!208325 () Bool)

(assert (=> b!248920 (=> (not res!208325) (not e!172455))))

(assert (=> b!248920 (= res!208325 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(declare-fun b!248921 () Bool)

(declare-fun e!172456 () Bool)

(assert (=> b!248921 (= e!172455 e!172456)))

(declare-fun res!208324 () Bool)

(assert (=> b!248921 (=> res!208324 e!172456)))

(assert (=> b!248921 (= res!208324 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) #b00000000000000000000000000000000))))

(declare-fun b!248922 () Bool)

(assert (=> b!248922 (= e!172456 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (= (and d!83626 res!208326) b!248920))

(assert (= (and b!248920 res!208325) b!248921))

(assert (= (and b!248921 (not res!208324)) b!248922))

(assert (=> b!248920 m!373757))

(assert (=> b!248920 m!373757))

(assert (=> b!248922 m!373757))

(assert (=> b!248922 m!373757))

(declare-fun m!375313 () Bool)

(assert (=> b!248922 m!375313))

(assert (=> d!83010 d!83626))

(declare-fun d!83628 () Bool)

(assert (=> d!83628 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) ((_ sign_extend 32) (currentByte!11838 thiss!1005)) ((_ sign_extend 32) (currentBit!11833 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386531)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 thiss!1005)))))))

(assert (=> d!83022 d!83628))

(declare-fun d!83630 () Bool)

(declare-fun e!172457 () Bool)

(assert (=> d!83630 e!172457))

(declare-fun res!208328 () Bool)

(assert (=> d!83630 (=> (not res!208328) (not e!172457))))

(declare-fun lt!387941 () (_ BitVec 64))

(declare-fun lt!387939 () (_ BitVec 64))

(declare-fun lt!387943 () (_ BitVec 64))

(assert (=> d!83630 (= res!208328 (= lt!387943 (bvsub lt!387941 lt!387939)))))

(assert (=> d!83630 (or (= (bvand lt!387941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387941 lt!387939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83630 (= lt!387939 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386813)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386813))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386813)))))))

(declare-fun lt!387942 () (_ BitVec 64))

(declare-fun lt!387940 () (_ BitVec 64))

(assert (=> d!83630 (= lt!387941 (bvmul lt!387942 lt!387940))))

(assert (=> d!83630 (or (= lt!387942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387940 (bvsdiv (bvmul lt!387942 lt!387940) lt!387942)))))

(assert (=> d!83630 (= lt!387940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83630 (= lt!387942 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(assert (=> d!83630 (= lt!387943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386813))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386813)))))))

(assert (=> d!83630 (invariant!0 (currentBit!11833 (_2!11559 lt!386813)) (currentByte!11838 (_2!11559 lt!386813)) (size!5935 (buf!6422 (_2!11559 lt!386813))))))

(assert (=> d!83630 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386813))) (currentByte!11838 (_2!11559 lt!386813)) (currentBit!11833 (_2!11559 lt!386813))) lt!387943)))

(declare-fun b!248923 () Bool)

(declare-fun res!208327 () Bool)

(assert (=> b!248923 (=> (not res!208327) (not e!172457))))

(assert (=> b!248923 (= res!208327 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387943))))

(declare-fun b!248924 () Bool)

(declare-fun lt!387944 () (_ BitVec 64))

(assert (=> b!248924 (= e!172457 (bvsle lt!387943 (bvmul lt!387944 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248924 (or (= lt!387944 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387944 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387944)))))

(assert (=> b!248924 (= lt!387944 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(assert (= (and d!83630 res!208328) b!248923))

(assert (= (and b!248923 res!208327) b!248924))

(declare-fun m!375315 () Bool)

(assert (=> d!83630 m!375315))

(assert (=> d!83630 m!375211))

(assert (=> b!248180 d!83630))

(assert (=> b!248180 d!82998))

(declare-fun d!83632 () Bool)

(assert (=> d!83632 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21157 () Bool)

(assert (= bs!21157 d!83632))

(assert (=> bs!21157 m!373999))

(assert (=> b!248202 d!83632))

(declare-fun d!83634 () Bool)

(declare-fun e!172458 () Bool)

(assert (=> d!83634 e!172458))

(declare-fun res!208330 () Bool)

(assert (=> d!83634 (=> (not res!208330) (not e!172458))))

(declare-fun lt!387947 () (_ BitVec 64))

(declare-fun lt!387949 () (_ BitVec 64))

(declare-fun lt!387945 () (_ BitVec 64))

(assert (=> d!83634 (= res!208330 (= lt!387949 (bvsub lt!387947 lt!387945)))))

(assert (=> d!83634 (or (= (bvand lt!387947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387947 lt!387945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83634 (= lt!387945 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386811)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386811))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386811)))))))

(declare-fun lt!387948 () (_ BitVec 64))

(declare-fun lt!387946 () (_ BitVec 64))

(assert (=> d!83634 (= lt!387947 (bvmul lt!387948 lt!387946))))

(assert (=> d!83634 (or (= lt!387948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387946 (bvsdiv (bvmul lt!387948 lt!387946) lt!387948)))))

(assert (=> d!83634 (= lt!387946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83634 (= lt!387948 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386811)))))))

(assert (=> d!83634 (= lt!387949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386811))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386811)))))))

(assert (=> d!83634 (invariant!0 (currentBit!11833 (_1!11558 lt!386811)) (currentByte!11838 (_1!11558 lt!386811)) (size!5935 (buf!6422 (_1!11558 lt!386811))))))

(assert (=> d!83634 (= (bitIndex!0 (size!5935 (buf!6422 (_1!11558 lt!386811))) (currentByte!11838 (_1!11558 lt!386811)) (currentBit!11833 (_1!11558 lt!386811))) lt!387949)))

(declare-fun b!248925 () Bool)

(declare-fun res!208329 () Bool)

(assert (=> b!248925 (=> (not res!208329) (not e!172458))))

(assert (=> b!248925 (= res!208329 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387949))))

(declare-fun b!248926 () Bool)

(declare-fun lt!387950 () (_ BitVec 64))

(assert (=> b!248926 (= e!172458 (bvsle lt!387949 (bvmul lt!387950 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248926 (or (= lt!387950 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387950 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387950)))))

(assert (=> b!248926 (= lt!387950 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386811)))))))

(assert (= (and d!83634 res!208330) b!248925))

(assert (= (and b!248925 res!208329) b!248926))

(declare-fun m!375317 () Bool)

(assert (=> d!83634 m!375317))

(declare-fun m!375319 () Bool)

(assert (=> d!83634 m!375319))

(assert (=> b!248183 d!83634))

(assert (=> b!248183 d!83630))

(declare-fun d!83636 () Bool)

(declare-fun e!172459 () Bool)

(assert (=> d!83636 e!172459))

(declare-fun res!208332 () Bool)

(assert (=> d!83636 (=> (not res!208332) (not e!172459))))

(declare-fun lt!387953 () (_ BitVec 64))

(declare-fun lt!387955 () (_ BitVec 64))

(declare-fun lt!387951 () (_ BitVec 64))

(assert (=> d!83636 (= res!208332 (= lt!387955 (bvsub lt!387953 lt!387951)))))

(assert (=> d!83636 (or (= (bvand lt!387953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387951 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387953 lt!387951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83636 (= lt!387951 (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386862))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386862)))))))

(declare-fun lt!387954 () (_ BitVec 64))

(declare-fun lt!387952 () (_ BitVec 64))

(assert (=> d!83636 (= lt!387953 (bvmul lt!387954 lt!387952))))

(assert (=> d!83636 (or (= lt!387954 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!387952 (bvsdiv (bvmul lt!387954 lt!387952) lt!387954)))))

(assert (=> d!83636 (= lt!387952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83636 (= lt!387954 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))))))

(assert (=> d!83636 (= lt!387955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386862))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386862)))))))

(assert (=> d!83636 (invariant!0 (currentBit!11833 (_2!11559 lt!386862)) (currentByte!11838 (_2!11559 lt!386862)) (size!5935 (buf!6422 (_2!11559 lt!386862))))))

(assert (=> d!83636 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386862))) (currentByte!11838 (_2!11559 lt!386862)) (currentBit!11833 (_2!11559 lt!386862))) lt!387955)))

(declare-fun b!248927 () Bool)

(declare-fun res!208331 () Bool)

(assert (=> b!248927 (=> (not res!208331) (not e!172459))))

(assert (=> b!248927 (= res!208331 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!387955))))

(declare-fun b!248928 () Bool)

(declare-fun lt!387956 () (_ BitVec 64))

(assert (=> b!248928 (= e!172459 (bvsle lt!387955 (bvmul lt!387956 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248928 (or (= lt!387956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!387956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!387956)))))

(assert (=> b!248928 (= lt!387956 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))))))

(assert (= (and d!83636 res!208332) b!248927))

(assert (= (and b!248927 res!208331) b!248928))

(declare-fun m!375321 () Bool)

(assert (=> d!83636 m!375321))

(declare-fun m!375323 () Bool)

(assert (=> d!83636 m!375323))

(assert (=> b!248196 d!83636))

(assert (=> b!248196 d!82996))

(declare-fun d!83638 () Bool)

(declare-fun e!172460 () Bool)

(assert (=> d!83638 e!172460))

(declare-fun res!208333 () Bool)

(assert (=> d!83638 (=> (not res!208333) (not e!172460))))

(assert (=> d!83638 (= res!208333 (= (buf!6422 (_2!11559 (increaseBitIndex!0 (_1!11557 lt!386544)))) (buf!6422 (_1!11557 lt!386544))))))

(declare-fun lt!387959 () Bool)

(assert (=> d!83638 (= lt!387959 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (_1!11557 lt!386544))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387962 () tuple2!21288)

(assert (=> d!83638 (= lt!387962 (tuple2!21289 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (_1!11557 lt!386544))))) #b00000000000000000000000000000000)) (_2!11559 (increaseBitIndex!0 (_1!11557 lt!386544)))))))

(assert (=> d!83638 (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11557 lt!386544)))) ((_ sign_extend 32) (currentByte!11838 (_1!11557 lt!386544))) ((_ sign_extend 32) (currentBit!11833 (_1!11557 lt!386544))))))

(assert (=> d!83638 (= (readBit!0 (_1!11557 lt!386544)) lt!387962)))

(declare-fun lt!387960 () (_ BitVec 64))

(declare-fun lt!387963 () (_ BitVec 64))

(declare-fun b!248929 () Bool)

(assert (=> b!248929 (= e!172460 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 (increaseBitIndex!0 (_1!11557 lt!386544))))) (currentByte!11838 (_2!11559 (increaseBitIndex!0 (_1!11557 lt!386544)))) (currentBit!11833 (_2!11559 (increaseBitIndex!0 (_1!11557 lt!386544))))) (bvadd lt!387960 lt!387963)))))

(assert (=> b!248929 (or (not (= (bvand lt!387960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!387963 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!387960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!387960 lt!387963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248929 (= lt!387963 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248929 (= lt!387960 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)) (currentBit!11833 (_1!11557 lt!386544))))))

(declare-fun lt!387958 () Bool)

(assert (=> b!248929 (= lt!387958 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (_1!11557 lt!386544))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387961 () Bool)

(assert (=> b!248929 (= lt!387961 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (_1!11557 lt!386544))))) #b00000000000000000000000000000000)))))

(declare-fun lt!387957 () Bool)

(assert (=> b!248929 (= lt!387957 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (_1!11557 lt!386544))) (currentByte!11838 (_1!11557 lt!386544)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (_1!11557 lt!386544))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83638 res!208333) b!248929))

(declare-fun m!375325 () Bool)

(assert (=> d!83638 m!375325))

(declare-fun m!375327 () Bool)

(assert (=> d!83638 m!375327))

(declare-fun m!375329 () Bool)

(assert (=> d!83638 m!375329))

(declare-fun m!375331 () Bool)

(assert (=> d!83638 m!375331))

(assert (=> b!248929 m!375329))

(assert (=> b!248929 m!375327))

(declare-fun m!375333 () Bool)

(assert (=> b!248929 m!375333))

(assert (=> b!248929 m!375325))

(assert (=> b!248929 m!373979))

(assert (=> d!83028 d!83638))

(assert (=> b!248142 d!82996))

(assert (=> b!248142 d!83000))

(assert (=> b!248130 d!82998))

(assert (=> b!248130 d!82996))

(declare-fun d!83640 () Bool)

(assert (=> d!83640 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386539)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83640 true))

(declare-fun _$1!324 () Unit!17991)

(assert (=> d!83640 (= (choose!27 thiss!1005 (_2!11559 lt!386539) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!324)))

(declare-fun bs!21158 () Bool)

(assert (= bs!21158 d!83640))

(assert (=> bs!21158 m!374129))

(assert (=> d!83044 d!83640))

(declare-fun d!83642 () Bool)

(declare-fun res!208336 () Bool)

(declare-fun e!172461 () Bool)

(assert (=> d!83642 (=> (not res!208336) (not e!172461))))

(assert (=> d!83642 (= res!208336 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 (_2!11559 lt!386813)))))))

(assert (=> d!83642 (= (isPrefixOf!0 thiss!1005 (_2!11559 lt!386813)) e!172461)))

(declare-fun b!248930 () Bool)

(declare-fun res!208335 () Bool)

(assert (=> b!248930 (=> (not res!208335) (not e!172461))))

(assert (=> b!248930 (= res!208335 (bvsle (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386813))) (currentByte!11838 (_2!11559 lt!386813)) (currentBit!11833 (_2!11559 lt!386813)))))))

(declare-fun b!248931 () Bool)

(declare-fun e!172462 () Bool)

(assert (=> b!248931 (= e!172461 e!172462)))

(declare-fun res!208334 () Bool)

(assert (=> b!248931 (=> res!208334 e!172462)))

(assert (=> b!248931 (= res!208334 (= (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248932 () Bool)

(assert (=> b!248932 (= e!172462 (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (= (and d!83642 res!208336) b!248930))

(assert (= (and b!248930 res!208335) b!248931))

(assert (= (and b!248931 (not res!208334)) b!248932))

(assert (=> b!248930 m!373759))

(assert (=> b!248930 m!374083))

(assert (=> b!248932 m!373759))

(assert (=> b!248932 m!373759))

(declare-fun m!375335 () Bool)

(assert (=> b!248932 m!375335))

(assert (=> b!248181 d!83642))

(assert (=> d!83006 d!83574))

(declare-fun d!83644 () Bool)

(declare-fun res!208339 () Bool)

(declare-fun e!172463 () Bool)

(assert (=> d!83644 (=> (not res!208339) (not e!172463))))

(assert (=> d!83644 (= res!208339 (= (size!5935 (buf!6422 (_2!11557 lt!386770))) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83644 (= (isPrefixOf!0 (_2!11557 lt!386770) (_2!11559 lt!386531)) e!172463)))

(declare-fun b!248933 () Bool)

(declare-fun res!208338 () Bool)

(assert (=> b!248933 (=> (not res!208338) (not e!172463))))

(assert (=> b!248933 (= res!208338 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386770))) (currentByte!11838 (_2!11557 lt!386770)) (currentBit!11833 (_2!11557 lt!386770))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248934 () Bool)

(declare-fun e!172464 () Bool)

(assert (=> b!248934 (= e!172463 e!172464)))

(declare-fun res!208337 () Bool)

(assert (=> b!248934 (=> res!208337 e!172464)))

(assert (=> b!248934 (= res!208337 (= (size!5935 (buf!6422 (_2!11557 lt!386770))) #b00000000000000000000000000000000))))

(declare-fun b!248935 () Bool)

(assert (=> b!248935 (= e!172464 (arrayBitRangesEq!0 (buf!6422 (_2!11557 lt!386770)) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386770))) (currentByte!11838 (_2!11557 lt!386770)) (currentBit!11833 (_2!11557 lt!386770)))))))

(assert (= (and d!83644 res!208339) b!248933))

(assert (= (and b!248933 res!208338) b!248934))

(assert (= (and b!248934 (not res!208337)) b!248935))

(assert (=> b!248933 m!375233))

(assert (=> b!248933 m!373765))

(assert (=> b!248935 m!375233))

(assert (=> b!248935 m!375233))

(declare-fun m!375337 () Bool)

(assert (=> b!248935 m!375337))

(assert (=> b!248161 d!83644))

(declare-fun d!83646 () Bool)

(assert (=> d!83646 (isPrefixOf!0 lt!386796 (_2!11559 lt!386531))))

(declare-fun lt!387964 () Unit!17991)

(assert (=> d!83646 (= lt!387964 (choose!30 lt!386796 (_2!11559 lt!386531) (_2!11559 lt!386531)))))

(assert (=> d!83646 (isPrefixOf!0 lt!386796 (_2!11559 lt!386531))))

(assert (=> d!83646 (= (lemmaIsPrefixTransitive!0 lt!386796 (_2!11559 lt!386531) (_2!11559 lt!386531)) lt!387964)))

(declare-fun bs!21159 () Bool)

(assert (= bs!21159 d!83646))

(assert (=> bs!21159 m!374055))

(declare-fun m!375339 () Bool)

(assert (=> bs!21159 m!375339))

(assert (=> bs!21159 m!374055))

(assert (=> d!83014 d!83646))

(declare-fun d!83648 () Bool)

(declare-fun res!208342 () Bool)

(declare-fun e!172465 () Bool)

(assert (=> d!83648 (=> (not res!208342) (not e!172465))))

(assert (=> d!83648 (= res!208342 (= (size!5935 (buf!6422 lt!386796)) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83648 (= (isPrefixOf!0 lt!386796 (_2!11559 lt!386531)) e!172465)))

(declare-fun b!248936 () Bool)

(declare-fun res!208341 () Bool)

(assert (=> b!248936 (=> (not res!208341) (not e!172465))))

(assert (=> b!248936 (= res!208341 (bvsle (bitIndex!0 (size!5935 (buf!6422 lt!386796)) (currentByte!11838 lt!386796) (currentBit!11833 lt!386796)) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248937 () Bool)

(declare-fun e!172466 () Bool)

(assert (=> b!248937 (= e!172465 e!172466)))

(declare-fun res!208340 () Bool)

(assert (=> b!248937 (=> res!208340 e!172466)))

(assert (=> b!248937 (= res!208340 (= (size!5935 (buf!6422 lt!386796)) #b00000000000000000000000000000000))))

(declare-fun b!248938 () Bool)

(assert (=> b!248938 (= e!172466 (arrayBitRangesEq!0 (buf!6422 lt!386796) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 lt!386796)) (currentByte!11838 lt!386796) (currentBit!11833 lt!386796))))))

(assert (= (and d!83648 res!208342) b!248936))

(assert (= (and b!248936 res!208341) b!248937))

(assert (= (and b!248937 (not res!208340)) b!248938))

(declare-fun m!375341 () Bool)

(assert (=> b!248936 m!375341))

(assert (=> b!248936 m!373765))

(assert (=> b!248938 m!375341))

(assert (=> b!248938 m!375341))

(declare-fun m!375343 () Bool)

(assert (=> b!248938 m!375343))

(assert (=> d!83014 d!83648))

(declare-fun d!83650 () Bool)

(declare-fun res!208345 () Bool)

(declare-fun e!172467 () Bool)

(assert (=> d!83650 (=> (not res!208345) (not e!172467))))

(assert (=> d!83650 (= res!208345 (= (size!5935 (buf!6422 thiss!1005)) (size!5935 (buf!6422 thiss!1005))))))

(assert (=> d!83650 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!172467)))

(declare-fun b!248939 () Bool)

(declare-fun res!208344 () Bool)

(assert (=> b!248939 (=> (not res!208344) (not e!172467))))

(assert (=> b!248939 (= res!208344 (bvsle (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(declare-fun b!248940 () Bool)

(declare-fun e!172468 () Bool)

(assert (=> b!248940 (= e!172467 e!172468)))

(declare-fun res!208343 () Bool)

(assert (=> b!248940 (=> res!208343 e!172468)))

(assert (=> b!248940 (= res!208343 (= (size!5935 (buf!6422 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!248941 () Bool)

(assert (=> b!248941 (= e!172468 (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (= (and d!83650 res!208345) b!248939))

(assert (= (and b!248939 res!208344) b!248940))

(assert (= (and b!248940 (not res!208343)) b!248941))

(assert (=> b!248939 m!373759))

(assert (=> b!248939 m!373759))

(assert (=> b!248941 m!373759))

(assert (=> b!248941 m!373759))

(declare-fun m!375345 () Bool)

(assert (=> b!248941 m!375345))

(assert (=> d!83014 d!83650))

(assert (=> d!83014 d!83054))

(assert (=> d!83014 d!83614))

(declare-fun d!83652 () Bool)

(assert (=> d!83652 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!387965 () Unit!17991)

(assert (=> d!83652 (= lt!387965 (choose!11 thiss!1005))))

(assert (=> d!83652 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!387965)))

(declare-fun bs!21160 () Bool)

(assert (= bs!21160 d!83652))

(assert (=> bs!21160 m!374065))

(declare-fun m!375347 () Bool)

(assert (=> bs!21160 m!375347))

(assert (=> d!83014 d!83652))

(declare-fun d!83654 () Bool)

(assert (=> d!83654 (isPrefixOf!0 lt!386796 lt!386796)))

(declare-fun lt!387966 () Unit!17991)

(assert (=> d!83654 (= lt!387966 (choose!11 lt!386796))))

(assert (=> d!83654 (= (lemmaIsPrefixRefl!0 lt!386796) lt!387966)))

(declare-fun bs!21161 () Bool)

(assert (= bs!21161 d!83654))

(assert (=> bs!21161 m!374069))

(declare-fun m!375349 () Bool)

(assert (=> bs!21161 m!375349))

(assert (=> d!83014 d!83654))

(declare-fun d!83656 () Bool)

(declare-fun res!208348 () Bool)

(declare-fun e!172469 () Bool)

(assert (=> d!83656 (=> (not res!208348) (not e!172469))))

(assert (=> d!83656 (= res!208348 (= (size!5935 (buf!6422 lt!386796)) (size!5935 (buf!6422 lt!386796))))))

(assert (=> d!83656 (= (isPrefixOf!0 lt!386796 lt!386796) e!172469)))

(declare-fun b!248942 () Bool)

(declare-fun res!208347 () Bool)

(assert (=> b!248942 (=> (not res!208347) (not e!172469))))

(assert (=> b!248942 (= res!208347 (bvsle (bitIndex!0 (size!5935 (buf!6422 lt!386796)) (currentByte!11838 lt!386796) (currentBit!11833 lt!386796)) (bitIndex!0 (size!5935 (buf!6422 lt!386796)) (currentByte!11838 lt!386796) (currentBit!11833 lt!386796))))))

(declare-fun b!248943 () Bool)

(declare-fun e!172470 () Bool)

(assert (=> b!248943 (= e!172469 e!172470)))

(declare-fun res!208346 () Bool)

(assert (=> b!248943 (=> res!208346 e!172470)))

(assert (=> b!248943 (= res!208346 (= (size!5935 (buf!6422 lt!386796)) #b00000000000000000000000000000000))))

(declare-fun b!248944 () Bool)

(assert (=> b!248944 (= e!172470 (arrayBitRangesEq!0 (buf!6422 lt!386796) (buf!6422 lt!386796) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 lt!386796)) (currentByte!11838 lt!386796) (currentBit!11833 lt!386796))))))

(assert (= (and d!83656 res!208348) b!248942))

(assert (= (and b!248942 res!208347) b!248943))

(assert (= (and b!248943 (not res!208346)) b!248944))

(assert (=> b!248942 m!375341))

(assert (=> b!248942 m!375341))

(assert (=> b!248944 m!375341))

(assert (=> b!248944 m!375341))

(declare-fun m!375351 () Bool)

(assert (=> b!248944 m!375351))

(assert (=> d!83014 d!83656))

(assert (=> d!83014 d!83618))

(declare-fun d!83658 () Bool)

(assert (=> d!83658 (isPrefixOf!0 lt!386796 (_2!11559 lt!386531))))

(declare-fun lt!387967 () Unit!17991)

(assert (=> d!83658 (= lt!387967 (choose!30 lt!386796 thiss!1005 (_2!11559 lt!386531)))))

(assert (=> d!83658 (isPrefixOf!0 lt!386796 thiss!1005)))

(assert (=> d!83658 (= (lemmaIsPrefixTransitive!0 lt!386796 thiss!1005 (_2!11559 lt!386531)) lt!387967)))

(declare-fun bs!21162 () Bool)

(assert (= bs!21162 d!83658))

(assert (=> bs!21162 m!374055))

(declare-fun m!375353 () Bool)

(assert (=> bs!21162 m!375353))

(declare-fun m!375355 () Bool)

(assert (=> bs!21162 m!375355))

(assert (=> d!83014 d!83658))

(declare-fun d!83660 () Bool)

(declare-fun res!208351 () Bool)

(declare-fun e!172471 () Bool)

(assert (=> d!83660 (=> (not res!208351) (not e!172471))))

(assert (=> d!83660 (= res!208351 (= (size!5935 (buf!6422 (_1!11557 lt!386791))) (size!5935 (buf!6422 (_2!11557 lt!386791)))))))

(assert (=> d!83660 (= (isPrefixOf!0 (_1!11557 lt!386791) (_2!11557 lt!386791)) e!172471)))

(declare-fun b!248945 () Bool)

(declare-fun res!208350 () Bool)

(assert (=> b!248945 (=> (not res!208350) (not e!172471))))

(assert (=> b!248945 (= res!208350 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386791))) (currentByte!11838 (_1!11557 lt!386791)) (currentBit!11833 (_1!11557 lt!386791))) (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386791))) (currentByte!11838 (_2!11557 lt!386791)) (currentBit!11833 (_2!11557 lt!386791)))))))

(declare-fun b!248946 () Bool)

(declare-fun e!172472 () Bool)

(assert (=> b!248946 (= e!172471 e!172472)))

(declare-fun res!208349 () Bool)

(assert (=> b!248946 (=> res!208349 e!172472)))

(assert (=> b!248946 (= res!208349 (= (size!5935 (buf!6422 (_1!11557 lt!386791))) #b00000000000000000000000000000000))))

(declare-fun b!248947 () Bool)

(assert (=> b!248947 (= e!172472 (arrayBitRangesEq!0 (buf!6422 (_1!11557 lt!386791)) (buf!6422 (_2!11557 lt!386791)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386791))) (currentByte!11838 (_1!11557 lt!386791)) (currentBit!11833 (_1!11557 lt!386791)))))))

(assert (= (and d!83660 res!208351) b!248945))

(assert (= (and b!248945 res!208350) b!248946))

(assert (= (and b!248946 (not res!208349)) b!248947))

(assert (=> b!248945 m!375285))

(assert (=> b!248945 m!375159))

(assert (=> b!248947 m!375285))

(assert (=> b!248947 m!375285))

(declare-fun m!375357 () Bool)

(assert (=> b!248947 m!375357))

(assert (=> d!83014 d!83660))

(declare-fun b!248949 () Bool)

(declare-fun e!172474 () Bool)

(declare-fun e!172477 () Bool)

(assert (=> b!248949 (= e!172474 e!172477)))

(declare-fun res!208356 () Bool)

(assert (=> b!248949 (=> (not res!208356) (not e!172477))))

(declare-fun e!172473 () Bool)

(assert (=> b!248949 (= res!208356 e!172473)))

(declare-fun res!208353 () Bool)

(assert (=> b!248949 (=> res!208353 e!172473)))

(declare-fun lt!387968 () tuple4!288)

(assert (=> b!248949 (= res!208353 (bvsge (_1!11571 lt!387968) (_2!11571 lt!387968)))))

(declare-fun lt!387970 () (_ BitVec 32))

(assert (=> b!248949 (= lt!387970 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387969 () (_ BitVec 32))

(assert (=> b!248949 (= lt!387969 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248949 (= lt!387968 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(declare-fun b!248950 () Bool)

(declare-fun res!208352 () Bool)

(assert (=> b!248950 (= res!208352 (= lt!387970 #b00000000000000000000000000000000))))

(declare-fun e!172476 () Bool)

(assert (=> b!248950 (=> res!208352 e!172476)))

(declare-fun e!172478 () Bool)

(assert (=> b!248950 (= e!172478 e!172476)))

(declare-fun b!248951 () Bool)

(assert (=> b!248951 (= e!172473 (arrayRangesEq!921 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) (_1!11571 lt!387968) (_2!11571 lt!387968)))))

(declare-fun b!248952 () Bool)

(declare-fun e!172475 () Bool)

(assert (=> b!248952 (= e!172475 e!172478)))

(declare-fun res!208354 () Bool)

(assert (=> b!248952 (= res!208354 (byteRangesEq!0 (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!387968)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!387968)) lt!387969 #b00000000000000000000000000001000))))

(assert (=> b!248952 (=> (not res!208354) (not e!172478))))

(declare-fun b!248953 () Bool)

(declare-fun call!3954 () Bool)

(assert (=> b!248953 (= e!172476 call!3954)))

(declare-fun b!248954 () Bool)

(assert (=> b!248954 (= e!172475 call!3954)))

(declare-fun bm!3951 () Bool)

(declare-fun c!11581 () Bool)

(assert (=> bm!3951 (= call!3954 (byteRangesEq!0 (ite c!11581 (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!387968)) (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_4!144 lt!387968))) (ite c!11581 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!387968)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_4!144 lt!387968))) (ite c!11581 lt!387969 #b00000000000000000000000000000000) lt!387970))))

(declare-fun b!248948 () Bool)

(assert (=> b!248948 (= e!172477 e!172475)))

(assert (=> b!248948 (= c!11581 (= (_3!924 lt!387968) (_4!144 lt!387968)))))

(declare-fun d!83662 () Bool)

(declare-fun res!208355 () Bool)

(assert (=> d!83662 (=> res!208355 e!172474)))

(assert (=> d!83662 (= res!208355 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (=> d!83662 (= (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))) e!172474)))

(assert (= (and d!83662 (not res!208355)) b!248949))

(assert (= (and b!248949 (not res!208353)) b!248951))

(assert (= (and b!248949 res!208356) b!248948))

(assert (= (and b!248948 c!11581) b!248954))

(assert (= (and b!248948 (not c!11581)) b!248952))

(assert (= (and b!248952 res!208354) b!248950))

(assert (= (and b!248950 (not res!208352)) b!248953))

(assert (= (or b!248954 b!248953) bm!3951))

(assert (=> b!248949 m!373757))

(declare-fun m!375359 () Bool)

(assert (=> b!248949 m!375359))

(declare-fun m!375361 () Bool)

(assert (=> b!248951 m!375361))

(declare-fun m!375363 () Bool)

(assert (=> b!248952 m!375363))

(declare-fun m!375365 () Bool)

(assert (=> b!248952 m!375365))

(assert (=> b!248952 m!375363))

(assert (=> b!248952 m!375365))

(declare-fun m!375367 () Bool)

(assert (=> b!248952 m!375367))

(assert (=> bm!3951 m!375365))

(declare-fun m!375369 () Bool)

(assert (=> bm!3951 m!375369))

(assert (=> bm!3951 m!375363))

(declare-fun m!375371 () Bool)

(assert (=> bm!3951 m!375371))

(declare-fun m!375373 () Bool)

(assert (=> bm!3951 m!375373))

(assert (=> b!248144 d!83662))

(assert (=> b!248144 d!82996))

(declare-fun d!83664 () Bool)

(declare-fun e!172487 () Bool)

(assert (=> d!83664 e!172487))

(declare-fun res!208364 () Bool)

(assert (=> d!83664 (=> (not res!208364) (not e!172487))))

(declare-fun _$23!30 () tuple2!21274)

(assert (=> d!83664 (= res!208364 (= (size!5935 (buf!6422 (_2!11559 lt!386539))) (size!5935 (buf!6422 (_2!11559 _$23!30)))))))

(declare-fun e!172486 () Bool)

(assert (=> d!83664 (and (inv!12 (_2!11559 _$23!30)) e!172486)))

(assert (=> d!83664 (= (choose!51 (_2!11559 lt!386539) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!30)))

(declare-fun b!248963 () Bool)

(assert (=> b!248963 (= e!172486 (array_inv!5676 (buf!6422 (_2!11559 _$23!30))))))

(declare-fun b!248966 () Bool)

(declare-fun lt!387981 () tuple2!21272)

(declare-fun lt!387985 () tuple2!21270)

(assert (=> b!248966 (= e!172487 (and (_2!11558 lt!387981) (= (_1!11558 lt!387981) (_2!11557 lt!387985))))))

(assert (=> b!248966 (= lt!387981 (checkBitsLoopPure!0 (_1!11557 lt!387985) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!387983 () Unit!17991)

(declare-fun lt!387982 () Unit!17991)

(assert (=> b!248966 (= lt!387983 lt!387982)))

(declare-fun lt!387984 () (_ BitVec 64))

(assert (=> b!248966 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 _$23!30)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!387984)))

(assert (=> b!248966 (= lt!387982 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 _$23!30)) lt!387984))))

(assert (=> b!248966 (= lt!387984 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!248966 (= lt!387985 (reader!0 (_2!11559 lt!386539) (_2!11559 _$23!30)))))

(declare-fun b!248964 () Bool)

(declare-fun res!208363 () Bool)

(assert (=> b!248964 (=> (not res!208363) (not e!172487))))

(assert (=> b!248964 (= res!208363 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 _$23!30))) (currentByte!11838 (_2!11559 _$23!30)) (currentBit!11833 (_2!11559 _$23!30))) (bvadd (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!248965 () Bool)

(declare-fun res!208365 () Bool)

(assert (=> b!248965 (=> (not res!208365) (not e!172487))))

(assert (=> b!248965 (= res!208365 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 _$23!30)))))

(assert (= d!83664 b!248963))

(assert (= (and d!83664 res!208364) b!248964))

(assert (= (and b!248964 res!208363) b!248965))

(assert (= (and b!248965 res!208365) b!248966))

(declare-fun m!375375 () Bool)

(assert (=> b!248964 m!375375))

(assert (=> b!248964 m!373757))

(declare-fun m!375377 () Bool)

(assert (=> d!83664 m!375377))

(declare-fun m!375379 () Bool)

(assert (=> b!248965 m!375379))

(declare-fun m!375381 () Bool)

(assert (=> b!248966 m!375381))

(declare-fun m!375383 () Bool)

(assert (=> b!248966 m!375383))

(declare-fun m!375385 () Bool)

(assert (=> b!248966 m!375385))

(declare-fun m!375387 () Bool)

(assert (=> b!248966 m!375387))

(declare-fun m!375389 () Bool)

(assert (=> b!248963 m!375389))

(assert (=> d!83032 d!83664))

(declare-fun b!248968 () Bool)

(declare-fun e!172489 () Bool)

(declare-fun e!172492 () Bool)

(assert (=> b!248968 (= e!172489 e!172492)))

(declare-fun res!208370 () Bool)

(assert (=> b!248968 (=> (not res!208370) (not e!172492))))

(declare-fun e!172488 () Bool)

(assert (=> b!248968 (= res!208370 e!172488)))

(declare-fun res!208367 () Bool)

(assert (=> b!248968 (=> res!208367 e!172488)))

(declare-fun lt!387986 () tuple4!288)

(assert (=> b!248968 (= res!208367 (bvsge (_1!11571 lt!387986) (_2!11571 lt!387986)))))

(declare-fun lt!387988 () (_ BitVec 32))

(assert (=> b!248968 (= lt!387988 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!387987 () (_ BitVec 32))

(assert (=> b!248968 (= lt!387987 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248968 (= lt!387986 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(declare-fun b!248969 () Bool)

(declare-fun res!208366 () Bool)

(assert (=> b!248969 (= res!208366 (= lt!387988 #b00000000000000000000000000000000))))

(declare-fun e!172491 () Bool)

(assert (=> b!248969 (=> res!208366 e!172491)))

(declare-fun e!172493 () Bool)

(assert (=> b!248969 (= e!172493 e!172491)))

(declare-fun b!248970 () Bool)

(assert (=> b!248970 (= e!172488 (arrayRangesEq!921 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386539)) (_1!11571 lt!387986) (_2!11571 lt!387986)))))

(declare-fun b!248971 () Bool)

(declare-fun e!172490 () Bool)

(assert (=> b!248971 (= e!172490 e!172493)))

(declare-fun res!208368 () Bool)

(assert (=> b!248971 (= res!208368 (byteRangesEq!0 (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!387986)) (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!387986)) lt!387987 #b00000000000000000000000000001000))))

(assert (=> b!248971 (=> (not res!208368) (not e!172493))))

(declare-fun b!248972 () Bool)

(declare-fun call!3955 () Bool)

(assert (=> b!248972 (= e!172491 call!3955)))

(declare-fun b!248973 () Bool)

(assert (=> b!248973 (= e!172490 call!3955)))

(declare-fun c!11582 () Bool)

(declare-fun bm!3952 () Bool)

(assert (=> bm!3952 (= call!3955 (byteRangesEq!0 (ite c!11582 (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!387986)) (select (arr!6922 (buf!6422 thiss!1005)) (_4!144 lt!387986))) (ite c!11582 (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!387986)) (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_4!144 lt!387986))) (ite c!11582 lt!387987 #b00000000000000000000000000000000) lt!387988))))

(declare-fun b!248967 () Bool)

(assert (=> b!248967 (= e!172492 e!172490)))

(assert (=> b!248967 (= c!11582 (= (_3!924 lt!387986) (_4!144 lt!387986)))))

(declare-fun d!83666 () Bool)

(declare-fun res!208369 () Bool)

(assert (=> d!83666 (=> res!208369 e!172489)))

(assert (=> d!83666 (= res!208369 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (=> d!83666 (= (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) e!172489)))

(assert (= (and d!83666 (not res!208369)) b!248968))

(assert (= (and b!248968 (not res!208367)) b!248970))

(assert (= (and b!248968 res!208370) b!248967))

(assert (= (and b!248967 c!11582) b!248973))

(assert (= (and b!248967 (not c!11582)) b!248971))

(assert (= (and b!248971 res!208368) b!248969))

(assert (= (and b!248969 (not res!208366)) b!248972))

(assert (= (or b!248973 b!248972) bm!3952))

(assert (=> b!248968 m!373759))

(declare-fun m!375391 () Bool)

(assert (=> b!248968 m!375391))

(declare-fun m!375393 () Bool)

(assert (=> b!248970 m!375393))

(declare-fun m!375395 () Bool)

(assert (=> b!248971 m!375395))

(declare-fun m!375397 () Bool)

(assert (=> b!248971 m!375397))

(assert (=> b!248971 m!375395))

(assert (=> b!248971 m!375397))

(declare-fun m!375399 () Bool)

(assert (=> b!248971 m!375399))

(assert (=> bm!3952 m!375397))

(declare-fun m!375401 () Bool)

(assert (=> bm!3952 m!375401))

(assert (=> bm!3952 m!375395))

(declare-fun m!375403 () Bool)

(assert (=> bm!3952 m!375403))

(declare-fun m!375405 () Bool)

(assert (=> bm!3952 m!375405))

(assert (=> b!248132 d!83666))

(assert (=> b!248132 d!82998))

(declare-fun lt!387989 () tuple2!21288)

(declare-fun d!83668 () Bool)

(assert (=> d!83668 (= lt!387989 (checkBitsLoop!0 (_1!11557 lt!386861) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83668 (= (checkBitsLoopPure!0 (_1!11557 lt!386861) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21273 (_2!11566 lt!387989) (_1!11566 lt!387989)))))

(declare-fun bs!21163 () Bool)

(assert (= bs!21163 d!83668))

(declare-fun m!375407 () Bool)

(assert (=> bs!21163 m!375407))

(assert (=> b!248198 d!83668))

(declare-fun d!83670 () Bool)

(assert (=> d!83670 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386855) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539)))) lt!386855))))

(declare-fun bs!21164 () Bool)

(assert (= bs!21164 d!83670))

(declare-fun m!375409 () Bool)

(assert (=> bs!21164 m!375409))

(assert (=> b!248198 d!83670))

(declare-fun d!83672 () Bool)

(assert (=> d!83672 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11559 lt!386862)))) ((_ sign_extend 32) (currentByte!11838 (_2!11559 lt!386539))) ((_ sign_extend 32) (currentBit!11833 (_2!11559 lt!386539))) lt!386855)))

(declare-fun lt!387990 () Unit!17991)

(assert (=> d!83672 (= lt!387990 (choose!9 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386862)) lt!386855 (BitStream!10793 (buf!6422 (_2!11559 lt!386862)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(assert (=> d!83672 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11559 lt!386539) (buf!6422 (_2!11559 lt!386862)) lt!386855) lt!387990)))

(declare-fun bs!21165 () Bool)

(assert (= bs!21165 d!83672))

(assert (=> bs!21165 m!374113))

(declare-fun m!375411 () Bool)

(assert (=> bs!21165 m!375411))

(assert (=> b!248198 d!83672))

(declare-fun b!248974 () Bool)

(declare-fun res!208373 () Bool)

(declare-fun e!172495 () Bool)

(assert (=> b!248974 (=> (not res!208373) (not e!172495))))

(declare-fun lt!387999 () tuple2!21270)

(assert (=> b!248974 (= res!208373 (isPrefixOf!0 (_2!11557 lt!387999) (_2!11559 lt!386862)))))

(declare-fun lt!388008 () (_ BitVec 64))

(declare-fun lt!387993 () (_ BitVec 64))

(declare-fun b!248975 () Bool)

(assert (=> b!248975 (= e!172495 (= (_1!11557 lt!387999) (withMovedBitIndex!0 (_2!11557 lt!387999) (bvsub lt!387993 lt!388008))))))

(assert (=> b!248975 (or (= (bvand lt!387993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!388008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!387993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!387993 lt!388008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248975 (= lt!388008 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386862))) (currentByte!11838 (_2!11559 lt!386862)) (currentBit!11833 (_2!11559 lt!386862))))))

(assert (=> b!248975 (= lt!387993 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(declare-fun b!248976 () Bool)

(declare-fun e!172494 () Unit!17991)

(declare-fun lt!388007 () Unit!17991)

(assert (=> b!248976 (= e!172494 lt!388007)))

(declare-fun lt!387995 () (_ BitVec 64))

(assert (=> b!248976 (= lt!387995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!387991 () (_ BitVec 64))

(assert (=> b!248976 (= lt!387991 (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(assert (=> b!248976 (= lt!388007 (arrayBitRangesEqSymmetric!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386862)) lt!387995 lt!387991))))

(assert (=> b!248976 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386862)) (buf!6422 (_2!11559 lt!386539)) lt!387995 lt!387991)))

(declare-fun b!248977 () Bool)

(declare-fun Unit!18023 () Unit!17991)

(assert (=> b!248977 (= e!172494 Unit!18023)))

(declare-fun b!248978 () Bool)

(declare-fun res!208371 () Bool)

(assert (=> b!248978 (=> (not res!208371) (not e!172495))))

(assert (=> b!248978 (= res!208371 (isPrefixOf!0 (_1!11557 lt!387999) (_2!11559 lt!386539)))))

(declare-fun d!83674 () Bool)

(assert (=> d!83674 e!172495))

(declare-fun res!208372 () Bool)

(assert (=> d!83674 (=> (not res!208372) (not e!172495))))

(assert (=> d!83674 (= res!208372 (isPrefixOf!0 (_1!11557 lt!387999) (_2!11557 lt!387999)))))

(declare-fun lt!388004 () BitStream!10792)

(assert (=> d!83674 (= lt!387999 (tuple2!21271 lt!388004 (_2!11559 lt!386862)))))

(declare-fun lt!387997 () Unit!17991)

(declare-fun lt!388006 () Unit!17991)

(assert (=> d!83674 (= lt!387997 lt!388006)))

(assert (=> d!83674 (isPrefixOf!0 lt!388004 (_2!11559 lt!386862))))

(assert (=> d!83674 (= lt!388006 (lemmaIsPrefixTransitive!0 lt!388004 (_2!11559 lt!386862) (_2!11559 lt!386862)))))

(declare-fun lt!387996 () Unit!17991)

(declare-fun lt!388005 () Unit!17991)

(assert (=> d!83674 (= lt!387996 lt!388005)))

(assert (=> d!83674 (isPrefixOf!0 lt!388004 (_2!11559 lt!386862))))

(assert (=> d!83674 (= lt!388005 (lemmaIsPrefixTransitive!0 lt!388004 (_2!11559 lt!386539) (_2!11559 lt!386862)))))

(declare-fun lt!387994 () Unit!17991)

(assert (=> d!83674 (= lt!387994 e!172494)))

(declare-fun c!11583 () Bool)

(assert (=> d!83674 (= c!11583 (not (= (size!5935 (buf!6422 (_2!11559 lt!386539))) #b00000000000000000000000000000000)))))

(declare-fun lt!388010 () Unit!17991)

(declare-fun lt!388009 () Unit!17991)

(assert (=> d!83674 (= lt!388010 lt!388009)))

(assert (=> d!83674 (isPrefixOf!0 (_2!11559 lt!386862) (_2!11559 lt!386862))))

(assert (=> d!83674 (= lt!388009 (lemmaIsPrefixRefl!0 (_2!11559 lt!386862)))))

(declare-fun lt!388002 () Unit!17991)

(declare-fun lt!387998 () Unit!17991)

(assert (=> d!83674 (= lt!388002 lt!387998)))

(assert (=> d!83674 (= lt!387998 (lemmaIsPrefixRefl!0 (_2!11559 lt!386862)))))

(declare-fun lt!388000 () Unit!17991)

(declare-fun lt!387992 () Unit!17991)

(assert (=> d!83674 (= lt!388000 lt!387992)))

(assert (=> d!83674 (isPrefixOf!0 lt!388004 lt!388004)))

(assert (=> d!83674 (= lt!387992 (lemmaIsPrefixRefl!0 lt!388004))))

(declare-fun lt!388001 () Unit!17991)

(declare-fun lt!388003 () Unit!17991)

(assert (=> d!83674 (= lt!388001 lt!388003)))

(assert (=> d!83674 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386539))))

(assert (=> d!83674 (= lt!388003 (lemmaIsPrefixRefl!0 (_2!11559 lt!386539)))))

(assert (=> d!83674 (= lt!388004 (BitStream!10793 (buf!6422 (_2!11559 lt!386862)) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539))))))

(assert (=> d!83674 (isPrefixOf!0 (_2!11559 lt!386539) (_2!11559 lt!386862))))

(assert (=> d!83674 (= (reader!0 (_2!11559 lt!386539) (_2!11559 lt!386862)) lt!387999)))

(assert (= (and d!83674 c!11583) b!248976))

(assert (= (and d!83674 (not c!11583)) b!248977))

(assert (= (and d!83674 res!208372) b!248978))

(assert (= (and b!248978 res!208371) b!248974))

(assert (= (and b!248974 res!208373) b!248975))

(declare-fun m!375413 () Bool)

(assert (=> b!248974 m!375413))

(declare-fun m!375415 () Bool)

(assert (=> b!248978 m!375415))

(declare-fun m!375417 () Bool)

(assert (=> b!248975 m!375417))

(assert (=> b!248975 m!374123))

(assert (=> b!248975 m!373757))

(assert (=> b!248976 m!373757))

(declare-fun m!375419 () Bool)

(assert (=> b!248976 m!375419))

(declare-fun m!375421 () Bool)

(assert (=> b!248976 m!375421))

(declare-fun m!375423 () Bool)

(assert (=> d!83674 m!375423))

(declare-fun m!375425 () Bool)

(assert (=> d!83674 m!375425))

(assert (=> d!83674 m!374027))

(declare-fun m!375427 () Bool)

(assert (=> d!83674 m!375427))

(declare-fun m!375429 () Bool)

(assert (=> d!83674 m!375429))

(declare-fun m!375431 () Bool)

(assert (=> d!83674 m!375431))

(assert (=> d!83674 m!374035))

(assert (=> d!83674 m!374121))

(declare-fun m!375433 () Bool)

(assert (=> d!83674 m!375433))

(declare-fun m!375435 () Bool)

(assert (=> d!83674 m!375435))

(declare-fun m!375437 () Bool)

(assert (=> d!83674 m!375437))

(assert (=> b!248198 d!83674))

(declare-fun d!83676 () Bool)

(assert (=> d!83676 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386536)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386536))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386536)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386536)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386536))))))))

(assert (=> d!83030 d!83676))

(declare-fun d!83678 () Bool)

(assert (=> d!83678 (= (invariant!0 (currentBit!11833 (_1!11558 lt!386536)) (currentByte!11838 (_1!11558 lt!386536)) (size!5935 (buf!6422 (_1!11558 lt!386536)))) (and (bvsge (currentBit!11833 (_1!11558 lt!386536)) #b00000000000000000000000000000000) (bvslt (currentBit!11833 (_1!11558 lt!386536)) #b00000000000000000000000000001000) (bvsge (currentByte!11838 (_1!11558 lt!386536)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 (_1!11558 lt!386536)) (size!5935 (buf!6422 (_1!11558 lt!386536)))) (and (= (currentBit!11833 (_1!11558 lt!386536)) #b00000000000000000000000000000000) (= (currentByte!11838 (_1!11558 lt!386536)) (size!5935 (buf!6422 (_1!11558 lt!386536))))))))))

(assert (=> d!83030 d!83678))

(assert (=> d!82994 d!83532))

(assert (=> d!83048 d!83564))

(assert (=> b!248163 d!82996))

(declare-fun d!83680 () Bool)

(assert (=> d!83680 (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 (_2!11559 lt!386539)) lt!386766 lt!386762)))

(declare-fun lt!388011 () Unit!17991)

(assert (=> d!83680 (= lt!388011 (choose!8 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) lt!386766 lt!386762))))

(assert (=> d!83680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386766) (bvsle lt!386766 lt!386762))))

(assert (=> d!83680 (= (arrayBitRangesEqSymmetric!0 (buf!6422 (_2!11559 lt!386539)) (buf!6422 (_2!11559 lt!386531)) lt!386766 lt!386762) lt!388011)))

(declare-fun bs!21166 () Bool)

(assert (= bs!21166 d!83680))

(assert (=> bs!21166 m!374021))

(declare-fun m!375439 () Bool)

(assert (=> bs!21166 m!375439))

(assert (=> b!248163 d!83680))

(declare-fun b!248980 () Bool)

(declare-fun e!172497 () Bool)

(declare-fun e!172500 () Bool)

(assert (=> b!248980 (= e!172497 e!172500)))

(declare-fun res!208378 () Bool)

(assert (=> b!248980 (=> (not res!208378) (not e!172500))))

(declare-fun e!172496 () Bool)

(assert (=> b!248980 (= res!208378 e!172496)))

(declare-fun res!208375 () Bool)

(assert (=> b!248980 (=> res!208375 e!172496)))

(declare-fun lt!388012 () tuple4!288)

(assert (=> b!248980 (= res!208375 (bvsge (_1!11571 lt!388012) (_2!11571 lt!388012)))))

(declare-fun lt!388014 () (_ BitVec 32))

(assert (=> b!248980 (= lt!388014 ((_ extract 31 0) (bvsrem lt!386762 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!388013 () (_ BitVec 32))

(assert (=> b!248980 (= lt!388013 ((_ extract 31 0) (bvsrem lt!386766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!248980 (= lt!388012 (arrayBitIndices!0 lt!386766 lt!386762))))

(declare-fun b!248981 () Bool)

(declare-fun res!208374 () Bool)

(assert (=> b!248981 (= res!208374 (= lt!388014 #b00000000000000000000000000000000))))

(declare-fun e!172499 () Bool)

(assert (=> b!248981 (=> res!208374 e!172499)))

(declare-fun e!172501 () Bool)

(assert (=> b!248981 (= e!172501 e!172499)))

(declare-fun b!248982 () Bool)

(assert (=> b!248982 (= e!172496 (arrayRangesEq!921 (buf!6422 (_2!11559 lt!386531)) (buf!6422 (_2!11559 lt!386539)) (_1!11571 lt!388012) (_2!11571 lt!388012)))))

(declare-fun b!248983 () Bool)

(declare-fun e!172498 () Bool)

(assert (=> b!248983 (= e!172498 e!172501)))

(declare-fun res!208376 () Bool)

(assert (=> b!248983 (= res!208376 (byteRangesEq!0 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!388012)) (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!388012)) lt!388013 #b00000000000000000000000000001000))))

(assert (=> b!248983 (=> (not res!208376) (not e!172501))))

(declare-fun b!248984 () Bool)

(declare-fun call!3956 () Bool)

(assert (=> b!248984 (= e!172499 call!3956)))

(declare-fun b!248985 () Bool)

(assert (=> b!248985 (= e!172498 call!3956)))

(declare-fun bm!3953 () Bool)

(declare-fun c!11584 () Bool)

(assert (=> bm!3953 (= call!3956 (byteRangesEq!0 (ite c!11584 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!388012)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_4!144 lt!388012))) (ite c!11584 (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_3!924 lt!388012)) (select (arr!6922 (buf!6422 (_2!11559 lt!386539))) (_4!144 lt!388012))) (ite c!11584 lt!388013 #b00000000000000000000000000000000) lt!388014))))

(declare-fun b!248979 () Bool)

(assert (=> b!248979 (= e!172500 e!172498)))

(assert (=> b!248979 (= c!11584 (= (_3!924 lt!388012) (_4!144 lt!388012)))))

(declare-fun d!83682 () Bool)

(declare-fun res!208377 () Bool)

(assert (=> d!83682 (=> res!208377 e!172497)))

(assert (=> d!83682 (= res!208377 (bvsge lt!386766 lt!386762))))

(assert (=> d!83682 (= (arrayBitRangesEq!0 (buf!6422 (_2!11559 lt!386531)) (buf!6422 (_2!11559 lt!386539)) lt!386766 lt!386762) e!172497)))

(assert (= (and d!83682 (not res!208377)) b!248980))

(assert (= (and b!248980 (not res!208375)) b!248982))

(assert (= (and b!248980 res!208378) b!248979))

(assert (= (and b!248979 c!11584) b!248985))

(assert (= (and b!248979 (not c!11584)) b!248983))

(assert (= (and b!248983 res!208376) b!248981))

(assert (= (and b!248981 (not res!208374)) b!248984))

(assert (= (or b!248985 b!248984) bm!3953))

(declare-fun m!375441 () Bool)

(assert (=> b!248980 m!375441))

(declare-fun m!375443 () Bool)

(assert (=> b!248982 m!375443))

(declare-fun m!375445 () Bool)

(assert (=> b!248983 m!375445))

(declare-fun m!375447 () Bool)

(assert (=> b!248983 m!375447))

(assert (=> b!248983 m!375445))

(assert (=> b!248983 m!375447))

(declare-fun m!375449 () Bool)

(assert (=> b!248983 m!375449))

(assert (=> bm!3953 m!375447))

(declare-fun m!375451 () Bool)

(assert (=> bm!3953 m!375451))

(assert (=> bm!3953 m!375445))

(declare-fun m!375453 () Bool)

(assert (=> bm!3953 m!375453))

(declare-fun m!375455 () Bool)

(assert (=> bm!3953 m!375455))

(assert (=> b!248163 d!83682))

(declare-fun d!83684 () Bool)

(declare-fun e!172502 () Bool)

(assert (=> d!83684 e!172502))

(declare-fun res!208379 () Bool)

(assert (=> d!83684 (=> (not res!208379) (not e!172502))))

(assert (=> d!83684 (= res!208379 (= (buf!6422 (_2!11559 (increaseBitIndex!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))))

(declare-fun lt!388017 () Bool)

(assert (=> d!83684 (= lt!388017 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!388020 () tuple2!21288)

(assert (=> d!83684 (= lt!388020 (tuple2!21289 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11559 (increaseBitIndex!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))))))

(assert (=> d!83684 (validate_offset_bit!0 ((_ sign_extend 32) (size!5935 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 32) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) ((_ sign_extend 32) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))))

(assert (=> d!83684 (= (readBit!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))) lt!388020)))

(declare-fun lt!388018 () (_ BitVec 64))

(declare-fun b!248986 () Bool)

(declare-fun lt!388021 () (_ BitVec 64))

(assert (=> b!248986 (= e!172502 (= (bitIndex!0 (size!5935 (buf!6422 (_2!11559 (increaseBitIndex!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) (currentByte!11838 (_2!11559 (increaseBitIndex!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) (currentBit!11833 (_2!11559 (increaseBitIndex!0 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) (bvadd lt!388018 lt!388021)))))

(assert (=> b!248986 (or (not (= (bvand lt!388018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!388021 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!388018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!388018 lt!388021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248986 (= lt!388021 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248986 (= lt!388018 (bitIndex!0 (size!5935 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))))

(declare-fun lt!388016 () Bool)

(assert (=> b!248986 (= lt!388016 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!388019 () Bool)

(assert (=> b!248986 (= lt!388019 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!388015 () Bool)

(assert (=> b!248986 (= lt!388015 (not (= (bvand ((_ sign_extend 24) (select (arr!6922 (buf!6422 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))) (currentByte!11838 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11833 (readerFrom!0 (_2!11559 lt!386539) (currentBit!11833 thiss!1005) (currentByte!11838 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!83684 res!208379) b!248986))

(assert (=> d!83684 m!373825))

(declare-fun m!375457 () Bool)

(assert (=> d!83684 m!375457))

(declare-fun m!375459 () Bool)

(assert (=> d!83684 m!375459))

(declare-fun m!375461 () Bool)

(assert (=> d!83684 m!375461))

(declare-fun m!375463 () Bool)

(assert (=> d!83684 m!375463))

(assert (=> b!248986 m!375461))

(assert (=> b!248986 m!375459))

(declare-fun m!375465 () Bool)

(assert (=> b!248986 m!375465))

(assert (=> b!248986 m!373825))

(assert (=> b!248986 m!375457))

(declare-fun m!375467 () Bool)

(assert (=> b!248986 m!375467))

(assert (=> d!82986 d!83684))

(assert (=> b!248203 d!82998))

(assert (=> b!248203 d!83000))

(declare-fun d!83686 () Bool)

(assert (=> d!83686 (= (remainingBits!0 ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386529)))) ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386529))) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386529)))) (bvsub (bvmul ((_ sign_extend 32) (size!5935 (buf!6422 (_1!11558 lt!386529)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11838 (_1!11558 lt!386529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11833 (_1!11558 lt!386529))))))))

(assert (=> d!83026 d!83686))

(declare-fun d!83688 () Bool)

(assert (=> d!83688 (= (invariant!0 (currentBit!11833 (_1!11558 lt!386529)) (currentByte!11838 (_1!11558 lt!386529)) (size!5935 (buf!6422 (_1!11558 lt!386529)))) (and (bvsge (currentBit!11833 (_1!11558 lt!386529)) #b00000000000000000000000000000000) (bvslt (currentBit!11833 (_1!11558 lt!386529)) #b00000000000000000000000000001000) (bvsge (currentByte!11838 (_1!11558 lt!386529)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11838 (_1!11558 lt!386529)) (size!5935 (buf!6422 (_1!11558 lt!386529)))) (and (= (currentBit!11833 (_1!11558 lt!386529)) #b00000000000000000000000000000000) (= (currentByte!11838 (_1!11558 lt!386529)) (size!5935 (buf!6422 (_1!11558 lt!386529))))))))))

(assert (=> d!83026 d!83688))

(declare-fun lt!388024 () (_ BitVec 64))

(declare-fun b!248987 () Bool)

(declare-fun lt!388028 () tuple2!21288)

(declare-fun e!172505 () Bool)

(assert (=> b!248987 (= e!172505 (= (bvsub lt!388024 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!388028))) (currentByte!11838 (_2!11566 lt!388028)) (currentBit!11833 (_2!11566 lt!388028)))))))

(assert (=> b!248987 (or (= (bvand lt!388024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!388024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!388024 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!388029 () (_ BitVec 64))

(assert (=> b!248987 (= lt!388024 (bvadd lt!388029 nBits!297))))

(assert (=> b!248987 (or (not (= (bvand lt!388029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!388029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!388029 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!248987 (= lt!388029 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386542))) (currentByte!11838 (_1!11557 lt!386542)) (currentBit!11833 (_1!11557 lt!386542))))))

(declare-fun b!248988 () Bool)

(declare-fun e!172507 () tuple2!21288)

(assert (=> b!248988 (= e!172507 (tuple2!21289 true (_1!11557 lt!386542)))))

(declare-fun b!248990 () Bool)

(declare-fun e!172503 () Bool)

(assert (=> b!248990 (= e!172503 (= bit!26 (_2!11558 (readBitPure!0 (_1!11557 lt!386542)))))))

(declare-fun b!248991 () Bool)

(declare-fun e!172506 () Bool)

(assert (=> b!248991 (= e!172506 e!172503)))

(declare-fun res!208382 () Bool)

(assert (=> b!248991 (=> res!208382 e!172503)))

(assert (=> b!248991 (= res!208382 (or (not (_1!11566 lt!388028)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!248992 () Bool)

(declare-fun lt!388032 () tuple2!21288)

(declare-fun lt!388023 () tuple2!21288)

(assert (=> b!248992 (= lt!388032 (checkBitsLoop!0 (_2!11566 lt!388023) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!388027 () Unit!17991)

(declare-fun lt!388026 () Unit!17991)

(assert (=> b!248992 (= lt!388027 lt!388026)))

(declare-fun lt!388022 () (_ BitVec 64))

(declare-fun lt!388025 () (_ BitVec 64))

(assert (=> b!248992 (validate_offset_bits!1 ((_ sign_extend 32) (size!5935 (buf!6422 (_2!11566 lt!388023)))) ((_ sign_extend 32) (currentByte!11838 (_2!11566 lt!388023))) ((_ sign_extend 32) (currentBit!11833 (_2!11566 lt!388023))) (bvsub lt!388022 lt!388025))))

(assert (=> b!248992 (= lt!388026 (validateOffsetBitsIneqLemma!0 (_1!11557 lt!386542) (_2!11566 lt!388023) lt!388022 lt!388025))))

(assert (=> b!248992 (= lt!388025 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!248992 (= lt!388022 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun e!172504 () tuple2!21288)

(assert (=> b!248992 (= e!172504 (tuple2!21289 (_1!11566 lt!388032) (_2!11566 lt!388032)))))

(declare-fun b!248993 () Bool)

(assert (=> b!248993 (= e!172507 e!172504)))

(assert (=> b!248993 (= lt!388023 (readBit!0 (_1!11557 lt!386542)))))

(declare-fun c!11586 () Bool)

(assert (=> b!248993 (= c!11586 (not (= (_1!11566 lt!388023) bit!26)))))

(declare-fun d!83690 () Bool)

(assert (=> d!83690 e!172506))

(declare-fun res!208383 () Bool)

(assert (=> d!83690 (=> (not res!208383) (not e!172506))))

(declare-fun lt!388030 () (_ BitVec 64))

(assert (=> d!83690 (= res!208383 (bvsge (bvsub lt!388030 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!5935 (buf!6422 (_2!11566 lt!388028))) (currentByte!11838 (_2!11566 lt!388028)) (currentBit!11833 (_2!11566 lt!388028)))))))

(assert (=> d!83690 (or (= (bvand lt!388030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!388030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!388030 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!388031 () (_ BitVec 64))

(assert (=> d!83690 (= lt!388030 (bvadd lt!388031 nBits!297))))

(assert (=> d!83690 (or (not (= (bvand lt!388031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!388031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!388031 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83690 (= lt!388031 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386542))) (currentByte!11838 (_1!11557 lt!386542)) (currentBit!11833 (_1!11557 lt!386542))))))

(assert (=> d!83690 (= lt!388028 e!172507)))

(declare-fun c!11585 () Bool)

(assert (=> d!83690 (= c!11585 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!83690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83690 (= (checkBitsLoop!0 (_1!11557 lt!386542) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!388028)))

(declare-fun b!248989 () Bool)

(declare-fun res!208380 () Bool)

(assert (=> b!248989 (=> (not res!208380) (not e!172506))))

(assert (=> b!248989 (= res!208380 e!172505)))

(declare-fun res!208381 () Bool)

(assert (=> b!248989 (=> res!208381 e!172505)))

(assert (=> b!248989 (= res!208381 (not (_1!11566 lt!388028)))))

(declare-fun b!248994 () Bool)

(assert (=> b!248994 (= e!172504 (tuple2!21289 false (_2!11566 lt!388023)))))

(declare-fun b!248995 () Bool)

(declare-fun res!208384 () Bool)

(assert (=> b!248995 (=> (not res!208384) (not e!172506))))

(assert (=> b!248995 (= res!208384 (and (= (buf!6422 (_1!11557 lt!386542)) (buf!6422 (_2!11566 lt!388028))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11566 lt!388028))))))

(assert (= (and d!83690 c!11585) b!248988))

(assert (= (and d!83690 (not c!11585)) b!248993))

(assert (= (and b!248993 c!11586) b!248994))

(assert (= (and b!248993 (not c!11586)) b!248992))

(assert (= (and d!83690 res!208383) b!248995))

(assert (= (and b!248995 res!208384) b!248989))

(assert (= (and b!248989 (not res!208381)) b!248987))

(assert (= (and b!248989 res!208380) b!248991))

(assert (= (and b!248991 (not res!208382)) b!248990))

(declare-fun m!375469 () Bool)

(assert (=> b!248987 m!375469))

(declare-fun m!375471 () Bool)

(assert (=> b!248987 m!375471))

(declare-fun m!375473 () Bool)

(assert (=> b!248992 m!375473))

(declare-fun m!375475 () Bool)

(assert (=> b!248992 m!375475))

(declare-fun m!375477 () Bool)

(assert (=> b!248992 m!375477))

(declare-fun m!375479 () Bool)

(assert (=> b!248990 m!375479))

(declare-fun m!375481 () Bool)

(assert (=> b!248993 m!375481))

(assert (=> d!83690 m!375469))

(assert (=> d!83690 m!375471))

(assert (=> d!83020 d!83690))

(declare-fun d!83692 () Bool)

(declare-fun res!208387 () Bool)

(declare-fun e!172508 () Bool)

(assert (=> d!83692 (=> (not res!208387) (not e!172508))))

(assert (=> d!83692 (= res!208387 (= (size!5935 (buf!6422 (_2!11557 lt!386791))) (size!5935 (buf!6422 (_2!11559 lt!386531)))))))

(assert (=> d!83692 (= (isPrefixOf!0 (_2!11557 lt!386791) (_2!11559 lt!386531)) e!172508)))

(declare-fun b!248996 () Bool)

(declare-fun res!208386 () Bool)

(assert (=> b!248996 (=> (not res!208386) (not e!172508))))

(assert (=> b!248996 (= res!208386 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386791))) (currentByte!11838 (_2!11557 lt!386791)) (currentBit!11833 (_2!11557 lt!386791))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386531))) (currentByte!11838 (_2!11559 lt!386531)) (currentBit!11833 (_2!11559 lt!386531)))))))

(declare-fun b!248997 () Bool)

(declare-fun e!172509 () Bool)

(assert (=> b!248997 (= e!172508 e!172509)))

(declare-fun res!208385 () Bool)

(assert (=> b!248997 (=> res!208385 e!172509)))

(assert (=> b!248997 (= res!208385 (= (size!5935 (buf!6422 (_2!11557 lt!386791))) #b00000000000000000000000000000000))))

(declare-fun b!248998 () Bool)

(assert (=> b!248998 (= e!172509 (arrayBitRangesEq!0 (buf!6422 (_2!11557 lt!386791)) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_2!11557 lt!386791))) (currentByte!11838 (_2!11557 lt!386791)) (currentBit!11833 (_2!11557 lt!386791)))))))

(assert (= (and d!83692 res!208387) b!248996))

(assert (= (and b!248996 res!208386) b!248997))

(assert (= (and b!248997 (not res!208385)) b!248998))

(assert (=> b!248996 m!375159))

(assert (=> b!248996 m!373765))

(assert (=> b!248998 m!375159))

(assert (=> b!248998 m!375159))

(declare-fun m!375483 () Bool)

(assert (=> b!248998 m!375483))

(assert (=> b!248166 d!83692))

(declare-fun d!83694 () Bool)

(declare-fun res!208390 () Bool)

(declare-fun e!172510 () Bool)

(assert (=> d!83694 (=> (not res!208390) (not e!172510))))

(assert (=> d!83694 (= res!208390 (= (size!5935 (buf!6422 (_1!11557 lt!386770))) (size!5935 (buf!6422 (_2!11559 lt!386539)))))))

(assert (=> d!83694 (= (isPrefixOf!0 (_1!11557 lt!386770) (_2!11559 lt!386539)) e!172510)))

(declare-fun b!248999 () Bool)

(declare-fun res!208389 () Bool)

(assert (=> b!248999 (=> (not res!208389) (not e!172510))))

(assert (=> b!248999 (= res!208389 (bvsle (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386770))) (currentByte!11838 (_1!11557 lt!386770)) (currentBit!11833 (_1!11557 lt!386770))) (bitIndex!0 (size!5935 (buf!6422 (_2!11559 lt!386539))) (currentByte!11838 (_2!11559 lt!386539)) (currentBit!11833 (_2!11559 lt!386539)))))))

(declare-fun b!249000 () Bool)

(declare-fun e!172511 () Bool)

(assert (=> b!249000 (= e!172510 e!172511)))

(declare-fun res!208388 () Bool)

(assert (=> b!249000 (=> res!208388 e!172511)))

(assert (=> b!249000 (= res!208388 (= (size!5935 (buf!6422 (_1!11557 lt!386770))) #b00000000000000000000000000000000))))

(declare-fun b!249001 () Bool)

(assert (=> b!249001 (= e!172511 (arrayBitRangesEq!0 (buf!6422 (_1!11557 lt!386770)) (buf!6422 (_2!11559 lt!386539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 (_1!11557 lt!386770))) (currentByte!11838 (_1!11557 lt!386770)) (currentBit!11833 (_1!11557 lt!386770)))))))

(assert (= (and d!83694 res!208390) b!248999))

(assert (= (and b!248999 res!208389) b!249000))

(assert (= (and b!249000 (not res!208388)) b!249001))

(assert (=> b!248999 m!375303))

(assert (=> b!248999 m!373757))

(assert (=> b!249001 m!375303))

(assert (=> b!249001 m!375303))

(declare-fun m!375485 () Bool)

(assert (=> b!249001 m!375485))

(assert (=> b!248165 d!83694))

(declare-fun b!249003 () Bool)

(declare-fun e!172513 () Bool)

(declare-fun e!172516 () Bool)

(assert (=> b!249003 (= e!172513 e!172516)))

(declare-fun res!208395 () Bool)

(assert (=> b!249003 (=> (not res!208395) (not e!172516))))

(declare-fun e!172512 () Bool)

(assert (=> b!249003 (= res!208395 e!172512)))

(declare-fun res!208392 () Bool)

(assert (=> b!249003 (=> res!208392 e!172512)))

(declare-fun lt!388033 () tuple4!288)

(assert (=> b!249003 (= res!208392 (bvsge (_1!11571 lt!388033) (_2!11571 lt!388033)))))

(declare-fun lt!388035 () (_ BitVec 32))

(assert (=> b!249003 (= lt!388035 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!388034 () (_ BitVec 32))

(assert (=> b!249003 (= lt!388034 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!249003 (= lt!388033 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(declare-fun b!249004 () Bool)

(declare-fun res!208391 () Bool)

(assert (=> b!249004 (= res!208391 (= lt!388035 #b00000000000000000000000000000000))))

(declare-fun e!172515 () Bool)

(assert (=> b!249004 (=> res!208391 e!172515)))

(declare-fun e!172517 () Bool)

(assert (=> b!249004 (= e!172517 e!172515)))

(declare-fun b!249005 () Bool)

(assert (=> b!249005 (= e!172512 (arrayRangesEq!921 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) (_1!11571 lt!388033) (_2!11571 lt!388033)))))

(declare-fun b!249006 () Bool)

(declare-fun e!172514 () Bool)

(assert (=> b!249006 (= e!172514 e!172517)))

(declare-fun res!208393 () Bool)

(assert (=> b!249006 (= res!208393 (byteRangesEq!0 (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!388033)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!388033)) lt!388034 #b00000000000000000000000000001000))))

(assert (=> b!249006 (=> (not res!208393) (not e!172517))))

(declare-fun b!249007 () Bool)

(declare-fun call!3957 () Bool)

(assert (=> b!249007 (= e!172515 call!3957)))

(declare-fun b!249008 () Bool)

(assert (=> b!249008 (= e!172514 call!3957)))

(declare-fun bm!3954 () Bool)

(declare-fun c!11587 () Bool)

(assert (=> bm!3954 (= call!3957 (byteRangesEq!0 (ite c!11587 (select (arr!6922 (buf!6422 thiss!1005)) (_3!924 lt!388033)) (select (arr!6922 (buf!6422 thiss!1005)) (_4!144 lt!388033))) (ite c!11587 (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_3!924 lt!388033)) (select (arr!6922 (buf!6422 (_2!11559 lt!386531))) (_4!144 lt!388033))) (ite c!11587 lt!388034 #b00000000000000000000000000000000) lt!388035))))

(declare-fun b!249002 () Bool)

(assert (=> b!249002 (= e!172516 e!172514)))

(assert (=> b!249002 (= c!11587 (= (_3!924 lt!388033) (_4!144 lt!388033)))))

(declare-fun d!83696 () Bool)

(declare-fun res!208394 () Bool)

(assert (=> d!83696 (=> res!208394 e!172513)))

(assert (=> d!83696 (= res!208394 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))))))

(assert (=> d!83696 (= (arrayBitRangesEq!0 (buf!6422 thiss!1005) (buf!6422 (_2!11559 lt!386531)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5935 (buf!6422 thiss!1005)) (currentByte!11838 thiss!1005) (currentBit!11833 thiss!1005))) e!172513)))

(assert (= (and d!83696 (not res!208394)) b!249003))

(assert (= (and b!249003 (not res!208392)) b!249005))

(assert (= (and b!249003 res!208395) b!249002))

(assert (= (and b!249002 c!11587) b!249008))

(assert (= (and b!249002 (not c!11587)) b!249006))

(assert (= (and b!249006 res!208393) b!249004))

(assert (= (and b!249004 (not res!208391)) b!249007))

(assert (= (or b!249008 b!249007) bm!3954))

(assert (=> b!249003 m!373759))

(assert (=> b!249003 m!375391))

(declare-fun m!375487 () Bool)

(assert (=> b!249005 m!375487))

(declare-fun m!375489 () Bool)

(assert (=> b!249006 m!375489))

(declare-fun m!375491 () Bool)

(assert (=> b!249006 m!375491))

(assert (=> b!249006 m!375489))

(assert (=> b!249006 m!375491))

(declare-fun m!375493 () Bool)

(assert (=> b!249006 m!375493))

(assert (=> bm!3954 m!375491))

(declare-fun m!375495 () Bool)

(assert (=> bm!3954 m!375495))

(assert (=> bm!3954 m!375489))

(declare-fun m!375497 () Bool)

(assert (=> bm!3954 m!375497))

(declare-fun m!375499 () Bool)

(assert (=> bm!3954 m!375499))

(assert (=> b!248205 d!83696))

(assert (=> b!248205 d!82998))

(push 1)

(assert (not b!248990))

(assert (not bm!3953))

(assert (not b!248942))

(assert (not d!83616))

(assert (not d!83536))

(assert (not b!248987))

(assert (not d!83658))

(assert (not b!248863))

(assert (not b!248869))

(assert (not b!248856))

(assert (not b!248907))

(assert (not d!83608))

(assert (not d!83546))

(assert (not b!248916))

(assert (not b!248978))

(assert (not b!248966))

(assert (not d!83670))

(assert (not b!248963))

(assert (not d!83578))

(assert (not b!248976))

(assert (not b!248944))

(assert (not b!248847))

(assert (not b!248872))

(assert (not b!248933))

(assert (not bm!3952))

(assert (not b!248929))

(assert (not d!83674))

(assert (not b!248917))

(assert (not d!83646))

(assert (not b!248964))

(assert (not d!83584))

(assert (not b!248982))

(assert (not d!83586))

(assert (not bm!3954))

(assert (not b!248826))

(assert (not b!248938))

(assert (not b!248965))

(assert (not d!83558))

(assert (not d!83684))

(assert (not b!248998))

(assert (not d!83588))

(assert (not b!248999))

(assert (not b!249005))

(assert (not d!83668))

(assert (not b!248825))

(assert (not d!83572))

(assert (not b!248843))

(assert (not d!83548))

(assert (not b!248820))

(assert (not b!248899))

(assert (not b!248930))

(assert (not b!248914))

(assert (not b!248862))

(assert (not b!248920))

(assert (not b!249006))

(assert (not b!248951))

(assert (not bm!3951))

(assert (not b!248871))

(assert (not b!248986))

(assert (not d!83554))

(assert (not b!249003))

(assert (not d!83542))

(assert (not b!248901))

(assert (not b!248968))

(assert (not d!83590))

(assert (not b!248913))

(assert (not d!83634))

(assert (not b!248922))

(assert (not b!248971))

(assert (not b!248952))

(assert (not d!83664))

(assert (not d!83566))

(assert (not b!248908))

(assert (not d!83638))

(assert (not d!83612))

(assert (not b!248910))

(assert (not d!83632))

(assert (not b!248919))

(assert (not d!83654))

(assert (not b!248876))

(assert (not b!248974))

(assert (not b!248941))

(assert (not d!83610))

(assert (not d!83672))

(assert (not d!83636))

(assert (not b!248993))

(assert (not b!248947))

(assert (not d!83568))

(assert (not b!248865))

(assert (not b!248911))

(assert (not d!83556))

(assert (not b!248939))

(assert (not d!83596))

(assert (not d!83630))

(assert (not d!83606))

(assert (not b!248945))

(assert (not d!83640))

(assert (not d!83552))

(assert (not b!248975))

(assert (not b!248902))

(assert (not b!248841))

(assert (not b!248842))

(assert (not b!248935))

(assert (not b!248861))

(assert (not b!248823))

(assert (not b!249001))

(assert (not b!248905))

(assert (not b!248844))

(assert (not d!83550))

(assert (not d!83618))

(assert (not d!83594))

(assert (not b!248970))

(assert (not d!83680))

(assert (not b!248996))

(assert (not b!248980))

(assert (not d!83690))

(assert (not d!83592))

(assert (not d!83652))

(assert (not b!248936))

(assert (not d!83600))

(assert (not b!248949))

(assert (not b!248992))

(assert (not b!248932))

(assert (not b!248983))

(assert (not d!83576))

(assert (not b!248866))

(assert (not b!248840))

(assert (not bm!3950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

