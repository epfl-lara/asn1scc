; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27490 () Bool)

(assert start!27490)

(declare-fun b!141761 () Bool)

(declare-fun e!94449 () Bool)

(declare-datatypes ((array!6505 0))(
  ( (array!6506 (arr!3653 (Array (_ BitVec 32) (_ BitVec 8))) (size!2946 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5150 0))(
  ( (BitStream!5151 (buf!3367 array!6505) (currentByte!6227 (_ BitVec 32)) (currentBit!6222 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8874 0))(
  ( (Unit!8875) )
))
(declare-datatypes ((tuple2!12584 0))(
  ( (tuple2!12585 (_1!6622 Unit!8874) (_2!6622 BitStream!5150)) )
))
(declare-fun lt!219782 () tuple2!12584)

(declare-fun thiss!1634 () BitStream!5150)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141761 (= e!94449 (not (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782))))))))))

(declare-fun e!94447 () Bool)

(assert (=> b!141761 e!94447))

(declare-fun res!118275 () Bool)

(assert (=> b!141761 (=> (not res!118275) (not e!94447))))

(declare-fun lt!219784 () tuple2!12584)

(declare-fun isPrefixOf!0 (BitStream!5150 BitStream!5150) Bool)

(assert (=> b!141761 (= res!118275 (isPrefixOf!0 thiss!1634 (_2!6622 lt!219784)))))

(declare-fun lt!219781 () Unit!8874)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5150 BitStream!5150 BitStream!5150) Unit!8874)

(assert (=> b!141761 (= lt!219781 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6622 lt!219782) (_2!6622 lt!219784)))))

(declare-fun e!94455 () Bool)

(assert (=> b!141761 e!94455))

(declare-fun res!118285 () Bool)

(assert (=> b!141761 (=> (not res!118285) (not e!94455))))

(assert (=> b!141761 (= res!118285 (= (size!2946 (buf!3367 (_2!6622 lt!219782))) (size!2946 (buf!3367 (_2!6622 lt!219784)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6505)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5150 array!6505 (_ BitVec 32) (_ BitVec 32)) tuple2!12584)

(assert (=> b!141761 (= lt!219784 (appendByteArrayLoop!0 (_2!6622 lt!219782) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141761 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219780 () Unit!8874)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5150 BitStream!5150 (_ BitVec 64) (_ BitVec 32)) Unit!8874)

(assert (=> b!141761 (= lt!219780 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6622 lt!219782) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94450 () Bool)

(assert (=> b!141761 e!94450))

(declare-fun res!118283 () Bool)

(assert (=> b!141761 (=> (not res!118283) (not e!94450))))

(assert (=> b!141761 (= res!118283 (= (size!2946 (buf!3367 thiss!1634)) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(declare-fun appendByte!0 (BitStream!5150 (_ BitVec 8)) tuple2!12584)

(assert (=> b!141761 (= lt!219782 (appendByte!0 thiss!1634 (select (arr!3653 arr!237) from!447)))))

(declare-fun b!141762 () Bool)

(declare-fun res!118282 () Bool)

(assert (=> b!141762 (=> (not res!118282) (not e!94450))))

(assert (=> b!141762 (= res!118282 (isPrefixOf!0 thiss!1634 (_2!6622 lt!219782)))))

(declare-fun b!141763 () Bool)

(declare-fun e!94452 () Bool)

(declare-fun array_inv!2735 (array!6505) Bool)

(assert (=> b!141763 (= e!94452 (array_inv!2735 (buf!3367 thiss!1634)))))

(declare-fun b!141764 () Bool)

(declare-fun res!118280 () Bool)

(assert (=> b!141764 (=> (not res!118280) (not e!94449))))

(assert (=> b!141764 (= res!118280 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!118278 () Bool)

(assert (=> start!27490 (=> (not res!118278) (not e!94449))))

(assert (=> start!27490 (= res!118278 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2946 arr!237))))))

(assert (=> start!27490 e!94449))

(assert (=> start!27490 true))

(assert (=> start!27490 (array_inv!2735 arr!237)))

(declare-fun inv!12 (BitStream!5150) Bool)

(assert (=> start!27490 (and (inv!12 thiss!1634) e!94452)))

(declare-fun b!141765 () Bool)

(declare-fun res!118276 () Bool)

(assert (=> b!141765 (=> (not res!118276) (not e!94450))))

(assert (=> b!141765 (= res!118276 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)))))))

(declare-fun b!141766 () Bool)

(declare-fun e!94448 () Bool)

(assert (=> b!141766 (= e!94455 e!94448)))

(declare-fun res!118277 () Bool)

(assert (=> b!141766 (=> (not res!118277) (not e!94448))))

(declare-fun lt!219785 () (_ BitVec 64))

(assert (=> b!141766 (= res!118277 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219784))) (currentByte!6227 (_2!6622 lt!219784)) (currentBit!6222 (_2!6622 lt!219784))) (bvadd (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219785))))))

(assert (=> b!141766 (= lt!219785 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141767 () Bool)

(declare-fun res!118274 () Bool)

(assert (=> b!141767 (=> (not res!118274) (not e!94449))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141767 (= res!118274 (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634))))))

(declare-fun b!141768 () Bool)

(declare-fun res!118284 () Bool)

(assert (=> b!141768 (=> (not res!118284) (not e!94448))))

(assert (=> b!141768 (= res!118284 (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!219784)))))

(declare-fun b!141769 () Bool)

(declare-fun e!94451 () Bool)

(assert (=> b!141769 (= e!94448 (not e!94451))))

(declare-fun res!118279 () Bool)

(assert (=> b!141769 (=> res!118279 e!94451)))

(declare-datatypes ((tuple2!12586 0))(
  ( (tuple2!12587 (_1!6623 BitStream!5150) (_2!6623 BitStream!5150)) )
))
(declare-fun lt!219783 () tuple2!12586)

(declare-datatypes ((tuple2!12588 0))(
  ( (tuple2!12589 (_1!6624 BitStream!5150) (_2!6624 array!6505)) )
))
(declare-fun lt!219786 () tuple2!12588)

(assert (=> b!141769 (= res!118279 (or (not (= (size!2946 (_2!6624 lt!219786)) (size!2946 arr!237))) (not (= (_1!6624 lt!219786) (_2!6623 lt!219783)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5150 array!6505 (_ BitVec 32) (_ BitVec 32)) tuple2!12588)

(assert (=> b!141769 (= lt!219786 (readByteArrayLoopPure!0 (_1!6623 lt!219783) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141769 (validate_offset_bits!1 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) lt!219785)))

(declare-fun lt!219788 () Unit!8874)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5150 array!6505 (_ BitVec 64)) Unit!8874)

(assert (=> b!141769 (= lt!219788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6622 lt!219782) (buf!3367 (_2!6622 lt!219784)) lt!219785))))

(declare-fun reader!0 (BitStream!5150 BitStream!5150) tuple2!12586)

(assert (=> b!141769 (= lt!219783 (reader!0 (_2!6622 lt!219782) (_2!6622 lt!219784)))))

(declare-datatypes ((tuple2!12590 0))(
  ( (tuple2!12591 (_1!6625 BitStream!5150) (_2!6625 (_ BitVec 8))) )
))
(declare-fun lt!219779 () tuple2!12590)

(declare-fun b!141770 () Bool)

(declare-fun lt!219787 () tuple2!12586)

(assert (=> b!141770 (= e!94450 (and (= (_2!6625 lt!219779) (select (arr!3653 arr!237) from!447)) (= (_1!6625 lt!219779) (_2!6623 lt!219787))))))

(declare-fun readBytePure!0 (BitStream!5150) tuple2!12590)

(assert (=> b!141770 (= lt!219779 (readBytePure!0 (_1!6623 lt!219787)))))

(assert (=> b!141770 (= lt!219787 (reader!0 thiss!1634 (_2!6622 lt!219782)))))

(declare-fun b!141771 () Bool)

(declare-fun arrayRangesEq!262 (array!6505 array!6505 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141771 (= e!94451 (not (arrayRangesEq!262 arr!237 (_2!6624 lt!219786) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141772 () Bool)

(assert (=> b!141772 (= e!94447 (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(declare-fun b!141773 () Bool)

(declare-fun res!118281 () Bool)

(assert (=> b!141773 (=> (not res!118281) (not e!94449))))

(assert (=> b!141773 (= res!118281 (bvslt from!447 to!404))))

(assert (= (and start!27490 res!118278) b!141764))

(assert (= (and b!141764 res!118280) b!141773))

(assert (= (and b!141773 res!118281) b!141767))

(assert (= (and b!141767 res!118274) b!141761))

(assert (= (and b!141761 res!118283) b!141765))

(assert (= (and b!141765 res!118276) b!141762))

(assert (= (and b!141762 res!118282) b!141770))

(assert (= (and b!141761 res!118285) b!141766))

(assert (= (and b!141766 res!118277) b!141768))

(assert (= (and b!141768 res!118284) b!141769))

(assert (= (and b!141769 (not res!118279)) b!141771))

(assert (= (and b!141761 res!118275) b!141772))

(assert (= start!27490 b!141763))

(declare-fun m!217735 () Bool)

(assert (=> b!141769 m!217735))

(declare-fun m!217737 () Bool)

(assert (=> b!141769 m!217737))

(declare-fun m!217739 () Bool)

(assert (=> b!141769 m!217739))

(declare-fun m!217741 () Bool)

(assert (=> b!141769 m!217741))

(declare-fun m!217743 () Bool)

(assert (=> b!141771 m!217743))

(declare-fun m!217745 () Bool)

(assert (=> b!141767 m!217745))

(declare-fun m!217747 () Bool)

(assert (=> b!141765 m!217747))

(declare-fun m!217749 () Bool)

(assert (=> b!141765 m!217749))

(declare-fun m!217751 () Bool)

(assert (=> b!141763 m!217751))

(declare-fun m!217753 () Bool)

(assert (=> b!141770 m!217753))

(declare-fun m!217755 () Bool)

(assert (=> b!141770 m!217755))

(declare-fun m!217757 () Bool)

(assert (=> b!141770 m!217757))

(declare-fun m!217759 () Bool)

(assert (=> b!141772 m!217759))

(declare-fun m!217761 () Bool)

(assert (=> b!141768 m!217761))

(declare-fun m!217763 () Bool)

(assert (=> b!141762 m!217763))

(declare-fun m!217765 () Bool)

(assert (=> b!141766 m!217765))

(assert (=> b!141766 m!217747))

(declare-fun m!217767 () Bool)

(assert (=> b!141761 m!217767))

(declare-fun m!217769 () Bool)

(assert (=> b!141761 m!217769))

(declare-fun m!217771 () Bool)

(assert (=> b!141761 m!217771))

(declare-fun m!217773 () Bool)

(assert (=> b!141761 m!217773))

(declare-fun m!217775 () Bool)

(assert (=> b!141761 m!217775))

(assert (=> b!141761 m!217753))

(assert (=> b!141761 m!217753))

(declare-fun m!217777 () Bool)

(assert (=> b!141761 m!217777))

(declare-fun m!217779 () Bool)

(assert (=> b!141761 m!217779))

(declare-fun m!217781 () Bool)

(assert (=> start!27490 m!217781))

(declare-fun m!217783 () Bool)

(assert (=> start!27490 m!217783))

(declare-fun m!217785 () Bool)

(assert (=> b!141764 m!217785))

(push 1)

(assert (not b!141764))

(assert (not b!141762))

(assert (not b!141766))

(assert (not b!141772))

(assert (not b!141769))

(assert (not b!141768))

(assert (not b!141765))

(assert (not start!27490))

(assert (not b!141767))

(assert (not b!141763))

(assert (not b!141771))

(assert (not b!141761))

(assert (not b!141770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45428 () Bool)

(assert (=> d!45428 (= (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634))) (and (bvsge (currentBit!6222 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6222 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6227 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634))) (and (= (currentBit!6222 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634)))))))))

(assert (=> b!141767 d!45428))

(declare-fun d!45430 () Bool)

(declare-fun e!94485 () Bool)

(assert (=> d!45430 e!94485))

(declare-fun res!118330 () Bool)

(assert (=> d!45430 (=> (not res!118330) (not e!94485))))

(declare-fun lt!219924 () (_ BitVec 64))

(declare-fun lt!219927 () (_ BitVec 64))

(declare-fun lt!219928 () (_ BitVec 64))

(assert (=> d!45430 (= res!118330 (= lt!219928 (bvsub lt!219927 lt!219924)))))

(assert (=> d!45430 (or (= (bvand lt!219927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219927 lt!219924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45430 (= lt!219924 (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219784))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219784)))))))

(declare-fun lt!219923 () (_ BitVec 64))

(declare-fun lt!219926 () (_ BitVec 64))

(assert (=> d!45430 (= lt!219927 (bvmul lt!219923 lt!219926))))

(assert (=> d!45430 (or (= lt!219923 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219926 (bvsdiv (bvmul lt!219923 lt!219926) lt!219923)))))

(assert (=> d!45430 (= lt!219926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45430 (= lt!219923 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))))))

(assert (=> d!45430 (= lt!219928 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219784))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219784)))))))

(assert (=> d!45430 (invariant!0 (currentBit!6222 (_2!6622 lt!219784)) (currentByte!6227 (_2!6622 lt!219784)) (size!2946 (buf!3367 (_2!6622 lt!219784))))))

(assert (=> d!45430 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219784))) (currentByte!6227 (_2!6622 lt!219784)) (currentBit!6222 (_2!6622 lt!219784))) lt!219928)))

(declare-fun b!141826 () Bool)

(declare-fun res!118331 () Bool)

(assert (=> b!141826 (=> (not res!118331) (not e!94485))))

(assert (=> b!141826 (= res!118331 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219928))))

(declare-fun b!141827 () Bool)

(declare-fun lt!219925 () (_ BitVec 64))

(assert (=> b!141827 (= e!94485 (bvsle lt!219928 (bvmul lt!219925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141827 (or (= lt!219925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219925)))))

(assert (=> b!141827 (= lt!219925 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))))))

(assert (= (and d!45430 res!118330) b!141826))

(assert (= (and b!141826 res!118331) b!141827))

(declare-fun m!217873 () Bool)

(assert (=> d!45430 m!217873))

(declare-fun m!217875 () Bool)

(assert (=> d!45430 m!217875))

(assert (=> b!141766 d!45430))

(declare-fun d!45434 () Bool)

(declare-fun e!94486 () Bool)

(assert (=> d!45434 e!94486))

(declare-fun res!118332 () Bool)

(assert (=> d!45434 (=> (not res!118332) (not e!94486))))

(declare-fun lt!219933 () (_ BitVec 64))

(declare-fun lt!219930 () (_ BitVec 64))

(declare-fun lt!219934 () (_ BitVec 64))

(assert (=> d!45434 (= res!118332 (= lt!219934 (bvsub lt!219933 lt!219930)))))

(assert (=> d!45434 (or (= (bvand lt!219933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219933 lt!219930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45434 (= lt!219930 (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782)))))))

(declare-fun lt!219929 () (_ BitVec 64))

(declare-fun lt!219932 () (_ BitVec 64))

(assert (=> d!45434 (= lt!219933 (bvmul lt!219929 lt!219932))))

(assert (=> d!45434 (or (= lt!219929 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219932 (bvsdiv (bvmul lt!219929 lt!219932) lt!219929)))))

(assert (=> d!45434 (= lt!219932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45434 (= lt!219929 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(assert (=> d!45434 (= lt!219934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782)))))))

(assert (=> d!45434 (invariant!0 (currentBit!6222 (_2!6622 lt!219782)) (currentByte!6227 (_2!6622 lt!219782)) (size!2946 (buf!3367 (_2!6622 lt!219782))))))

(assert (=> d!45434 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))) lt!219934)))

(declare-fun b!141828 () Bool)

(declare-fun res!118333 () Bool)

(assert (=> b!141828 (=> (not res!118333) (not e!94486))))

(assert (=> b!141828 (= res!118333 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219934))))

(declare-fun b!141829 () Bool)

(declare-fun lt!219931 () (_ BitVec 64))

(assert (=> b!141829 (= e!94486 (bvsle lt!219934 (bvmul lt!219931 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141829 (or (= lt!219931 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219931 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219931)))))

(assert (=> b!141829 (= lt!219931 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(assert (= (and d!45434 res!118332) b!141828))

(assert (= (and b!141828 res!118333) b!141829))

(declare-fun m!217877 () Bool)

(assert (=> d!45434 m!217877))

(declare-fun m!217879 () Bool)

(assert (=> d!45434 m!217879))

(assert (=> b!141766 d!45434))

(assert (=> b!141765 d!45434))

(declare-fun d!45438 () Bool)

(declare-fun e!94487 () Bool)

(assert (=> d!45438 e!94487))

(declare-fun res!118334 () Bool)

(assert (=> d!45438 (=> (not res!118334) (not e!94487))))

(declare-fun lt!219936 () (_ BitVec 64))

(declare-fun lt!219940 () (_ BitVec 64))

(declare-fun lt!219939 () (_ BitVec 64))

(assert (=> d!45438 (= res!118334 (= lt!219940 (bvsub lt!219939 lt!219936)))))

(assert (=> d!45438 (or (= (bvand lt!219939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219939 lt!219936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45438 (= lt!219936 (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634))))))

(declare-fun lt!219935 () (_ BitVec 64))

(declare-fun lt!219938 () (_ BitVec 64))

(assert (=> d!45438 (= lt!219939 (bvmul lt!219935 lt!219938))))

(assert (=> d!45438 (or (= lt!219935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219938 (bvsdiv (bvmul lt!219935 lt!219938) lt!219935)))))

(assert (=> d!45438 (= lt!219938 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45438 (= lt!219935 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))))))

(assert (=> d!45438 (= lt!219940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6227 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6222 thiss!1634))))))

(assert (=> d!45438 (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634)))))

(assert (=> d!45438 (= (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)) lt!219940)))

(declare-fun b!141830 () Bool)

(declare-fun res!118335 () Bool)

(assert (=> b!141830 (=> (not res!118335) (not e!94487))))

(assert (=> b!141830 (= res!118335 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219940))))

(declare-fun b!141831 () Bool)

(declare-fun lt!219937 () (_ BitVec 64))

(assert (=> b!141831 (= e!94487 (bvsle lt!219940 (bvmul lt!219937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141831 (or (= lt!219937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219937)))))

(assert (=> b!141831 (= lt!219937 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))))))

(assert (= (and d!45438 res!118334) b!141830))

(assert (= (and b!141830 res!118335) b!141831))

(declare-fun m!217881 () Bool)

(assert (=> d!45438 m!217881))

(assert (=> d!45438 m!217745))

(assert (=> b!141765 d!45438))

(declare-fun d!45440 () Bool)

(declare-datatypes ((tuple3!538 0))(
  ( (tuple3!539 (_1!6628 Unit!8874) (_2!6628 BitStream!5150) (_3!331 array!6505)) )
))
(declare-fun lt!219943 () tuple3!538)

(declare-fun readByteArrayLoop!0 (BitStream!5150 array!6505 (_ BitVec 32) (_ BitVec 32)) tuple3!538)

(assert (=> d!45440 (= lt!219943 (readByteArrayLoop!0 (_1!6623 lt!219783) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45440 (= (readByteArrayLoopPure!0 (_1!6623 lt!219783) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12589 (_2!6628 lt!219943) (_3!331 lt!219943)))))

(declare-fun bs!11170 () Bool)

(assert (= bs!11170 d!45440))

(declare-fun m!217885 () Bool)

(assert (=> bs!11170 m!217885))

(assert (=> b!141769 d!45440))

(declare-fun d!45448 () Bool)

(assert (=> d!45448 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) lt!219785) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782)))) lt!219785))))

(declare-fun bs!11171 () Bool)

(assert (= bs!11171 d!45448))

(declare-fun m!217887 () Bool)

(assert (=> bs!11171 m!217887))

(assert (=> b!141769 d!45448))

(declare-fun d!45450 () Bool)

(assert (=> d!45450 (validate_offset_bits!1 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219784)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) lt!219785)))

(declare-fun lt!219946 () Unit!8874)

(declare-fun choose!9 (BitStream!5150 array!6505 (_ BitVec 64) BitStream!5150) Unit!8874)

(assert (=> d!45450 (= lt!219946 (choose!9 (_2!6622 lt!219782) (buf!3367 (_2!6622 lt!219784)) lt!219785 (BitStream!5151 (buf!3367 (_2!6622 lt!219784)) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782)))))))

(assert (=> d!45450 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6622 lt!219782) (buf!3367 (_2!6622 lt!219784)) lt!219785) lt!219946)))

(declare-fun bs!11173 () Bool)

(assert (= bs!11173 d!45450))

(assert (=> bs!11173 m!217737))

(declare-fun m!217889 () Bool)

(assert (=> bs!11173 m!217889))

(assert (=> b!141769 d!45450))

(declare-fun d!45454 () Bool)

(declare-fun e!94504 () Bool)

(assert (=> d!45454 e!94504))

(declare-fun res!118362 () Bool)

(assert (=> d!45454 (=> (not res!118362) (not e!94504))))

(declare-fun lt!220019 () tuple2!12586)

(assert (=> d!45454 (= res!118362 (isPrefixOf!0 (_1!6623 lt!220019) (_2!6623 lt!220019)))))

(declare-fun lt!220009 () BitStream!5150)

(assert (=> d!45454 (= lt!220019 (tuple2!12587 lt!220009 (_2!6622 lt!219784)))))

(declare-fun lt!220022 () Unit!8874)

(declare-fun lt!220021 () Unit!8874)

(assert (=> d!45454 (= lt!220022 lt!220021)))

(assert (=> d!45454 (isPrefixOf!0 lt!220009 (_2!6622 lt!219784))))

(assert (=> d!45454 (= lt!220021 (lemmaIsPrefixTransitive!0 lt!220009 (_2!6622 lt!219784) (_2!6622 lt!219784)))))

(declare-fun lt!220010 () Unit!8874)

(declare-fun lt!220025 () Unit!8874)

(assert (=> d!45454 (= lt!220010 lt!220025)))

(assert (=> d!45454 (isPrefixOf!0 lt!220009 (_2!6622 lt!219784))))

(assert (=> d!45454 (= lt!220025 (lemmaIsPrefixTransitive!0 lt!220009 (_2!6622 lt!219782) (_2!6622 lt!219784)))))

(declare-fun lt!220013 () Unit!8874)

(declare-fun e!94505 () Unit!8874)

(assert (=> d!45454 (= lt!220013 e!94505)))

(declare-fun c!7806 () Bool)

(assert (=> d!45454 (= c!7806 (not (= (size!2946 (buf!3367 (_2!6622 lt!219782))) #b00000000000000000000000000000000)))))

(declare-fun lt!220020 () Unit!8874)

(declare-fun lt!220015 () Unit!8874)

(assert (=> d!45454 (= lt!220020 lt!220015)))

(assert (=> d!45454 (isPrefixOf!0 (_2!6622 lt!219784) (_2!6622 lt!219784))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5150) Unit!8874)

(assert (=> d!45454 (= lt!220015 (lemmaIsPrefixRefl!0 (_2!6622 lt!219784)))))

(declare-fun lt!220018 () Unit!8874)

(declare-fun lt!220024 () Unit!8874)

(assert (=> d!45454 (= lt!220018 lt!220024)))

(assert (=> d!45454 (= lt!220024 (lemmaIsPrefixRefl!0 (_2!6622 lt!219784)))))

(declare-fun lt!220023 () Unit!8874)

(declare-fun lt!220017 () Unit!8874)

(assert (=> d!45454 (= lt!220023 lt!220017)))

(assert (=> d!45454 (isPrefixOf!0 lt!220009 lt!220009)))

(assert (=> d!45454 (= lt!220017 (lemmaIsPrefixRefl!0 lt!220009))))

(declare-fun lt!220014 () Unit!8874)

(declare-fun lt!220016 () Unit!8874)

(assert (=> d!45454 (= lt!220014 lt!220016)))

(assert (=> d!45454 (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!219782))))

(assert (=> d!45454 (= lt!220016 (lemmaIsPrefixRefl!0 (_2!6622 lt!219782)))))

(assert (=> d!45454 (= lt!220009 (BitStream!5151 (buf!3367 (_2!6622 lt!219784)) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))))))

(assert (=> d!45454 (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!219784))))

(assert (=> d!45454 (= (reader!0 (_2!6622 lt!219782) (_2!6622 lt!219784)) lt!220019)))

(declare-fun b!141861 () Bool)

(declare-fun lt!220012 () Unit!8874)

(assert (=> b!141861 (= e!94505 lt!220012)))

(declare-fun lt!220011 () (_ BitVec 64))

(assert (=> b!141861 (= lt!220011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220027 () (_ BitVec 64))

(assert (=> b!141861 (= lt!220027 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6505 array!6505 (_ BitVec 64) (_ BitVec 64)) Unit!8874)

(assert (=> b!141861 (= lt!220012 (arrayBitRangesEqSymmetric!0 (buf!3367 (_2!6622 lt!219782)) (buf!3367 (_2!6622 lt!219784)) lt!220011 lt!220027))))

(declare-fun arrayBitRangesEq!0 (array!6505 array!6505 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141861 (arrayBitRangesEq!0 (buf!3367 (_2!6622 lt!219784)) (buf!3367 (_2!6622 lt!219782)) lt!220011 lt!220027)))

(declare-fun b!141862 () Bool)

(declare-fun lt!220008 () (_ BitVec 64))

(declare-fun lt!220026 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5150 (_ BitVec 64)) BitStream!5150)

(assert (=> b!141862 (= e!94504 (= (_1!6623 lt!220019) (withMovedBitIndex!0 (_2!6623 lt!220019) (bvsub lt!220026 lt!220008))))))

(assert (=> b!141862 (or (= (bvand lt!220026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220026 lt!220008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141862 (= lt!220008 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219784))) (currentByte!6227 (_2!6622 lt!219784)) (currentBit!6222 (_2!6622 lt!219784))))))

(assert (=> b!141862 (= lt!220026 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))))))

(declare-fun b!141863 () Bool)

(declare-fun res!118363 () Bool)

(assert (=> b!141863 (=> (not res!118363) (not e!94504))))

(assert (=> b!141863 (= res!118363 (isPrefixOf!0 (_2!6623 lt!220019) (_2!6622 lt!219784)))))

(declare-fun b!141864 () Bool)

(declare-fun res!118361 () Bool)

(assert (=> b!141864 (=> (not res!118361) (not e!94504))))

(assert (=> b!141864 (= res!118361 (isPrefixOf!0 (_1!6623 lt!220019) (_2!6622 lt!219782)))))

(declare-fun b!141865 () Bool)

(declare-fun Unit!8878 () Unit!8874)

(assert (=> b!141865 (= e!94505 Unit!8878)))

(assert (= (and d!45454 c!7806) b!141861))

(assert (= (and d!45454 (not c!7806)) b!141865))

(assert (= (and d!45454 res!118362) b!141864))

(assert (= (and b!141864 res!118361) b!141863))

(assert (= (and b!141863 res!118363) b!141862))

(declare-fun m!217895 () Bool)

(assert (=> d!45454 m!217895))

(declare-fun m!217897 () Bool)

(assert (=> d!45454 m!217897))

(declare-fun m!217899 () Bool)

(assert (=> d!45454 m!217899))

(declare-fun m!217901 () Bool)

(assert (=> d!45454 m!217901))

(declare-fun m!217903 () Bool)

(assert (=> d!45454 m!217903))

(declare-fun m!217905 () Bool)

(assert (=> d!45454 m!217905))

(assert (=> d!45454 m!217761))

(declare-fun m!217907 () Bool)

(assert (=> d!45454 m!217907))

(declare-fun m!217909 () Bool)

(assert (=> d!45454 m!217909))

(declare-fun m!217911 () Bool)

(assert (=> d!45454 m!217911))

(declare-fun m!217913 () Bool)

(assert (=> d!45454 m!217913))

(declare-fun m!217915 () Bool)

(assert (=> b!141863 m!217915))

(assert (=> b!141861 m!217747))

(declare-fun m!217917 () Bool)

(assert (=> b!141861 m!217917))

(declare-fun m!217919 () Bool)

(assert (=> b!141861 m!217919))

(declare-fun m!217921 () Bool)

(assert (=> b!141862 m!217921))

(assert (=> b!141862 m!217765))

(assert (=> b!141862 m!217747))

(declare-fun m!217923 () Bool)

(assert (=> b!141864 m!217923))

(assert (=> b!141769 d!45454))

(declare-fun d!45460 () Bool)

(assert (=> d!45460 (= (array_inv!2735 arr!237) (bvsge (size!2946 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27490 d!45460))

(declare-fun d!45462 () Bool)

(assert (=> d!45462 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 thiss!1634))))))

(declare-fun bs!11175 () Bool)

(assert (= bs!11175 d!45462))

(assert (=> bs!11175 m!217745))

(assert (=> start!27490 d!45462))

(declare-fun d!45464 () Bool)

(declare-fun res!118380 () Bool)

(declare-fun e!94516 () Bool)

(assert (=> d!45464 (=> (not res!118380) (not e!94516))))

(assert (=> d!45464 (= res!118380 (= (size!2946 (buf!3367 (_2!6622 lt!219782))) (size!2946 (buf!3367 (_2!6622 lt!219784)))))))

(assert (=> d!45464 (= (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!219784)) e!94516)))

(declare-fun b!141882 () Bool)

(declare-fun res!118381 () Bool)

(assert (=> b!141882 (=> (not res!118381) (not e!94516))))

(assert (=> b!141882 (= res!118381 (bvsle (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))) (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219784))) (currentByte!6227 (_2!6622 lt!219784)) (currentBit!6222 (_2!6622 lt!219784)))))))

(declare-fun b!141883 () Bool)

(declare-fun e!94517 () Bool)

(assert (=> b!141883 (= e!94516 e!94517)))

(declare-fun res!118382 () Bool)

(assert (=> b!141883 (=> res!118382 e!94517)))

(assert (=> b!141883 (= res!118382 (= (size!2946 (buf!3367 (_2!6622 lt!219782))) #b00000000000000000000000000000000))))

(declare-fun b!141884 () Bool)

(assert (=> b!141884 (= e!94517 (arrayBitRangesEq!0 (buf!3367 (_2!6622 lt!219782)) (buf!3367 (_2!6622 lt!219784)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782)))))))

(assert (= (and d!45464 res!118380) b!141882))

(assert (= (and b!141882 res!118381) b!141883))

(assert (= (and b!141883 (not res!118382)) b!141884))

(assert (=> b!141882 m!217747))

(assert (=> b!141882 m!217765))

(assert (=> b!141884 m!217747))

(assert (=> b!141884 m!217747))

(declare-fun m!217947 () Bool)

(assert (=> b!141884 m!217947))

(assert (=> b!141768 d!45464))

(declare-fun d!45474 () Bool)

(assert (=> d!45474 (= (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 (_2!6622 lt!219782)))) (and (bvsge (currentBit!6222 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6222 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6227 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6227 thiss!1634) (size!2946 (buf!3367 (_2!6622 lt!219782)))) (and (= (currentBit!6222 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6227 thiss!1634) (size!2946 (buf!3367 (_2!6622 lt!219782))))))))))

(assert (=> b!141772 d!45474))

(declare-fun d!45476 () Bool)

(declare-fun e!94527 () Bool)

(assert (=> d!45476 e!94527))

(declare-fun res!118394 () Bool)

(assert (=> d!45476 (=> (not res!118394) (not e!94527))))

(assert (=> d!45476 (= res!118394 (and (or (let ((rhs!3179 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3179 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3179) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45478 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45478 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45478 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3178 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3178 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3178) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220099 () Unit!8874)

(declare-fun choose!57 (BitStream!5150 BitStream!5150 (_ BitVec 64) (_ BitVec 32)) Unit!8874)

(assert (=> d!45476 (= lt!220099 (choose!57 thiss!1634 (_2!6622 lt!219782) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45476 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6622 lt!219782) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220099)))

(declare-fun lt!220100 () (_ BitVec 32))

(declare-fun b!141900 () Bool)

(assert (=> b!141900 (= e!94527 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) (bvsub (bvsub to!404 from!447) lt!220100)))))

(assert (=> b!141900 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220100 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220100) #b10000000000000000000000000000000)))))

(declare-fun lt!220098 () (_ BitVec 64))

(assert (=> b!141900 (= lt!220100 ((_ extract 31 0) lt!220098))))

(assert (=> b!141900 (and (bvslt lt!220098 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220098 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!141900 (= lt!220098 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45476 res!118394) b!141900))

(declare-fun m!217953 () Bool)

(assert (=> d!45476 m!217953))

(declare-fun m!217955 () Bool)

(assert (=> b!141900 m!217955))

(assert (=> b!141761 d!45476))

(declare-fun d!45482 () Bool)

(declare-fun e!94529 () Bool)

(assert (=> d!45482 e!94529))

(declare-fun res!118397 () Bool)

(assert (=> d!45482 (=> (not res!118397) (not e!94529))))

(declare-fun lt!220112 () (_ BitVec 64))

(declare-fun lt!220110 () (_ BitVec 64))

(declare-fun lt!220104 () (_ BitVec 64))

(assert (=> d!45482 (= res!118397 (= lt!220112 (bvsub lt!220110 lt!220104)))))

(assert (=> d!45482 (or (= (bvand lt!220110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220110 lt!220104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45482 (= lt!220104 (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634))))))

(declare-fun lt!220102 () (_ BitVec 64))

(declare-fun lt!220108 () (_ BitVec 64))

(assert (=> d!45482 (= lt!220110 (bvmul lt!220102 lt!220108))))

(assert (=> d!45482 (or (= lt!220102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220108 (bvsdiv (bvmul lt!220102 lt!220108) lt!220102)))))

(assert (=> d!45482 (= lt!220108 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45482 (= lt!220102 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(assert (=> d!45482 (= lt!220112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6227 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6222 thiss!1634))))))

(assert (=> d!45482 (invariant!0 (currentBit!6222 thiss!1634) (currentByte!6227 thiss!1634) (size!2946 (buf!3367 (_2!6622 lt!219782))))))

(assert (=> d!45482 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)) lt!220112)))

(declare-fun b!141901 () Bool)

(declare-fun res!118398 () Bool)

(assert (=> b!141901 (=> (not res!118398) (not e!94529))))

(assert (=> b!141901 (= res!118398 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220112))))

(declare-fun b!141902 () Bool)

(declare-fun lt!220106 () (_ BitVec 64))

(assert (=> b!141902 (= e!94529 (bvsle lt!220112 (bvmul lt!220106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141902 (or (= lt!220106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220106)))))

(assert (=> b!141902 (= lt!220106 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(assert (= (and d!45482 res!118397) b!141901))

(assert (= (and b!141901 res!118398) b!141902))

(declare-fun m!217957 () Bool)

(assert (=> d!45482 m!217957))

(assert (=> d!45482 m!217759))

(assert (=> b!141761 d!45482))

(declare-fun d!45484 () Bool)

(declare-fun res!118400 () Bool)

(declare-fun e!94531 () Bool)

(assert (=> d!45484 (=> (not res!118400) (not e!94531))))

(assert (=> d!45484 (= res!118400 (= (size!2946 (buf!3367 thiss!1634)) (size!2946 (buf!3367 (_2!6622 lt!219784)))))))

(assert (=> d!45484 (= (isPrefixOf!0 thiss!1634 (_2!6622 lt!219784)) e!94531)))

(declare-fun b!141908 () Bool)

(declare-fun res!118401 () Bool)

(assert (=> b!141908 (=> (not res!118401) (not e!94531))))

(assert (=> b!141908 (= res!118401 (bvsle (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)) (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219784))) (currentByte!6227 (_2!6622 lt!219784)) (currentBit!6222 (_2!6622 lt!219784)))))))

(declare-fun b!141909 () Bool)

(declare-fun e!94532 () Bool)

(assert (=> b!141909 (= e!94531 e!94532)))

(declare-fun res!118402 () Bool)

(assert (=> b!141909 (=> res!118402 e!94532)))

(assert (=> b!141909 (= res!118402 (= (size!2946 (buf!3367 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!141910 () Bool)

(assert (=> b!141910 (= e!94532 (arrayBitRangesEq!0 (buf!3367 thiss!1634) (buf!3367 (_2!6622 lt!219784)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634))))))

(assert (= (and d!45484 res!118400) b!141908))

(assert (= (and b!141908 res!118401) b!141909))

(assert (= (and b!141909 (not res!118402)) b!141910))

(assert (=> b!141908 m!217749))

(assert (=> b!141908 m!217765))

(assert (=> b!141910 m!217749))

(assert (=> b!141910 m!217749))

(declare-fun m!217959 () Bool)

(assert (=> b!141910 m!217959))

(assert (=> b!141761 d!45484))

(declare-fun d!45486 () Bool)

(assert (=> d!45486 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11177 () Bool)

(assert (= bs!11177 d!45486))

(assert (=> bs!11177 m!217877))

(assert (=> b!141761 d!45486))

(declare-fun b!141951 () Bool)

(declare-fun e!94556 () Bool)

(declare-fun e!94555 () Bool)

(assert (=> b!141951 (= e!94556 e!94555)))

(declare-fun res!118442 () Bool)

(assert (=> b!141951 (=> (not res!118442) (not e!94555))))

(declare-fun lt!220225 () tuple2!12586)

(declare-fun lt!220227 () tuple2!12588)

(assert (=> b!141951 (= res!118442 (and (= (size!2946 (_2!6624 lt!220227)) (size!2946 arr!237)) (= (_1!6624 lt!220227) (_2!6623 lt!220225))))))

(assert (=> b!141951 (= lt!220227 (readByteArrayLoopPure!0 (_1!6623 lt!220225) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220229 () Unit!8874)

(declare-fun lt!220233 () Unit!8874)

(assert (=> b!141951 (= lt!220229 lt!220233)))

(declare-fun lt!220226 () tuple2!12584)

(declare-fun lt!220231 () (_ BitVec 64))

(assert (=> b!141951 (validate_offset_bits!1 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!220226)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) lt!220231)))

(assert (=> b!141951 (= lt!220233 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6622 lt!219782) (buf!3367 (_2!6622 lt!220226)) lt!220231))))

(declare-fun e!94554 () Bool)

(assert (=> b!141951 e!94554))

(declare-fun res!118441 () Bool)

(assert (=> b!141951 (=> (not res!118441) (not e!94554))))

(assert (=> b!141951 (= res!118441 (and (= (size!2946 (buf!3367 (_2!6622 lt!219782))) (size!2946 (buf!3367 (_2!6622 lt!220226)))) (bvsge lt!220231 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141951 (= lt!220231 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141951 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141951 (= lt!220225 (reader!0 (_2!6622 lt!219782) (_2!6622 lt!220226)))))

(declare-fun b!141952 () Bool)

(assert (=> b!141952 (= e!94555 (arrayRangesEq!262 arr!237 (_2!6624 lt!220227) #b00000000000000000000000000000000 to!404))))

(declare-fun b!141953 () Bool)

(assert (=> b!141953 (= e!94554 (validate_offset_bits!1 ((_ sign_extend 32) (size!2946 (buf!3367 (_2!6622 lt!219782)))) ((_ sign_extend 32) (currentByte!6227 (_2!6622 lt!219782))) ((_ sign_extend 32) (currentBit!6222 (_2!6622 lt!219782))) lt!220231))))

(declare-fun b!141954 () Bool)

(declare-fun res!118443 () Bool)

(assert (=> b!141954 (=> (not res!118443) (not e!94556))))

(assert (=> b!141954 (= res!118443 (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!220226)))))

(declare-fun b!141955 () Bool)

(declare-fun res!118445 () Bool)

(assert (=> b!141955 (=> (not res!118445) (not e!94556))))

(declare-fun lt!220232 () (_ BitVec 64))

(declare-fun lt!220230 () (_ BitVec 64))

(assert (=> b!141955 (= res!118445 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!220226))) (currentByte!6227 (_2!6622 lt!220226)) (currentBit!6222 (_2!6622 lt!220226))) (bvadd lt!220232 lt!220230)))))

(assert (=> b!141955 (or (not (= (bvand lt!220232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220230 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220232 lt!220230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!220228 () (_ BitVec 64))

(assert (=> b!141955 (= lt!220230 (bvmul lt!220228 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!141955 (or (= lt!220228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220228)))))

(assert (=> b!141955 (= lt!220228 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141955 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141955 (= lt!220232 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))))))

(declare-fun d!45490 () Bool)

(assert (=> d!45490 e!94556))

(declare-fun res!118444 () Bool)

(assert (=> d!45490 (=> (not res!118444) (not e!94556))))

(assert (=> d!45490 (= res!118444 (= (size!2946 (buf!3367 (_2!6622 lt!219782))) (size!2946 (buf!3367 (_2!6622 lt!220226)))))))

(declare-fun choose!64 (BitStream!5150 array!6505 (_ BitVec 32) (_ BitVec 32)) tuple2!12584)

(assert (=> d!45490 (= lt!220226 (choose!64 (_2!6622 lt!219782) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45490 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2946 arr!237)))))

(assert (=> d!45490 (= (appendByteArrayLoop!0 (_2!6622 lt!219782) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!220226)))

(assert (= (and d!45490 res!118444) b!141955))

(assert (= (and b!141955 res!118445) b!141954))

(assert (= (and b!141954 res!118443) b!141951))

(assert (= (and b!141951 res!118441) b!141953))

(assert (= (and b!141951 res!118442) b!141952))

(declare-fun m!218049 () Bool)

(assert (=> b!141955 m!218049))

(assert (=> b!141955 m!217747))

(declare-fun m!218051 () Bool)

(assert (=> b!141953 m!218051))

(declare-fun m!218053 () Bool)

(assert (=> b!141951 m!218053))

(declare-fun m!218055 () Bool)

(assert (=> b!141951 m!218055))

(declare-fun m!218057 () Bool)

(assert (=> b!141951 m!218057))

(declare-fun m!218059 () Bool)

(assert (=> b!141951 m!218059))

(declare-fun m!218061 () Bool)

(assert (=> d!45490 m!218061))

(declare-fun m!218063 () Bool)

(assert (=> b!141954 m!218063))

(declare-fun m!218065 () Bool)

(assert (=> b!141952 m!218065))

(assert (=> b!141761 d!45490))

(declare-fun d!45517 () Bool)

(assert (=> d!45517 (isPrefixOf!0 thiss!1634 (_2!6622 lt!219784))))

(declare-fun lt!220236 () Unit!8874)

(declare-fun choose!30 (BitStream!5150 BitStream!5150 BitStream!5150) Unit!8874)

(assert (=> d!45517 (= lt!220236 (choose!30 thiss!1634 (_2!6622 lt!219782) (_2!6622 lt!219784)))))

(assert (=> d!45517 (isPrefixOf!0 thiss!1634 (_2!6622 lt!219782))))

(assert (=> d!45517 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6622 lt!219782) (_2!6622 lt!219784)) lt!220236)))

(declare-fun bs!11181 () Bool)

(assert (= bs!11181 d!45517))

(assert (=> bs!11181 m!217775))

(declare-fun m!218067 () Bool)

(assert (=> bs!11181 m!218067))

(assert (=> bs!11181 m!217763))

(assert (=> b!141761 d!45517))

(declare-fun d!45519 () Bool)

(declare-fun e!94559 () Bool)

(assert (=> d!45519 e!94559))

(declare-fun res!118453 () Bool)

(assert (=> d!45519 (=> (not res!118453) (not e!94559))))

(declare-fun lt!220251 () tuple2!12584)

(assert (=> d!45519 (= res!118453 (= (size!2946 (buf!3367 thiss!1634)) (size!2946 (buf!3367 (_2!6622 lt!220251)))))))

(declare-fun choose!6 (BitStream!5150 (_ BitVec 8)) tuple2!12584)

(assert (=> d!45519 (= lt!220251 (choose!6 thiss!1634 (select (arr!3653 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45519 (validate_offset_byte!0 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634)))))

(assert (=> d!45519 (= (appendByte!0 thiss!1634 (select (arr!3653 arr!237) from!447)) lt!220251)))

(declare-fun b!141962 () Bool)

(declare-fun res!118454 () Bool)

(assert (=> b!141962 (=> (not res!118454) (not e!94559))))

(declare-fun lt!220250 () (_ BitVec 64))

(declare-fun lt!220248 () (_ BitVec 64))

(assert (=> b!141962 (= res!118454 (= (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!220251))) (currentByte!6227 (_2!6622 lt!220251)) (currentBit!6222 (_2!6622 lt!220251))) (bvadd lt!220250 lt!220248)))))

(assert (=> b!141962 (or (not (= (bvand lt!220250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220250 lt!220248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141962 (= lt!220248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!141962 (= lt!220250 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)))))

(declare-fun b!141963 () Bool)

(declare-fun res!118452 () Bool)

(assert (=> b!141963 (=> (not res!118452) (not e!94559))))

(assert (=> b!141963 (= res!118452 (isPrefixOf!0 thiss!1634 (_2!6622 lt!220251)))))

(declare-fun lt!220247 () tuple2!12590)

(declare-fun b!141964 () Bool)

(declare-fun lt!220249 () tuple2!12586)

(assert (=> b!141964 (= e!94559 (and (= (_2!6625 lt!220247) (select (arr!3653 arr!237) from!447)) (= (_1!6625 lt!220247) (_2!6623 lt!220249))))))

(assert (=> b!141964 (= lt!220247 (readBytePure!0 (_1!6623 lt!220249)))))

(assert (=> b!141964 (= lt!220249 (reader!0 thiss!1634 (_2!6622 lt!220251)))))

(assert (= (and d!45519 res!118453) b!141962))

(assert (= (and b!141962 res!118454) b!141963))

(assert (= (and b!141963 res!118452) b!141964))

(assert (=> d!45519 m!217753))

(declare-fun m!218069 () Bool)

(assert (=> d!45519 m!218069))

(declare-fun m!218071 () Bool)

(assert (=> d!45519 m!218071))

(declare-fun m!218073 () Bool)

(assert (=> b!141962 m!218073))

(assert (=> b!141962 m!217749))

(declare-fun m!218075 () Bool)

(assert (=> b!141963 m!218075))

(declare-fun m!218077 () Bool)

(assert (=> b!141964 m!218077))

(declare-fun m!218079 () Bool)

(assert (=> b!141964 m!218079))

(assert (=> b!141761 d!45519))

(declare-fun d!45521 () Bool)

(declare-fun res!118459 () Bool)

(declare-fun e!94564 () Bool)

(assert (=> d!45521 (=> res!118459 e!94564)))

(assert (=> d!45521 (= res!118459 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45521 (= (arrayRangesEq!262 arr!237 (_2!6624 lt!219786) #b00000000000000000000000000000000 to!404) e!94564)))

(declare-fun b!141969 () Bool)

(declare-fun e!94565 () Bool)

(assert (=> b!141969 (= e!94564 e!94565)))

(declare-fun res!118460 () Bool)

(assert (=> b!141969 (=> (not res!118460) (not e!94565))))

(assert (=> b!141969 (= res!118460 (= (select (arr!3653 arr!237) #b00000000000000000000000000000000) (select (arr!3653 (_2!6624 lt!219786)) #b00000000000000000000000000000000)))))

(declare-fun b!141970 () Bool)

(assert (=> b!141970 (= e!94565 (arrayRangesEq!262 arr!237 (_2!6624 lt!219786) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45521 (not res!118459)) b!141969))

(assert (= (and b!141969 res!118460) b!141970))

(declare-fun m!218081 () Bool)

(assert (=> b!141969 m!218081))

(declare-fun m!218083 () Bool)

(assert (=> b!141969 m!218083))

(declare-fun m!218085 () Bool)

(assert (=> b!141970 m!218085))

(assert (=> b!141771 d!45521))

(declare-fun d!45523 () Bool)

(declare-datatypes ((tuple2!12596 0))(
  ( (tuple2!12597 (_1!6631 (_ BitVec 8)) (_2!6631 BitStream!5150)) )
))
(declare-fun lt!220254 () tuple2!12596)

(declare-fun readByte!0 (BitStream!5150) tuple2!12596)

(assert (=> d!45523 (= lt!220254 (readByte!0 (_1!6623 lt!219787)))))

(assert (=> d!45523 (= (readBytePure!0 (_1!6623 lt!219787)) (tuple2!12591 (_2!6631 lt!220254) (_1!6631 lt!220254)))))

(declare-fun bs!11182 () Bool)

(assert (= bs!11182 d!45523))

(declare-fun m!218087 () Bool)

(assert (=> bs!11182 m!218087))

(assert (=> b!141770 d!45523))

(declare-fun d!45525 () Bool)

(declare-fun e!94566 () Bool)

(assert (=> d!45525 e!94566))

(declare-fun res!118462 () Bool)

(assert (=> d!45525 (=> (not res!118462) (not e!94566))))

(declare-fun lt!220266 () tuple2!12586)

(assert (=> d!45525 (= res!118462 (isPrefixOf!0 (_1!6623 lt!220266) (_2!6623 lt!220266)))))

(declare-fun lt!220256 () BitStream!5150)

(assert (=> d!45525 (= lt!220266 (tuple2!12587 lt!220256 (_2!6622 lt!219782)))))

(declare-fun lt!220269 () Unit!8874)

(declare-fun lt!220268 () Unit!8874)

(assert (=> d!45525 (= lt!220269 lt!220268)))

(assert (=> d!45525 (isPrefixOf!0 lt!220256 (_2!6622 lt!219782))))

(assert (=> d!45525 (= lt!220268 (lemmaIsPrefixTransitive!0 lt!220256 (_2!6622 lt!219782) (_2!6622 lt!219782)))))

(declare-fun lt!220257 () Unit!8874)

(declare-fun lt!220272 () Unit!8874)

(assert (=> d!45525 (= lt!220257 lt!220272)))

(assert (=> d!45525 (isPrefixOf!0 lt!220256 (_2!6622 lt!219782))))

(assert (=> d!45525 (= lt!220272 (lemmaIsPrefixTransitive!0 lt!220256 thiss!1634 (_2!6622 lt!219782)))))

(declare-fun lt!220260 () Unit!8874)

(declare-fun e!94567 () Unit!8874)

(assert (=> d!45525 (= lt!220260 e!94567)))

(declare-fun c!7811 () Bool)

(assert (=> d!45525 (= c!7811 (not (= (size!2946 (buf!3367 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!220267 () Unit!8874)

(declare-fun lt!220262 () Unit!8874)

(assert (=> d!45525 (= lt!220267 lt!220262)))

(assert (=> d!45525 (isPrefixOf!0 (_2!6622 lt!219782) (_2!6622 lt!219782))))

(assert (=> d!45525 (= lt!220262 (lemmaIsPrefixRefl!0 (_2!6622 lt!219782)))))

(declare-fun lt!220265 () Unit!8874)

(declare-fun lt!220271 () Unit!8874)

(assert (=> d!45525 (= lt!220265 lt!220271)))

(assert (=> d!45525 (= lt!220271 (lemmaIsPrefixRefl!0 (_2!6622 lt!219782)))))

(declare-fun lt!220270 () Unit!8874)

(declare-fun lt!220264 () Unit!8874)

(assert (=> d!45525 (= lt!220270 lt!220264)))

(assert (=> d!45525 (isPrefixOf!0 lt!220256 lt!220256)))

(assert (=> d!45525 (= lt!220264 (lemmaIsPrefixRefl!0 lt!220256))))

(declare-fun lt!220261 () Unit!8874)

(declare-fun lt!220263 () Unit!8874)

(assert (=> d!45525 (= lt!220261 lt!220263)))

(assert (=> d!45525 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45525 (= lt!220263 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45525 (= lt!220256 (BitStream!5151 (buf!3367 (_2!6622 lt!219782)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)))))

(assert (=> d!45525 (isPrefixOf!0 thiss!1634 (_2!6622 lt!219782))))

(assert (=> d!45525 (= (reader!0 thiss!1634 (_2!6622 lt!219782)) lt!220266)))

(declare-fun b!141971 () Bool)

(declare-fun lt!220259 () Unit!8874)

(assert (=> b!141971 (= e!94567 lt!220259)))

(declare-fun lt!220258 () (_ BitVec 64))

(assert (=> b!141971 (= lt!220258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220274 () (_ BitVec 64))

(assert (=> b!141971 (= lt!220274 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)))))

(assert (=> b!141971 (= lt!220259 (arrayBitRangesEqSymmetric!0 (buf!3367 thiss!1634) (buf!3367 (_2!6622 lt!219782)) lt!220258 lt!220274))))

(assert (=> b!141971 (arrayBitRangesEq!0 (buf!3367 (_2!6622 lt!219782)) (buf!3367 thiss!1634) lt!220258 lt!220274)))

(declare-fun b!141972 () Bool)

(declare-fun lt!220255 () (_ BitVec 64))

(declare-fun lt!220273 () (_ BitVec 64))

(assert (=> b!141972 (= e!94566 (= (_1!6623 lt!220266) (withMovedBitIndex!0 (_2!6623 lt!220266) (bvsub lt!220273 lt!220255))))))

(assert (=> b!141972 (or (= (bvand lt!220273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220273 lt!220255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141972 (= lt!220255 (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782))))))

(assert (=> b!141972 (= lt!220273 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)))))

(declare-fun b!141973 () Bool)

(declare-fun res!118463 () Bool)

(assert (=> b!141973 (=> (not res!118463) (not e!94566))))

(assert (=> b!141973 (= res!118463 (isPrefixOf!0 (_2!6623 lt!220266) (_2!6622 lt!219782)))))

(declare-fun b!141974 () Bool)

(declare-fun res!118461 () Bool)

(assert (=> b!141974 (=> (not res!118461) (not e!94566))))

(assert (=> b!141974 (= res!118461 (isPrefixOf!0 (_1!6623 lt!220266) thiss!1634))))

(declare-fun b!141975 () Bool)

(declare-fun Unit!8881 () Unit!8874)

(assert (=> b!141975 (= e!94567 Unit!8881)))

(assert (= (and d!45525 c!7811) b!141971))

(assert (= (and d!45525 (not c!7811)) b!141975))

(assert (= (and d!45525 res!118462) b!141974))

(assert (= (and b!141974 res!118461) b!141973))

(assert (= (and b!141973 res!118463) b!141972))

(declare-fun m!218089 () Bool)

(assert (=> d!45525 m!218089))

(declare-fun m!218091 () Bool)

(assert (=> d!45525 m!218091))

(declare-fun m!218093 () Bool)

(assert (=> d!45525 m!218093))

(declare-fun m!218095 () Bool)

(assert (=> d!45525 m!218095))

(declare-fun m!218097 () Bool)

(assert (=> d!45525 m!218097))

(assert (=> d!45525 m!217901))

(assert (=> d!45525 m!217763))

(assert (=> d!45525 m!217909))

(declare-fun m!218099 () Bool)

(assert (=> d!45525 m!218099))

(declare-fun m!218101 () Bool)

(assert (=> d!45525 m!218101))

(declare-fun m!218103 () Bool)

(assert (=> d!45525 m!218103))

(declare-fun m!218105 () Bool)

(assert (=> b!141973 m!218105))

(assert (=> b!141971 m!217749))

(declare-fun m!218107 () Bool)

(assert (=> b!141971 m!218107))

(declare-fun m!218109 () Bool)

(assert (=> b!141971 m!218109))

(declare-fun m!218111 () Bool)

(assert (=> b!141972 m!218111))

(assert (=> b!141972 m!217747))

(assert (=> b!141972 m!217749))

(declare-fun m!218113 () Bool)

(assert (=> b!141974 m!218113))

(assert (=> b!141770 d!45525))

(declare-fun d!45527 () Bool)

(assert (=> d!45527 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2946 (buf!3367 thiss!1634))) ((_ sign_extend 32) (currentByte!6227 thiss!1634)) ((_ sign_extend 32) (currentBit!6222 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11183 () Bool)

(assert (= bs!11183 d!45527))

(assert (=> bs!11183 m!217881))

(assert (=> b!141764 d!45527))

(declare-fun d!45529 () Bool)

(assert (=> d!45529 (= (array_inv!2735 (buf!3367 thiss!1634)) (bvsge (size!2946 (buf!3367 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!141763 d!45529))

(declare-fun d!45531 () Bool)

(declare-fun res!118464 () Bool)

(declare-fun e!94568 () Bool)

(assert (=> d!45531 (=> (not res!118464) (not e!94568))))

(assert (=> d!45531 (= res!118464 (= (size!2946 (buf!3367 thiss!1634)) (size!2946 (buf!3367 (_2!6622 lt!219782)))))))

(assert (=> d!45531 (= (isPrefixOf!0 thiss!1634 (_2!6622 lt!219782)) e!94568)))

(declare-fun b!141976 () Bool)

(declare-fun res!118465 () Bool)

(assert (=> b!141976 (=> (not res!118465) (not e!94568))))

(assert (=> b!141976 (= res!118465 (bvsle (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634)) (bitIndex!0 (size!2946 (buf!3367 (_2!6622 lt!219782))) (currentByte!6227 (_2!6622 lt!219782)) (currentBit!6222 (_2!6622 lt!219782)))))))

(declare-fun b!141977 () Bool)

(declare-fun e!94569 () Bool)

(assert (=> b!141977 (= e!94568 e!94569)))

(declare-fun res!118466 () Bool)

(assert (=> b!141977 (=> res!118466 e!94569)))

(assert (=> b!141977 (= res!118466 (= (size!2946 (buf!3367 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!141978 () Bool)

(assert (=> b!141978 (= e!94569 (arrayBitRangesEq!0 (buf!3367 thiss!1634) (buf!3367 (_2!6622 lt!219782)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2946 (buf!3367 thiss!1634)) (currentByte!6227 thiss!1634) (currentBit!6222 thiss!1634))))))

(assert (= (and d!45531 res!118464) b!141976))

(assert (= (and b!141976 res!118465) b!141977))

(assert (= (and b!141977 (not res!118466)) b!141978))

(assert (=> b!141976 m!217749))

(assert (=> b!141976 m!217747))

(assert (=> b!141978 m!217749))

(assert (=> b!141978 m!217749))

(declare-fun m!218115 () Bool)

(assert (=> b!141978 m!218115))

(assert (=> b!141762 d!45531))

(push 1)

(assert (not d!45527))

(assert (not b!141972))

(assert (not b!141962))

(assert (not b!141908))

(assert (not d!45448))

(assert (not b!141963))

(assert (not b!141970))

(assert (not b!141952))

(assert (not d!45476))

(assert (not d!45519))

(assert (not d!45438))

(assert (not b!141954))

(assert (not b!141973))

(assert (not b!141971))

(assert (not b!141862))

(assert (not b!141951))

(assert (not b!141861))

(assert (not b!141978))

(assert (not b!141863))

(assert (not d!45517))

(assert (not b!141864))

(assert (not b!141974))

(assert (not d!45440))

(assert (not b!141955))

(assert (not d!45525))

(assert (not b!141976))

(assert (not b!141953))

(assert (not b!141910))

(assert (not d!45523))

(assert (not d!45490))

(assert (not b!141884))

(assert (not d!45482))

(assert (not d!45454))

(assert (not d!45430))

(assert (not d!45486))

(assert (not d!45462))

(assert (not b!141900))

(assert (not b!141882))

(assert (not d!45450))

(assert (not d!45434))

(assert (not b!141964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

