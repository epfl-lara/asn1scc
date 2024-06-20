; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40856 () Bool)

(assert start!40856)

(declare-fun b!187991 () Bool)

(declare-fun e!129927 () Bool)

(declare-datatypes ((array!9851 0))(
  ( (array!9852 (arr!5272 (Array (_ BitVec 32) (_ BitVec 8))) (size!4342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7792 0))(
  ( (BitStream!7793 (buf!4813 array!9851) (currentByte!9079 (_ BitVec 32)) (currentBit!9074 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7792)

(declare-fun array_inv!4083 (array!9851) Bool)

(assert (=> b!187991 (= e!129927 (array_inv!4083 (buf!4813 thiss!1204)))))

(declare-fun b!187992 () Bool)

(declare-fun e!129930 () Bool)

(declare-datatypes ((tuple2!16232 0))(
  ( (tuple2!16233 (_1!8761 BitStream!7792) (_2!8761 Bool)) )
))
(declare-fun lt!291714 () tuple2!16232)

(declare-fun lt!291701 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187992 (= e!129930 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291714))) (currentByte!9079 (_1!8761 lt!291714)) (currentBit!9074 (_1!8761 lt!291714))) lt!291701))))

(declare-fun b!187993 () Bool)

(declare-fun res!156587 () Bool)

(declare-fun e!129933 () Bool)

(assert (=> b!187993 (=> (not res!156587) (not e!129933))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!187993 (= res!156587 (not (= i!590 nBits!348)))))

(declare-fun b!187994 () Bool)

(declare-fun e!129928 () Bool)

(assert (=> b!187994 (= e!129928 e!129933)))

(declare-fun res!156602 () Bool)

(assert (=> b!187994 (=> (not res!156602) (not e!129933))))

(declare-fun lt!291695 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187994 (= res!156602 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)) lt!291695))))

(assert (=> b!187994 (= lt!291695 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!187995 () Bool)

(declare-fun res!156589 () Bool)

(assert (=> b!187995 (=> (not res!156589) (not e!129933))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187995 (= res!156589 (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204))))))

(declare-fun b!187996 () Bool)

(declare-fun e!129924 () Bool)

(assert (=> b!187996 (= e!129933 (not e!129924))))

(declare-fun res!156592 () Bool)

(assert (=> b!187996 (=> res!156592 e!129924)))

(declare-fun lt!291709 () (_ BitVec 64))

(declare-fun lt!291702 () (_ BitVec 64))

(assert (=> b!187996 (= res!156592 (not (= lt!291709 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291702))))))

(declare-datatypes ((Unit!13444 0))(
  ( (Unit!13445) )
))
(declare-datatypes ((tuple2!16234 0))(
  ( (tuple2!16235 (_1!8762 Unit!13444) (_2!8762 BitStream!7792)) )
))
(declare-fun lt!291690 () tuple2!16234)

(assert (=> b!187996 (= lt!291709 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(assert (=> b!187996 (= lt!291702 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(declare-fun e!129926 () Bool)

(assert (=> b!187996 e!129926))

(declare-fun res!156597 () Bool)

(assert (=> b!187996 (=> (not res!156597) (not e!129926))))

(assert (=> b!187996 (= res!156597 (= (size!4342 (buf!4813 thiss!1204)) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(declare-fun lt!291703 () Bool)

(declare-fun appendBit!0 (BitStream!7792 Bool) tuple2!16234)

(assert (=> b!187996 (= lt!291690 (appendBit!0 thiss!1204 lt!291703))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!291713 () (_ BitVec 64))

(assert (=> b!187996 (= lt!291703 (not (= (bvand v!189 lt!291713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187996 (= lt!291713 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!187997 () Bool)

(declare-fun e!129923 () Bool)

(declare-datatypes ((tuple2!16236 0))(
  ( (tuple2!16237 (_1!8763 BitStream!7792) (_2!8763 BitStream!7792)) )
))
(declare-fun lt!291706 () tuple2!16236)

(assert (=> b!187997 (= e!129923 (invariant!0 (currentBit!9074 (_2!8763 lt!291706)) (currentByte!9079 (_2!8763 lt!291706)) (size!4342 (buf!4813 (_2!8763 lt!291706)))))))

(declare-fun b!187998 () Bool)

(declare-fun e!129929 () Bool)

(declare-fun e!129932 () Bool)

(assert (=> b!187998 (= e!129929 e!129932)))

(declare-fun res!156594 () Bool)

(assert (=> b!187998 (=> res!156594 e!129932)))

(declare-datatypes ((tuple2!16238 0))(
  ( (tuple2!16239 (_1!8764 BitStream!7792) (_2!8764 (_ BitVec 64))) )
))
(declare-fun lt!291710 () tuple2!16238)

(declare-fun lt!291715 () tuple2!16236)

(assert (=> b!187998 (= res!156594 (not (= (_1!8764 lt!291710) (_2!8763 lt!291715))))))

(declare-fun lt!291718 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16238)

(assert (=> b!187998 (= lt!291710 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!291715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718))))

(declare-fun lt!291708 () tuple2!16234)

(declare-fun lt!291712 () (_ BitVec 64))

(assert (=> b!187998 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!291712)))

(declare-fun lt!291698 () Unit!13444)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7792 array!9851 (_ BitVec 64)) Unit!13444)

(assert (=> b!187998 (= lt!291698 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!291708)) lt!291712))))

(assert (=> b!187998 (= lt!291712 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!291699 () (_ BitVec 64))

(declare-fun lt!291707 () tuple2!16232)

(assert (=> b!187998 (= lt!291718 (bvor lt!291699 (ite (_2!8761 lt!291707) lt!291713 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!291691 () tuple2!16238)

(assert (=> b!187998 (= lt!291691 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699))))

(assert (=> b!187998 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)) lt!291695)))

(declare-fun lt!291696 () Unit!13444)

(assert (=> b!187998 (= lt!291696 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4813 (_2!8762 lt!291708)) lt!291695))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187998 (= lt!291699 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187998 (= (_2!8761 lt!291707) lt!291703)))

(declare-fun readBitPure!0 (BitStream!7792) tuple2!16232)

(assert (=> b!187998 (= lt!291707 (readBitPure!0 (_1!8763 lt!291706)))))

(declare-fun reader!0 (BitStream!7792 BitStream!7792) tuple2!16236)

(assert (=> b!187998 (= lt!291715 (reader!0 (_2!8762 lt!291690) (_2!8762 lt!291708)))))

(assert (=> b!187998 (= lt!291706 (reader!0 thiss!1204 (_2!8762 lt!291708)))))

(declare-fun e!129935 () Bool)

(assert (=> b!187998 e!129935))

(declare-fun res!156603 () Bool)

(assert (=> b!187998 (=> (not res!156603) (not e!129935))))

(declare-fun lt!291697 () tuple2!16232)

(declare-fun lt!291711 () tuple2!16232)

(assert (=> b!187998 (= res!156603 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291697))) (currentByte!9079 (_1!8761 lt!291697)) (currentBit!9074 (_1!8761 lt!291697))) (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291711))) (currentByte!9079 (_1!8761 lt!291711)) (currentBit!9074 (_1!8761 lt!291711)))))))

(declare-fun lt!291700 () Unit!13444)

(declare-fun lt!291717 () BitStream!7792)

(declare-fun readBitPrefixLemma!0 (BitStream!7792 BitStream!7792) Unit!13444)

(assert (=> b!187998 (= lt!291700 (readBitPrefixLemma!0 lt!291717 (_2!8762 lt!291708)))))

(assert (=> b!187998 (= lt!291711 (readBitPure!0 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))))))

(assert (=> b!187998 (= lt!291697 (readBitPure!0 lt!291717))))

(declare-fun e!129925 () Bool)

(assert (=> b!187998 e!129925))

(declare-fun res!156590 () Bool)

(assert (=> b!187998 (=> (not res!156590) (not e!129925))))

(assert (=> b!187998 (= res!156590 (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (=> b!187998 (= lt!291717 (BitStream!7793 (buf!4813 (_2!8762 lt!291690)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(declare-fun b!187999 () Bool)

(assert (=> b!187999 (= e!129925 (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291708)))))))

(declare-fun b!188000 () Bool)

(assert (=> b!188000 (= e!129932 e!129923)))

(declare-fun res!156604 () Bool)

(assert (=> b!188000 (=> res!156604 e!129923)))

(declare-fun lt!291704 () BitStream!7792)

(assert (=> b!188000 (= res!156604 (not (= (_1!8763 lt!291715) lt!291704)))))

(declare-fun e!129922 () Bool)

(assert (=> b!188000 e!129922))

(declare-fun res!156605 () Bool)

(assert (=> b!188000 (=> (not res!156605) (not e!129922))))

(declare-fun lt!291692 () tuple2!16238)

(assert (=> b!188000 (= res!156605 (and (= (_2!8764 lt!291691) (_2!8764 lt!291692)) (= (_1!8764 lt!291691) (_1!8764 lt!291692))))))

(declare-fun lt!291716 () Unit!13444)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13444)

(assert (=> b!188000 (= lt!291716 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699))))

(assert (=> b!188000 (= lt!291692 (readNBitsLSBFirstsLoopPure!0 lt!291704 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718))))

(declare-fun withMovedBitIndex!0 (BitStream!7792 (_ BitVec 64)) BitStream!7792)

(assert (=> b!188000 (= lt!291704 (withMovedBitIndex!0 (_1!8763 lt!291706) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!188001 () Bool)

(declare-fun res!156600 () Bool)

(assert (=> b!188001 (=> (not res!156600) (not e!129922))))

(declare-fun lt!291693 () (_ BitVec 64))

(assert (=> b!188001 (= res!156600 (= (_1!8763 lt!291715) (withMovedBitIndex!0 (_2!8763 lt!291715) (bvsub lt!291709 lt!291693))))))

(declare-fun b!188002 () Bool)

(declare-fun res!156601 () Bool)

(assert (=> b!188002 (=> res!156601 e!129929)))

(assert (=> b!188002 (= res!156601 (or (not (= (size!4342 (buf!4813 (_2!8762 lt!291708))) (size!4342 (buf!4813 thiss!1204)))) (not (= lt!291693 (bvsub (bvadd lt!291702 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!188003 () Bool)

(assert (=> b!188003 (= e!129922 (and (= lt!291702 (bvsub lt!291709 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8763 lt!291715) lt!291704)) (= (_2!8764 lt!291691) (_2!8764 lt!291710)))))))

(declare-fun b!188004 () Bool)

(declare-fun res!156593 () Bool)

(assert (=> b!188004 (=> res!156593 e!129929)))

(declare-fun isPrefixOf!0 (BitStream!7792 BitStream!7792) Bool)

(assert (=> b!188004 (= res!156593 (not (isPrefixOf!0 thiss!1204 (_2!8762 lt!291690))))))

(declare-fun b!188005 () Bool)

(assert (=> b!188005 (= e!129924 e!129929)))

(declare-fun res!156588 () Bool)

(assert (=> b!188005 (=> res!156588 e!129929)))

(assert (=> b!188005 (= res!156588 (not (= lt!291693 (bvsub (bvsub (bvadd lt!291709 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!188005 (= lt!291693 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708))))))

(assert (=> b!188005 (isPrefixOf!0 thiss!1204 (_2!8762 lt!291708))))

(declare-fun lt!291694 () Unit!13444)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7792 BitStream!7792 BitStream!7792) Unit!13444)

(assert (=> b!188005 (= lt!291694 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8762 lt!291690) (_2!8762 lt!291708)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7792 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16234)

(assert (=> b!188005 (= lt!291708 (appendBitsLSBFirstLoopTR!0 (_2!8762 lt!291690) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!188006 () Bool)

(declare-fun res!156598 () Bool)

(assert (=> b!188006 (=> (not res!156598) (not e!129922))))

(assert (=> b!188006 (= res!156598 (= (_1!8763 lt!291706) (withMovedBitIndex!0 (_2!8763 lt!291706) (bvsub lt!291702 lt!291693))))))

(declare-fun b!188007 () Bool)

(declare-fun e!129931 () Bool)

(assert (=> b!188007 (= e!129926 e!129931)))

(declare-fun res!156586 () Bool)

(assert (=> b!188007 (=> (not res!156586) (not e!129931))))

(declare-fun lt!291705 () (_ BitVec 64))

(assert (=> b!188007 (= res!156586 (= lt!291701 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291705)))))

(assert (=> b!188007 (= lt!291701 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(assert (=> b!188007 (= lt!291705 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(declare-fun res!156595 () Bool)

(assert (=> start!40856 (=> (not res!156595) (not e!129928))))

(assert (=> start!40856 (= res!156595 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40856 e!129928))

(assert (=> start!40856 true))

(declare-fun inv!12 (BitStream!7792) Bool)

(assert (=> start!40856 (and (inv!12 thiss!1204) e!129927)))

(declare-fun b!188008 () Bool)

(declare-fun res!156591 () Bool)

(assert (=> b!188008 (=> res!156591 e!129929)))

(assert (=> b!188008 (= res!156591 (not (invariant!0 (currentBit!9074 (_2!8762 lt!291708)) (currentByte!9079 (_2!8762 lt!291708)) (size!4342 (buf!4813 (_2!8762 lt!291708))))))))

(declare-fun b!188009 () Bool)

(declare-fun res!156606 () Bool)

(assert (=> b!188009 (=> (not res!156606) (not e!129931))))

(assert (=> b!188009 (= res!156606 (isPrefixOf!0 thiss!1204 (_2!8762 lt!291690)))))

(declare-fun b!188010 () Bool)

(declare-fun res!156599 () Bool)

(assert (=> b!188010 (=> res!156599 e!129929)))

(assert (=> b!188010 (= res!156599 (not (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!291708))))))

(declare-fun b!188011 () Bool)

(assert (=> b!188011 (= e!129931 e!129930)))

(declare-fun res!156596 () Bool)

(assert (=> b!188011 (=> (not res!156596) (not e!129930))))

(assert (=> b!188011 (= res!156596 (and (= (_2!8761 lt!291714) lt!291703) (= (_1!8761 lt!291714) (_2!8762 lt!291690))))))

(declare-fun readerFrom!0 (BitStream!7792 (_ BitVec 32) (_ BitVec 32)) BitStream!7792)

(assert (=> b!188011 (= lt!291714 (readBitPure!0 (readerFrom!0 (_2!8762 lt!291690) (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204))))))

(declare-fun b!188012 () Bool)

(assert (=> b!188012 (= e!129935 (= (_2!8761 lt!291697) (_2!8761 lt!291711)))))

(assert (= (and start!40856 res!156595) b!187994))

(assert (= (and b!187994 res!156602) b!187995))

(assert (= (and b!187995 res!156589) b!187993))

(assert (= (and b!187993 res!156587) b!187996))

(assert (= (and b!187996 res!156597) b!188007))

(assert (= (and b!188007 res!156586) b!188009))

(assert (= (and b!188009 res!156606) b!188011))

(assert (= (and b!188011 res!156596) b!187992))

(assert (= (and b!187996 (not res!156592)) b!188005))

(assert (= (and b!188005 (not res!156588)) b!188008))

(assert (= (and b!188008 (not res!156591)) b!188002))

(assert (= (and b!188002 (not res!156601)) b!188010))

(assert (= (and b!188010 (not res!156599)) b!188004))

(assert (= (and b!188004 (not res!156593)) b!187998))

(assert (= (and b!187998 res!156590) b!187999))

(assert (= (and b!187998 res!156603) b!188012))

(assert (= (and b!187998 (not res!156594)) b!188000))

(assert (= (and b!188000 res!156605) b!188006))

(assert (= (and b!188006 res!156598) b!188001))

(assert (= (and b!188001 res!156600) b!188003))

(assert (= (and b!188000 (not res!156604)) b!187997))

(assert (= start!40856 b!187991))

(declare-fun m!292415 () Bool)

(assert (=> b!188008 m!292415))

(declare-fun m!292417 () Bool)

(assert (=> b!188009 m!292417))

(declare-fun m!292419 () Bool)

(assert (=> b!187996 m!292419))

(declare-fun m!292421 () Bool)

(assert (=> b!187996 m!292421))

(declare-fun m!292423 () Bool)

(assert (=> b!187996 m!292423))

(declare-fun m!292425 () Bool)

(assert (=> b!188011 m!292425))

(assert (=> b!188011 m!292425))

(declare-fun m!292427 () Bool)

(assert (=> b!188011 m!292427))

(assert (=> b!188007 m!292419))

(assert (=> b!188007 m!292421))

(declare-fun m!292429 () Bool)

(assert (=> b!188010 m!292429))

(declare-fun m!292431 () Bool)

(assert (=> b!187994 m!292431))

(declare-fun m!292433 () Bool)

(assert (=> b!188001 m!292433))

(declare-fun m!292435 () Bool)

(assert (=> b!188000 m!292435))

(declare-fun m!292437 () Bool)

(assert (=> b!188000 m!292437))

(declare-fun m!292439 () Bool)

(assert (=> b!188000 m!292439))

(declare-fun m!292441 () Bool)

(assert (=> b!187998 m!292441))

(declare-fun m!292443 () Bool)

(assert (=> b!187998 m!292443))

(declare-fun m!292445 () Bool)

(assert (=> b!187998 m!292445))

(declare-fun m!292447 () Bool)

(assert (=> b!187998 m!292447))

(declare-fun m!292449 () Bool)

(assert (=> b!187998 m!292449))

(declare-fun m!292451 () Bool)

(assert (=> b!187998 m!292451))

(declare-fun m!292453 () Bool)

(assert (=> b!187998 m!292453))

(declare-fun m!292455 () Bool)

(assert (=> b!187998 m!292455))

(declare-fun m!292457 () Bool)

(assert (=> b!187998 m!292457))

(declare-fun m!292459 () Bool)

(assert (=> b!187998 m!292459))

(declare-fun m!292461 () Bool)

(assert (=> b!187998 m!292461))

(declare-fun m!292463 () Bool)

(assert (=> b!187998 m!292463))

(declare-fun m!292465 () Bool)

(assert (=> b!187998 m!292465))

(declare-fun m!292467 () Bool)

(assert (=> b!187998 m!292467))

(declare-fun m!292469 () Bool)

(assert (=> b!187998 m!292469))

(declare-fun m!292471 () Bool)

(assert (=> b!187998 m!292471))

(declare-fun m!292473 () Bool)

(assert (=> b!187999 m!292473))

(declare-fun m!292475 () Bool)

(assert (=> b!187997 m!292475))

(declare-fun m!292477 () Bool)

(assert (=> b!187991 m!292477))

(assert (=> b!188004 m!292417))

(declare-fun m!292479 () Bool)

(assert (=> b!188005 m!292479))

(declare-fun m!292481 () Bool)

(assert (=> b!188005 m!292481))

(declare-fun m!292483 () Bool)

(assert (=> b!188005 m!292483))

(declare-fun m!292485 () Bool)

(assert (=> b!188005 m!292485))

(declare-fun m!292487 () Bool)

(assert (=> b!188006 m!292487))

(declare-fun m!292489 () Bool)

(assert (=> b!187995 m!292489))

(declare-fun m!292491 () Bool)

(assert (=> start!40856 m!292491))

(declare-fun m!292493 () Bool)

(assert (=> b!187992 m!292493))

(push 1)

(assert (not b!188011))

(assert (not b!188007))

(assert (not b!187998))

(assert (not b!187999))

(assert (not b!188004))

(assert (not b!188008))

(assert (not b!188005))

(assert (not b!187992))

(assert (not start!40856))

(assert (not b!187995))

(assert (not b!188009))

(assert (not b!188001))

(assert (not b!187997))

(assert (not b!188006))

(assert (not b!187994))

(assert (not b!188010))

(assert (not b!188000))

(assert (not b!187991))

(assert (not b!187996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64911 () Bool)

(assert (=> d!64911 (= (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204))) (and (bvsge (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9074 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9079 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204))) (and (= (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204)))))))))

(assert (=> b!187995 d!64911))

(declare-fun d!64913 () Bool)

(declare-fun e!130033 () Bool)

(assert (=> d!64913 e!130033))

(declare-fun res!156757 () Bool)

(assert (=> d!64913 (=> (not res!156757) (not e!130033))))

(declare-fun lt!291943 () (_ BitVec 64))

(declare-fun lt!291941 () (_ BitVec 64))

(declare-fun lt!291942 () (_ BitVec 64))

(assert (=> d!64913 (= res!156757 (= lt!291943 (bvsub lt!291942 lt!291941)))))

(assert (=> d!64913 (or (= (bvand lt!291942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291942 lt!291941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64913 (= lt!291941 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291708))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291708)))))))

(declare-fun lt!291938 () (_ BitVec 64))

(declare-fun lt!291939 () (_ BitVec 64))

(assert (=> d!64913 (= lt!291942 (bvmul lt!291938 lt!291939))))

(assert (=> d!64913 (or (= lt!291938 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291939 (bvsdiv (bvmul lt!291938 lt!291939) lt!291938)))))

(assert (=> d!64913 (= lt!291939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64913 (= lt!291938 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))))))

(assert (=> d!64913 (= lt!291943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291708))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291708)))))))

(assert (=> d!64913 (invariant!0 (currentBit!9074 (_2!8762 lt!291708)) (currentByte!9079 (_2!8762 lt!291708)) (size!4342 (buf!4813 (_2!8762 lt!291708))))))

(assert (=> d!64913 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708))) lt!291943)))

(declare-fun b!188168 () Bool)

(declare-fun res!156756 () Bool)

(assert (=> b!188168 (=> (not res!156756) (not e!130033))))

(assert (=> b!188168 (= res!156756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291943))))

(declare-fun b!188169 () Bool)

(declare-fun lt!291940 () (_ BitVec 64))

(assert (=> b!188169 (= e!130033 (bvsle lt!291943 (bvmul lt!291940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188169 (or (= lt!291940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291940)))))

(assert (=> b!188169 (= lt!291940 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))))))

(assert (= (and d!64913 res!156757) b!188168))

(assert (= (and b!188168 res!156756) b!188169))

(declare-fun m!292667 () Bool)

(assert (=> d!64913 m!292667))

(assert (=> d!64913 m!292415))

(assert (=> b!188005 d!64913))

(declare-fun d!64915 () Bool)

(declare-fun res!156766 () Bool)

(declare-fun e!130038 () Bool)

(assert (=> d!64915 (=> (not res!156766) (not e!130038))))

(assert (=> d!64915 (= res!156766 (= (size!4342 (buf!4813 thiss!1204)) (size!4342 (buf!4813 (_2!8762 lt!291708)))))))

(assert (=> d!64915 (= (isPrefixOf!0 thiss!1204 (_2!8762 lt!291708)) e!130038)))

(declare-fun b!188176 () Bool)

(declare-fun res!156764 () Bool)

(assert (=> b!188176 (=> (not res!156764) (not e!130038))))

(assert (=> b!188176 (= res!156764 (bvsle (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708)))))))

(declare-fun b!188177 () Bool)

(declare-fun e!130039 () Bool)

(assert (=> b!188177 (= e!130038 e!130039)))

(declare-fun res!156765 () Bool)

(assert (=> b!188177 (=> res!156765 e!130039)))

(assert (=> b!188177 (= res!156765 (= (size!4342 (buf!4813 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188178 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9851 array!9851 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188178 (= e!130039 (arrayBitRangesEq!0 (buf!4813 thiss!1204) (buf!4813 (_2!8762 lt!291708)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))))))

(assert (= (and d!64915 res!156766) b!188176))

(assert (= (and b!188176 res!156764) b!188177))

(assert (= (and b!188177 (not res!156765)) b!188178))

(assert (=> b!188176 m!292421))

(assert (=> b!188176 m!292479))

(assert (=> b!188178 m!292421))

(assert (=> b!188178 m!292421))

(declare-fun m!292669 () Bool)

(assert (=> b!188178 m!292669))

(assert (=> b!188005 d!64915))

(declare-fun d!64917 () Bool)

(assert (=> d!64917 (isPrefixOf!0 thiss!1204 (_2!8762 lt!291708))))

(declare-fun lt!291946 () Unit!13444)

(declare-fun choose!30 (BitStream!7792 BitStream!7792 BitStream!7792) Unit!13444)

(assert (=> d!64917 (= lt!291946 (choose!30 thiss!1204 (_2!8762 lt!291690) (_2!8762 lt!291708)))))

(assert (=> d!64917 (isPrefixOf!0 thiss!1204 (_2!8762 lt!291690))))

(assert (=> d!64917 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8762 lt!291690) (_2!8762 lt!291708)) lt!291946)))

(declare-fun bs!16132 () Bool)

(assert (= bs!16132 d!64917))

(assert (=> bs!16132 m!292481))

(declare-fun m!292671 () Bool)

(assert (=> bs!16132 m!292671))

(assert (=> bs!16132 m!292417))

(assert (=> b!188005 d!64917))

(declare-fun b!188331 () Bool)

(declare-fun res!156892 () Bool)

(declare-fun lt!292447 () tuple2!16234)

(assert (=> b!188331 (= res!156892 (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!292447)))))

(declare-fun e!130126 () Bool)

(assert (=> b!188331 (=> (not res!156892) (not e!130126))))

(declare-fun b!188332 () Bool)

(declare-fun e!130127 () tuple2!16234)

(declare-fun Unit!13463 () Unit!13444)

(assert (=> b!188332 (= e!130127 (tuple2!16235 Unit!13463 (_2!8762 lt!291690)))))

(declare-fun lt!292445 () Unit!13444)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7792) Unit!13444)

(assert (=> b!188332 (= lt!292445 (lemmaIsPrefixRefl!0 (_2!8762 lt!291690)))))

(declare-fun call!3026 () Bool)

(assert (=> b!188332 call!3026))

(declare-fun lt!292454 () Unit!13444)

(assert (=> b!188332 (= lt!292454 lt!292445)))

(declare-fun b!188333 () Bool)

(declare-fun e!130134 () Bool)

(declare-fun lt!292465 () (_ BitVec 64))

(assert (=> b!188333 (= e!130134 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291690)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!292465))))

(declare-fun b!188334 () Bool)

(declare-fun e!130129 () (_ BitVec 64))

(assert (=> b!188334 (= e!130129 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!188335 () Bool)

(declare-fun e!130133 () Bool)

(declare-fun lt!292419 () tuple2!16232)

(assert (=> b!188335 (= e!130133 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292419))) (currentByte!9079 (_1!8761 lt!292419)) (currentBit!9074 (_1!8761 lt!292419))) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292447))) (currentByte!9079 (_2!8762 lt!292447)) (currentBit!9074 (_2!8762 lt!292447)))))))

(declare-fun b!188336 () Bool)

(declare-fun e!130128 () Bool)

(declare-fun lt!292462 () tuple2!16238)

(declare-fun lt!292449 () tuple2!16236)

(assert (=> b!188336 (= e!130128 (= (_1!8764 lt!292462) (_2!8763 lt!292449)))))

(declare-fun b!188337 () Bool)

(declare-fun e!130130 () Bool)

(assert (=> b!188337 (= e!130130 e!130128)))

(declare-fun res!156901 () Bool)

(assert (=> b!188337 (=> (not res!156901) (not e!130128))))

(assert (=> b!188337 (= res!156901 (= (_2!8764 lt!292462) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!188337 (= lt!292462 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!292449) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!292423 () Unit!13444)

(declare-fun lt!292436 () Unit!13444)

(assert (=> b!188337 (= lt!292423 lt!292436)))

(declare-fun lt!292417 () tuple2!16234)

(assert (=> b!188337 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!292417)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!292465)))

(assert (=> b!188337 (= lt!292436 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!292417)) lt!292465))))

(assert (=> b!188337 e!130134))

(declare-fun res!156898 () Bool)

(assert (=> b!188337 (=> (not res!156898) (not e!130134))))

(assert (=> b!188337 (= res!156898 (and (= (size!4342 (buf!4813 (_2!8762 lt!291690))) (size!4342 (buf!4813 (_2!8762 lt!292417)))) (bvsge lt!292465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188337 (= lt!292465 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!188337 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!188337 (= lt!292449 (reader!0 (_2!8762 lt!291690) (_2!8762 lt!292417)))))

(declare-fun b!188338 () Bool)

(declare-fun res!156891 () Bool)

(assert (=> b!188338 (=> (not res!156891) (not e!130130))))

(declare-fun lt!292442 () (_ BitVec 64))

(declare-fun lt!292455 () (_ BitVec 64))

(assert (=> b!188338 (= res!156891 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292417))) (currentByte!9079 (_2!8762 lt!292417)) (currentBit!9074 (_2!8762 lt!292417))) (bvsub lt!292455 lt!292442)))))

(assert (=> b!188338 (or (= (bvand lt!292455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292455 lt!292442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188338 (= lt!292442 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!292466 () (_ BitVec 64))

(declare-fun lt!292448 () (_ BitVec 64))

(assert (=> b!188338 (= lt!292455 (bvadd lt!292466 lt!292448))))

(assert (=> b!188338 (or (not (= (bvand lt!292466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292448 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292466 lt!292448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188338 (= lt!292448 ((_ sign_extend 32) nBits!348))))

(assert (=> b!188338 (= lt!292466 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(declare-fun d!64919 () Bool)

(assert (=> d!64919 e!130130))

(declare-fun res!156895 () Bool)

(assert (=> d!64919 (=> (not res!156895) (not e!130130))))

(assert (=> d!64919 (= res!156895 (invariant!0 (currentBit!9074 (_2!8762 lt!292417)) (currentByte!9079 (_2!8762 lt!292417)) (size!4342 (buf!4813 (_2!8762 lt!292417)))))))

(assert (=> d!64919 (= lt!292417 e!130127)))

(declare-fun c!9605 () Bool)

(assert (=> d!64919 (= c!9605 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64919 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64919 (= (appendBitsLSBFirstLoopTR!0 (_2!8762 lt!291690) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!292417)))

(declare-fun b!188330 () Bool)

(declare-fun res!156897 () Bool)

(assert (=> b!188330 (= res!156897 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292447))) (currentByte!9079 (_2!8762 lt!292447)) (currentBit!9074 (_2!8762 lt!292447))) (bvadd (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!188330 (=> (not res!156897) (not e!130126))))

(declare-fun b!188339 () Bool)

(declare-fun e!130132 () Bool)

(declare-fun lt!292458 () tuple2!16232)

(declare-fun lt!292424 () tuple2!16232)

(assert (=> b!188339 (= e!130132 (= (_2!8761 lt!292458) (_2!8761 lt!292424)))))

(declare-fun b!188340 () Bool)

(declare-fun e!130131 () Bool)

(declare-fun lt!292456 () tuple2!16238)

(declare-fun lt!292450 () tuple2!16236)

(assert (=> b!188340 (= e!130131 (= (_1!8764 lt!292456) (_2!8763 lt!292450)))))

(declare-fun b!188341 () Bool)

(assert (=> b!188341 (= lt!292419 (readBitPure!0 (readerFrom!0 (_2!8762 lt!292447) (currentBit!9074 (_2!8762 lt!291690)) (currentByte!9079 (_2!8762 lt!291690)))))))

(declare-fun res!156890 () Bool)

(declare-fun lt!292438 () Bool)

(assert (=> b!188341 (= res!156890 (and (= (_2!8761 lt!292419) lt!292438) (= (_1!8761 lt!292419) (_2!8762 lt!292447))))))

(assert (=> b!188341 (=> (not res!156890) (not e!130133))))

(assert (=> b!188341 (= e!130126 e!130133)))

(declare-fun bm!3023 () Bool)

(declare-fun lt!292435 () tuple2!16234)

(assert (=> bm!3023 (= call!3026 (isPrefixOf!0 (_2!8762 lt!291690) (ite c!9605 (_2!8762 lt!291690) (_2!8762 lt!292435))))))

(declare-fun b!188342 () Bool)

(declare-fun res!156894 () Bool)

(assert (=> b!188342 (=> (not res!156894) (not e!130130))))

(assert (=> b!188342 (= res!156894 (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!292417)))))

(declare-fun b!188343 () Bool)

(assert (=> b!188343 (= e!130129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!188344 () Bool)

(assert (=> b!188344 (= e!130127 (tuple2!16235 (_1!8762 lt!292435) (_2!8762 lt!292435)))))

(assert (=> b!188344 (= lt!292438 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188344 (= lt!292447 (appendBit!0 (_2!8762 lt!291690) lt!292438))))

(declare-fun res!156893 () Bool)

(assert (=> b!188344 (= res!156893 (= (size!4342 (buf!4813 (_2!8762 lt!291690))) (size!4342 (buf!4813 (_2!8762 lt!292447)))))))

(assert (=> b!188344 (=> (not res!156893) (not e!130126))))

(assert (=> b!188344 e!130126))

(declare-fun lt!292437 () tuple2!16234)

(assert (=> b!188344 (= lt!292437 lt!292447)))

(assert (=> b!188344 (= lt!292435 (appendBitsLSBFirstLoopTR!0 (_2!8762 lt!292437) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!292452 () Unit!13444)

(assert (=> b!188344 (= lt!292452 (lemmaIsPrefixTransitive!0 (_2!8762 lt!291690) (_2!8762 lt!292437) (_2!8762 lt!292435)))))

(assert (=> b!188344 call!3026))

(declare-fun lt!292427 () Unit!13444)

(assert (=> b!188344 (= lt!292427 lt!292452)))

(assert (=> b!188344 (invariant!0 (currentBit!9074 (_2!8762 lt!291690)) (currentByte!9079 (_2!8762 lt!291690)) (size!4342 (buf!4813 (_2!8762 lt!292437))))))

(declare-fun lt!292418 () BitStream!7792)

(assert (=> b!188344 (= lt!292418 (BitStream!7793 (buf!4813 (_2!8762 lt!292437)) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(assert (=> b!188344 (invariant!0 (currentBit!9074 lt!292418) (currentByte!9079 lt!292418) (size!4342 (buf!4813 (_2!8762 lt!292435))))))

(declare-fun lt!292468 () BitStream!7792)

(assert (=> b!188344 (= lt!292468 (BitStream!7793 (buf!4813 (_2!8762 lt!292435)) (currentByte!9079 lt!292418) (currentBit!9074 lt!292418)))))

(assert (=> b!188344 (= lt!292458 (readBitPure!0 lt!292418))))

(assert (=> b!188344 (= lt!292424 (readBitPure!0 lt!292468))))

(declare-fun lt!292440 () Unit!13444)

(assert (=> b!188344 (= lt!292440 (readBitPrefixLemma!0 lt!292418 (_2!8762 lt!292435)))))

(declare-fun res!156896 () Bool)

(assert (=> b!188344 (= res!156896 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292458))) (currentByte!9079 (_1!8761 lt!292458)) (currentBit!9074 (_1!8761 lt!292458))) (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292424))) (currentByte!9079 (_1!8761 lt!292424)) (currentBit!9074 (_1!8761 lt!292424)))))))

(assert (=> b!188344 (=> (not res!156896) (not e!130132))))

(assert (=> b!188344 e!130132))

(declare-fun lt!292453 () Unit!13444)

(assert (=> b!188344 (= lt!292453 lt!292440)))

(declare-fun lt!292414 () tuple2!16236)

(assert (=> b!188344 (= lt!292414 (reader!0 (_2!8762 lt!291690) (_2!8762 lt!292435)))))

(declare-fun lt!292426 () tuple2!16236)

(assert (=> b!188344 (= lt!292426 (reader!0 (_2!8762 lt!292437) (_2!8762 lt!292435)))))

(declare-fun lt!292457 () tuple2!16232)

(assert (=> b!188344 (= lt!292457 (readBitPure!0 (_1!8763 lt!292414)))))

(assert (=> b!188344 (= (_2!8761 lt!292457) lt!292438)))

(declare-fun lt!292441 () Unit!13444)

(declare-fun Unit!13464 () Unit!13444)

(assert (=> b!188344 (= lt!292441 Unit!13464)))

(declare-fun lt!292459 () (_ BitVec 64))

(assert (=> b!188344 (= lt!292459 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292433 () (_ BitVec 64))

(assert (=> b!188344 (= lt!292433 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292444 () Unit!13444)

(assert (=> b!188344 (= lt!292444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!292435)) lt!292433))))

(assert (=> b!188344 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!292435)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!292433)))

(declare-fun lt!292464 () Unit!13444)

(assert (=> b!188344 (= lt!292464 lt!292444)))

(declare-fun lt!292422 () tuple2!16238)

(assert (=> b!188344 (= lt!292422 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!292414) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292459))))

(declare-fun lt!292439 () (_ BitVec 64))

(assert (=> b!188344 (= lt!292439 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!292421 () Unit!13444)

(assert (=> b!188344 (= lt!292421 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!292437) (buf!4813 (_2!8762 lt!292435)) lt!292439))))

(assert (=> b!188344 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!292435)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!292437))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!292437))) lt!292439)))

(declare-fun lt!292461 () Unit!13444)

(assert (=> b!188344 (= lt!292461 lt!292421)))

(declare-fun lt!292429 () tuple2!16238)

(assert (=> b!188344 (= lt!292429 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!292426) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292459 (ite (_2!8761 lt!292457) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!292463 () tuple2!16238)

(assert (=> b!188344 (= lt!292463 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!292414) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292459))))

(declare-fun c!9604 () Bool)

(assert (=> b!188344 (= c!9604 (_2!8761 (readBitPure!0 (_1!8763 lt!292414))))))

(declare-fun lt!292443 () tuple2!16238)

(assert (=> b!188344 (= lt!292443 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8763 lt!292414) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292459 e!130129)))))

(declare-fun lt!292416 () Unit!13444)

(assert (=> b!188344 (= lt!292416 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8763 lt!292414) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292459))))

(assert (=> b!188344 (and (= (_2!8764 lt!292463) (_2!8764 lt!292443)) (= (_1!8764 lt!292463) (_1!8764 lt!292443)))))

(declare-fun lt!292425 () Unit!13444)

(assert (=> b!188344 (= lt!292425 lt!292416)))

(assert (=> b!188344 (= (_1!8763 lt!292414) (withMovedBitIndex!0 (_2!8763 lt!292414) (bvsub (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292435))) (currentByte!9079 (_2!8762 lt!292435)) (currentBit!9074 (_2!8762 lt!292435))))))))

(declare-fun lt!292434 () Unit!13444)

(declare-fun Unit!13465 () Unit!13444)

(assert (=> b!188344 (= lt!292434 Unit!13465)))

(assert (=> b!188344 (= (_1!8763 lt!292426) (withMovedBitIndex!0 (_2!8763 lt!292426) (bvsub (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292437))) (currentByte!9079 (_2!8762 lt!292437)) (currentBit!9074 (_2!8762 lt!292437))) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292435))) (currentByte!9079 (_2!8762 lt!292435)) (currentBit!9074 (_2!8762 lt!292435))))))))

(declare-fun lt!292460 () Unit!13444)

(declare-fun Unit!13466 () Unit!13444)

(assert (=> b!188344 (= lt!292460 Unit!13466)))

(assert (=> b!188344 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) (bvsub (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292437))) (currentByte!9079 (_2!8762 lt!292437)) (currentBit!9074 (_2!8762 lt!292437))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!292431 () Unit!13444)

(declare-fun Unit!13467 () Unit!13444)

(assert (=> b!188344 (= lt!292431 Unit!13467)))

(assert (=> b!188344 (= (_2!8764 lt!292422) (_2!8764 lt!292429))))

(declare-fun lt!292446 () Unit!13444)

(declare-fun Unit!13468 () Unit!13444)

(assert (=> b!188344 (= lt!292446 Unit!13468)))

(assert (=> b!188344 (invariant!0 (currentBit!9074 (_2!8762 lt!292435)) (currentByte!9079 (_2!8762 lt!292435)) (size!4342 (buf!4813 (_2!8762 lt!292435))))))

(declare-fun lt!292467 () Unit!13444)

(declare-fun Unit!13469 () Unit!13444)

(assert (=> b!188344 (= lt!292467 Unit!13469)))

(assert (=> b!188344 (= (size!4342 (buf!4813 (_2!8762 lt!291690))) (size!4342 (buf!4813 (_2!8762 lt!292435))))))

(declare-fun lt!292415 () Unit!13444)

(declare-fun Unit!13470 () Unit!13444)

(assert (=> b!188344 (= lt!292415 Unit!13470)))

(assert (=> b!188344 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292435))) (currentByte!9079 (_2!8762 lt!292435)) (currentBit!9074 (_2!8762 lt!292435))) (bvsub (bvadd (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292428 () Unit!13444)

(declare-fun Unit!13471 () Unit!13444)

(assert (=> b!188344 (= lt!292428 Unit!13471)))

(declare-fun lt!292432 () Unit!13444)

(declare-fun Unit!13472 () Unit!13444)

(assert (=> b!188344 (= lt!292432 Unit!13472)))

(assert (=> b!188344 (= lt!292450 (reader!0 (_2!8762 lt!291690) (_2!8762 lt!292435)))))

(declare-fun lt!292420 () (_ BitVec 64))

(assert (=> b!188344 (= lt!292420 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292413 () Unit!13444)

(assert (=> b!188344 (= lt!292413 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!292435)) lt!292420))))

(assert (=> b!188344 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!292435)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!292420)))

(declare-fun lt!292430 () Unit!13444)

(assert (=> b!188344 (= lt!292430 lt!292413)))

(assert (=> b!188344 (= lt!292456 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!292450) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156900 () Bool)

(assert (=> b!188344 (= res!156900 (= (_2!8764 lt!292456) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!188344 (=> (not res!156900) (not e!130131))))

(assert (=> b!188344 e!130131))

(declare-fun lt!292451 () Unit!13444)

(declare-fun Unit!13473 () Unit!13444)

(assert (=> b!188344 (= lt!292451 Unit!13473)))

(declare-fun b!188345 () Bool)

(declare-fun res!156899 () Bool)

(assert (=> b!188345 (=> (not res!156899) (not e!130130))))

(assert (=> b!188345 (= res!156899 (= (size!4342 (buf!4813 (_2!8762 lt!291690))) (size!4342 (buf!4813 (_2!8762 lt!292417)))))))

(assert (= (and d!64919 c!9605) b!188332))

(assert (= (and d!64919 (not c!9605)) b!188344))

(assert (= (and b!188344 res!156893) b!188330))

(assert (= (and b!188330 res!156897) b!188331))

(assert (= (and b!188331 res!156892) b!188341))

(assert (= (and b!188341 res!156890) b!188335))

(assert (= (and b!188344 res!156896) b!188339))

(assert (= (and b!188344 c!9604) b!188334))

(assert (= (and b!188344 (not c!9604)) b!188343))

(assert (= (and b!188344 res!156900) b!188340))

(assert (= (or b!188332 b!188344) bm!3023))

(assert (= (and d!64919 res!156895) b!188345))

(assert (= (and b!188345 res!156899) b!188338))

(assert (= (and b!188338 res!156891) b!188342))

(assert (= (and b!188342 res!156894) b!188337))

(assert (= (and b!188337 res!156898) b!188333))

(assert (= (and b!188337 res!156901) b!188336))

(declare-fun m!292917 () Bool)

(assert (=> b!188342 m!292917))

(declare-fun m!292919 () Bool)

(assert (=> bm!3023 m!292919))

(declare-fun m!292921 () Bool)

(assert (=> b!188338 m!292921))

(assert (=> b!188338 m!292419))

(declare-fun m!292923 () Bool)

(assert (=> b!188332 m!292923))

(declare-fun m!292925 () Bool)

(assert (=> d!64919 m!292925))

(declare-fun m!292927 () Bool)

(assert (=> b!188341 m!292927))

(assert (=> b!188341 m!292927))

(declare-fun m!292929 () Bool)

(assert (=> b!188341 m!292929))

(declare-fun m!292931 () Bool)

(assert (=> b!188331 m!292931))

(declare-fun m!292933 () Bool)

(assert (=> b!188335 m!292933))

(declare-fun m!292935 () Bool)

(assert (=> b!188335 m!292935))

(declare-fun m!292937 () Bool)

(assert (=> b!188337 m!292937))

(declare-fun m!292939 () Bool)

(assert (=> b!188337 m!292939))

(declare-fun m!292941 () Bool)

(assert (=> b!188337 m!292941))

(declare-fun m!292943 () Bool)

(assert (=> b!188337 m!292943))

(declare-fun m!292945 () Bool)

(assert (=> b!188337 m!292945))

(declare-fun m!292947 () Bool)

(assert (=> b!188337 m!292947))

(assert (=> b!188330 m!292935))

(assert (=> b!188330 m!292419))

(declare-fun m!292949 () Bool)

(assert (=> b!188344 m!292949))

(declare-fun m!292951 () Bool)

(assert (=> b!188344 m!292951))

(declare-fun m!292953 () Bool)

(assert (=> b!188344 m!292953))

(declare-fun m!292955 () Bool)

(assert (=> b!188344 m!292955))

(declare-fun m!292957 () Bool)

(assert (=> b!188344 m!292957))

(declare-fun m!292959 () Bool)

(assert (=> b!188344 m!292959))

(declare-fun m!292961 () Bool)

(assert (=> b!188344 m!292961))

(assert (=> b!188344 m!292953))

(declare-fun m!292963 () Bool)

(assert (=> b!188344 m!292963))

(declare-fun m!292965 () Bool)

(assert (=> b!188344 m!292965))

(declare-fun m!292967 () Bool)

(assert (=> b!188344 m!292967))

(declare-fun m!292969 () Bool)

(assert (=> b!188344 m!292969))

(declare-fun m!292971 () Bool)

(assert (=> b!188344 m!292971))

(declare-fun m!292973 () Bool)

(assert (=> b!188344 m!292973))

(declare-fun m!292975 () Bool)

(assert (=> b!188344 m!292975))

(declare-fun m!292977 () Bool)

(assert (=> b!188344 m!292977))

(declare-fun m!292979 () Bool)

(assert (=> b!188344 m!292979))

(declare-fun m!292981 () Bool)

(assert (=> b!188344 m!292981))

(declare-fun m!292983 () Bool)

(assert (=> b!188344 m!292983))

(declare-fun m!292985 () Bool)

(assert (=> b!188344 m!292985))

(assert (=> b!188344 m!292937))

(declare-fun m!292987 () Bool)

(assert (=> b!188344 m!292987))

(declare-fun m!292989 () Bool)

(assert (=> b!188344 m!292989))

(declare-fun m!292991 () Bool)

(assert (=> b!188344 m!292991))

(declare-fun m!292993 () Bool)

(assert (=> b!188344 m!292993))

(assert (=> b!188344 m!292941))

(assert (=> b!188344 m!292419))

(declare-fun m!292995 () Bool)

(assert (=> b!188344 m!292995))

(declare-fun m!292997 () Bool)

(assert (=> b!188344 m!292997))

(declare-fun m!292999 () Bool)

(assert (=> b!188344 m!292999))

(declare-fun m!293001 () Bool)

(assert (=> b!188344 m!293001))

(declare-fun m!293003 () Bool)

(assert (=> b!188344 m!293003))

(declare-fun m!293005 () Bool)

(assert (=> b!188344 m!293005))

(declare-fun m!293007 () Bool)

(assert (=> b!188344 m!293007))

(declare-fun m!293009 () Bool)

(assert (=> b!188333 m!293009))

(assert (=> b!188005 d!64919))

(declare-fun d!64999 () Bool)

(assert (=> d!64999 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)) lt!291695) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204))) lt!291695))))

(declare-fun bs!16149 () Bool)

(assert (= bs!16149 d!64999))

(declare-fun m!293011 () Bool)

(assert (=> bs!16149 m!293011))

(assert (=> b!187994 d!64999))

(declare-fun d!65001 () Bool)

(declare-fun e!130135 () Bool)

(assert (=> d!65001 e!130135))

(declare-fun res!156903 () Bool)

(assert (=> d!65001 (=> (not res!156903) (not e!130135))))

(declare-fun lt!292472 () (_ BitVec 64))

(declare-fun lt!292474 () (_ BitVec 64))

(declare-fun lt!292473 () (_ BitVec 64))

(assert (=> d!65001 (= res!156903 (= lt!292474 (bvsub lt!292473 lt!292472)))))

(assert (=> d!65001 (or (= (bvand lt!292473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292473 lt!292472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65001 (= lt!292472 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291690)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690)))))))

(declare-fun lt!292469 () (_ BitVec 64))

(declare-fun lt!292470 () (_ BitVec 64))

(assert (=> d!65001 (= lt!292473 (bvmul lt!292469 lt!292470))))

(assert (=> d!65001 (or (= lt!292469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292470 (bvsdiv (bvmul lt!292469 lt!292470) lt!292469)))))

(assert (=> d!65001 (= lt!292470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65001 (= lt!292469 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (=> d!65001 (= lt!292474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690)))))))

(assert (=> d!65001 (invariant!0 (currentBit!9074 (_2!8762 lt!291690)) (currentByte!9079 (_2!8762 lt!291690)) (size!4342 (buf!4813 (_2!8762 lt!291690))))))

(assert (=> d!65001 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) lt!292474)))

(declare-fun b!188346 () Bool)

(declare-fun res!156902 () Bool)

(assert (=> b!188346 (=> (not res!156902) (not e!130135))))

(assert (=> b!188346 (= res!156902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292474))))

(declare-fun b!188347 () Bool)

(declare-fun lt!292471 () (_ BitVec 64))

(assert (=> b!188347 (= e!130135 (bvsle lt!292474 (bvmul lt!292471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188347 (or (= lt!292471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292471)))))

(assert (=> b!188347 (= lt!292471 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (= (and d!65001 res!156903) b!188346))

(assert (= (and b!188346 res!156902) b!188347))

(declare-fun m!293013 () Bool)

(assert (=> d!65001 m!293013))

(declare-fun m!293015 () Bool)

(assert (=> d!65001 m!293015))

(assert (=> b!188007 d!65001))

(declare-fun d!65003 () Bool)

(declare-fun e!130136 () Bool)

(assert (=> d!65003 e!130136))

(declare-fun res!156905 () Bool)

(assert (=> d!65003 (=> (not res!156905) (not e!130136))))

(declare-fun lt!292478 () (_ BitVec 64))

(declare-fun lt!292480 () (_ BitVec 64))

(declare-fun lt!292479 () (_ BitVec 64))

(assert (=> d!65003 (= res!156905 (= lt!292480 (bvsub lt!292479 lt!292478)))))

(assert (=> d!65003 (or (= (bvand lt!292479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292479 lt!292478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65003 (= lt!292478 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204))))))

(declare-fun lt!292475 () (_ BitVec 64))

(declare-fun lt!292476 () (_ BitVec 64))

(assert (=> d!65003 (= lt!292479 (bvmul lt!292475 lt!292476))))

(assert (=> d!65003 (or (= lt!292475 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292476 (bvsdiv (bvmul lt!292475 lt!292476) lt!292475)))))

(assert (=> d!65003 (= lt!292476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65003 (= lt!292475 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))))))

(assert (=> d!65003 (= lt!292480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 thiss!1204))))))

(assert (=> d!65003 (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204)))))

(assert (=> d!65003 (= (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)) lt!292480)))

(declare-fun b!188348 () Bool)

(declare-fun res!156904 () Bool)

(assert (=> b!188348 (=> (not res!156904) (not e!130136))))

(assert (=> b!188348 (= res!156904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292480))))

(declare-fun b!188349 () Bool)

(declare-fun lt!292477 () (_ BitVec 64))

(assert (=> b!188349 (= e!130136 (bvsle lt!292480 (bvmul lt!292477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188349 (or (= lt!292477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292477)))))

(assert (=> b!188349 (= lt!292477 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))))))

(assert (= (and d!65003 res!156905) b!188348))

(assert (= (and b!188348 res!156904) b!188349))

(assert (=> d!65003 m!293011))

(assert (=> d!65003 m!292489))

(assert (=> b!188007 d!65003))

(assert (=> b!187996 d!65001))

(assert (=> b!187996 d!65003))

(declare-fun d!65005 () Bool)

(declare-fun e!130141 () Bool)

(assert (=> d!65005 e!130141))

(declare-fun res!156917 () Bool)

(assert (=> d!65005 (=> (not res!156917) (not e!130141))))

(declare-fun lt!292491 () tuple2!16234)

(assert (=> d!65005 (= res!156917 (= (size!4342 (buf!4813 thiss!1204)) (size!4342 (buf!4813 (_2!8762 lt!292491)))))))

(declare-fun choose!16 (BitStream!7792 Bool) tuple2!16234)

(assert (=> d!65005 (= lt!292491 (choose!16 thiss!1204 lt!291703))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65005 (validate_offset_bit!0 ((_ sign_extend 32) (size!4342 (buf!4813 thiss!1204))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)))))

(assert (=> d!65005 (= (appendBit!0 thiss!1204 lt!291703) lt!292491)))

(declare-fun b!188360 () Bool)

(declare-fun res!156916 () Bool)

(assert (=> b!188360 (=> (not res!156916) (not e!130141))))

(assert (=> b!188360 (= res!156916 (isPrefixOf!0 thiss!1204 (_2!8762 lt!292491)))))

(declare-fun b!188359 () Bool)

(declare-fun res!156914 () Bool)

(assert (=> b!188359 (=> (not res!156914) (not e!130141))))

(declare-fun lt!292492 () (_ BitVec 64))

(declare-fun lt!292490 () (_ BitVec 64))

(assert (=> b!188359 (= res!156914 (= (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292491))) (currentByte!9079 (_2!8762 lt!292491)) (currentBit!9074 (_2!8762 lt!292491))) (bvadd lt!292492 lt!292490)))))

(assert (=> b!188359 (or (not (= (bvand lt!292492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292490 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292492 lt!292490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188359 (= lt!292490 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!188359 (= lt!292492 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(declare-fun b!188361 () Bool)

(declare-fun e!130142 () Bool)

(assert (=> b!188361 (= e!130141 e!130142)))

(declare-fun res!156915 () Bool)

(assert (=> b!188361 (=> (not res!156915) (not e!130142))))

(declare-fun lt!292489 () tuple2!16232)

(assert (=> b!188361 (= res!156915 (and (= (_2!8761 lt!292489) lt!291703) (= (_1!8761 lt!292489) (_2!8762 lt!292491))))))

(assert (=> b!188361 (= lt!292489 (readBitPure!0 (readerFrom!0 (_2!8762 lt!292491) (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204))))))

(declare-fun b!188362 () Bool)

(assert (=> b!188362 (= e!130142 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292489))) (currentByte!9079 (_1!8761 lt!292489)) (currentBit!9074 (_1!8761 lt!292489))) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!292491))) (currentByte!9079 (_2!8762 lt!292491)) (currentBit!9074 (_2!8762 lt!292491)))))))

(assert (= (and d!65005 res!156917) b!188359))

(assert (= (and b!188359 res!156914) b!188360))

(assert (= (and b!188360 res!156916) b!188361))

(assert (= (and b!188361 res!156915) b!188362))

(declare-fun m!293017 () Bool)

(assert (=> b!188361 m!293017))

(assert (=> b!188361 m!293017))

(declare-fun m!293019 () Bool)

(assert (=> b!188361 m!293019))

(declare-fun m!293021 () Bool)

(assert (=> b!188359 m!293021))

(assert (=> b!188359 m!292421))

(declare-fun m!293023 () Bool)

(assert (=> b!188360 m!293023))

(declare-fun m!293025 () Bool)

(assert (=> d!65005 m!293025))

(declare-fun m!293027 () Bool)

(assert (=> d!65005 m!293027))

(declare-fun m!293029 () Bool)

(assert (=> b!188362 m!293029))

(assert (=> b!188362 m!293021))

(assert (=> b!187996 d!65005))

(declare-fun d!65007 () Bool)

(declare-fun e!130151 () Bool)

(assert (=> d!65007 e!130151))

(declare-fun res!156928 () Bool)

(assert (=> d!65007 (=> (not res!156928) (not e!130151))))

(declare-fun lt!292518 () (_ BitVec 64))

(declare-fun lt!292517 () BitStream!7792)

(assert (=> d!65007 (= res!156928 (= (bvadd lt!292518 (bvsub lt!291702 lt!291693)) (bitIndex!0 (size!4342 (buf!4813 lt!292517)) (currentByte!9079 lt!292517) (currentBit!9074 lt!292517))))))

(assert (=> d!65007 (or (not (= (bvand lt!292518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291702 lt!291693) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292518 (bvsub lt!291702 lt!291693)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65007 (= lt!292518 (bitIndex!0 (size!4342 (buf!4813 (_2!8763 lt!291706))) (currentByte!9079 (_2!8763 lt!291706)) (currentBit!9074 (_2!8763 lt!291706))))))

(declare-fun moveBitIndex!0 (BitStream!7792 (_ BitVec 64)) tuple2!16234)

(assert (=> d!65007 (= lt!292517 (_2!8762 (moveBitIndex!0 (_2!8763 lt!291706) (bvsub lt!291702 lt!291693))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7792 (_ BitVec 64)) Bool)

(assert (=> d!65007 (moveBitIndexPrecond!0 (_2!8763 lt!291706) (bvsub lt!291702 lt!291693))))

(assert (=> d!65007 (= (withMovedBitIndex!0 (_2!8763 lt!291706) (bvsub lt!291702 lt!291693)) lt!292517)))

(declare-fun b!188377 () Bool)

(assert (=> b!188377 (= e!130151 (= (size!4342 (buf!4813 (_2!8763 lt!291706))) (size!4342 (buf!4813 lt!292517))))))

(assert (= (and d!65007 res!156928) b!188377))

(declare-fun m!293031 () Bool)

(assert (=> d!65007 m!293031))

(declare-fun m!293033 () Bool)

(assert (=> d!65007 m!293033))

(declare-fun m!293035 () Bool)

(assert (=> d!65007 m!293035))

(declare-fun m!293037 () Bool)

(assert (=> d!65007 m!293037))

(assert (=> b!188006 d!65007))

(declare-fun d!65009 () Bool)

(declare-fun e!130152 () Bool)

(assert (=> d!65009 e!130152))

(declare-fun res!156930 () Bool)

(assert (=> d!65009 (=> (not res!156930) (not e!130152))))

(declare-fun lt!292529 () (_ BitVec 64))

(declare-fun lt!292530 () (_ BitVec 64))

(declare-fun lt!292528 () (_ BitVec 64))

(assert (=> d!65009 (= res!156930 (= lt!292530 (bvsub lt!292529 lt!292528)))))

(assert (=> d!65009 (or (= (bvand lt!292529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292529 lt!292528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65009 (= lt!292528 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291714)))) ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291714))) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291714)))))))

(declare-fun lt!292525 () (_ BitVec 64))

(declare-fun lt!292526 () (_ BitVec 64))

(assert (=> d!65009 (= lt!292529 (bvmul lt!292525 lt!292526))))

(assert (=> d!65009 (or (= lt!292525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292526 (bvsdiv (bvmul lt!292525 lt!292526) lt!292525)))))

(assert (=> d!65009 (= lt!292526 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65009 (= lt!292525 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291714)))))))

(assert (=> d!65009 (= lt!292530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291714)))))))

(assert (=> d!65009 (invariant!0 (currentBit!9074 (_1!8761 lt!291714)) (currentByte!9079 (_1!8761 lt!291714)) (size!4342 (buf!4813 (_1!8761 lt!291714))))))

(assert (=> d!65009 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291714))) (currentByte!9079 (_1!8761 lt!291714)) (currentBit!9074 (_1!8761 lt!291714))) lt!292530)))

(declare-fun b!188378 () Bool)

(declare-fun res!156929 () Bool)

(assert (=> b!188378 (=> (not res!156929) (not e!130152))))

(assert (=> b!188378 (= res!156929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292530))))

(declare-fun b!188379 () Bool)

(declare-fun lt!292527 () (_ BitVec 64))

(assert (=> b!188379 (= e!130152 (bvsle lt!292530 (bvmul lt!292527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188379 (or (= lt!292527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292527)))))

(assert (=> b!188379 (= lt!292527 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291714)))))))

(assert (= (and d!65009 res!156930) b!188378))

(assert (= (and b!188378 res!156929) b!188379))

(declare-fun m!293039 () Bool)

(assert (=> d!65009 m!293039))

(declare-fun m!293041 () Bool)

(assert (=> d!65009 m!293041))

(assert (=> b!187992 d!65009))

(declare-fun d!65011 () Bool)

(declare-fun res!156935 () Bool)

(declare-fun e!130155 () Bool)

(assert (=> d!65011 (=> (not res!156935) (not e!130155))))

(assert (=> d!65011 (= res!156935 (= (size!4342 (buf!4813 thiss!1204)) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (=> d!65011 (= (isPrefixOf!0 thiss!1204 (_2!8762 lt!291690)) e!130155)))

(declare-fun b!188382 () Bool)

(declare-fun res!156933 () Bool)

(assert (=> b!188382 (=> (not res!156933) (not e!130155))))

(assert (=> b!188382 (= res!156933 (bvsle (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690)))))))

(declare-fun b!188383 () Bool)

(declare-fun e!130156 () Bool)

(assert (=> b!188383 (= e!130155 e!130156)))

(declare-fun res!156934 () Bool)

(assert (=> b!188383 (=> res!156934 e!130156)))

(assert (=> b!188383 (= res!156934 (= (size!4342 (buf!4813 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188384 () Bool)

(assert (=> b!188384 (= e!130156 (arrayBitRangesEq!0 (buf!4813 thiss!1204) (buf!4813 (_2!8762 lt!291690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))))))

(assert (= (and d!65011 res!156935) b!188382))

(assert (= (and b!188382 res!156933) b!188383))

(assert (= (and b!188383 (not res!156934)) b!188384))

(assert (=> b!188382 m!292421))

(assert (=> b!188382 m!292419))

(assert (=> b!188384 m!292421))

(assert (=> b!188384 m!292421))

(declare-fun m!293043 () Bool)

(assert (=> b!188384 m!293043))

(assert (=> b!188004 d!65011))

(declare-fun d!65013 () Bool)

(declare-datatypes ((tuple2!16260 0))(
  ( (tuple2!16261 (_1!8775 Bool) (_2!8775 BitStream!7792)) )
))
(declare-fun lt!292557 () tuple2!16260)

(declare-fun readBit!0 (BitStream!7792) tuple2!16260)

(assert (=> d!65013 (= lt!292557 (readBit!0 (readerFrom!0 (_2!8762 lt!291690) (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204))))))

(assert (=> d!65013 (= (readBitPure!0 (readerFrom!0 (_2!8762 lt!291690) (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204))) (tuple2!16233 (_2!8775 lt!292557) (_1!8775 lt!292557)))))

(declare-fun bs!16150 () Bool)

(assert (= bs!16150 d!65013))

(assert (=> bs!16150 m!292425))

(declare-fun m!293045 () Bool)

(assert (=> bs!16150 m!293045))

(assert (=> b!188011 d!65013))

(declare-fun d!65015 () Bool)

(declare-fun e!130161 () Bool)

(assert (=> d!65015 e!130161))

(declare-fun res!156939 () Bool)

(assert (=> d!65015 (=> (not res!156939) (not e!130161))))

(assert (=> d!65015 (= res!156939 (invariant!0 (currentBit!9074 (_2!8762 lt!291690)) (currentByte!9079 (_2!8762 lt!291690)) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (=> d!65015 (= (readerFrom!0 (_2!8762 lt!291690) (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204)) (BitStream!7793 (buf!4813 (_2!8762 lt!291690)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(declare-fun b!188391 () Bool)

(assert (=> b!188391 (= e!130161 (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291690)))))))

(assert (= (and d!65015 res!156939) b!188391))

(assert (=> d!65015 m!293015))

(assert (=> b!188391 m!292447))

(assert (=> b!188011 d!65015))

(declare-fun d!65017 () Bool)

(declare-fun lt!292636 () tuple2!16238)

(declare-fun lt!292632 () tuple2!16238)

(assert (=> d!65017 (and (= (_2!8764 lt!292636) (_2!8764 lt!292632)) (= (_1!8764 lt!292636) (_1!8764 lt!292632)))))

(declare-fun lt!292635 () Bool)

(declare-fun lt!292633 () (_ BitVec 64))

(declare-fun lt!292637 () BitStream!7792)

(declare-fun lt!292634 () Unit!13444)

(declare-fun choose!56 (BitStream!7792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16238 tuple2!16238 BitStream!7792 (_ BitVec 64) Bool BitStream!7792 (_ BitVec 64) tuple2!16238 tuple2!16238 BitStream!7792 (_ BitVec 64)) Unit!13444)

(assert (=> d!65017 (= lt!292634 (choose!56 (_1!8763 lt!291706) nBits!348 i!590 lt!291699 lt!292636 (tuple2!16239 (_1!8764 lt!292636) (_2!8764 lt!292636)) (_1!8764 lt!292636) (_2!8764 lt!292636) lt!292635 lt!292637 lt!292633 lt!292632 (tuple2!16239 (_1!8764 lt!292632) (_2!8764 lt!292632)) (_1!8764 lt!292632) (_2!8764 lt!292632)))))

(assert (=> d!65017 (= lt!292632 (readNBitsLSBFirstsLoopPure!0 lt!292637 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!292633))))

(assert (=> d!65017 (= lt!292633 (bvor lt!291699 (ite lt!292635 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65017 (= lt!292637 (withMovedBitIndex!0 (_1!8763 lt!291706) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65017 (= lt!292635 (_2!8761 (readBitPure!0 (_1!8763 lt!291706))))))

(assert (=> d!65017 (= lt!292636 (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699))))

(assert (=> d!65017 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699) lt!292634)))

(declare-fun bs!16152 () Bool)

(assert (= bs!16152 d!65017))

(assert (=> bs!16152 m!292463))

(declare-fun m!293047 () Bool)

(assert (=> bs!16152 m!293047))

(assert (=> bs!16152 m!292439))

(assert (=> bs!16152 m!292441))

(declare-fun m!293049 () Bool)

(assert (=> bs!16152 m!293049))

(assert (=> b!188000 d!65017))

(declare-fun d!65019 () Bool)

(declare-datatypes ((tuple2!16262 0))(
  ( (tuple2!16263 (_1!8776 (_ BitVec 64)) (_2!8776 BitStream!7792)) )
))
(declare-fun lt!292640 () tuple2!16262)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16262)

(assert (=> d!65019 (= lt!292640 (readNBitsLSBFirstsLoop!0 lt!291704 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718))))

(assert (=> d!65019 (= (readNBitsLSBFirstsLoopPure!0 lt!291704 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718) (tuple2!16239 (_2!8776 lt!292640) (_1!8776 lt!292640)))))

(declare-fun bs!16153 () Bool)

(assert (= bs!16153 d!65019))

(declare-fun m!293051 () Bool)

(assert (=> bs!16153 m!293051))

(assert (=> b!188000 d!65019))

(declare-fun d!65021 () Bool)

(declare-fun e!130170 () Bool)

(assert (=> d!65021 e!130170))

(declare-fun res!156954 () Bool)

(assert (=> d!65021 (=> (not res!156954) (not e!130170))))

(declare-fun lt!292642 () (_ BitVec 64))

(declare-fun lt!292641 () BitStream!7792)

(assert (=> d!65021 (= res!156954 (= (bvadd lt!292642 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4342 (buf!4813 lt!292641)) (currentByte!9079 lt!292641) (currentBit!9074 lt!292641))))))

(assert (=> d!65021 (or (not (= (bvand lt!292642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292642 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65021 (= lt!292642 (bitIndex!0 (size!4342 (buf!4813 (_1!8763 lt!291706))) (currentByte!9079 (_1!8763 lt!291706)) (currentBit!9074 (_1!8763 lt!291706))))))

(assert (=> d!65021 (= lt!292641 (_2!8762 (moveBitIndex!0 (_1!8763 lt!291706) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65021 (moveBitIndexPrecond!0 (_1!8763 lt!291706) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65021 (= (withMovedBitIndex!0 (_1!8763 lt!291706) #b0000000000000000000000000000000000000000000000000000000000000001) lt!292641)))

(declare-fun b!188406 () Bool)

(assert (=> b!188406 (= e!130170 (= (size!4342 (buf!4813 (_1!8763 lt!291706))) (size!4342 (buf!4813 lt!292641))))))

(assert (= (and d!65021 res!156954) b!188406))

(declare-fun m!293053 () Bool)

(assert (=> d!65021 m!293053))

(declare-fun m!293055 () Bool)

(assert (=> d!65021 m!293055))

(declare-fun m!293057 () Bool)

(assert (=> d!65021 m!293057))

(declare-fun m!293059 () Bool)

(assert (=> d!65021 m!293059))

(assert (=> b!188000 d!65021))

(declare-fun d!65023 () Bool)

(declare-fun res!156957 () Bool)

(declare-fun e!130171 () Bool)

(assert (=> d!65023 (=> (not res!156957) (not e!130171))))

(assert (=> d!65023 (= res!156957 (= (size!4342 (buf!4813 (_2!8762 lt!291690))) (size!4342 (buf!4813 (_2!8762 lt!291708)))))))

(assert (=> d!65023 (= (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!291708)) e!130171)))

(declare-fun b!188407 () Bool)

(declare-fun res!156955 () Bool)

(assert (=> b!188407 (=> (not res!156955) (not e!130171))))

(assert (=> b!188407 (= res!156955 (bvsle (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))) (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708)))))))

(declare-fun b!188408 () Bool)

(declare-fun e!130172 () Bool)

(assert (=> b!188408 (= e!130171 e!130172)))

(declare-fun res!156956 () Bool)

(assert (=> b!188408 (=> res!156956 e!130172)))

(assert (=> b!188408 (= res!156956 (= (size!4342 (buf!4813 (_2!8762 lt!291690))) #b00000000000000000000000000000000))))

(declare-fun b!188409 () Bool)

(assert (=> b!188409 (= e!130172 (arrayBitRangesEq!0 (buf!4813 (_2!8762 lt!291690)) (buf!4813 (_2!8762 lt!291708)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690)))))))

(assert (= (and d!65023 res!156957) b!188407))

(assert (= (and b!188407 res!156955) b!188408))

(assert (= (and b!188408 (not res!156956)) b!188409))

(assert (=> b!188407 m!292419))

(assert (=> b!188407 m!292479))

(assert (=> b!188409 m!292419))

(assert (=> b!188409 m!292419))

(declare-fun m!293061 () Bool)

(assert (=> b!188409 m!293061))

(assert (=> b!188010 d!65023))

(declare-fun d!65025 () Bool)

(assert (=> d!65025 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 thiss!1204))))))

(declare-fun bs!16154 () Bool)

(assert (= bs!16154 d!65025))

(assert (=> bs!16154 m!292489))

(assert (=> start!40856 d!65025))

(declare-fun d!65027 () Bool)

(assert (=> d!65027 (= (array_inv!4083 (buf!4813 thiss!1204)) (bvsge (size!4342 (buf!4813 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!187991 d!65027))

(declare-fun d!65029 () Bool)

(declare-fun e!130173 () Bool)

(assert (=> d!65029 e!130173))

(declare-fun res!156958 () Bool)

(assert (=> d!65029 (=> (not res!156958) (not e!130173))))

(declare-fun lt!292644 () (_ BitVec 64))

(declare-fun lt!292643 () BitStream!7792)

(assert (=> d!65029 (= res!156958 (= (bvadd lt!292644 (bvsub lt!291709 lt!291693)) (bitIndex!0 (size!4342 (buf!4813 lt!292643)) (currentByte!9079 lt!292643) (currentBit!9074 lt!292643))))))

(assert (=> d!65029 (or (not (= (bvand lt!292644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291709 lt!291693) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292644 (bvsub lt!291709 lt!291693)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65029 (= lt!292644 (bitIndex!0 (size!4342 (buf!4813 (_2!8763 lt!291715))) (currentByte!9079 (_2!8763 lt!291715)) (currentBit!9074 (_2!8763 lt!291715))))))

(assert (=> d!65029 (= lt!292643 (_2!8762 (moveBitIndex!0 (_2!8763 lt!291715) (bvsub lt!291709 lt!291693))))))

(assert (=> d!65029 (moveBitIndexPrecond!0 (_2!8763 lt!291715) (bvsub lt!291709 lt!291693))))

(assert (=> d!65029 (= (withMovedBitIndex!0 (_2!8763 lt!291715) (bvsub lt!291709 lt!291693)) lt!292643)))

(declare-fun b!188410 () Bool)

(assert (=> b!188410 (= e!130173 (= (size!4342 (buf!4813 (_2!8763 lt!291715))) (size!4342 (buf!4813 lt!292643))))))

(assert (= (and d!65029 res!156958) b!188410))

(declare-fun m!293063 () Bool)

(assert (=> d!65029 m!293063))

(declare-fun m!293065 () Bool)

(assert (=> d!65029 m!293065))

(declare-fun m!293067 () Bool)

(assert (=> d!65029 m!293067))

(declare-fun m!293069 () Bool)

(assert (=> d!65029 m!293069))

(assert (=> b!188001 d!65029))

(declare-fun d!65031 () Bool)

(assert (=> d!65031 (= (invariant!0 (currentBit!9074 (_2!8762 lt!291708)) (currentByte!9079 (_2!8762 lt!291708)) (size!4342 (buf!4813 (_2!8762 lt!291708)))) (and (bvsge (currentBit!9074 (_2!8762 lt!291708)) #b00000000000000000000000000000000) (bvslt (currentBit!9074 (_2!8762 lt!291708)) #b00000000000000000000000000001000) (bvsge (currentByte!9079 (_2!8762 lt!291708)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9079 (_2!8762 lt!291708)) (size!4342 (buf!4813 (_2!8762 lt!291708)))) (and (= (currentBit!9074 (_2!8762 lt!291708)) #b00000000000000000000000000000000) (= (currentByte!9079 (_2!8762 lt!291708)) (size!4342 (buf!4813 (_2!8762 lt!291708))))))))))

(assert (=> b!188008 d!65031))

(declare-fun d!65033 () Bool)

(assert (=> d!65033 (= (invariant!0 (currentBit!9074 (_2!8763 lt!291706)) (currentByte!9079 (_2!8763 lt!291706)) (size!4342 (buf!4813 (_2!8763 lt!291706)))) (and (bvsge (currentBit!9074 (_2!8763 lt!291706)) #b00000000000000000000000000000000) (bvslt (currentBit!9074 (_2!8763 lt!291706)) #b00000000000000000000000000001000) (bvsge (currentByte!9079 (_2!8763 lt!291706)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9079 (_2!8763 lt!291706)) (size!4342 (buf!4813 (_2!8763 lt!291706)))) (and (= (currentBit!9074 (_2!8763 lt!291706)) #b00000000000000000000000000000000) (= (currentByte!9079 (_2!8763 lt!291706)) (size!4342 (buf!4813 (_2!8763 lt!291706))))))))))

(assert (=> b!187997 d!65033))

(declare-fun d!65035 () Bool)

(assert (=> d!65035 (= (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291708)))) (and (bvsge (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9074 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9079 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291708)))) (and (= (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291708))))))))))

(assert (=> b!187999 d!65035))

(assert (=> b!188009 d!65011))

(declare-fun d!65037 () Bool)

(declare-fun e!130185 () Bool)

(assert (=> d!65037 e!130185))

(declare-fun res!156973 () Bool)

(assert (=> d!65037 (=> (not res!156973) (not e!130185))))

(declare-fun lt!292711 () tuple2!16232)

(declare-fun lt!292709 () tuple2!16232)

(assert (=> d!65037 (= res!156973 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292711))) (currentByte!9079 (_1!8761 lt!292711)) (currentBit!9074 (_1!8761 lt!292711))) (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!292709))) (currentByte!9079 (_1!8761 lt!292709)) (currentBit!9074 (_1!8761 lt!292709)))))))

(declare-fun lt!292712 () BitStream!7792)

(declare-fun lt!292710 () Unit!13444)

(declare-fun choose!50 (BitStream!7792 BitStream!7792 BitStream!7792 tuple2!16232 tuple2!16232 BitStream!7792 Bool tuple2!16232 tuple2!16232 BitStream!7792 Bool) Unit!13444)

(assert (=> d!65037 (= lt!292710 (choose!50 lt!291717 (_2!8762 lt!291708) lt!292712 lt!292711 (tuple2!16233 (_1!8761 lt!292711) (_2!8761 lt!292711)) (_1!8761 lt!292711) (_2!8761 lt!292711) lt!292709 (tuple2!16233 (_1!8761 lt!292709) (_2!8761 lt!292709)) (_1!8761 lt!292709) (_2!8761 lt!292709)))))

(assert (=> d!65037 (= lt!292709 (readBitPure!0 lt!292712))))

(assert (=> d!65037 (= lt!292711 (readBitPure!0 lt!291717))))

(assert (=> d!65037 (= lt!292712 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 lt!291717) (currentBit!9074 lt!291717)))))

(assert (=> d!65037 (invariant!0 (currentBit!9074 lt!291717) (currentByte!9079 lt!291717) (size!4342 (buf!4813 (_2!8762 lt!291708))))))

(assert (=> d!65037 (= (readBitPrefixLemma!0 lt!291717 (_2!8762 lt!291708)) lt!292710)))

(declare-fun b!188429 () Bool)

(assert (=> b!188429 (= e!130185 (= (_2!8761 lt!292711) (_2!8761 lt!292709)))))

(assert (= (and d!65037 res!156973) b!188429))

(assert (=> d!65037 m!292457))

(declare-fun m!293165 () Bool)

(assert (=> d!65037 m!293165))

(declare-fun m!293167 () Bool)

(assert (=> d!65037 m!293167))

(declare-fun m!293169 () Bool)

(assert (=> d!65037 m!293169))

(declare-fun m!293171 () Bool)

(assert (=> d!65037 m!293171))

(declare-fun m!293173 () Bool)

(assert (=> d!65037 m!293173))

(assert (=> b!187998 d!65037))

(declare-fun d!65041 () Bool)

(assert (=> d!65041 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!291712) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690)))) lt!291712))))

(declare-fun bs!16155 () Bool)

(assert (= bs!16155 d!65041))

(declare-fun m!293175 () Bool)

(assert (=> bs!16155 m!293175))

(assert (=> b!187998 d!65041))

(declare-fun d!65043 () Bool)

(assert (=> d!65043 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)) lt!291695)))

(declare-fun lt!292718 () Unit!13444)

(declare-fun choose!9 (BitStream!7792 array!9851 (_ BitVec 64) BitStream!7792) Unit!13444)

(assert (=> d!65043 (= lt!292718 (choose!9 thiss!1204 (buf!4813 (_2!8762 lt!291708)) lt!291695 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))))))

(assert (=> d!65043 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4813 (_2!8762 lt!291708)) lt!291695) lt!292718)))

(declare-fun bs!16157 () Bool)

(assert (= bs!16157 d!65043))

(assert (=> bs!16157 m!292453))

(declare-fun m!293179 () Bool)

(assert (=> bs!16157 m!293179))

(assert (=> b!187998 d!65043))

(declare-fun d!65049 () Bool)

(assert (=> d!65049 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!187998 d!65049))

(declare-fun d!65053 () Bool)

(declare-fun e!130186 () Bool)

(assert (=> d!65053 e!130186))

(declare-fun res!156975 () Bool)

(assert (=> d!65053 (=> (not res!156975) (not e!130186))))

(declare-fun lt!292722 () (_ BitVec 64))

(declare-fun lt!292723 () (_ BitVec 64))

(declare-fun lt!292724 () (_ BitVec 64))

(assert (=> d!65053 (= res!156975 (= lt!292724 (bvsub lt!292723 lt!292722)))))

(assert (=> d!65053 (or (= (bvand lt!292723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292723 lt!292722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65053 (= lt!292722 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291711)))) ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291711))) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291711)))))))

(declare-fun lt!292719 () (_ BitVec 64))

(declare-fun lt!292720 () (_ BitVec 64))

(assert (=> d!65053 (= lt!292723 (bvmul lt!292719 lt!292720))))

(assert (=> d!65053 (or (= lt!292719 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292720 (bvsdiv (bvmul lt!292719 lt!292720) lt!292719)))))

(assert (=> d!65053 (= lt!292720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65053 (= lt!292719 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291711)))))))

(assert (=> d!65053 (= lt!292724 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291711))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291711)))))))

(assert (=> d!65053 (invariant!0 (currentBit!9074 (_1!8761 lt!291711)) (currentByte!9079 (_1!8761 lt!291711)) (size!4342 (buf!4813 (_1!8761 lt!291711))))))

(assert (=> d!65053 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291711))) (currentByte!9079 (_1!8761 lt!291711)) (currentBit!9074 (_1!8761 lt!291711))) lt!292724)))

(declare-fun b!188430 () Bool)

(declare-fun res!156974 () Bool)

(assert (=> b!188430 (=> (not res!156974) (not e!130186))))

(assert (=> b!188430 (= res!156974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292724))))

(declare-fun b!188431 () Bool)

(declare-fun lt!292721 () (_ BitVec 64))

(assert (=> b!188431 (= e!130186 (bvsle lt!292724 (bvmul lt!292721 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188431 (or (= lt!292721 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292721 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292721)))))

(assert (=> b!188431 (= lt!292721 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291711)))))))

(assert (= (and d!65053 res!156975) b!188430))

(assert (= (and b!188430 res!156974) b!188431))

(declare-fun m!293183 () Bool)

(assert (=> d!65053 m!293183))

(declare-fun m!293185 () Bool)

(assert (=> d!65053 m!293185))

(assert (=> b!187998 d!65053))

(declare-fun d!65055 () Bool)

(declare-fun lt!292725 () tuple2!16260)

(assert (=> d!65055 (= lt!292725 (readBit!0 lt!291717))))

(assert (=> d!65055 (= (readBitPure!0 lt!291717) (tuple2!16233 (_2!8775 lt!292725) (_1!8775 lt!292725)))))

(declare-fun bs!16159 () Bool)

(assert (= bs!16159 d!65055))

(declare-fun m!293187 () Bool)

(assert (=> bs!16159 m!293187))

(assert (=> b!187998 d!65055))

(declare-fun d!65057 () Bool)

(declare-fun lt!292726 () tuple2!16260)

(assert (=> d!65057 (= lt!292726 (readBit!0 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))))))

(assert (=> d!65057 (= (readBitPure!0 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204))) (tuple2!16233 (_2!8775 lt!292726) (_1!8775 lt!292726)))))

(declare-fun bs!16160 () Bool)

(assert (= bs!16160 d!65057))

(declare-fun m!293189 () Bool)

(assert (=> bs!16160 m!293189))

(assert (=> b!187998 d!65057))

(declare-fun lt!292727 () tuple2!16262)

(declare-fun d!65059 () Bool)

(assert (=> d!65059 (= lt!292727 (readNBitsLSBFirstsLoop!0 (_1!8763 lt!291715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718))))

(assert (=> d!65059 (= (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!291715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291718) (tuple2!16239 (_2!8776 lt!292727) (_1!8776 lt!292727)))))

(declare-fun bs!16161 () Bool)

(assert (= bs!16161 d!65059))

(declare-fun m!293191 () Bool)

(assert (=> bs!16161 m!293191))

(assert (=> b!187998 d!65059))

(declare-fun b!188452 () Bool)

(declare-fun res!156990 () Bool)

(declare-fun e!130195 () Bool)

(assert (=> b!188452 (=> (not res!156990) (not e!130195))))

(declare-fun lt!292814 () tuple2!16236)

(assert (=> b!188452 (= res!156990 (isPrefixOf!0 (_2!8763 lt!292814) (_2!8762 lt!291708)))))

(declare-fun d!65061 () Bool)

(assert (=> d!65061 e!130195))

(declare-fun res!156988 () Bool)

(assert (=> d!65061 (=> (not res!156988) (not e!130195))))

(assert (=> d!65061 (= res!156988 (isPrefixOf!0 (_1!8763 lt!292814) (_2!8763 lt!292814)))))

(declare-fun lt!292818 () BitStream!7792)

(assert (=> d!65061 (= lt!292814 (tuple2!16237 lt!292818 (_2!8762 lt!291708)))))

(declare-fun lt!292819 () Unit!13444)

(declare-fun lt!292828 () Unit!13444)

(assert (=> d!65061 (= lt!292819 lt!292828)))

(assert (=> d!65061 (isPrefixOf!0 lt!292818 (_2!8762 lt!291708))))

(assert (=> d!65061 (= lt!292828 (lemmaIsPrefixTransitive!0 lt!292818 (_2!8762 lt!291708) (_2!8762 lt!291708)))))

(declare-fun lt!292830 () Unit!13444)

(declare-fun lt!292811 () Unit!13444)

(assert (=> d!65061 (= lt!292830 lt!292811)))

(assert (=> d!65061 (isPrefixOf!0 lt!292818 (_2!8762 lt!291708))))

(assert (=> d!65061 (= lt!292811 (lemmaIsPrefixTransitive!0 lt!292818 (_2!8762 lt!291690) (_2!8762 lt!291708)))))

(declare-fun lt!292813 () Unit!13444)

(declare-fun e!130196 () Unit!13444)

(assert (=> d!65061 (= lt!292813 e!130196)))

(declare-fun c!9616 () Bool)

(assert (=> d!65061 (= c!9616 (not (= (size!4342 (buf!4813 (_2!8762 lt!291690))) #b00000000000000000000000000000000)))))

(declare-fun lt!292817 () Unit!13444)

(declare-fun lt!292825 () Unit!13444)

(assert (=> d!65061 (= lt!292817 lt!292825)))

(assert (=> d!65061 (isPrefixOf!0 (_2!8762 lt!291708) (_2!8762 lt!291708))))

(assert (=> d!65061 (= lt!292825 (lemmaIsPrefixRefl!0 (_2!8762 lt!291708)))))

(declare-fun lt!292824 () Unit!13444)

(declare-fun lt!292816 () Unit!13444)

(assert (=> d!65061 (= lt!292824 lt!292816)))

(assert (=> d!65061 (= lt!292816 (lemmaIsPrefixRefl!0 (_2!8762 lt!291708)))))

(declare-fun lt!292829 () Unit!13444)

(declare-fun lt!292827 () Unit!13444)

(assert (=> d!65061 (= lt!292829 lt!292827)))

(assert (=> d!65061 (isPrefixOf!0 lt!292818 lt!292818)))

(assert (=> d!65061 (= lt!292827 (lemmaIsPrefixRefl!0 lt!292818))))

(declare-fun lt!292821 () Unit!13444)

(declare-fun lt!292820 () Unit!13444)

(assert (=> d!65061 (= lt!292821 lt!292820)))

(assert (=> d!65061 (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!291690))))

(assert (=> d!65061 (= lt!292820 (lemmaIsPrefixRefl!0 (_2!8762 lt!291690)))))

(assert (=> d!65061 (= lt!292818 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(assert (=> d!65061 (isPrefixOf!0 (_2!8762 lt!291690) (_2!8762 lt!291708))))

(assert (=> d!65061 (= (reader!0 (_2!8762 lt!291690) (_2!8762 lt!291708)) lt!292814)))

(declare-fun b!188453 () Bool)

(declare-fun res!156989 () Bool)

(assert (=> b!188453 (=> (not res!156989) (not e!130195))))

(assert (=> b!188453 (= res!156989 (isPrefixOf!0 (_1!8763 lt!292814) (_2!8762 lt!291690)))))

(declare-fun b!188454 () Bool)

(declare-fun Unit!13485 () Unit!13444)

(assert (=> b!188454 (= e!130196 Unit!13485)))

(declare-fun b!188455 () Bool)

(declare-fun lt!292812 () Unit!13444)

(assert (=> b!188455 (= e!130196 lt!292812)))

(declare-fun lt!292826 () (_ BitVec 64))

(assert (=> b!188455 (= lt!292826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292823 () (_ BitVec 64))

(assert (=> b!188455 (= lt!292823 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9851 array!9851 (_ BitVec 64) (_ BitVec 64)) Unit!13444)

(assert (=> b!188455 (= lt!292812 (arrayBitRangesEqSymmetric!0 (buf!4813 (_2!8762 lt!291690)) (buf!4813 (_2!8762 lt!291708)) lt!292826 lt!292823))))

(assert (=> b!188455 (arrayBitRangesEq!0 (buf!4813 (_2!8762 lt!291708)) (buf!4813 (_2!8762 lt!291690)) lt!292826 lt!292823)))

(declare-fun lt!292815 () (_ BitVec 64))

(declare-fun b!188456 () Bool)

(declare-fun lt!292822 () (_ BitVec 64))

(assert (=> b!188456 (= e!130195 (= (_1!8763 lt!292814) (withMovedBitIndex!0 (_2!8763 lt!292814) (bvsub lt!292822 lt!292815))))))

(assert (=> b!188456 (or (= (bvand lt!292822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292822 lt!292815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188456 (= lt!292815 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708))))))

(assert (=> b!188456 (= lt!292822 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291690))) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690))))))

(assert (= (and d!65061 c!9616) b!188455))

(assert (= (and d!65061 (not c!9616)) b!188454))

(assert (= (and d!65061 res!156988) b!188453))

(assert (= (and b!188453 res!156989) b!188452))

(assert (= (and b!188452 res!156990) b!188456))

(declare-fun m!293195 () Bool)

(assert (=> b!188452 m!293195))

(declare-fun m!293197 () Bool)

(assert (=> d!65061 m!293197))

(declare-fun m!293199 () Bool)

(assert (=> d!65061 m!293199))

(assert (=> d!65061 m!292429))

(declare-fun m!293201 () Bool)

(assert (=> d!65061 m!293201))

(assert (=> d!65061 m!292923))

(declare-fun m!293203 () Bool)

(assert (=> d!65061 m!293203))

(declare-fun m!293205 () Bool)

(assert (=> d!65061 m!293205))

(declare-fun m!293207 () Bool)

(assert (=> d!65061 m!293207))

(declare-fun m!293209 () Bool)

(assert (=> d!65061 m!293209))

(declare-fun m!293211 () Bool)

(assert (=> d!65061 m!293211))

(declare-fun m!293213 () Bool)

(assert (=> d!65061 m!293213))

(declare-fun m!293215 () Bool)

(assert (=> b!188456 m!293215))

(assert (=> b!188456 m!292479))

(assert (=> b!188456 m!292419))

(declare-fun m!293217 () Bool)

(assert (=> b!188453 m!293217))

(assert (=> b!188455 m!292419))

(declare-fun m!293219 () Bool)

(assert (=> b!188455 m!293219))

(declare-fun m!293221 () Bool)

(assert (=> b!188455 m!293221))

(assert (=> b!187998 d!65061))

(declare-fun d!65065 () Bool)

(declare-fun e!130199 () Bool)

(assert (=> d!65065 e!130199))

(declare-fun res!156995 () Bool)

(assert (=> d!65065 (=> (not res!156995) (not e!130199))))

(declare-fun lt!292855 () (_ BitVec 64))

(declare-fun lt!292854 () (_ BitVec 64))

(declare-fun lt!292856 () (_ BitVec 64))

(assert (=> d!65065 (= res!156995 (= lt!292856 (bvsub lt!292855 lt!292854)))))

(assert (=> d!65065 (or (= (bvand lt!292855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292855 lt!292854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65065 (= lt!292854 (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291697)))) ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291697))) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291697)))))))

(declare-fun lt!292851 () (_ BitVec 64))

(declare-fun lt!292852 () (_ BitVec 64))

(assert (=> d!65065 (= lt!292855 (bvmul lt!292851 lt!292852))))

(assert (=> d!65065 (or (= lt!292851 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292852 (bvsdiv (bvmul lt!292851 lt!292852) lt!292851)))))

(assert (=> d!65065 (= lt!292852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65065 (= lt!292851 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291697)))))))

(assert (=> d!65065 (= lt!292856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9079 (_1!8761 lt!291697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9074 (_1!8761 lt!291697)))))))

(assert (=> d!65065 (invariant!0 (currentBit!9074 (_1!8761 lt!291697)) (currentByte!9079 (_1!8761 lt!291697)) (size!4342 (buf!4813 (_1!8761 lt!291697))))))

(assert (=> d!65065 (= (bitIndex!0 (size!4342 (buf!4813 (_1!8761 lt!291697))) (currentByte!9079 (_1!8761 lt!291697)) (currentBit!9074 (_1!8761 lt!291697))) lt!292856)))

(declare-fun b!188462 () Bool)

(declare-fun res!156994 () Bool)

(assert (=> b!188462 (=> (not res!156994) (not e!130199))))

(assert (=> b!188462 (= res!156994 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292856))))

(declare-fun b!188463 () Bool)

(declare-fun lt!292853 () (_ BitVec 64))

(assert (=> b!188463 (= e!130199 (bvsle lt!292856 (bvmul lt!292853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188463 (or (= lt!292853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292853)))))

(assert (=> b!188463 (= lt!292853 ((_ sign_extend 32) (size!4342 (buf!4813 (_1!8761 lt!291697)))))))

(assert (= (and d!65065 res!156995) b!188462))

(assert (= (and b!188462 res!156994) b!188463))

(declare-fun m!293229 () Bool)

(assert (=> d!65065 m!293229))

(declare-fun m!293233 () Bool)

(assert (=> d!65065 m!293233))

(assert (=> b!187998 d!65065))

(declare-fun d!65067 () Bool)

(declare-fun lt!292857 () tuple2!16260)

(assert (=> d!65067 (= lt!292857 (readBit!0 (_1!8763 lt!291706)))))

(assert (=> d!65067 (= (readBitPure!0 (_1!8763 lt!291706)) (tuple2!16233 (_2!8775 lt!292857) (_1!8775 lt!292857)))))

(declare-fun bs!16163 () Bool)

(assert (= bs!16163 d!65067))

(declare-fun m!293249 () Bool)

(assert (=> bs!16163 m!293249))

(assert (=> b!187998 d!65067))

(declare-fun d!65069 () Bool)

(assert (=> d!65069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 (_2!8762 lt!291690))) ((_ sign_extend 32) (currentBit!9074 (_2!8762 lt!291690))) lt!291712)))

(declare-fun lt!292858 () Unit!13444)

(assert (=> d!65069 (= lt!292858 (choose!9 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!291708)) lt!291712 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 (_2!8762 lt!291690)) (currentBit!9074 (_2!8762 lt!291690)))))))

(assert (=> d!65069 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8762 lt!291690) (buf!4813 (_2!8762 lt!291708)) lt!291712) lt!292858)))

(declare-fun bs!16164 () Bool)

(assert (= bs!16164 d!65069))

(assert (=> bs!16164 m!292471))

(declare-fun m!293261 () Bool)

(assert (=> bs!16164 m!293261))

(assert (=> b!187998 d!65069))

(declare-fun d!65075 () Bool)

(assert (=> d!65075 (= (invariant!0 (currentBit!9074 thiss!1204) (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291690)))) (and (bvsge (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9074 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9079 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291690)))) (and (= (currentBit!9074 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9079 thiss!1204) (size!4342 (buf!4813 (_2!8762 lt!291690))))))))))

(assert (=> b!187998 d!65075))

(declare-fun b!188466 () Bool)

(declare-fun res!157000 () Bool)

(declare-fun e!130201 () Bool)

(assert (=> b!188466 (=> (not res!157000) (not e!130201))))

(declare-fun lt!292869 () tuple2!16236)

(assert (=> b!188466 (= res!157000 (isPrefixOf!0 (_2!8763 lt!292869) (_2!8762 lt!291708)))))

(declare-fun d!65077 () Bool)

(assert (=> d!65077 e!130201))

(declare-fun res!156998 () Bool)

(assert (=> d!65077 (=> (not res!156998) (not e!130201))))

(assert (=> d!65077 (= res!156998 (isPrefixOf!0 (_1!8763 lt!292869) (_2!8763 lt!292869)))))

(declare-fun lt!292873 () BitStream!7792)

(assert (=> d!65077 (= lt!292869 (tuple2!16237 lt!292873 (_2!8762 lt!291708)))))

(declare-fun lt!292874 () Unit!13444)

(declare-fun lt!292883 () Unit!13444)

(assert (=> d!65077 (= lt!292874 lt!292883)))

(assert (=> d!65077 (isPrefixOf!0 lt!292873 (_2!8762 lt!291708))))

(assert (=> d!65077 (= lt!292883 (lemmaIsPrefixTransitive!0 lt!292873 (_2!8762 lt!291708) (_2!8762 lt!291708)))))

(declare-fun lt!292885 () Unit!13444)

(declare-fun lt!292866 () Unit!13444)

(assert (=> d!65077 (= lt!292885 lt!292866)))

(assert (=> d!65077 (isPrefixOf!0 lt!292873 (_2!8762 lt!291708))))

(assert (=> d!65077 (= lt!292866 (lemmaIsPrefixTransitive!0 lt!292873 thiss!1204 (_2!8762 lt!291708)))))

(declare-fun lt!292868 () Unit!13444)

(declare-fun e!130202 () Unit!13444)

(assert (=> d!65077 (= lt!292868 e!130202)))

(declare-fun c!9618 () Bool)

(assert (=> d!65077 (= c!9618 (not (= (size!4342 (buf!4813 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!292872 () Unit!13444)

(declare-fun lt!292880 () Unit!13444)

(assert (=> d!65077 (= lt!292872 lt!292880)))

(assert (=> d!65077 (isPrefixOf!0 (_2!8762 lt!291708) (_2!8762 lt!291708))))

(assert (=> d!65077 (= lt!292880 (lemmaIsPrefixRefl!0 (_2!8762 lt!291708)))))

(declare-fun lt!292879 () Unit!13444)

(declare-fun lt!292871 () Unit!13444)

(assert (=> d!65077 (= lt!292879 lt!292871)))

(assert (=> d!65077 (= lt!292871 (lemmaIsPrefixRefl!0 (_2!8762 lt!291708)))))

(declare-fun lt!292884 () Unit!13444)

(declare-fun lt!292882 () Unit!13444)

(assert (=> d!65077 (= lt!292884 lt!292882)))

(assert (=> d!65077 (isPrefixOf!0 lt!292873 lt!292873)))

(assert (=> d!65077 (= lt!292882 (lemmaIsPrefixRefl!0 lt!292873))))

(declare-fun lt!292876 () Unit!13444)

(declare-fun lt!292875 () Unit!13444)

(assert (=> d!65077 (= lt!292876 lt!292875)))

(assert (=> d!65077 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65077 (= lt!292875 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65077 (= lt!292873 (BitStream!7793 (buf!4813 (_2!8762 lt!291708)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(assert (=> d!65077 (isPrefixOf!0 thiss!1204 (_2!8762 lt!291708))))

(assert (=> d!65077 (= (reader!0 thiss!1204 (_2!8762 lt!291708)) lt!292869)))

(declare-fun b!188467 () Bool)

(declare-fun res!156999 () Bool)

(assert (=> b!188467 (=> (not res!156999) (not e!130201))))

(assert (=> b!188467 (= res!156999 (isPrefixOf!0 (_1!8763 lt!292869) thiss!1204))))

(declare-fun b!188468 () Bool)

(declare-fun Unit!13486 () Unit!13444)

(assert (=> b!188468 (= e!130202 Unit!13486)))

(declare-fun b!188469 () Bool)

(declare-fun lt!292867 () Unit!13444)

(assert (=> b!188469 (= e!130202 lt!292867)))

(declare-fun lt!292881 () (_ BitVec 64))

(assert (=> b!188469 (= lt!292881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292878 () (_ BitVec 64))

(assert (=> b!188469 (= lt!292878 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(assert (=> b!188469 (= lt!292867 (arrayBitRangesEqSymmetric!0 (buf!4813 thiss!1204) (buf!4813 (_2!8762 lt!291708)) lt!292881 lt!292878))))

(assert (=> b!188469 (arrayBitRangesEq!0 (buf!4813 (_2!8762 lt!291708)) (buf!4813 thiss!1204) lt!292881 lt!292878)))

(declare-fun lt!292877 () (_ BitVec 64))

(declare-fun b!188470 () Bool)

(declare-fun lt!292870 () (_ BitVec 64))

(assert (=> b!188470 (= e!130201 (= (_1!8763 lt!292869) (withMovedBitIndex!0 (_2!8763 lt!292869) (bvsub lt!292877 lt!292870))))))

(assert (=> b!188470 (or (= (bvand lt!292877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292877 lt!292870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188470 (= lt!292870 (bitIndex!0 (size!4342 (buf!4813 (_2!8762 lt!291708))) (currentByte!9079 (_2!8762 lt!291708)) (currentBit!9074 (_2!8762 lt!291708))))))

(assert (=> b!188470 (= lt!292877 (bitIndex!0 (size!4342 (buf!4813 thiss!1204)) (currentByte!9079 thiss!1204) (currentBit!9074 thiss!1204)))))

(assert (= (and d!65077 c!9618) b!188469))

(assert (= (and d!65077 (not c!9618)) b!188468))

(assert (= (and d!65077 res!156998) b!188467))

(assert (= (and b!188467 res!156999) b!188466))

(assert (= (and b!188466 res!157000) b!188470))

(declare-fun m!293267 () Bool)

(assert (=> b!188466 m!293267))

(declare-fun m!293269 () Bool)

(assert (=> d!65077 m!293269))

(assert (=> d!65077 m!293199))

(assert (=> d!65077 m!292481))

(declare-fun m!293271 () Bool)

(assert (=> d!65077 m!293271))

(declare-fun m!293273 () Bool)

(assert (=> d!65077 m!293273))

(declare-fun m!293275 () Bool)

(assert (=> d!65077 m!293275))

(declare-fun m!293277 () Bool)

(assert (=> d!65077 m!293277))

(declare-fun m!293279 () Bool)

(assert (=> d!65077 m!293279))

(assert (=> d!65077 m!293209))

(declare-fun m!293281 () Bool)

(assert (=> d!65077 m!293281))

(declare-fun m!293283 () Bool)

(assert (=> d!65077 m!293283))

(declare-fun m!293285 () Bool)

(assert (=> b!188470 m!293285))

(assert (=> b!188470 m!292479))

(assert (=> b!188470 m!292421))

(declare-fun m!293287 () Bool)

(assert (=> b!188467 m!293287))

(assert (=> b!188469 m!292421))

(declare-fun m!293289 () Bool)

(assert (=> b!188469 m!293289))

(declare-fun m!293291 () Bool)

(assert (=> b!188469 m!293291))

(assert (=> b!187998 d!65077))

(declare-fun lt!292886 () tuple2!16262)

(declare-fun d!65081 () Bool)

(assert (=> d!65081 (= lt!292886 (readNBitsLSBFirstsLoop!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699))))

(assert (=> d!65081 (= (readNBitsLSBFirstsLoopPure!0 (_1!8763 lt!291706) nBits!348 i!590 lt!291699) (tuple2!16239 (_2!8776 lt!292886) (_1!8776 lt!292886)))))

(declare-fun bs!16166 () Bool)

(assert (= bs!16166 d!65081))

(declare-fun m!293293 () Bool)

(assert (=> bs!16166 m!293293))

(assert (=> b!187998 d!65081))

(declare-fun d!65083 () Bool)

(assert (=> d!65083 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204)) lt!291695) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4342 (buf!4813 (_2!8762 lt!291708)))) ((_ sign_extend 32) (currentByte!9079 thiss!1204)) ((_ sign_extend 32) (currentBit!9074 thiss!1204))) lt!291695))))

(declare-fun bs!16167 () Bool)

(assert (= bs!16167 d!65083))

(declare-fun m!293295 () Bool)

(assert (=> bs!16167 m!293295))

(assert (=> b!187998 d!65083))

(push 1)

(assert (not d!65069))

(assert (not d!65007))

(assert (not b!188330))

(assert (not d!65061))

(assert (not d!64917))

(assert (not d!65055))

(assert (not b!188469))

(assert (not d!64913))

(assert (not b!188360))

(assert (not d!65013))

(assert (not b!188382))

(assert (not b!188331))

(assert (not b!188456))

(assert (not d!65067))

(assert (not b!188467))

(assert (not d!65077))

(assert (not b!188466))

(assert (not d!65043))

(assert (not b!188359))

(assert (not d!65037))

(assert (not b!188455))

(assert (not b!188361))

(assert (not d!65009))

(assert (not d!65029))

(assert (not d!65065))

(assert (not b!188407))

(assert (not d!65021))

(assert (not b!188409))

(assert (not b!188344))

(assert (not b!188362))

(assert (not d!64999))

(assert (not b!188333))

(assert (not b!188337))

(assert (not d!65081))

(assert (not bm!3023))

(assert (not b!188341))

(assert (not d!65057))

(assert (not d!65003))

(assert (not d!65005))

(assert (not b!188470))

(assert (not b!188176))

(assert (not b!188178))

(assert (not d!65059))

(assert (not b!188332))

(assert (not d!64919))

(assert (not b!188384))

(assert (not b!188391))

(assert (not b!188342))

(assert (not b!188335))

(assert (not d!65041))

(assert (not b!188452))

(assert (not d!65083))

(assert (not d!65053))

(assert (not b!188338))

(assert (not b!188453))

(assert (not d!65025))

(assert (not d!65017))

(assert (not d!65015))

(assert (not d!65001))

(assert (not d!65019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

