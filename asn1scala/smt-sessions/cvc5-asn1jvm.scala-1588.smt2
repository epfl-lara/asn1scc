; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45282 () Bool)

(assert start!45282)

(declare-fun b!218892 () Bool)

(declare-fun res!184322 () Bool)

(declare-fun e!148699 () Bool)

(assert (=> b!218892 (=> (not res!184322) (not e!148699))))

(declare-datatypes ((array!10646 0))(
  ( (array!10647 (arr!5605 (Array (_ BitVec 32) (_ BitVec 8))) (size!4675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8458 0))(
  ( (BitStream!8459 (buf!5222 array!10646) (currentByte!9821 (_ BitVec 32)) (currentBit!9816 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8458)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218892 (= res!184322 (invariant!0 (currentBit!9816 thiss!1204) (currentByte!9821 thiss!1204) (size!4675 (buf!5222 thiss!1204))))))

(declare-fun b!218893 () Bool)

(declare-fun res!184310 () Bool)

(declare-fun e!148698 () Bool)

(assert (=> b!218893 (=> (not res!184310) (not e!148698))))

(declare-fun lt!346665 () (_ BitVec 64))

(declare-fun lt!346666 () (_ BitVec 64))

(declare-datatypes ((tuple2!18662 0))(
  ( (tuple2!18663 (_1!9989 BitStream!8458) (_2!9989 BitStream!8458)) )
))
(declare-fun lt!346664 () tuple2!18662)

(declare-fun withMovedBitIndex!0 (BitStream!8458 (_ BitVec 64)) BitStream!8458)

(assert (=> b!218893 (= res!184310 (= (_1!9989 lt!346664) (withMovedBitIndex!0 (_2!9989 lt!346664) (bvsub lt!346665 lt!346666))))))

(declare-datatypes ((tuple2!18664 0))(
  ( (tuple2!18665 (_1!9990 BitStream!8458) (_2!9990 (_ BitVec 64))) )
))
(declare-fun lt!346661 () tuple2!18664)

(declare-fun lt!346654 () BitStream!8458)

(declare-fun lt!346658 () tuple2!18662)

(declare-fun lt!346662 () (_ BitVec 64))

(declare-fun lt!346667 () tuple2!18664)

(declare-fun b!218894 () Bool)

(assert (=> b!218894 (= e!148698 (and (= lt!346665 (bvsub lt!346662 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9989 lt!346658) lt!346654)) (= (_2!9990 lt!346667) (_2!9990 lt!346661)))))))

(declare-fun b!218895 () Bool)

(declare-fun res!184312 () Bool)

(declare-fun e!148704 () Bool)

(assert (=> b!218895 (=> res!184312 e!148704)))

(declare-datatypes ((Unit!15547 0))(
  ( (Unit!15548) )
))
(declare-datatypes ((tuple2!18666 0))(
  ( (tuple2!18667 (_1!9991 Unit!15547) (_2!9991 BitStream!8458)) )
))
(declare-fun lt!346649 () tuple2!18666)

(declare-fun lt!346668 () tuple2!18666)

(declare-fun isPrefixOf!0 (BitStream!8458 BitStream!8458) Bool)

(assert (=> b!218895 (= res!184312 (not (isPrefixOf!0 (_2!9991 lt!346649) (_2!9991 lt!346668))))))

(declare-fun b!218896 () Bool)

(declare-fun res!184327 () Bool)

(declare-fun e!148702 () Bool)

(assert (=> b!218896 (=> res!184327 e!148702)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218896 (= res!184327 (not (= (bitIndex!0 (size!4675 (buf!5222 (_1!9990 lt!346667))) (currentByte!9821 (_1!9990 lt!346667)) (currentBit!9816 (_1!9990 lt!346667))) (bitIndex!0 (size!4675 (buf!5222 (_2!9989 lt!346664))) (currentByte!9821 (_2!9989 lt!346664)) (currentBit!9816 (_2!9989 lt!346664))))))))

(declare-fun b!218897 () Bool)

(declare-fun e!148701 () Bool)

(assert (=> b!218897 (= e!148701 e!148702)))

(declare-fun res!184317 () Bool)

(assert (=> b!218897 (=> res!184317 e!148702)))

(assert (=> b!218897 (= res!184317 (not (= (_1!9989 lt!346658) lt!346654)))))

(assert (=> b!218897 e!148698))

(declare-fun res!184316 () Bool)

(assert (=> b!218897 (=> (not res!184316) (not e!148698))))

(declare-fun lt!346650 () tuple2!18664)

(assert (=> b!218897 (= res!184316 (and (= (_2!9990 lt!346667) (_2!9990 lt!346650)) (= (_1!9990 lt!346667) (_1!9990 lt!346650))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!346642 () (_ BitVec 64))

(declare-fun lt!346653 () Unit!15547)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15547)

(assert (=> b!218897 (= lt!346653 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9989 lt!346664) nBits!348 i!590 lt!346642))))

(declare-fun lt!346657 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18664)

(assert (=> b!218897 (= lt!346650 (readNBitsLSBFirstsLoopPure!0 lt!346654 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346657))))

(assert (=> b!218897 (= lt!346654 (withMovedBitIndex!0 (_1!9989 lt!346664) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!218898 () Bool)

(declare-fun res!184320 () Bool)

(assert (=> b!218898 (=> (not res!184320) (not e!148699))))

(assert (=> b!218898 (= res!184320 (not (= i!590 nBits!348)))))

(declare-fun b!218899 () Bool)

(declare-fun res!184311 () Bool)

(assert (=> b!218899 (=> (not res!184311) (not e!148698))))

(assert (=> b!218899 (= res!184311 (= (_1!9989 lt!346658) (withMovedBitIndex!0 (_2!9989 lt!346658) (bvsub lt!346662 lt!346666))))))

(declare-fun b!218900 () Bool)

(declare-fun res!184328 () Bool)

(assert (=> b!218900 (=> res!184328 e!148704)))

(assert (=> b!218900 (= res!184328 (not (isPrefixOf!0 thiss!1204 (_2!9991 lt!346649))))))

(declare-fun b!218902 () Bool)

(declare-fun e!148694 () Bool)

(declare-datatypes ((tuple2!18668 0))(
  ( (tuple2!18669 (_1!9992 BitStream!8458) (_2!9992 Bool)) )
))
(declare-fun lt!346659 () tuple2!18668)

(declare-fun lt!346656 () (_ BitVec 64))

(assert (=> b!218902 (= e!148694 (= (bitIndex!0 (size!4675 (buf!5222 (_1!9992 lt!346659))) (currentByte!9821 (_1!9992 lt!346659)) (currentBit!9816 (_1!9992 lt!346659))) lt!346656))))

(declare-fun b!218903 () Bool)

(declare-fun e!148693 () Bool)

(assert (=> b!218903 (= e!148693 e!148694)))

(declare-fun res!184315 () Bool)

(assert (=> b!218903 (=> (not res!184315) (not e!148694))))

(declare-fun lt!346652 () Bool)

(assert (=> b!218903 (= res!184315 (and (= (_2!9992 lt!346659) lt!346652) (= (_1!9992 lt!346659) (_2!9991 lt!346649))))))

(declare-fun readBitPure!0 (BitStream!8458) tuple2!18668)

(declare-fun readerFrom!0 (BitStream!8458 (_ BitVec 32) (_ BitVec 32)) BitStream!8458)

(assert (=> b!218903 (= lt!346659 (readBitPure!0 (readerFrom!0 (_2!9991 lt!346649) (currentBit!9816 thiss!1204) (currentByte!9821 thiss!1204))))))

(declare-fun b!218904 () Bool)

(declare-fun res!184314 () Bool)

(assert (=> b!218904 (=> (not res!184314) (not e!148693))))

(assert (=> b!218904 (= res!184314 (isPrefixOf!0 thiss!1204 (_2!9991 lt!346649)))))

(declare-fun b!218905 () Bool)

(assert (=> b!218905 (= e!148704 e!148701)))

(declare-fun res!184319 () Bool)

(assert (=> b!218905 (=> res!184319 e!148701)))

(assert (=> b!218905 (= res!184319 (not (= (_1!9990 lt!346661) (_2!9989 lt!346658))))))

(assert (=> b!218905 (= lt!346661 (readNBitsLSBFirstsLoopPure!0 (_1!9989 lt!346658) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346657))))

(declare-fun lt!346645 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218905 (validate_offset_bits!1 ((_ sign_extend 32) (size!4675 (buf!5222 (_2!9991 lt!346668)))) ((_ sign_extend 32) (currentByte!9821 (_2!9991 lt!346649))) ((_ sign_extend 32) (currentBit!9816 (_2!9991 lt!346649))) lt!346645)))

(declare-fun lt!346670 () Unit!15547)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8458 array!10646 (_ BitVec 64)) Unit!15547)

(assert (=> b!218905 (= lt!346670 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9991 lt!346649) (buf!5222 (_2!9991 lt!346668)) lt!346645))))

(assert (=> b!218905 (= lt!346645 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!346663 () (_ BitVec 64))

(declare-fun lt!346651 () tuple2!18668)

(assert (=> b!218905 (= lt!346657 (bvor lt!346642 (ite (_2!9992 lt!346651) lt!346663 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218905 (= lt!346667 (readNBitsLSBFirstsLoopPure!0 (_1!9989 lt!346664) nBits!348 i!590 lt!346642))))

(declare-fun lt!346643 () (_ BitVec 64))

(assert (=> b!218905 (validate_offset_bits!1 ((_ sign_extend 32) (size!4675 (buf!5222 (_2!9991 lt!346668)))) ((_ sign_extend 32) (currentByte!9821 thiss!1204)) ((_ sign_extend 32) (currentBit!9816 thiss!1204)) lt!346643)))

(declare-fun lt!346644 () Unit!15547)

(assert (=> b!218905 (= lt!346644 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5222 (_2!9991 lt!346668)) lt!346643))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218905 (= lt!346642 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218905 (= (_2!9992 lt!346651) lt!346652)))

(assert (=> b!218905 (= lt!346651 (readBitPure!0 (_1!9989 lt!346664)))))

(declare-fun reader!0 (BitStream!8458 BitStream!8458) tuple2!18662)

(assert (=> b!218905 (= lt!346658 (reader!0 (_2!9991 lt!346649) (_2!9991 lt!346668)))))

(assert (=> b!218905 (= lt!346664 (reader!0 thiss!1204 (_2!9991 lt!346668)))))

(declare-fun e!148697 () Bool)

(assert (=> b!218905 e!148697))

(declare-fun res!184326 () Bool)

(assert (=> b!218905 (=> (not res!184326) (not e!148697))))

(declare-fun lt!346647 () tuple2!18668)

(declare-fun lt!346646 () tuple2!18668)

(assert (=> b!218905 (= res!184326 (= (bitIndex!0 (size!4675 (buf!5222 (_1!9992 lt!346647))) (currentByte!9821 (_1!9992 lt!346647)) (currentBit!9816 (_1!9992 lt!346647))) (bitIndex!0 (size!4675 (buf!5222 (_1!9992 lt!346646))) (currentByte!9821 (_1!9992 lt!346646)) (currentBit!9816 (_1!9992 lt!346646)))))))

(declare-fun lt!346660 () Unit!15547)

(declare-fun lt!346655 () BitStream!8458)

(declare-fun readBitPrefixLemma!0 (BitStream!8458 BitStream!8458) Unit!15547)

(assert (=> b!218905 (= lt!346660 (readBitPrefixLemma!0 lt!346655 (_2!9991 lt!346668)))))

(assert (=> b!218905 (= lt!346646 (readBitPure!0 (BitStream!8459 (buf!5222 (_2!9991 lt!346668)) (currentByte!9821 thiss!1204) (currentBit!9816 thiss!1204))))))

(assert (=> b!218905 (= lt!346647 (readBitPure!0 lt!346655))))

(declare-fun e!148700 () Bool)

(assert (=> b!218905 e!148700))

(declare-fun res!184308 () Bool)

(assert (=> b!218905 (=> (not res!184308) (not e!148700))))

(assert (=> b!218905 (= res!184308 (invariant!0 (currentBit!9816 thiss!1204) (currentByte!9821 thiss!1204) (size!4675 (buf!5222 (_2!9991 lt!346649)))))))

(assert (=> b!218905 (= lt!346655 (BitStream!8459 (buf!5222 (_2!9991 lt!346649)) (currentByte!9821 thiss!1204) (currentBit!9816 thiss!1204)))))

(declare-fun b!218906 () Bool)

(assert (=> b!218906 (= e!148702 true)))

(declare-fun e!148703 () Bool)

(assert (=> b!218906 e!148703))

(declare-fun res!184318 () Bool)

(assert (=> b!218906 (=> (not res!184318) (not e!148703))))

(assert (=> b!218906 (= res!184318 (= (size!4675 (buf!5222 thiss!1204)) (size!4675 (buf!5222 (_2!9991 lt!346668)))))))

(declare-fun b!218907 () Bool)

(assert (=> b!218907 (= e!148703 (= (_1!9990 lt!346667) (_2!9989 lt!346664)))))

(declare-fun b!218908 () Bool)

(declare-fun e!148692 () Bool)

(assert (=> b!218908 (= e!148692 e!148693)))

(declare-fun res!184324 () Bool)

(assert (=> b!218908 (=> (not res!184324) (not e!148693))))

(declare-fun lt!346669 () (_ BitVec 64))

(assert (=> b!218908 (= res!184324 (= lt!346656 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346669)))))

(assert (=> b!218908 (= lt!346656 (bitIndex!0 (size!4675 (buf!5222 (_2!9991 lt!346649))) (currentByte!9821 (_2!9991 lt!346649)) (currentBit!9816 (_2!9991 lt!346649))))))

(assert (=> b!218908 (= lt!346669 (bitIndex!0 (size!4675 (buf!5222 thiss!1204)) (currentByte!9821 thiss!1204) (currentBit!9816 thiss!1204)))))

(declare-fun b!218909 () Bool)

(declare-fun e!148691 () Bool)

(assert (=> b!218909 (= e!148691 e!148699)))

(declare-fun res!184330 () Bool)

(assert (=> b!218909 (=> (not res!184330) (not e!148699))))

(assert (=> b!218909 (= res!184330 (validate_offset_bits!1 ((_ sign_extend 32) (size!4675 (buf!5222 thiss!1204))) ((_ sign_extend 32) (currentByte!9821 thiss!1204)) ((_ sign_extend 32) (currentBit!9816 thiss!1204)) lt!346643))))

(assert (=> b!218909 (= lt!346643 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!184329 () Bool)

(assert (=> start!45282 (=> (not res!184329) (not e!148691))))

(assert (=> start!45282 (= res!184329 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45282 e!148691))

(assert (=> start!45282 true))

(declare-fun e!148696 () Bool)

(declare-fun inv!12 (BitStream!8458) Bool)

(assert (=> start!45282 (and (inv!12 thiss!1204) e!148696)))

(declare-fun b!218901 () Bool)

(declare-fun e!148690 () Bool)

(assert (=> b!218901 (= e!148690 e!148704)))

(declare-fun res!184313 () Bool)

(assert (=> b!218901 (=> res!184313 e!148704)))

(assert (=> b!218901 (= res!184313 (not (= lt!346666 (bvsub (bvsub (bvadd lt!346662 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!218901 (= lt!346666 (bitIndex!0 (size!4675 (buf!5222 (_2!9991 lt!346668))) (currentByte!9821 (_2!9991 lt!346668)) (currentBit!9816 (_2!9991 lt!346668))))))

(assert (=> b!218901 (isPrefixOf!0 thiss!1204 (_2!9991 lt!346668))))

(declare-fun lt!346648 () Unit!15547)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8458 BitStream!8458 BitStream!8458) Unit!15547)

(assert (=> b!218901 (= lt!346648 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9991 lt!346649) (_2!9991 lt!346668)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18666)

(assert (=> b!218901 (= lt!346668 (appendBitsLSBFirstLoopTR!0 (_2!9991 lt!346649) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218910 () Bool)

(declare-fun res!184331 () Bool)

(assert (=> b!218910 (=> (not res!184331) (not e!148703))))

(assert (=> b!218910 (= res!184331 (= (_2!9990 lt!346667) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218911 () Bool)

(assert (=> b!218911 (= e!148699 (not e!148690))))

(declare-fun res!184325 () Bool)

(assert (=> b!218911 (=> res!184325 e!148690)))

(assert (=> b!218911 (= res!184325 (not (= lt!346662 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346665))))))

(assert (=> b!218911 (= lt!346662 (bitIndex!0 (size!4675 (buf!5222 (_2!9991 lt!346649))) (currentByte!9821 (_2!9991 lt!346649)) (currentBit!9816 (_2!9991 lt!346649))))))

(assert (=> b!218911 (= lt!346665 (bitIndex!0 (size!4675 (buf!5222 thiss!1204)) (currentByte!9821 thiss!1204) (currentBit!9816 thiss!1204)))))

(assert (=> b!218911 e!148692))

(declare-fun res!184309 () Bool)

(assert (=> b!218911 (=> (not res!184309) (not e!148692))))

(assert (=> b!218911 (= res!184309 (= (size!4675 (buf!5222 thiss!1204)) (size!4675 (buf!5222 (_2!9991 lt!346649)))))))

(declare-fun appendBit!0 (BitStream!8458 Bool) tuple2!18666)

(assert (=> b!218911 (= lt!346649 (appendBit!0 thiss!1204 lt!346652))))

(assert (=> b!218911 (= lt!346652 (not (= (bvand v!189 lt!346663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218911 (= lt!346663 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!218912 () Bool)

(declare-fun res!184323 () Bool)

(assert (=> b!218912 (=> res!184323 e!148704)))

(assert (=> b!218912 (= res!184323 (or (not (= (size!4675 (buf!5222 (_2!9991 lt!346668))) (size!4675 (buf!5222 thiss!1204)))) (not (= lt!346666 (bvsub (bvadd lt!346665 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!218913 () Bool)

(declare-fun array_inv!4416 (array!10646) Bool)

(assert (=> b!218913 (= e!148696 (array_inv!4416 (buf!5222 thiss!1204)))))

(declare-fun b!218914 () Bool)

(assert (=> b!218914 (= e!148700 (invariant!0 (currentBit!9816 thiss!1204) (currentByte!9821 thiss!1204) (size!4675 (buf!5222 (_2!9991 lt!346668)))))))

(declare-fun b!218915 () Bool)

(assert (=> b!218915 (= e!148697 (= (_2!9992 lt!346647) (_2!9992 lt!346646)))))

(declare-fun b!218916 () Bool)

(declare-fun res!184321 () Bool)

(assert (=> b!218916 (=> res!184321 e!148704)))

(assert (=> b!218916 (= res!184321 (not (invariant!0 (currentBit!9816 (_2!9991 lt!346668)) (currentByte!9821 (_2!9991 lt!346668)) (size!4675 (buf!5222 (_2!9991 lt!346668))))))))

(assert (= (and start!45282 res!184329) b!218909))

(assert (= (and b!218909 res!184330) b!218892))

(assert (= (and b!218892 res!184322) b!218898))

(assert (= (and b!218898 res!184320) b!218911))

(assert (= (and b!218911 res!184309) b!218908))

(assert (= (and b!218908 res!184324) b!218904))

(assert (= (and b!218904 res!184314) b!218903))

(assert (= (and b!218903 res!184315) b!218902))

(assert (= (and b!218911 (not res!184325)) b!218901))

(assert (= (and b!218901 (not res!184313)) b!218916))

(assert (= (and b!218916 (not res!184321)) b!218912))

(assert (= (and b!218912 (not res!184323)) b!218895))

(assert (= (and b!218895 (not res!184312)) b!218900))

(assert (= (and b!218900 (not res!184328)) b!218905))

(assert (= (and b!218905 res!184308) b!218914))

(assert (= (and b!218905 res!184326) b!218915))

(assert (= (and b!218905 (not res!184319)) b!218897))

(assert (= (and b!218897 res!184316) b!218893))

(assert (= (and b!218893 res!184310) b!218899))

(assert (= (and b!218899 res!184311) b!218894))

(assert (= (and b!218897 (not res!184317)) b!218896))

(assert (= (and b!218896 (not res!184327)) b!218906))

(assert (= (and b!218906 res!184318) b!218910))

(assert (= (and b!218910 res!184331) b!218907))

(assert (= start!45282 b!218913))

(declare-fun m!337443 () Bool)

(assert (=> b!218916 m!337443))

(declare-fun m!337445 () Bool)

(assert (=> b!218900 m!337445))

(declare-fun m!337447 () Bool)

(assert (=> b!218893 m!337447))

(declare-fun m!337449 () Bool)

(assert (=> b!218897 m!337449))

(declare-fun m!337451 () Bool)

(assert (=> b!218897 m!337451))

(declare-fun m!337453 () Bool)

(assert (=> b!218897 m!337453))

(declare-fun m!337455 () Bool)

(assert (=> b!218910 m!337455))

(declare-fun m!337457 () Bool)

(assert (=> b!218908 m!337457))

(declare-fun m!337459 () Bool)

(assert (=> b!218908 m!337459))

(assert (=> b!218904 m!337445))

(declare-fun m!337461 () Bool)

(assert (=> b!218902 m!337461))

(declare-fun m!337463 () Bool)

(assert (=> b!218892 m!337463))

(assert (=> b!218911 m!337457))

(assert (=> b!218911 m!337459))

(declare-fun m!337465 () Bool)

(assert (=> b!218911 m!337465))

(declare-fun m!337467 () Bool)

(assert (=> b!218895 m!337467))

(declare-fun m!337469 () Bool)

(assert (=> b!218913 m!337469))

(declare-fun m!337471 () Bool)

(assert (=> b!218905 m!337471))

(declare-fun m!337473 () Bool)

(assert (=> b!218905 m!337473))

(declare-fun m!337475 () Bool)

(assert (=> b!218905 m!337475))

(declare-fun m!337477 () Bool)

(assert (=> b!218905 m!337477))

(declare-fun m!337479 () Bool)

(assert (=> b!218905 m!337479))

(declare-fun m!337481 () Bool)

(assert (=> b!218905 m!337481))

(declare-fun m!337483 () Bool)

(assert (=> b!218905 m!337483))

(declare-fun m!337485 () Bool)

(assert (=> b!218905 m!337485))

(declare-fun m!337487 () Bool)

(assert (=> b!218905 m!337487))

(declare-fun m!337489 () Bool)

(assert (=> b!218905 m!337489))

(declare-fun m!337491 () Bool)

(assert (=> b!218905 m!337491))

(declare-fun m!337493 () Bool)

(assert (=> b!218905 m!337493))

(declare-fun m!337495 () Bool)

(assert (=> b!218905 m!337495))

(declare-fun m!337497 () Bool)

(assert (=> b!218905 m!337497))

(declare-fun m!337499 () Bool)

(assert (=> b!218905 m!337499))

(declare-fun m!337501 () Bool)

(assert (=> b!218905 m!337501))

(declare-fun m!337503 () Bool)

(assert (=> b!218899 m!337503))

(declare-fun m!337505 () Bool)

(assert (=> start!45282 m!337505))

(declare-fun m!337507 () Bool)

(assert (=> b!218903 m!337507))

(assert (=> b!218903 m!337507))

(declare-fun m!337509 () Bool)

(assert (=> b!218903 m!337509))

(declare-fun m!337511 () Bool)

(assert (=> b!218896 m!337511))

(declare-fun m!337513 () Bool)

(assert (=> b!218896 m!337513))

(declare-fun m!337515 () Bool)

(assert (=> b!218914 m!337515))

(declare-fun m!337517 () Bool)

(assert (=> b!218901 m!337517))

(declare-fun m!337519 () Bool)

(assert (=> b!218901 m!337519))

(declare-fun m!337521 () Bool)

(assert (=> b!218901 m!337521))

(declare-fun m!337523 () Bool)

(assert (=> b!218901 m!337523))

(declare-fun m!337525 () Bool)

(assert (=> b!218909 m!337525))

(push 1)

(assert (not b!218896))

(assert (not b!218911))

(assert (not b!218904))

(assert (not b!218910))

(assert (not b!218902))

(assert (not b!218897))

(assert (not b!218892))

(assert (not b!218913))

(assert (not b!218893))

(assert (not b!218901))

(assert (not b!218900))

(assert (not b!218903))

(assert (not b!218916))

(assert (not b!218909))

(assert (not b!218914))

(assert (not b!218908))

(assert (not b!218905))

(assert (not start!45282))

(assert (not b!218899))

(assert (not b!218895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

