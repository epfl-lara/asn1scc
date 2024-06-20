; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27994 () Bool)

(assert start!27994)

(declare-fun b!144665 () Bool)

(declare-fun e!96413 () Bool)

(declare-datatypes ((array!6586 0))(
  ( (array!6587 (arr!3714 (Array (_ BitVec 32) (_ BitVec 8))) (size!2981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5220 0))(
  ( (BitStream!5221 (buf!3420 array!6586) (currentByte!6310 (_ BitVec 32)) (currentBit!6305 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5220)

(declare-datatypes ((Unit!9035 0))(
  ( (Unit!9036) )
))
(declare-datatypes ((tuple2!12890 0))(
  ( (tuple2!12891 (_1!6791 Unit!9035) (_2!6791 BitStream!5220)) )
))
(declare-fun lt!224313 () tuple2!12890)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144665 (= e!96413 (invariant!0 (currentBit!6305 thiss!1634) (currentByte!6310 thiss!1634) (size!2981 (buf!3420 (_2!6791 lt!224313)))))))

(declare-fun b!144666 () Bool)

(declare-fun res!120896 () Bool)

(declare-fun e!96411 () Bool)

(assert (=> b!144666 (=> (not res!120896) (not e!96411))))

(declare-fun isPrefixOf!0 (BitStream!5220 BitStream!5220) Bool)

(assert (=> b!144666 (= res!120896 (isPrefixOf!0 thiss!1634 (_2!6791 lt!224313)))))

(declare-fun b!144667 () Bool)

(declare-fun e!96410 () Bool)

(declare-fun array_inv!2770 (array!6586) Bool)

(assert (=> b!144667 (= e!96410 (array_inv!2770 (buf!3420 thiss!1634)))))

(declare-fun b!144668 () Bool)

(declare-fun e!96412 () Bool)

(assert (=> b!144668 (= e!96412 (not true))))

(declare-fun e!96409 () Bool)

(assert (=> b!144668 e!96409))

(declare-fun res!120900 () Bool)

(assert (=> b!144668 (=> (not res!120900) (not e!96409))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun lt!224315 () tuple2!12890)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144668 (= res!120900 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2981 (buf!3420 (_2!6791 lt!224315)))) ((_ sign_extend 32) (currentByte!6310 thiss!1634)) ((_ sign_extend 32) (currentBit!6305 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224308 () Unit!9035)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5220 array!6586 (_ BitVec 32)) Unit!9035)

(assert (=> b!144668 (= lt!224308 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3420 (_2!6791 lt!224315)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12892 0))(
  ( (tuple2!12893 (_1!6792 BitStream!5220) (_2!6792 BitStream!5220)) )
))
(declare-fun lt!224309 () tuple2!12892)

(declare-fun arr!237 () array!6586)

(declare-datatypes ((tuple2!12894 0))(
  ( (tuple2!12895 (_1!6793 BitStream!5220) (_2!6793 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5220) tuple2!12894)

(assert (=> b!144668 (= (_2!6793 (readBytePure!0 (_1!6792 lt!224309))) (select (arr!3714 arr!237) from!447))))

(declare-fun lt!224306 () tuple2!12892)

(declare-fun reader!0 (BitStream!5220 BitStream!5220) tuple2!12892)

(assert (=> b!144668 (= lt!224306 (reader!0 (_2!6791 lt!224313) (_2!6791 lt!224315)))))

(assert (=> b!144668 (= lt!224309 (reader!0 thiss!1634 (_2!6791 lt!224315)))))

(declare-fun e!96408 () Bool)

(assert (=> b!144668 e!96408))

(declare-fun res!120904 () Bool)

(assert (=> b!144668 (=> (not res!120904) (not e!96408))))

(declare-fun lt!224317 () tuple2!12894)

(declare-fun lt!224318 () tuple2!12894)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144668 (= res!120904 (= (bitIndex!0 (size!2981 (buf!3420 (_1!6793 lt!224317))) (currentByte!6310 (_1!6793 lt!224317)) (currentBit!6305 (_1!6793 lt!224317))) (bitIndex!0 (size!2981 (buf!3420 (_1!6793 lt!224318))) (currentByte!6310 (_1!6793 lt!224318)) (currentBit!6305 (_1!6793 lt!224318)))))))

(declare-fun lt!224305 () Unit!9035)

(declare-fun lt!224311 () BitStream!5220)

(declare-fun readBytePrefixLemma!0 (BitStream!5220 BitStream!5220) Unit!9035)

(assert (=> b!144668 (= lt!224305 (readBytePrefixLemma!0 lt!224311 (_2!6791 lt!224315)))))

(assert (=> b!144668 (= lt!224318 (readBytePure!0 (BitStream!5221 (buf!3420 (_2!6791 lt!224315)) (currentByte!6310 thiss!1634) (currentBit!6305 thiss!1634))))))

(assert (=> b!144668 (= lt!224317 (readBytePure!0 lt!224311))))

(assert (=> b!144668 (= lt!224311 (BitStream!5221 (buf!3420 (_2!6791 lt!224313)) (currentByte!6310 thiss!1634) (currentBit!6305 thiss!1634)))))

(assert (=> b!144668 e!96413))

(declare-fun res!120902 () Bool)

(assert (=> b!144668 (=> (not res!120902) (not e!96413))))

(assert (=> b!144668 (= res!120902 (isPrefixOf!0 thiss!1634 (_2!6791 lt!224315)))))

(declare-fun lt!224314 () Unit!9035)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5220 BitStream!5220 BitStream!5220) Unit!9035)

(assert (=> b!144668 (= lt!224314 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6791 lt!224313) (_2!6791 lt!224315)))))

(declare-fun e!96407 () Bool)

(assert (=> b!144668 e!96407))

(declare-fun res!120892 () Bool)

(assert (=> b!144668 (=> (not res!120892) (not e!96407))))

(assert (=> b!144668 (= res!120892 (= (size!2981 (buf!3420 (_2!6791 lt!224313))) (size!2981 (buf!3420 (_2!6791 lt!224315)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5220 array!6586 (_ BitVec 32) (_ BitVec 32)) tuple2!12890)

(assert (=> b!144668 (= lt!224315 (appendByteArrayLoop!0 (_2!6791 lt!224313) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144668 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2981 (buf!3420 (_2!6791 lt!224313)))) ((_ sign_extend 32) (currentByte!6310 (_2!6791 lt!224313))) ((_ sign_extend 32) (currentBit!6305 (_2!6791 lt!224313))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224307 () Unit!9035)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5220 BitStream!5220 (_ BitVec 64) (_ BitVec 32)) Unit!9035)

(assert (=> b!144668 (= lt!224307 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6791 lt!224313) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144668 e!96411))

(declare-fun res!120895 () Bool)

(assert (=> b!144668 (=> (not res!120895) (not e!96411))))

(assert (=> b!144668 (= res!120895 (= (size!2981 (buf!3420 thiss!1634)) (size!2981 (buf!3420 (_2!6791 lt!224313)))))))

(declare-fun appendByte!0 (BitStream!5220 (_ BitVec 8)) tuple2!12890)

(assert (=> b!144668 (= lt!224313 (appendByte!0 thiss!1634 (select (arr!3714 arr!237) from!447)))))

(declare-fun b!144670 () Bool)

(declare-fun res!120898 () Bool)

(assert (=> b!144670 (=> (not res!120898) (not e!96412))))

(assert (=> b!144670 (= res!120898 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2981 (buf!3420 thiss!1634))) ((_ sign_extend 32) (currentByte!6310 thiss!1634)) ((_ sign_extend 32) (currentBit!6305 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144671 () Bool)

(declare-fun e!96414 () Bool)

(declare-fun e!96404 () Bool)

(assert (=> b!144671 (= e!96414 (not e!96404))))

(declare-fun res!120901 () Bool)

(assert (=> b!144671 (=> res!120901 e!96404)))

(declare-datatypes ((tuple2!12896 0))(
  ( (tuple2!12897 (_1!6794 BitStream!5220) (_2!6794 array!6586)) )
))
(declare-fun lt!224312 () tuple2!12896)

(declare-fun lt!224316 () tuple2!12892)

(assert (=> b!144671 (= res!120901 (or (not (= (size!2981 (_2!6794 lt!224312)) (size!2981 arr!237))) (not (= (_1!6794 lt!224312) (_2!6792 lt!224316)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5220 array!6586 (_ BitVec 32) (_ BitVec 32)) tuple2!12896)

(assert (=> b!144671 (= lt!224312 (readByteArrayLoopPure!0 (_1!6792 lt!224316) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224303 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144671 (validate_offset_bits!1 ((_ sign_extend 32) (size!2981 (buf!3420 (_2!6791 lt!224315)))) ((_ sign_extend 32) (currentByte!6310 (_2!6791 lt!224313))) ((_ sign_extend 32) (currentBit!6305 (_2!6791 lt!224313))) lt!224303)))

(declare-fun lt!224319 () Unit!9035)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5220 array!6586 (_ BitVec 64)) Unit!9035)

(assert (=> b!144671 (= lt!224319 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6791 lt!224313) (buf!3420 (_2!6791 lt!224315)) lt!224303))))

(assert (=> b!144671 (= lt!224316 (reader!0 (_2!6791 lt!224313) (_2!6791 lt!224315)))))

(declare-fun lt!224310 () tuple2!12894)

(declare-fun lt!224304 () tuple2!12892)

(declare-fun b!144672 () Bool)

(assert (=> b!144672 (= e!96411 (and (= (_2!6793 lt!224310) (select (arr!3714 arr!237) from!447)) (= (_1!6793 lt!224310) (_2!6792 lt!224304))))))

(assert (=> b!144672 (= lt!224310 (readBytePure!0 (_1!6792 lt!224304)))))

(assert (=> b!144672 (= lt!224304 (reader!0 thiss!1634 (_2!6791 lt!224313)))))

(declare-fun b!144673 () Bool)

(assert (=> b!144673 (= e!96407 e!96414)))

(declare-fun res!120893 () Bool)

(assert (=> b!144673 (=> (not res!120893) (not e!96414))))

(assert (=> b!144673 (= res!120893 (= (bitIndex!0 (size!2981 (buf!3420 (_2!6791 lt!224315))) (currentByte!6310 (_2!6791 lt!224315)) (currentBit!6305 (_2!6791 lt!224315))) (bvadd (bitIndex!0 (size!2981 (buf!3420 (_2!6791 lt!224313))) (currentByte!6310 (_2!6791 lt!224313)) (currentBit!6305 (_2!6791 lt!224313))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224303))))))

(assert (=> b!144673 (= lt!224303 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144674 () Bool)

(declare-fun res!120899 () Bool)

(assert (=> b!144674 (=> (not res!120899) (not e!96412))))

(assert (=> b!144674 (= res!120899 (bvslt from!447 to!404))))

(declare-fun b!144675 () Bool)

(declare-fun res!120891 () Bool)

(assert (=> b!144675 (=> (not res!120891) (not e!96414))))

(assert (=> b!144675 (= res!120891 (isPrefixOf!0 (_2!6791 lt!224313) (_2!6791 lt!224315)))))

(declare-fun b!144676 () Bool)

(assert (=> b!144676 (= e!96409 (= (_1!6794 (readByteArrayLoopPure!0 (_1!6792 lt!224309) arr!237 from!447 to!404)) (_2!6792 lt!224309)))))

(declare-fun b!144677 () Bool)

(declare-fun res!120897 () Bool)

(assert (=> b!144677 (=> (not res!120897) (not e!96412))))

(assert (=> b!144677 (= res!120897 (invariant!0 (currentBit!6305 thiss!1634) (currentByte!6310 thiss!1634) (size!2981 (buf!3420 thiss!1634))))))

(declare-fun res!120903 () Bool)

(assert (=> start!27994 (=> (not res!120903) (not e!96412))))

(assert (=> start!27994 (= res!120903 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2981 arr!237))))))

(assert (=> start!27994 e!96412))

(assert (=> start!27994 true))

(assert (=> start!27994 (array_inv!2770 arr!237)))

(declare-fun inv!12 (BitStream!5220) Bool)

(assert (=> start!27994 (and (inv!12 thiss!1634) e!96410)))

(declare-fun b!144669 () Bool)

(assert (=> b!144669 (= e!96408 (= (_2!6793 lt!224317) (_2!6793 lt!224318)))))

(declare-fun b!144678 () Bool)

(declare-fun res!120894 () Bool)

(assert (=> b!144678 (=> (not res!120894) (not e!96411))))

(assert (=> b!144678 (= res!120894 (= (bitIndex!0 (size!2981 (buf!3420 (_2!6791 lt!224313))) (currentByte!6310 (_2!6791 lt!224313)) (currentBit!6305 (_2!6791 lt!224313))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2981 (buf!3420 thiss!1634)) (currentByte!6310 thiss!1634) (currentBit!6305 thiss!1634)))))))

(declare-fun b!144679 () Bool)

(declare-fun arrayRangesEq!297 (array!6586 array!6586 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144679 (= e!96404 (not (arrayRangesEq!297 arr!237 (_2!6794 lt!224312) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!27994 res!120903) b!144670))

(assert (= (and b!144670 res!120898) b!144674))

(assert (= (and b!144674 res!120899) b!144677))

(assert (= (and b!144677 res!120897) b!144668))

(assert (= (and b!144668 res!120895) b!144678))

(assert (= (and b!144678 res!120894) b!144666))

(assert (= (and b!144666 res!120896) b!144672))

(assert (= (and b!144668 res!120892) b!144673))

(assert (= (and b!144673 res!120893) b!144675))

(assert (= (and b!144675 res!120891) b!144671))

(assert (= (and b!144671 (not res!120901)) b!144679))

(assert (= (and b!144668 res!120902) b!144665))

(assert (= (and b!144668 res!120904) b!144669))

(assert (= (and b!144668 res!120900) b!144676))

(assert (= start!27994 b!144667))

(declare-fun m!222501 () Bool)

(assert (=> b!144667 m!222501))

(declare-fun m!222503 () Bool)

(assert (=> b!144671 m!222503))

(declare-fun m!222505 () Bool)

(assert (=> b!144671 m!222505))

(declare-fun m!222507 () Bool)

(assert (=> b!144671 m!222507))

(declare-fun m!222509 () Bool)

(assert (=> b!144671 m!222509))

(declare-fun m!222511 () Bool)

(assert (=> b!144666 m!222511))

(declare-fun m!222513 () Bool)

(assert (=> b!144678 m!222513))

(declare-fun m!222515 () Bool)

(assert (=> b!144678 m!222515))

(declare-fun m!222517 () Bool)

(assert (=> b!144673 m!222517))

(assert (=> b!144673 m!222513))

(declare-fun m!222519 () Bool)

(assert (=> b!144670 m!222519))

(declare-fun m!222521 () Bool)

(assert (=> start!27994 m!222521))

(declare-fun m!222523 () Bool)

(assert (=> start!27994 m!222523))

(declare-fun m!222525 () Bool)

(assert (=> b!144668 m!222525))

(declare-fun m!222527 () Bool)

(assert (=> b!144668 m!222527))

(declare-fun m!222529 () Bool)

(assert (=> b!144668 m!222529))

(declare-fun m!222531 () Bool)

(assert (=> b!144668 m!222531))

(declare-fun m!222533 () Bool)

(assert (=> b!144668 m!222533))

(declare-fun m!222535 () Bool)

(assert (=> b!144668 m!222535))

(declare-fun m!222537 () Bool)

(assert (=> b!144668 m!222537))

(declare-fun m!222539 () Bool)

(assert (=> b!144668 m!222539))

(declare-fun m!222541 () Bool)

(assert (=> b!144668 m!222541))

(declare-fun m!222543 () Bool)

(assert (=> b!144668 m!222543))

(assert (=> b!144668 m!222509))

(declare-fun m!222545 () Bool)

(assert (=> b!144668 m!222545))

(declare-fun m!222547 () Bool)

(assert (=> b!144668 m!222547))

(declare-fun m!222549 () Bool)

(assert (=> b!144668 m!222549))

(declare-fun m!222551 () Bool)

(assert (=> b!144668 m!222551))

(assert (=> b!144668 m!222541))

(declare-fun m!222553 () Bool)

(assert (=> b!144668 m!222553))

(declare-fun m!222555 () Bool)

(assert (=> b!144668 m!222555))

(assert (=> b!144672 m!222541))

(declare-fun m!222557 () Bool)

(assert (=> b!144672 m!222557))

(declare-fun m!222559 () Bool)

(assert (=> b!144672 m!222559))

(declare-fun m!222561 () Bool)

(assert (=> b!144676 m!222561))

(declare-fun m!222563 () Bool)

(assert (=> b!144675 m!222563))

(declare-fun m!222565 () Bool)

(assert (=> b!144665 m!222565))

(declare-fun m!222567 () Bool)

(assert (=> b!144677 m!222567))

(declare-fun m!222569 () Bool)

(assert (=> b!144679 m!222569))

(check-sat (not b!144675) (not b!144678) (not b!144671) (not b!144668) (not b!144677) (not b!144667) (not b!144673) (not b!144670) (not start!27994) (not b!144676) (not b!144666) (not b!144672) (not b!144679) (not b!144665))
