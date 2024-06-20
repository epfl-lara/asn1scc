; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54652 () Bool)

(assert start!54652)

(declare-fun b!256041 () Bool)

(declare-fun e!177380 () Bool)

(declare-fun e!177385 () Bool)

(assert (=> b!256041 (= e!177380 (not e!177385))))

(declare-fun res!214670 () Bool)

(assert (=> b!256041 (=> res!214670 e!177385)))

(declare-datatypes ((array!13799 0))(
  ( (array!13800 (arr!7041 (Array (_ BitVec 32) (_ BitVec 8))) (size!6054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11030 0))(
  ( (BitStream!11031 (buf!6571 array!13799) (currentByte!12050 (_ BitVec 32)) (currentBit!12045 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21912 0))(
  ( (tuple2!21913 (_1!11890 BitStream!11030) (_2!11890 Bool)) )
))
(declare-fun lt!397571 () tuple2!21912)

(declare-datatypes ((tuple2!21914 0))(
  ( (tuple2!21915 (_1!11891 BitStream!11030) (_2!11891 BitStream!11030)) )
))
(declare-fun lt!397568 () tuple2!21914)

(assert (=> b!256041 (= res!214670 (not (= (_1!11890 lt!397571) (_2!11891 lt!397568))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!11030 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21912)

(assert (=> b!256041 (= lt!397571 (checkBitsLoopPure!0 (_1!11891 lt!397568) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18316 0))(
  ( (Unit!18317) )
))
(declare-datatypes ((tuple2!21916 0))(
  ( (tuple2!21917 (_1!11892 Unit!18316) (_2!11892 BitStream!11030)) )
))
(declare-fun lt!397560 () tuple2!21916)

(declare-fun lt!397575 () tuple2!21916)

(declare-fun lt!397574 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256041 (validate_offset_bits!1 ((_ sign_extend 32) (size!6054 (buf!6571 (_2!11892 lt!397560)))) ((_ sign_extend 32) (currentByte!12050 (_2!11892 lt!397575))) ((_ sign_extend 32) (currentBit!12045 (_2!11892 lt!397575))) lt!397574)))

(declare-fun lt!397561 () Unit!18316)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11030 array!13799 (_ BitVec 64)) Unit!18316)

(assert (=> b!256041 (= lt!397561 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11892 lt!397575) (buf!6571 (_2!11892 lt!397560)) lt!397574))))

(declare-fun lt!397562 () tuple2!21914)

(declare-fun lt!397563 () tuple2!21912)

(assert (=> b!256041 (= lt!397563 (checkBitsLoopPure!0 (_1!11891 lt!397562) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!11030)

(assert (=> b!256041 (validate_offset_bits!1 ((_ sign_extend 32) (size!6054 (buf!6571 (_2!11892 lt!397560)))) ((_ sign_extend 32) (currentByte!12050 thiss!1005)) ((_ sign_extend 32) (currentBit!12045 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397554 () Unit!18316)

(assert (=> b!256041 (= lt!397554 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6571 (_2!11892 lt!397560)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!11030) tuple2!21912)

(assert (=> b!256041 (= (_2!11890 (readBitPure!0 (_1!11891 lt!397562))) bit!26)))

(declare-fun reader!0 (BitStream!11030 BitStream!11030) tuple2!21914)

(assert (=> b!256041 (= lt!397568 (reader!0 (_2!11892 lt!397575) (_2!11892 lt!397560)))))

(assert (=> b!256041 (= lt!397562 (reader!0 thiss!1005 (_2!11892 lt!397560)))))

(declare-fun e!177377 () Bool)

(assert (=> b!256041 e!177377))

(declare-fun res!214669 () Bool)

(assert (=> b!256041 (=> (not res!214669) (not e!177377))))

(declare-fun lt!397557 () tuple2!21912)

(declare-fun lt!397572 () tuple2!21912)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256041 (= res!214669 (= (bitIndex!0 (size!6054 (buf!6571 (_1!11890 lt!397557))) (currentByte!12050 (_1!11890 lt!397557)) (currentBit!12045 (_1!11890 lt!397557))) (bitIndex!0 (size!6054 (buf!6571 (_1!11890 lt!397572))) (currentByte!12050 (_1!11890 lt!397572)) (currentBit!12045 (_1!11890 lt!397572)))))))

(declare-fun lt!397564 () Unit!18316)

(declare-fun lt!397558 () BitStream!11030)

(declare-fun readBitPrefixLemma!0 (BitStream!11030 BitStream!11030) Unit!18316)

(assert (=> b!256041 (= lt!397564 (readBitPrefixLemma!0 lt!397558 (_2!11892 lt!397560)))))

(assert (=> b!256041 (= lt!397572 (readBitPure!0 (BitStream!11031 (buf!6571 (_2!11892 lt!397560)) (currentByte!12050 thiss!1005) (currentBit!12045 thiss!1005))))))

(assert (=> b!256041 (= lt!397557 (readBitPure!0 lt!397558))))

(assert (=> b!256041 (= lt!397558 (BitStream!11031 (buf!6571 (_2!11892 lt!397575)) (currentByte!12050 thiss!1005) (currentBit!12045 thiss!1005)))))

(declare-fun e!177382 () Bool)

(assert (=> b!256041 e!177382))

(declare-fun res!214674 () Bool)

(assert (=> b!256041 (=> (not res!214674) (not e!177382))))

(declare-fun isPrefixOf!0 (BitStream!11030 BitStream!11030) Bool)

(assert (=> b!256041 (= res!214674 (isPrefixOf!0 thiss!1005 (_2!11892 lt!397560)))))

(declare-fun lt!397569 () Unit!18316)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11030 BitStream!11030 BitStream!11030) Unit!18316)

(assert (=> b!256041 (= lt!397569 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11892 lt!397575) (_2!11892 lt!397560)))))

(declare-fun e!177383 () Bool)

(assert (=> b!256041 e!177383))

(declare-fun res!214679 () Bool)

(assert (=> b!256041 (=> (not res!214679) (not e!177383))))

(assert (=> b!256041 (= res!214679 (= (size!6054 (buf!6571 (_2!11892 lt!397575))) (size!6054 (buf!6571 (_2!11892 lt!397560)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11030 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21916)

(assert (=> b!256041 (= lt!397560 (appendNBitsLoop!0 (_2!11892 lt!397575) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!256041 (validate_offset_bits!1 ((_ sign_extend 32) (size!6054 (buf!6571 (_2!11892 lt!397575)))) ((_ sign_extend 32) (currentByte!12050 (_2!11892 lt!397575))) ((_ sign_extend 32) (currentBit!12045 (_2!11892 lt!397575))) lt!397574)))

(assert (=> b!256041 (= lt!397574 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397565 () Unit!18316)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11030 BitStream!11030 (_ BitVec 64) (_ BitVec 64)) Unit!18316)

(assert (=> b!256041 (= lt!397565 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11892 lt!397575) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!177375 () Bool)

(assert (=> b!256041 e!177375))

(declare-fun res!214666 () Bool)

(assert (=> b!256041 (=> (not res!214666) (not e!177375))))

(assert (=> b!256041 (= res!214666 (= (size!6054 (buf!6571 thiss!1005)) (size!6054 (buf!6571 (_2!11892 lt!397575)))))))

(declare-fun appendBit!0 (BitStream!11030 Bool) tuple2!21916)

(assert (=> b!256041 (= lt!397575 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!256042 () Bool)

(declare-fun e!177378 () Bool)

(declare-fun array_inv!5795 (array!13799) Bool)

(assert (=> b!256042 (= e!177378 (array_inv!5795 (buf!6571 thiss!1005)))))

(declare-fun b!256043 () Bool)

(declare-fun res!214678 () Bool)

(declare-fun e!177386 () Bool)

(assert (=> b!256043 (=> (not res!214678) (not e!177386))))

(assert (=> b!256043 (= res!214678 (isPrefixOf!0 (_2!11892 lt!397575) (_2!11892 lt!397560)))))

(declare-fun res!214680 () Bool)

(assert (=> start!54652 (=> (not res!214680) (not e!177380))))

(assert (=> start!54652 (= res!214680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54652 e!177380))

(assert (=> start!54652 true))

(declare-fun inv!12 (BitStream!11030) Bool)

(assert (=> start!54652 (and (inv!12 thiss!1005) e!177378)))

(declare-fun b!256044 () Bool)

(declare-fun res!214673 () Bool)

(declare-fun e!177381 () Bool)

(assert (=> b!256044 (=> (not res!214673) (not e!177381))))

(assert (=> b!256044 (= res!214673 (isPrefixOf!0 thiss!1005 (_2!11892 lt!397575)))))

(declare-fun b!256045 () Bool)

(declare-fun e!177379 () Bool)

(assert (=> b!256045 (= e!177381 e!177379)))

(declare-fun res!214677 () Bool)

(assert (=> b!256045 (=> (not res!214677) (not e!177379))))

(declare-fun lt!397573 () tuple2!21912)

(assert (=> b!256045 (= res!214677 (and (= (_2!11890 lt!397573) bit!26) (= (_1!11890 lt!397573) (_2!11892 lt!397575))))))

(declare-fun readerFrom!0 (BitStream!11030 (_ BitVec 32) (_ BitVec 32)) BitStream!11030)

(assert (=> b!256045 (= lt!397573 (readBitPure!0 (readerFrom!0 (_2!11892 lt!397575) (currentBit!12045 thiss!1005) (currentByte!12050 thiss!1005))))))

(declare-fun b!256046 () Bool)

(declare-fun res!214675 () Bool)

(assert (=> b!256046 (=> (not res!214675) (not e!177382))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256046 (= res!214675 (invariant!0 (currentBit!12045 thiss!1005) (currentByte!12050 thiss!1005) (size!6054 (buf!6571 (_2!11892 lt!397575)))))))

(declare-fun b!256047 () Bool)

(declare-fun res!214676 () Bool)

(assert (=> b!256047 (=> (not res!214676) (not e!177380))))

(assert (=> b!256047 (= res!214676 (bvslt from!289 nBits!297))))

(declare-fun b!256048 () Bool)

(declare-fun lt!397555 () tuple2!21912)

(declare-fun lt!397559 () tuple2!21914)

(assert (=> b!256048 (= e!177386 (not (or (not (_2!11890 lt!397555)) (not (= (_1!11890 lt!397555) (_2!11891 lt!397559))))))))

(assert (=> b!256048 (= lt!397555 (checkBitsLoopPure!0 (_1!11891 lt!397559) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397567 () (_ BitVec 64))

(assert (=> b!256048 (validate_offset_bits!1 ((_ sign_extend 32) (size!6054 (buf!6571 (_2!11892 lt!397560)))) ((_ sign_extend 32) (currentByte!12050 (_2!11892 lt!397575))) ((_ sign_extend 32) (currentBit!12045 (_2!11892 lt!397575))) lt!397567)))

(declare-fun lt!397566 () Unit!18316)

(assert (=> b!256048 (= lt!397566 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11892 lt!397575) (buf!6571 (_2!11892 lt!397560)) lt!397567))))

(assert (=> b!256048 (= lt!397559 (reader!0 (_2!11892 lt!397575) (_2!11892 lt!397560)))))

(declare-fun b!256049 () Bool)

(declare-fun e!177376 () Bool)

(assert (=> b!256049 (= e!177385 e!177376)))

(declare-fun res!214667 () Bool)

(assert (=> b!256049 (=> (not res!214667) (not e!177376))))

(assert (=> b!256049 (= res!214667 (= (size!6054 (buf!6571 thiss!1005)) (size!6054 (buf!6571 (_2!11892 lt!397560)))))))

(assert (=> b!256049 (and (= (_2!11890 lt!397563) (_2!11890 lt!397571)) (= (_1!11890 lt!397563) (_2!11891 lt!397562)))))

(declare-fun b!256050 () Bool)

(assert (=> b!256050 (= e!177377 (= (_2!11890 lt!397557) (_2!11890 lt!397572)))))

(declare-fun b!256051 () Bool)

(assert (=> b!256051 (= e!177383 e!177386)))

(declare-fun res!214664 () Bool)

(assert (=> b!256051 (=> (not res!214664) (not e!177386))))

(assert (=> b!256051 (= res!214664 (= (bitIndex!0 (size!6054 (buf!6571 (_2!11892 lt!397560))) (currentByte!12050 (_2!11892 lt!397560)) (currentBit!12045 (_2!11892 lt!397560))) (bvadd (bitIndex!0 (size!6054 (buf!6571 (_2!11892 lt!397575))) (currentByte!12050 (_2!11892 lt!397575)) (currentBit!12045 (_2!11892 lt!397575))) lt!397567)))))

(assert (=> b!256051 (= lt!397567 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!256052 () Bool)

(assert (=> b!256052 (= e!177376 (_2!11890 lt!397563))))

(declare-fun b!256053 () Bool)

(assert (=> b!256053 (= e!177375 e!177381)))

(declare-fun res!214672 () Bool)

(assert (=> b!256053 (=> (not res!214672) (not e!177381))))

(declare-fun lt!397556 () (_ BitVec 64))

(declare-fun lt!397570 () (_ BitVec 64))

(assert (=> b!256053 (= res!214672 (= lt!397556 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397570)))))

(assert (=> b!256053 (= lt!397556 (bitIndex!0 (size!6054 (buf!6571 (_2!11892 lt!397575))) (currentByte!12050 (_2!11892 lt!397575)) (currentBit!12045 (_2!11892 lt!397575))))))

(assert (=> b!256053 (= lt!397570 (bitIndex!0 (size!6054 (buf!6571 thiss!1005)) (currentByte!12050 thiss!1005) (currentBit!12045 thiss!1005)))))

(declare-fun b!256054 () Bool)

(assert (=> b!256054 (= e!177379 (= (bitIndex!0 (size!6054 (buf!6571 (_1!11890 lt!397573))) (currentByte!12050 (_1!11890 lt!397573)) (currentBit!12045 (_1!11890 lt!397573))) lt!397556))))

(declare-fun b!256055 () Bool)

(assert (=> b!256055 (= e!177382 (invariant!0 (currentBit!12045 thiss!1005) (currentByte!12050 thiss!1005) (size!6054 (buf!6571 (_2!11892 lt!397560)))))))

(declare-fun b!256056 () Bool)

(declare-fun res!214668 () Bool)

(assert (=> b!256056 (=> (not res!214668) (not e!177376))))

(assert (=> b!256056 (= res!214668 (= (bitIndex!0 (size!6054 (buf!6571 (_2!11892 lt!397560))) (currentByte!12050 (_2!11892 lt!397560)) (currentBit!12045 (_2!11892 lt!397560))) (bvadd (bitIndex!0 (size!6054 (buf!6571 thiss!1005)) (currentByte!12050 thiss!1005) (currentBit!12045 thiss!1005)) (bvsub nBits!297 from!289))))))

(declare-fun b!256057 () Bool)

(declare-fun res!214665 () Bool)

(assert (=> b!256057 (=> (not res!214665) (not e!177380))))

(assert (=> b!256057 (= res!214665 (validate_offset_bits!1 ((_ sign_extend 32) (size!6054 (buf!6571 thiss!1005))) ((_ sign_extend 32) (currentByte!12050 thiss!1005)) ((_ sign_extend 32) (currentBit!12045 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256058 () Bool)

(declare-fun res!214671 () Bool)

(assert (=> b!256058 (=> res!214671 e!177385)))

(declare-fun withMovedBitIndex!0 (BitStream!11030 (_ BitVec 64)) BitStream!11030)

(assert (=> b!256058 (= res!214671 (not (= (_1!11891 lt!397568) (withMovedBitIndex!0 (_1!11891 lt!397562) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!54652 res!214680) b!256057))

(assert (= (and b!256057 res!214665) b!256047))

(assert (= (and b!256047 res!214676) b!256041))

(assert (= (and b!256041 res!214666) b!256053))

(assert (= (and b!256053 res!214672) b!256044))

(assert (= (and b!256044 res!214673) b!256045))

(assert (= (and b!256045 res!214677) b!256054))

(assert (= (and b!256041 res!214679) b!256051))

(assert (= (and b!256051 res!214664) b!256043))

(assert (= (and b!256043 res!214678) b!256048))

(assert (= (and b!256041 res!214674) b!256046))

(assert (= (and b!256046 res!214675) b!256055))

(assert (= (and b!256041 res!214669) b!256050))

(assert (= (and b!256041 (not res!214670)) b!256058))

(assert (= (and b!256058 (not res!214671)) b!256049))

(assert (= (and b!256049 res!214667) b!256056))

(assert (= (and b!256056 res!214668) b!256052))

(assert (= start!54652 b!256042))

(declare-fun m!385651 () Bool)

(assert (=> b!256057 m!385651))

(declare-fun m!385653 () Bool)

(assert (=> b!256058 m!385653))

(declare-fun m!385655 () Bool)

(assert (=> b!256055 m!385655))

(declare-fun m!385657 () Bool)

(assert (=> start!54652 m!385657))

(declare-fun m!385659 () Bool)

(assert (=> b!256056 m!385659))

(declare-fun m!385661 () Bool)

(assert (=> b!256056 m!385661))

(declare-fun m!385663 () Bool)

(assert (=> b!256045 m!385663))

(assert (=> b!256045 m!385663))

(declare-fun m!385665 () Bool)

(assert (=> b!256045 m!385665))

(declare-fun m!385667 () Bool)

(assert (=> b!256054 m!385667))

(declare-fun m!385669 () Bool)

(assert (=> b!256053 m!385669))

(assert (=> b!256053 m!385661))

(declare-fun m!385671 () Bool)

(assert (=> b!256048 m!385671))

(declare-fun m!385673 () Bool)

(assert (=> b!256048 m!385673))

(declare-fun m!385675 () Bool)

(assert (=> b!256048 m!385675))

(declare-fun m!385677 () Bool)

(assert (=> b!256048 m!385677))

(declare-fun m!385679 () Bool)

(assert (=> b!256046 m!385679))

(declare-fun m!385681 () Bool)

(assert (=> b!256042 m!385681))

(declare-fun m!385683 () Bool)

(assert (=> b!256041 m!385683))

(declare-fun m!385685 () Bool)

(assert (=> b!256041 m!385685))

(declare-fun m!385687 () Bool)

(assert (=> b!256041 m!385687))

(declare-fun m!385689 () Bool)

(assert (=> b!256041 m!385689))

(declare-fun m!385691 () Bool)

(assert (=> b!256041 m!385691))

(declare-fun m!385693 () Bool)

(assert (=> b!256041 m!385693))

(declare-fun m!385695 () Bool)

(assert (=> b!256041 m!385695))

(declare-fun m!385697 () Bool)

(assert (=> b!256041 m!385697))

(declare-fun m!385699 () Bool)

(assert (=> b!256041 m!385699))

(declare-fun m!385701 () Bool)

(assert (=> b!256041 m!385701))

(declare-fun m!385703 () Bool)

(assert (=> b!256041 m!385703))

(declare-fun m!385705 () Bool)

(assert (=> b!256041 m!385705))

(declare-fun m!385707 () Bool)

(assert (=> b!256041 m!385707))

(assert (=> b!256041 m!385677))

(declare-fun m!385709 () Bool)

(assert (=> b!256041 m!385709))

(declare-fun m!385711 () Bool)

(assert (=> b!256041 m!385711))

(declare-fun m!385713 () Bool)

(assert (=> b!256041 m!385713))

(declare-fun m!385715 () Bool)

(assert (=> b!256041 m!385715))

(declare-fun m!385717 () Bool)

(assert (=> b!256041 m!385717))

(declare-fun m!385719 () Bool)

(assert (=> b!256041 m!385719))

(declare-fun m!385721 () Bool)

(assert (=> b!256043 m!385721))

(declare-fun m!385723 () Bool)

(assert (=> b!256044 m!385723))

(assert (=> b!256051 m!385659))

(assert (=> b!256051 m!385669))

(push 1)

(assert (not b!256057))

(assert (not b!256055))

(assert (not b!256053))

(assert (not b!256046))

(assert (not b!256056))

(assert (not b!256058))

(assert (not b!256051))

(assert (not b!256048))

(assert (not start!54652))

(assert (not b!256041))

(assert (not b!256044))

(assert (not b!256045))

(assert (not b!256043))

(assert (not b!256054))

(assert (not b!256042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

