; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41136 () Bool)

(assert start!41136)

(declare-fun b!190951 () Bool)

(declare-fun e!131705 () Bool)

(declare-fun e!131702 () Bool)

(assert (=> b!190951 (= e!131705 (not e!131702))))

(declare-fun res!159334 () Bool)

(assert (=> b!190951 (=> res!159334 e!131702)))

(declare-fun lt!296733 () (_ BitVec 64))

(declare-fun lt!296725 () (_ BitVec 64))

(assert (=> b!190951 (= res!159334 (not (= lt!296733 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296725))))))

(declare-datatypes ((array!9921 0))(
  ( (array!9922 (arr!5304 (Array (_ BitVec 32) (_ BitVec 8))) (size!4374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7856 0))(
  ( (BitStream!7857 (buf!4851 array!9921) (currentByte!9129 (_ BitVec 32)) (currentBit!9124 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13586 0))(
  ( (Unit!13587) )
))
(declare-datatypes ((tuple2!16512 0))(
  ( (tuple2!16513 (_1!8901 Unit!13586) (_2!8901 BitStream!7856)) )
))
(declare-fun lt!296732 () tuple2!16512)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190951 (= lt!296733 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(declare-fun thiss!1204 () BitStream!7856)

(assert (=> b!190951 (= lt!296725 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(declare-fun e!131709 () Bool)

(assert (=> b!190951 e!131709))

(declare-fun res!159347 () Bool)

(assert (=> b!190951 (=> (not res!159347) (not e!131709))))

(assert (=> b!190951 (= res!159347 (= (size!4374 (buf!4851 thiss!1204)) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(declare-fun lt!296716 () Bool)

(declare-fun appendBit!0 (BitStream!7856 Bool) tuple2!16512)

(assert (=> b!190951 (= lt!296732 (appendBit!0 thiss!1204 lt!296716))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!296713 () (_ BitVec 64))

(assert (=> b!190951 (= lt!296716 (not (= (bvand v!189 lt!296713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!190951 (= lt!296713 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!190952 () Bool)

(declare-fun e!131704 () Bool)

(declare-fun lt!296721 () tuple2!16512)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190952 (= e!131704 (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296721)))))))

(declare-fun b!190953 () Bool)

(declare-fun e!131710 () Bool)

(assert (=> b!190953 (= e!131702 e!131710)))

(declare-fun res!159340 () Bool)

(assert (=> b!190953 (=> res!159340 e!131710)))

(declare-fun lt!296706 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!190953 (= res!159340 (not (= lt!296706 (bvsub (bvsub (bvadd lt!296733 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190953 (= lt!296706 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721))))))

(declare-fun isPrefixOf!0 (BitStream!7856 BitStream!7856) Bool)

(assert (=> b!190953 (isPrefixOf!0 thiss!1204 (_2!8901 lt!296721))))

(declare-fun lt!296727 () Unit!13586)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7856 BitStream!7856 BitStream!7856) Unit!13586)

(assert (=> b!190953 (= lt!296727 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8901 lt!296732) (_2!8901 lt!296721)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7856 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16512)

(assert (=> b!190953 (= lt!296721 (appendBitsLSBFirstLoopTR!0 (_2!8901 lt!296732) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190954 () Bool)

(declare-fun e!131708 () Bool)

(assert (=> b!190954 (= e!131709 e!131708)))

(declare-fun res!159338 () Bool)

(assert (=> b!190954 (=> (not res!159338) (not e!131708))))

(declare-fun lt!296715 () (_ BitVec 64))

(declare-fun lt!296734 () (_ BitVec 64))

(assert (=> b!190954 (= res!159338 (= lt!296715 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296734)))))

(assert (=> b!190954 (= lt!296715 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(assert (=> b!190954 (= lt!296734 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(declare-fun b!190955 () Bool)

(declare-fun e!131713 () Bool)

(declare-fun array_inv!4115 (array!9921) Bool)

(assert (=> b!190955 (= e!131713 (array_inv!4115 (buf!4851 thiss!1204)))))

(declare-fun b!190950 () Bool)

(declare-fun e!131712 () Bool)

(assert (=> b!190950 (= e!131710 e!131712)))

(declare-fun res!159342 () Bool)

(assert (=> b!190950 (=> res!159342 e!131712)))

(declare-datatypes ((tuple2!16514 0))(
  ( (tuple2!16515 (_1!8902 BitStream!7856) (_2!8902 (_ BitVec 64))) )
))
(declare-fun lt!296709 () tuple2!16514)

(declare-datatypes ((tuple2!16516 0))(
  ( (tuple2!16517 (_1!8903 BitStream!7856) (_2!8903 BitStream!7856)) )
))
(declare-fun lt!296728 () tuple2!16516)

(assert (=> b!190950 (= res!159342 (not (= (_1!8902 lt!296709) (_2!8903 lt!296728))))))

(declare-fun lt!296726 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16514)

(assert (=> b!190950 (= lt!296709 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!296728) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726))))

(declare-fun lt!296718 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190950 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!296718)))

(declare-fun lt!296717 () Unit!13586)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7856 array!9921 (_ BitVec 64)) Unit!13586)

(assert (=> b!190950 (= lt!296717 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!296721)) lt!296718))))

(assert (=> b!190950 (= lt!296718 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16518 0))(
  ( (tuple2!16519 (_1!8904 BitStream!7856) (_2!8904 Bool)) )
))
(declare-fun lt!296720 () tuple2!16518)

(declare-fun lt!296710 () (_ BitVec 64))

(assert (=> b!190950 (= lt!296726 (bvor lt!296710 (ite (_2!8904 lt!296720) lt!296713 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!296712 () tuple2!16516)

(declare-fun lt!296714 () tuple2!16514)

(assert (=> b!190950 (= lt!296714 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710))))

(declare-fun lt!296719 () (_ BitVec 64))

(assert (=> b!190950 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)) lt!296719)))

(declare-fun lt!296730 () Unit!13586)

(assert (=> b!190950 (= lt!296730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4851 (_2!8901 lt!296721)) lt!296719))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190950 (= lt!296710 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190950 (= (_2!8904 lt!296720) lt!296716)))

(declare-fun readBitPure!0 (BitStream!7856) tuple2!16518)

(assert (=> b!190950 (= lt!296720 (readBitPure!0 (_1!8903 lt!296712)))))

(declare-fun reader!0 (BitStream!7856 BitStream!7856) tuple2!16516)

(assert (=> b!190950 (= lt!296728 (reader!0 (_2!8901 lt!296732) (_2!8901 lt!296721)))))

(assert (=> b!190950 (= lt!296712 (reader!0 thiss!1204 (_2!8901 lt!296721)))))

(declare-fun e!131707 () Bool)

(assert (=> b!190950 e!131707))

(declare-fun res!159335 () Bool)

(assert (=> b!190950 (=> (not res!159335) (not e!131707))))

(declare-fun lt!296707 () tuple2!16518)

(declare-fun lt!296708 () tuple2!16518)

(assert (=> b!190950 (= res!159335 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296707))) (currentByte!9129 (_1!8904 lt!296707)) (currentBit!9124 (_1!8904 lt!296707))) (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296708))) (currentByte!9129 (_1!8904 lt!296708)) (currentBit!9124 (_1!8904 lt!296708)))))))

(declare-fun lt!296722 () Unit!13586)

(declare-fun lt!296723 () BitStream!7856)

(declare-fun readBitPrefixLemma!0 (BitStream!7856 BitStream!7856) Unit!13586)

(assert (=> b!190950 (= lt!296722 (readBitPrefixLemma!0 lt!296723 (_2!8901 lt!296721)))))

(assert (=> b!190950 (= lt!296708 (readBitPure!0 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))))))

(assert (=> b!190950 (= lt!296707 (readBitPure!0 lt!296723))))

(assert (=> b!190950 e!131704))

(declare-fun res!159346 () Bool)

(assert (=> b!190950 (=> (not res!159346) (not e!131704))))

(assert (=> b!190950 (= res!159346 (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (=> b!190950 (= lt!296723 (BitStream!7857 (buf!4851 (_2!8901 lt!296732)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(declare-fun res!159345 () Bool)

(declare-fun e!131714 () Bool)

(assert (=> start!41136 (=> (not res!159345) (not e!131714))))

(assert (=> start!41136 (= res!159345 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41136 e!131714))

(assert (=> start!41136 true))

(declare-fun inv!12 (BitStream!7856) Bool)

(assert (=> start!41136 (and (inv!12 thiss!1204) e!131713)))

(declare-fun b!190956 () Bool)

(declare-fun e!131700 () Bool)

(assert (=> b!190956 (= e!131708 e!131700)))

(declare-fun res!159329 () Bool)

(assert (=> b!190956 (=> (not res!159329) (not e!131700))))

(declare-fun lt!296731 () tuple2!16518)

(assert (=> b!190956 (= res!159329 (and (= (_2!8904 lt!296731) lt!296716) (= (_1!8904 lt!296731) (_2!8901 lt!296732))))))

(declare-fun readerFrom!0 (BitStream!7856 (_ BitVec 32) (_ BitVec 32)) BitStream!7856)

(assert (=> b!190956 (= lt!296731 (readBitPure!0 (readerFrom!0 (_2!8901 lt!296732) (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204))))))

(declare-fun lt!296724 () BitStream!7856)

(declare-fun e!131703 () Bool)

(declare-fun b!190957 () Bool)

(assert (=> b!190957 (= e!131703 (and (= lt!296725 (bvsub lt!296733 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8903 lt!296728) lt!296724)) (= (_2!8902 lt!296714) (_2!8902 lt!296709)))))))

(declare-fun b!190958 () Bool)

(declare-fun res!159348 () Bool)

(assert (=> b!190958 (=> (not res!159348) (not e!131705))))

(assert (=> b!190958 (= res!159348 (not (= i!590 nBits!348)))))

(declare-fun b!190959 () Bool)

(declare-fun e!131701 () Bool)

(assert (=> b!190959 (= e!131712 e!131701)))

(declare-fun res!159341 () Bool)

(assert (=> b!190959 (=> res!159341 e!131701)))

(assert (=> b!190959 (= res!159341 (not (= (_1!8903 lt!296728) lt!296724)))))

(assert (=> b!190959 e!131703))

(declare-fun res!159337 () Bool)

(assert (=> b!190959 (=> (not res!159337) (not e!131703))))

(declare-fun lt!296729 () tuple2!16514)

(assert (=> b!190959 (= res!159337 (and (= (_2!8902 lt!296714) (_2!8902 lt!296729)) (= (_1!8902 lt!296714) (_1!8902 lt!296729))))))

(declare-fun lt!296711 () Unit!13586)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13586)

(assert (=> b!190959 (= lt!296711 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710))))

(assert (=> b!190959 (= lt!296729 (readNBitsLSBFirstsLoopPure!0 lt!296724 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726))))

(declare-fun withMovedBitIndex!0 (BitStream!7856 (_ BitVec 64)) BitStream!7856)

(assert (=> b!190959 (= lt!296724 (withMovedBitIndex!0 (_1!8903 lt!296712) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190960 () Bool)

(assert (=> b!190960 (= e!131714 e!131705)))

(declare-fun res!159331 () Bool)

(assert (=> b!190960 (=> (not res!159331) (not e!131705))))

(assert (=> b!190960 (= res!159331 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)) lt!296719))))

(assert (=> b!190960 (= lt!296719 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190961 () Bool)

(declare-fun res!159349 () Bool)

(assert (=> b!190961 (=> (not res!159349) (not e!131703))))

(assert (=> b!190961 (= res!159349 (= (_1!8903 lt!296728) (withMovedBitIndex!0 (_2!8903 lt!296728) (bvsub lt!296733 lt!296706))))))

(declare-fun b!190962 () Bool)

(declare-fun res!159339 () Bool)

(assert (=> b!190962 (=> res!159339 e!131710)))

(assert (=> b!190962 (= res!159339 (not (invariant!0 (currentBit!9124 (_2!8901 lt!296721)) (currentByte!9129 (_2!8901 lt!296721)) (size!4374 (buf!4851 (_2!8901 lt!296721))))))))

(declare-fun b!190963 () Bool)

(declare-fun res!159350 () Bool)

(assert (=> b!190963 (=> res!159350 e!131710)))

(assert (=> b!190963 (= res!159350 (not (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!296721))))))

(declare-fun b!190964 () Bool)

(declare-fun res!159336 () Bool)

(assert (=> b!190964 (=> res!159336 e!131701)))

(assert (=> b!190964 (= res!159336 (not (= (bitIndex!0 (size!4374 (buf!4851 (_1!8902 lt!296714))) (currentByte!9129 (_1!8902 lt!296714)) (currentBit!9124 (_1!8902 lt!296714))) (bitIndex!0 (size!4374 (buf!4851 (_2!8903 lt!296712))) (currentByte!9129 (_2!8903 lt!296712)) (currentBit!9124 (_2!8903 lt!296712))))))))

(declare-fun b!190965 () Bool)

(declare-fun res!159344 () Bool)

(assert (=> b!190965 (=> (not res!159344) (not e!131705))))

(assert (=> b!190965 (= res!159344 (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204))))))

(declare-fun b!190966 () Bool)

(declare-fun e!131706 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190966 (= e!131706 (= (bvand lt!296710 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190967 () Bool)

(assert (=> b!190967 (= e!131700 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296731))) (currentByte!9129 (_1!8904 lt!296731)) (currentBit!9124 (_1!8904 lt!296731))) lt!296715))))

(declare-fun b!190968 () Bool)

(assert (=> b!190968 (= e!131707 (= (_2!8904 lt!296707) (_2!8904 lt!296708)))))

(declare-fun b!190969 () Bool)

(declare-fun res!159330 () Bool)

(assert (=> b!190969 (=> (not res!159330) (not e!131708))))

(assert (=> b!190969 (= res!159330 (isPrefixOf!0 thiss!1204 (_2!8901 lt!296732)))))

(declare-fun b!190970 () Bool)

(declare-fun res!159332 () Bool)

(assert (=> b!190970 (=> (not res!159332) (not e!131703))))

(assert (=> b!190970 (= res!159332 (= (_1!8903 lt!296712) (withMovedBitIndex!0 (_2!8903 lt!296712) (bvsub lt!296725 lt!296706))))))

(declare-fun b!190971 () Bool)

(declare-fun res!159343 () Bool)

(assert (=> b!190971 (=> res!159343 e!131710)))

(assert (=> b!190971 (= res!159343 (not (isPrefixOf!0 thiss!1204 (_2!8901 lt!296732))))))

(declare-fun b!190972 () Bool)

(declare-fun res!159333 () Bool)

(assert (=> b!190972 (=> res!159333 e!131710)))

(assert (=> b!190972 (= res!159333 (or (not (= (size!4374 (buf!4851 (_2!8901 lt!296721))) (size!4374 (buf!4851 thiss!1204)))) (not (= lt!296706 (bvsub (bvadd lt!296725 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190973 () Bool)

(assert (=> b!190973 (= e!131701 e!131706)))

(declare-fun res!159351 () Bool)

(assert (=> b!190973 (=> res!159351 e!131706)))

(assert (=> b!190973 (= res!159351 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8903 lt!296712)))) ((_ sign_extend 32) (currentByte!9129 (_1!8903 lt!296712))) ((_ sign_extend 32) (currentBit!9124 (_1!8903 lt!296712))) lt!296719)))))

(assert (=> b!190973 (= (size!4374 (buf!4851 thiss!1204)) (size!4374 (buf!4851 (_2!8901 lt!296721))))))

(assert (= (and start!41136 res!159345) b!190960))

(assert (= (and b!190960 res!159331) b!190965))

(assert (= (and b!190965 res!159344) b!190958))

(assert (= (and b!190958 res!159348) b!190951))

(assert (= (and b!190951 res!159347) b!190954))

(assert (= (and b!190954 res!159338) b!190969))

(assert (= (and b!190969 res!159330) b!190956))

(assert (= (and b!190956 res!159329) b!190967))

(assert (= (and b!190951 (not res!159334)) b!190953))

(assert (= (and b!190953 (not res!159340)) b!190962))

(assert (= (and b!190962 (not res!159339)) b!190972))

(assert (= (and b!190972 (not res!159333)) b!190963))

(assert (= (and b!190963 (not res!159350)) b!190971))

(assert (= (and b!190971 (not res!159343)) b!190950))

(assert (= (and b!190950 res!159346) b!190952))

(assert (= (and b!190950 res!159335) b!190968))

(assert (= (and b!190950 (not res!159342)) b!190959))

(assert (= (and b!190959 res!159337) b!190970))

(assert (= (and b!190970 res!159332) b!190961))

(assert (= (and b!190961 res!159349) b!190957))

(assert (= (and b!190959 (not res!159341)) b!190964))

(assert (= (and b!190964 (not res!159336)) b!190973))

(assert (= (and b!190973 (not res!159351)) b!190966))

(assert (= start!41136 b!190955))

(declare-fun m!296571 () Bool)

(assert (=> b!190953 m!296571))

(declare-fun m!296573 () Bool)

(assert (=> b!190953 m!296573))

(declare-fun m!296575 () Bool)

(assert (=> b!190953 m!296575))

(declare-fun m!296577 () Bool)

(assert (=> b!190953 m!296577))

(declare-fun m!296579 () Bool)

(assert (=> b!190959 m!296579))

(declare-fun m!296581 () Bool)

(assert (=> b!190959 m!296581))

(declare-fun m!296583 () Bool)

(assert (=> b!190959 m!296583))

(declare-fun m!296585 () Bool)

(assert (=> b!190954 m!296585))

(declare-fun m!296587 () Bool)

(assert (=> b!190954 m!296587))

(declare-fun m!296589 () Bool)

(assert (=> b!190965 m!296589))

(declare-fun m!296591 () Bool)

(assert (=> b!190963 m!296591))

(declare-fun m!296593 () Bool)

(assert (=> b!190960 m!296593))

(declare-fun m!296595 () Bool)

(assert (=> b!190961 m!296595))

(declare-fun m!296597 () Bool)

(assert (=> b!190970 m!296597))

(declare-fun m!296599 () Bool)

(assert (=> b!190952 m!296599))

(declare-fun m!296601 () Bool)

(assert (=> start!41136 m!296601))

(declare-fun m!296603 () Bool)

(assert (=> b!190966 m!296603))

(declare-fun m!296605 () Bool)

(assert (=> b!190969 m!296605))

(declare-fun m!296607 () Bool)

(assert (=> b!190955 m!296607))

(declare-fun m!296609 () Bool)

(assert (=> b!190973 m!296609))

(declare-fun m!296611 () Bool)

(assert (=> b!190962 m!296611))

(assert (=> b!190971 m!296605))

(declare-fun m!296613 () Bool)

(assert (=> b!190964 m!296613))

(declare-fun m!296615 () Bool)

(assert (=> b!190964 m!296615))

(declare-fun m!296617 () Bool)

(assert (=> b!190956 m!296617))

(assert (=> b!190956 m!296617))

(declare-fun m!296619 () Bool)

(assert (=> b!190956 m!296619))

(declare-fun m!296621 () Bool)

(assert (=> b!190950 m!296621))

(declare-fun m!296623 () Bool)

(assert (=> b!190950 m!296623))

(declare-fun m!296625 () Bool)

(assert (=> b!190950 m!296625))

(declare-fun m!296627 () Bool)

(assert (=> b!190950 m!296627))

(declare-fun m!296629 () Bool)

(assert (=> b!190950 m!296629))

(declare-fun m!296631 () Bool)

(assert (=> b!190950 m!296631))

(declare-fun m!296633 () Bool)

(assert (=> b!190950 m!296633))

(declare-fun m!296635 () Bool)

(assert (=> b!190950 m!296635))

(declare-fun m!296637 () Bool)

(assert (=> b!190950 m!296637))

(declare-fun m!296639 () Bool)

(assert (=> b!190950 m!296639))

(declare-fun m!296641 () Bool)

(assert (=> b!190950 m!296641))

(declare-fun m!296643 () Bool)

(assert (=> b!190950 m!296643))

(declare-fun m!296645 () Bool)

(assert (=> b!190950 m!296645))

(declare-fun m!296647 () Bool)

(assert (=> b!190950 m!296647))

(declare-fun m!296649 () Bool)

(assert (=> b!190950 m!296649))

(declare-fun m!296651 () Bool)

(assert (=> b!190950 m!296651))

(declare-fun m!296653 () Bool)

(assert (=> b!190967 m!296653))

(assert (=> b!190951 m!296585))

(assert (=> b!190951 m!296587))

(declare-fun m!296655 () Bool)

(assert (=> b!190951 m!296655))

(push 1)

(assert (not b!190950))

(assert (not b!190969))

(assert (not b!190956))

(assert (not b!190967))

(assert (not b!190951))

(assert (not b!190961))

(assert (not b!190955))

(assert (not b!190953))

(assert (not b!190959))

(assert (not b!190964))

(assert (not b!190954))

(assert (not b!190966))

(assert (not b!190971))

(assert (not b!190960))

(assert (not b!190965))

(assert (not b!190963))

(assert (not b!190952))

(assert (not b!190962))

(assert (not b!190970))

(assert (not start!41136))

(assert (not b!190973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65505 () Bool)

(declare-fun res!159462 () Bool)

(declare-fun e!131783 () Bool)

(assert (=> d!65505 (=> (not res!159462) (not e!131783))))

(assert (=> d!65505 (= res!159462 (= (size!4374 (buf!4851 thiss!1204)) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (=> d!65505 (= (isPrefixOf!0 thiss!1204 (_2!8901 lt!296732)) e!131783)))

(declare-fun b!191097 () Bool)

(declare-fun res!159461 () Bool)

(assert (=> b!191097 (=> (not res!159461) (not e!131783))))

(assert (=> b!191097 (= res!159461 (bvsle (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732)))))))

(declare-fun b!191098 () Bool)

(declare-fun e!131784 () Bool)

(assert (=> b!191098 (= e!131783 e!131784)))

(declare-fun res!159460 () Bool)

(assert (=> b!191098 (=> res!159460 e!131784)))

(assert (=> b!191098 (= res!159460 (= (size!4374 (buf!4851 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191099 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9921 array!9921 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!191099 (= e!131784 (arrayBitRangesEq!0 (buf!4851 thiss!1204) (buf!4851 (_2!8901 lt!296732)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))))))

(assert (= (and d!65505 res!159462) b!191097))

(assert (= (and b!191097 res!159461) b!191098))

(assert (= (and b!191098 (not res!159460)) b!191099))

(assert (=> b!191097 m!296587))

(assert (=> b!191097 m!296585))

(assert (=> b!191099 m!296587))

(assert (=> b!191099 m!296587))

(declare-fun m!296895 () Bool)

(assert (=> b!191099 m!296895))

(assert (=> b!190969 d!65505))

(declare-fun d!65517 () Bool)

(declare-fun lt!297093 () tuple2!16514)

(declare-fun lt!297094 () tuple2!16514)

(assert (=> d!65517 (and (= (_2!8902 lt!297093) (_2!8902 lt!297094)) (= (_1!8902 lt!297093) (_1!8902 lt!297094)))))

(declare-fun lt!297091 () Bool)

(declare-fun lt!297089 () BitStream!7856)

(declare-fun lt!297090 () (_ BitVec 64))

(declare-fun lt!297092 () Unit!13586)

(declare-fun choose!56 (BitStream!7856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16514 tuple2!16514 BitStream!7856 (_ BitVec 64) Bool BitStream!7856 (_ BitVec 64) tuple2!16514 tuple2!16514 BitStream!7856 (_ BitVec 64)) Unit!13586)

(assert (=> d!65517 (= lt!297092 (choose!56 (_1!8903 lt!296712) nBits!348 i!590 lt!296710 lt!297093 (tuple2!16515 (_1!8902 lt!297093) (_2!8902 lt!297093)) (_1!8902 lt!297093) (_2!8902 lt!297093) lt!297091 lt!297089 lt!297090 lt!297094 (tuple2!16515 (_1!8902 lt!297094) (_2!8902 lt!297094)) (_1!8902 lt!297094) (_2!8902 lt!297094)))))

(assert (=> d!65517 (= lt!297094 (readNBitsLSBFirstsLoopPure!0 lt!297089 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!297090))))

(assert (=> d!65517 (= lt!297090 (bvor lt!296710 (ite lt!297091 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65517 (= lt!297089 (withMovedBitIndex!0 (_1!8903 lt!296712) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65517 (= lt!297091 (_2!8904 (readBitPure!0 (_1!8903 lt!296712))))))

(assert (=> d!65517 (= lt!297093 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710))))

(assert (=> d!65517 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710) lt!297092)))

(declare-fun bs!16284 () Bool)

(assert (= bs!16284 d!65517))

(assert (=> bs!16284 m!296645))

(assert (=> bs!16284 m!296621))

(declare-fun m!296907 () Bool)

(assert (=> bs!16284 m!296907))

(declare-fun m!296909 () Bool)

(assert (=> bs!16284 m!296909))

(assert (=> bs!16284 m!296583))

(assert (=> b!190959 d!65517))

(declare-datatypes ((tuple2!16524 0))(
  ( (tuple2!16525 (_1!8907 (_ BitVec 64)) (_2!8907 BitStream!7856)) )
))
(declare-fun lt!297099 () tuple2!16524)

(declare-fun d!65521 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16524)

(assert (=> d!65521 (= lt!297099 (readNBitsLSBFirstsLoop!0 lt!296724 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726))))

(assert (=> d!65521 (= (readNBitsLSBFirstsLoopPure!0 lt!296724 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726) (tuple2!16515 (_2!8907 lt!297099) (_1!8907 lt!297099)))))

(declare-fun bs!16287 () Bool)

(assert (= bs!16287 d!65521))

(declare-fun m!296915 () Bool)

(assert (=> bs!16287 m!296915))

(assert (=> b!190959 d!65521))

(declare-fun d!65533 () Bool)

(declare-fun e!131790 () Bool)

(assert (=> d!65533 e!131790))

(declare-fun res!159468 () Bool)

(assert (=> d!65533 (=> (not res!159468) (not e!131790))))

(declare-fun lt!297105 () (_ BitVec 64))

(declare-fun lt!297104 () BitStream!7856)

(assert (=> d!65533 (= res!159468 (= (bvadd lt!297105 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4374 (buf!4851 lt!297104)) (currentByte!9129 lt!297104) (currentBit!9124 lt!297104))))))

(assert (=> d!65533 (or (not (= (bvand lt!297105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297105 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65533 (= lt!297105 (bitIndex!0 (size!4374 (buf!4851 (_1!8903 lt!296712))) (currentByte!9129 (_1!8903 lt!296712)) (currentBit!9124 (_1!8903 lt!296712))))))

(declare-fun moveBitIndex!0 (BitStream!7856 (_ BitVec 64)) tuple2!16512)

(assert (=> d!65533 (= lt!297104 (_2!8901 (moveBitIndex!0 (_1!8903 lt!296712) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7856 (_ BitVec 64)) Bool)

(assert (=> d!65533 (moveBitIndexPrecond!0 (_1!8903 lt!296712) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65533 (= (withMovedBitIndex!0 (_1!8903 lt!296712) #b0000000000000000000000000000000000000000000000000000000000000001) lt!297104)))

(declare-fun b!191105 () Bool)

(assert (=> b!191105 (= e!131790 (= (size!4374 (buf!4851 (_1!8903 lt!296712))) (size!4374 (buf!4851 lt!297104))))))

(assert (= (and d!65533 res!159468) b!191105))

(declare-fun m!296919 () Bool)

(assert (=> d!65533 m!296919))

(declare-fun m!296921 () Bool)

(assert (=> d!65533 m!296921))

(declare-fun m!296923 () Bool)

(assert (=> d!65533 m!296923))

(declare-fun m!296925 () Bool)

(assert (=> d!65533 m!296925))

(assert (=> b!190959 d!65533))

(declare-fun d!65541 () Bool)

(declare-fun e!131799 () Bool)

(assert (=> d!65541 e!131799))

(declare-fun res!159482 () Bool)

(assert (=> d!65541 (=> (not res!159482) (not e!131799))))

(declare-fun lt!297138 () (_ BitVec 64))

(declare-fun lt!297135 () (_ BitVec 64))

(declare-fun lt!297136 () (_ BitVec 64))

(assert (=> d!65541 (= res!159482 (= lt!297138 (bvsub lt!297135 lt!297136)))))

(assert (=> d!65541 (or (= (bvand lt!297135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297136 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297135 lt!297136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65541 (= lt!297136 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296732)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732)))))))

(declare-fun lt!297137 () (_ BitVec 64))

(declare-fun lt!297134 () (_ BitVec 64))

(assert (=> d!65541 (= lt!297135 (bvmul lt!297137 lt!297134))))

(assert (=> d!65541 (or (= lt!297137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297134 (bvsdiv (bvmul lt!297137 lt!297134) lt!297137)))))

(assert (=> d!65541 (= lt!297134 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65541 (= lt!297137 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (=> d!65541 (= lt!297138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732)))))))

(assert (=> d!65541 (invariant!0 (currentBit!9124 (_2!8901 lt!296732)) (currentByte!9129 (_2!8901 lt!296732)) (size!4374 (buf!4851 (_2!8901 lt!296732))))))

(assert (=> d!65541 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) lt!297138)))

(declare-fun b!191118 () Bool)

(declare-fun res!159481 () Bool)

(assert (=> b!191118 (=> (not res!159481) (not e!131799))))

(assert (=> b!191118 (= res!159481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297138))))

(declare-fun b!191119 () Bool)

(declare-fun lt!297133 () (_ BitVec 64))

(assert (=> b!191119 (= e!131799 (bvsle lt!297138 (bvmul lt!297133 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191119 (or (= lt!297133 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297133 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297133)))))

(assert (=> b!191119 (= lt!297133 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (= (and d!65541 res!159482) b!191118))

(assert (= (and b!191118 res!159481) b!191119))

(declare-fun m!296941 () Bool)

(assert (=> d!65541 m!296941))

(declare-fun m!296943 () Bool)

(assert (=> d!65541 m!296943))

(assert (=> b!190954 d!65541))

(declare-fun d!65551 () Bool)

(declare-fun e!131800 () Bool)

(assert (=> d!65551 e!131800))

(declare-fun res!159484 () Bool)

(assert (=> d!65551 (=> (not res!159484) (not e!131800))))

(declare-fun lt!297142 () (_ BitVec 64))

(declare-fun lt!297141 () (_ BitVec 64))

(declare-fun lt!297144 () (_ BitVec 64))

(assert (=> d!65551 (= res!159484 (= lt!297144 (bvsub lt!297141 lt!297142)))))

(assert (=> d!65551 (or (= (bvand lt!297141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297142 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297141 lt!297142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65551 (= lt!297142 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204))))))

(declare-fun lt!297143 () (_ BitVec 64))

(declare-fun lt!297140 () (_ BitVec 64))

(assert (=> d!65551 (= lt!297141 (bvmul lt!297143 lt!297140))))

(assert (=> d!65551 (or (= lt!297143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297140 (bvsdiv (bvmul lt!297143 lt!297140) lt!297143)))))

(assert (=> d!65551 (= lt!297140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65551 (= lt!297143 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))))))

(assert (=> d!65551 (= lt!297144 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 thiss!1204))))))

(assert (=> d!65551 (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204)))))

(assert (=> d!65551 (= (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)) lt!297144)))

(declare-fun b!191120 () Bool)

(declare-fun res!159483 () Bool)

(assert (=> b!191120 (=> (not res!159483) (not e!131800))))

(assert (=> b!191120 (= res!159483 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297144))))

(declare-fun b!191121 () Bool)

(declare-fun lt!297139 () (_ BitVec 64))

(assert (=> b!191121 (= e!131800 (bvsle lt!297144 (bvmul lt!297139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191121 (or (= lt!297139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297139)))))

(assert (=> b!191121 (= lt!297139 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))))))

(assert (= (and d!65551 res!159484) b!191120))

(assert (= (and b!191120 res!159483) b!191121))

(declare-fun m!296945 () Bool)

(assert (=> d!65551 m!296945))

(assert (=> d!65551 m!296589))

(assert (=> b!190954 d!65551))

(declare-fun d!65553 () Bool)

(assert (=> d!65553 (= (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204))) (and (bvsge (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9124 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9129 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204))) (and (= (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204)))))))))

(assert (=> b!190965 d!65553))

(declare-fun d!65555 () Bool)

(assert (=> d!65555 (= (array_inv!4115 (buf!4851 thiss!1204)) (bvsge (size!4374 (buf!4851 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190955 d!65555))

(declare-fun d!65557 () Bool)

(assert (=> d!65557 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!190966 d!65557))

(declare-fun d!65559 () Bool)

(declare-datatypes ((tuple2!16526 0))(
  ( (tuple2!16527 (_1!8908 Bool) (_2!8908 BitStream!7856)) )
))
(declare-fun lt!297147 () tuple2!16526)

(declare-fun readBit!0 (BitStream!7856) tuple2!16526)

(assert (=> d!65559 (= lt!297147 (readBit!0 (readerFrom!0 (_2!8901 lt!296732) (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204))))))

(assert (=> d!65559 (= (readBitPure!0 (readerFrom!0 (_2!8901 lt!296732) (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204))) (tuple2!16519 (_2!8908 lt!297147) (_1!8908 lt!297147)))))

(declare-fun bs!16291 () Bool)

(assert (= bs!16291 d!65559))

(assert (=> bs!16291 m!296617))

(declare-fun m!296947 () Bool)

(assert (=> bs!16291 m!296947))

(assert (=> b!190956 d!65559))

(declare-fun d!65561 () Bool)

(declare-fun e!131803 () Bool)

(assert (=> d!65561 e!131803))

(declare-fun res!159488 () Bool)

(assert (=> d!65561 (=> (not res!159488) (not e!131803))))

(assert (=> d!65561 (= res!159488 (invariant!0 (currentBit!9124 (_2!8901 lt!296732)) (currentByte!9129 (_2!8901 lt!296732)) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (=> d!65561 (= (readerFrom!0 (_2!8901 lt!296732) (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204)) (BitStream!7857 (buf!4851 (_2!8901 lt!296732)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(declare-fun b!191124 () Bool)

(assert (=> b!191124 (= e!131803 (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296732)))))))

(assert (= (and d!65561 res!159488) b!191124))

(assert (=> d!65561 m!296943))

(assert (=> b!191124 m!296625))

(assert (=> b!190956 d!65561))

(declare-fun d!65563 () Bool)

(assert (=> d!65563 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 thiss!1204))))))

(declare-fun bs!16292 () Bool)

(assert (= bs!16292 d!65563))

(assert (=> bs!16292 m!296589))

(assert (=> start!41136 d!65563))

(declare-fun d!65565 () Bool)

(declare-fun e!131804 () Bool)

(assert (=> d!65565 e!131804))

(declare-fun res!159490 () Bool)

(assert (=> d!65565 (=> (not res!159490) (not e!131804))))

(declare-fun lt!297153 () (_ BitVec 64))

(declare-fun lt!297150 () (_ BitVec 64))

(declare-fun lt!297151 () (_ BitVec 64))

(assert (=> d!65565 (= res!159490 (= lt!297153 (bvsub lt!297150 lt!297151)))))

(assert (=> d!65565 (or (= (bvand lt!297150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297150 lt!297151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65565 (= lt!297151 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296731)))) ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296731))) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296731)))))))

(declare-fun lt!297152 () (_ BitVec 64))

(declare-fun lt!297149 () (_ BitVec 64))

(assert (=> d!65565 (= lt!297150 (bvmul lt!297152 lt!297149))))

(assert (=> d!65565 (or (= lt!297152 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297149 (bvsdiv (bvmul lt!297152 lt!297149) lt!297152)))))

(assert (=> d!65565 (= lt!297149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65565 (= lt!297152 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296731)))))))

(assert (=> d!65565 (= lt!297153 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296731))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296731)))))))

(assert (=> d!65565 (invariant!0 (currentBit!9124 (_1!8904 lt!296731)) (currentByte!9129 (_1!8904 lt!296731)) (size!4374 (buf!4851 (_1!8904 lt!296731))))))

(assert (=> d!65565 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296731))) (currentByte!9129 (_1!8904 lt!296731)) (currentBit!9124 (_1!8904 lt!296731))) lt!297153)))

(declare-fun b!191125 () Bool)

(declare-fun res!159489 () Bool)

(assert (=> b!191125 (=> (not res!159489) (not e!131804))))

(assert (=> b!191125 (= res!159489 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297153))))

(declare-fun b!191126 () Bool)

(declare-fun lt!297148 () (_ BitVec 64))

(assert (=> b!191126 (= e!131804 (bvsle lt!297153 (bvmul lt!297148 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191126 (or (= lt!297148 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297148 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297148)))))

(assert (=> b!191126 (= lt!297148 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296731)))))))

(assert (= (and d!65565 res!159490) b!191125))

(assert (= (and b!191125 res!159489) b!191126))

(declare-fun m!296949 () Bool)

(assert (=> d!65565 m!296949))

(declare-fun m!296951 () Bool)

(assert (=> d!65565 m!296951))

(assert (=> b!190967 d!65565))

(declare-fun d!65567 () Bool)

(assert (=> d!65567 (= (invariant!0 (currentBit!9124 (_2!8901 lt!296721)) (currentByte!9129 (_2!8901 lt!296721)) (size!4374 (buf!4851 (_2!8901 lt!296721)))) (and (bvsge (currentBit!9124 (_2!8901 lt!296721)) #b00000000000000000000000000000000) (bvslt (currentBit!9124 (_2!8901 lt!296721)) #b00000000000000000000000000001000) (bvsge (currentByte!9129 (_2!8901 lt!296721)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9129 (_2!8901 lt!296721)) (size!4374 (buf!4851 (_2!8901 lt!296721)))) (and (= (currentBit!9124 (_2!8901 lt!296721)) #b00000000000000000000000000000000) (= (currentByte!9129 (_2!8901 lt!296721)) (size!4374 (buf!4851 (_2!8901 lt!296721))))))))))

(assert (=> b!190962 d!65567))

(declare-fun d!65569 () Bool)

(assert (=> d!65569 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8903 lt!296712)))) ((_ sign_extend 32) (currentByte!9129 (_1!8903 lt!296712))) ((_ sign_extend 32) (currentBit!9124 (_1!8903 lt!296712))) lt!296719) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8903 lt!296712)))) ((_ sign_extend 32) (currentByte!9129 (_1!8903 lt!296712))) ((_ sign_extend 32) (currentBit!9124 (_1!8903 lt!296712)))) lt!296719))))

(declare-fun bs!16293 () Bool)

(assert (= bs!16293 d!65569))

(declare-fun m!296953 () Bool)

(assert (=> bs!16293 m!296953))

(assert (=> b!190973 d!65569))

(declare-fun d!65571 () Bool)

(assert (=> d!65571 (= (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296721)))) (and (bvsge (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9124 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9129 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296721)))) (and (= (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296721))))))))))

(assert (=> b!190952 d!65571))

(declare-fun d!65573 () Bool)

(declare-fun res!159493 () Bool)

(declare-fun e!131805 () Bool)

(assert (=> d!65573 (=> (not res!159493) (not e!131805))))

(assert (=> d!65573 (= res!159493 (= (size!4374 (buf!4851 (_2!8901 lt!296732))) (size!4374 (buf!4851 (_2!8901 lt!296721)))))))

(assert (=> d!65573 (= (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!296721)) e!131805)))

(declare-fun b!191127 () Bool)

(declare-fun res!159492 () Bool)

(assert (=> b!191127 (=> (not res!159492) (not e!131805))))

(assert (=> b!191127 (= res!159492 (bvsle (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721)))))))

(declare-fun b!191128 () Bool)

(declare-fun e!131806 () Bool)

(assert (=> b!191128 (= e!131805 e!131806)))

(declare-fun res!159491 () Bool)

(assert (=> b!191128 (=> res!159491 e!131806)))

(assert (=> b!191128 (= res!159491 (= (size!4374 (buf!4851 (_2!8901 lt!296732))) #b00000000000000000000000000000000))))

(declare-fun b!191129 () Bool)

(assert (=> b!191129 (= e!131806 (arrayBitRangesEq!0 (buf!4851 (_2!8901 lt!296732)) (buf!4851 (_2!8901 lt!296721)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732)))))))

(assert (= (and d!65573 res!159493) b!191127))

(assert (= (and b!191127 res!159492) b!191128))

(assert (= (and b!191128 (not res!159491)) b!191129))

(assert (=> b!191127 m!296585))

(assert (=> b!191127 m!296571))

(assert (=> b!191129 m!296585))

(assert (=> b!191129 m!296585))

(declare-fun m!296955 () Bool)

(assert (=> b!191129 m!296955))

(assert (=> b!190963 d!65573))

(declare-fun d!65575 () Bool)

(declare-fun e!131807 () Bool)

(assert (=> d!65575 e!131807))

(declare-fun res!159495 () Bool)

(assert (=> d!65575 (=> (not res!159495) (not e!131807))))

(declare-fun lt!297156 () (_ BitVec 64))

(declare-fun lt!297157 () (_ BitVec 64))

(declare-fun lt!297159 () (_ BitVec 64))

(assert (=> d!65575 (= res!159495 (= lt!297159 (bvsub lt!297156 lt!297157)))))

(assert (=> d!65575 (or (= (bvand lt!297156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297156 lt!297157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65575 (= lt!297157 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296721))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296721)))))))

(declare-fun lt!297158 () (_ BitVec 64))

(declare-fun lt!297155 () (_ BitVec 64))

(assert (=> d!65575 (= lt!297156 (bvmul lt!297158 lt!297155))))

(assert (=> d!65575 (or (= lt!297158 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297155 (bvsdiv (bvmul lt!297158 lt!297155) lt!297158)))))

(assert (=> d!65575 (= lt!297155 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65575 (= lt!297158 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))))))

(assert (=> d!65575 (= lt!297159 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296721))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296721)))))))

(assert (=> d!65575 (invariant!0 (currentBit!9124 (_2!8901 lt!296721)) (currentByte!9129 (_2!8901 lt!296721)) (size!4374 (buf!4851 (_2!8901 lt!296721))))))

(assert (=> d!65575 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721))) lt!297159)))

(declare-fun b!191130 () Bool)

(declare-fun res!159494 () Bool)

(assert (=> b!191130 (=> (not res!159494) (not e!131807))))

(assert (=> b!191130 (= res!159494 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297159))))

(declare-fun b!191131 () Bool)

(declare-fun lt!297154 () (_ BitVec 64))

(assert (=> b!191131 (= e!131807 (bvsle lt!297159 (bvmul lt!297154 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191131 (or (= lt!297154 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297154 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297154)))))

(assert (=> b!191131 (= lt!297154 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))))))

(assert (= (and d!65575 res!159495) b!191130))

(assert (= (and b!191130 res!159494) b!191131))

(declare-fun m!296957 () Bool)

(assert (=> d!65575 m!296957))

(assert (=> d!65575 m!296611))

(assert (=> b!190953 d!65575))

(declare-fun d!65577 () Bool)

(declare-fun res!159498 () Bool)

(declare-fun e!131808 () Bool)

(assert (=> d!65577 (=> (not res!159498) (not e!131808))))

(assert (=> d!65577 (= res!159498 (= (size!4374 (buf!4851 thiss!1204)) (size!4374 (buf!4851 (_2!8901 lt!296721)))))))

(assert (=> d!65577 (= (isPrefixOf!0 thiss!1204 (_2!8901 lt!296721)) e!131808)))

(declare-fun b!191132 () Bool)

(declare-fun res!159497 () Bool)

(assert (=> b!191132 (=> (not res!159497) (not e!131808))))

(assert (=> b!191132 (= res!159497 (bvsle (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721)))))))

(declare-fun b!191133 () Bool)

(declare-fun e!131809 () Bool)

(assert (=> b!191133 (= e!131808 e!131809)))

(declare-fun res!159496 () Bool)

(assert (=> b!191133 (=> res!159496 e!131809)))

(assert (=> b!191133 (= res!159496 (= (size!4374 (buf!4851 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191134 () Bool)

(assert (=> b!191134 (= e!131809 (arrayBitRangesEq!0 (buf!4851 thiss!1204) (buf!4851 (_2!8901 lt!296721)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))))))

(assert (= (and d!65577 res!159498) b!191132))

(assert (= (and b!191132 res!159497) b!191133))

(assert (= (and b!191133 (not res!159496)) b!191134))

(assert (=> b!191132 m!296587))

(assert (=> b!191132 m!296571))

(assert (=> b!191134 m!296587))

(assert (=> b!191134 m!296587))

(declare-fun m!296959 () Bool)

(assert (=> b!191134 m!296959))

(assert (=> b!190953 d!65577))

(declare-fun d!65579 () Bool)

(assert (=> d!65579 (isPrefixOf!0 thiss!1204 (_2!8901 lt!296721))))

(declare-fun lt!297162 () Unit!13586)

(declare-fun choose!30 (BitStream!7856 BitStream!7856 BitStream!7856) Unit!13586)

(assert (=> d!65579 (= lt!297162 (choose!30 thiss!1204 (_2!8901 lt!296732) (_2!8901 lt!296721)))))

(assert (=> d!65579 (isPrefixOf!0 thiss!1204 (_2!8901 lt!296732))))

(assert (=> d!65579 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8901 lt!296732) (_2!8901 lt!296721)) lt!297162)))

(declare-fun bs!16294 () Bool)

(assert (= bs!16294 d!65579))

(assert (=> bs!16294 m!296573))

(declare-fun m!296961 () Bool)

(assert (=> bs!16294 m!296961))

(assert (=> bs!16294 m!296605))

(assert (=> b!190953 d!65579))

(declare-fun b!191223 () Bool)

(declare-fun e!131864 () tuple2!16512)

(declare-fun lt!297478 () tuple2!16512)

(assert (=> b!191223 (= e!131864 (tuple2!16513 (_1!8901 lt!297478) (_2!8901 lt!297478)))))

(declare-fun lt!297476 () Bool)

(assert (=> b!191223 (= lt!297476 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!297492 () tuple2!16512)

(assert (=> b!191223 (= lt!297492 (appendBit!0 (_2!8901 lt!296732) lt!297476))))

(declare-fun res!159576 () Bool)

(assert (=> b!191223 (= res!159576 (= (size!4374 (buf!4851 (_2!8901 lt!296732))) (size!4374 (buf!4851 (_2!8901 lt!297492)))))))

(declare-fun e!131867 () Bool)

(assert (=> b!191223 (=> (not res!159576) (not e!131867))))

(assert (=> b!191223 e!131867))

(declare-fun lt!297496 () tuple2!16512)

(assert (=> b!191223 (= lt!297496 lt!297492)))

(assert (=> b!191223 (= lt!297478 (appendBitsLSBFirstLoopTR!0 (_2!8901 lt!297496) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!297477 () Unit!13586)

(assert (=> b!191223 (= lt!297477 (lemmaIsPrefixTransitive!0 (_2!8901 lt!296732) (_2!8901 lt!297496) (_2!8901 lt!297478)))))

(assert (=> b!191223 (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!297478))))

(declare-fun lt!297502 () Unit!13586)

(assert (=> b!191223 (= lt!297502 lt!297477)))

(assert (=> b!191223 (invariant!0 (currentBit!9124 (_2!8901 lt!296732)) (currentByte!9129 (_2!8901 lt!296732)) (size!4374 (buf!4851 (_2!8901 lt!297496))))))

(declare-fun lt!297464 () BitStream!7856)

(assert (=> b!191223 (= lt!297464 (BitStream!7857 (buf!4851 (_2!8901 lt!297496)) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(assert (=> b!191223 (invariant!0 (currentBit!9124 lt!297464) (currentByte!9129 lt!297464) (size!4374 (buf!4851 (_2!8901 lt!297478))))))

(declare-fun lt!297499 () BitStream!7856)

(assert (=> b!191223 (= lt!297499 (BitStream!7857 (buf!4851 (_2!8901 lt!297478)) (currentByte!9129 lt!297464) (currentBit!9124 lt!297464)))))

(declare-fun lt!297463 () tuple2!16518)

(assert (=> b!191223 (= lt!297463 (readBitPure!0 lt!297464))))

(declare-fun lt!297485 () tuple2!16518)

(assert (=> b!191223 (= lt!297485 (readBitPure!0 lt!297499))))

(declare-fun lt!297484 () Unit!13586)

(assert (=> b!191223 (= lt!297484 (readBitPrefixLemma!0 lt!297464 (_2!8901 lt!297478)))))

(declare-fun res!159570 () Bool)

(assert (=> b!191223 (= res!159570 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297463))) (currentByte!9129 (_1!8904 lt!297463)) (currentBit!9124 (_1!8904 lt!297463))) (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297485))) (currentByte!9129 (_1!8904 lt!297485)) (currentBit!9124 (_1!8904 lt!297485)))))))

(declare-fun e!131862 () Bool)

(assert (=> b!191223 (=> (not res!159570) (not e!131862))))

(assert (=> b!191223 e!131862))

(declare-fun lt!297498 () Unit!13586)

(assert (=> b!191223 (= lt!297498 lt!297484)))

(declare-fun lt!297507 () tuple2!16516)

(assert (=> b!191223 (= lt!297507 (reader!0 (_2!8901 lt!296732) (_2!8901 lt!297478)))))

(declare-fun lt!297465 () tuple2!16516)

(assert (=> b!191223 (= lt!297465 (reader!0 (_2!8901 lt!297496) (_2!8901 lt!297478)))))

(declare-fun lt!297503 () tuple2!16518)

(assert (=> b!191223 (= lt!297503 (readBitPure!0 (_1!8903 lt!297507)))))

(assert (=> b!191223 (= (_2!8904 lt!297503) lt!297476)))

(declare-fun lt!297479 () Unit!13586)

(declare-fun Unit!13602 () Unit!13586)

(assert (=> b!191223 (= lt!297479 Unit!13602)))

(declare-fun lt!297469 () (_ BitVec 64))

(assert (=> b!191223 (= lt!297469 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297480 () (_ BitVec 64))

(assert (=> b!191223 (= lt!297480 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297470 () Unit!13586)

(assert (=> b!191223 (= lt!297470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!297478)) lt!297480))))

(assert (=> b!191223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!297478)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!297480)))

(declare-fun lt!297468 () Unit!13586)

(assert (=> b!191223 (= lt!297468 lt!297470)))

(declare-fun lt!297481 () tuple2!16514)

(assert (=> b!191223 (= lt!297481 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!297507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297469))))

(declare-fun lt!297511 () (_ BitVec 64))

(assert (=> b!191223 (= lt!297511 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!297491 () Unit!13586)

(assert (=> b!191223 (= lt!297491 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!297496) (buf!4851 (_2!8901 lt!297478)) lt!297511))))

(assert (=> b!191223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!297478)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!297496))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!297496))) lt!297511)))

(declare-fun lt!297475 () Unit!13586)

(assert (=> b!191223 (= lt!297475 lt!297491)))

(declare-fun lt!297506 () tuple2!16514)

(assert (=> b!191223 (= lt!297506 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!297465) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297469 (ite (_2!8904 lt!297503) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!297462 () tuple2!16514)

(assert (=> b!191223 (= lt!297462 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!297507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297469))))

(declare-fun c!9668 () Bool)

(assert (=> b!191223 (= c!9668 (_2!8904 (readBitPure!0 (_1!8903 lt!297507))))))

(declare-fun e!131866 () (_ BitVec 64))

(declare-fun lt!297457 () tuple2!16514)

(assert (=> b!191223 (= lt!297457 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8903 lt!297507) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297469 e!131866)))))

(declare-fun lt!297467 () Unit!13586)

(assert (=> b!191223 (= lt!297467 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8903 lt!297507) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297469))))

(assert (=> b!191223 (and (= (_2!8902 lt!297462) (_2!8902 lt!297457)) (= (_1!8902 lt!297462) (_1!8902 lt!297457)))))

(declare-fun lt!297508 () Unit!13586)

(assert (=> b!191223 (= lt!297508 lt!297467)))

(assert (=> b!191223 (= (_1!8903 lt!297507) (withMovedBitIndex!0 (_2!8903 lt!297507) (bvsub (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297478))) (currentByte!9129 (_2!8901 lt!297478)) (currentBit!9124 (_2!8901 lt!297478))))))))

(declare-fun lt!297488 () Unit!13586)

(declare-fun Unit!13604 () Unit!13586)

(assert (=> b!191223 (= lt!297488 Unit!13604)))

(assert (=> b!191223 (= (_1!8903 lt!297465) (withMovedBitIndex!0 (_2!8903 lt!297465) (bvsub (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297496))) (currentByte!9129 (_2!8901 lt!297496)) (currentBit!9124 (_2!8901 lt!297496))) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297478))) (currentByte!9129 (_2!8901 lt!297478)) (currentBit!9124 (_2!8901 lt!297478))))))))

(declare-fun lt!297504 () Unit!13586)

(declare-fun Unit!13605 () Unit!13586)

(assert (=> b!191223 (= lt!297504 Unit!13605)))

(assert (=> b!191223 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) (bvsub (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297496))) (currentByte!9129 (_2!8901 lt!297496)) (currentBit!9124 (_2!8901 lt!297496))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!297471 () Unit!13586)

(declare-fun Unit!13606 () Unit!13586)

(assert (=> b!191223 (= lt!297471 Unit!13606)))

(assert (=> b!191223 (= (_2!8902 lt!297481) (_2!8902 lt!297506))))

(declare-fun lt!297490 () Unit!13586)

(declare-fun Unit!13607 () Unit!13586)

(assert (=> b!191223 (= lt!297490 Unit!13607)))

(assert (=> b!191223 (invariant!0 (currentBit!9124 (_2!8901 lt!297478)) (currentByte!9129 (_2!8901 lt!297478)) (size!4374 (buf!4851 (_2!8901 lt!297478))))))

(declare-fun lt!297497 () Unit!13586)

(declare-fun Unit!13608 () Unit!13586)

(assert (=> b!191223 (= lt!297497 Unit!13608)))

(assert (=> b!191223 (= (size!4374 (buf!4851 (_2!8901 lt!296732))) (size!4374 (buf!4851 (_2!8901 lt!297478))))))

(declare-fun lt!297486 () Unit!13586)

(declare-fun Unit!13609 () Unit!13586)

(assert (=> b!191223 (= lt!297486 Unit!13609)))

(assert (=> b!191223 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297478))) (currentByte!9129 (_2!8901 lt!297478)) (currentBit!9124 (_2!8901 lt!297478))) (bvsub (bvadd (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297505 () Unit!13586)

(declare-fun Unit!13610 () Unit!13586)

(assert (=> b!191223 (= lt!297505 Unit!13610)))

(declare-fun lt!297509 () Unit!13586)

(declare-fun Unit!13611 () Unit!13586)

(assert (=> b!191223 (= lt!297509 Unit!13611)))

(declare-fun lt!297458 () tuple2!16516)

(assert (=> b!191223 (= lt!297458 (reader!0 (_2!8901 lt!296732) (_2!8901 lt!297478)))))

(declare-fun lt!297472 () (_ BitVec 64))

(assert (=> b!191223 (= lt!297472 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297500 () Unit!13586)

(assert (=> b!191223 (= lt!297500 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!297478)) lt!297472))))

(assert (=> b!191223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!297478)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!297472)))

(declare-fun lt!297494 () Unit!13586)

(assert (=> b!191223 (= lt!297494 lt!297500)))

(declare-fun lt!297495 () tuple2!16514)

(assert (=> b!191223 (= lt!297495 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!297458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159573 () Bool)

(assert (=> b!191223 (= res!159573 (= (_2!8902 lt!297495) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!131863 () Bool)

(assert (=> b!191223 (=> (not res!159573) (not e!131863))))

(assert (=> b!191223 e!131863))

(declare-fun lt!297493 () Unit!13586)

(declare-fun Unit!13612 () Unit!13586)

(assert (=> b!191223 (= lt!297493 Unit!13612)))

(declare-fun b!191224 () Bool)

(declare-fun lt!297512 () tuple2!16518)

(assert (=> b!191224 (= lt!297512 (readBitPure!0 (readerFrom!0 (_2!8901 lt!297492) (currentBit!9124 (_2!8901 lt!296732)) (currentByte!9129 (_2!8901 lt!296732)))))))

(declare-fun res!159567 () Bool)

(assert (=> b!191224 (= res!159567 (and (= (_2!8904 lt!297512) lt!297476) (= (_1!8904 lt!297512) (_2!8901 lt!297492))))))

(declare-fun e!131860 () Bool)

(assert (=> b!191224 (=> (not res!159567) (not e!131860))))

(assert (=> b!191224 (= e!131867 e!131860)))

(declare-fun b!191225 () Bool)

(declare-fun res!159578 () Bool)

(declare-fun call!3044 () Bool)

(assert (=> b!191225 (= res!159578 call!3044)))

(assert (=> b!191225 (=> (not res!159578) (not e!131867))))

(declare-fun b!191226 () Bool)

(assert (=> b!191226 (= e!131860 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297512))) (currentByte!9129 (_1!8904 lt!297512)) (currentBit!9124 (_1!8904 lt!297512))) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297492))) (currentByte!9129 (_2!8901 lt!297492)) (currentBit!9124 (_2!8901 lt!297492)))))))

(declare-fun d!65581 () Bool)

(declare-fun e!131861 () Bool)

(assert (=> d!65581 e!131861))

(declare-fun res!159568 () Bool)

(assert (=> d!65581 (=> (not res!159568) (not e!131861))))

(declare-fun lt!297473 () tuple2!16512)

(assert (=> d!65581 (= res!159568 (invariant!0 (currentBit!9124 (_2!8901 lt!297473)) (currentByte!9129 (_2!8901 lt!297473)) (size!4374 (buf!4851 (_2!8901 lt!297473)))))))

(assert (=> d!65581 (= lt!297473 e!131864)))

(declare-fun c!9669 () Bool)

(assert (=> d!65581 (= c!9669 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65581 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65581 (= (appendBitsLSBFirstLoopTR!0 (_2!8901 lt!296732) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!297473)))

(declare-fun b!191227 () Bool)

(declare-fun e!131865 () Bool)

(declare-fun lt!297474 () (_ BitVec 64))

(assert (=> b!191227 (= e!131865 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296732)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!297474))))

(declare-fun bm!3041 () Bool)

(assert (=> bm!3041 (= call!3044 (isPrefixOf!0 (_2!8901 lt!296732) (ite c!9669 (_2!8901 lt!296732) (_2!8901 lt!297492))))))

(declare-fun b!191228 () Bool)

(declare-fun res!159571 () Bool)

(assert (=> b!191228 (=> (not res!159571) (not e!131861))))

(assert (=> b!191228 (= res!159571 (= (size!4374 (buf!4851 (_2!8901 lt!296732))) (size!4374 (buf!4851 (_2!8901 lt!297473)))))))

(declare-fun b!191229 () Bool)

(assert (=> b!191229 (= e!131863 (= (_1!8902 lt!297495) (_2!8903 lt!297458)))))

(declare-fun b!191230 () Bool)

(declare-fun res!159572 () Bool)

(assert (=> b!191230 (= res!159572 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297492))) (currentByte!9129 (_2!8901 lt!297492)) (currentBit!9124 (_2!8901 lt!297492))) (bvadd (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!191230 (=> (not res!159572) (not e!131867))))

(declare-fun b!191231 () Bool)

(assert (=> b!191231 (= e!131866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!191232 () Bool)

(declare-fun e!131868 () Bool)

(declare-fun lt!297510 () tuple2!16514)

(declare-fun lt!297501 () tuple2!16516)

(assert (=> b!191232 (= e!131868 (= (_1!8902 lt!297510) (_2!8903 lt!297501)))))

(declare-fun b!191233 () Bool)

(assert (=> b!191233 (= e!131861 e!131868)))

(declare-fun res!159574 () Bool)

(assert (=> b!191233 (=> (not res!159574) (not e!131868))))

(assert (=> b!191233 (= res!159574 (= (_2!8902 lt!297510) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!191233 (= lt!297510 (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!297501) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!297466 () Unit!13586)

(declare-fun lt!297487 () Unit!13586)

(assert (=> b!191233 (= lt!297466 lt!297487)))

(assert (=> b!191233 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!297473)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!297474)))

(assert (=> b!191233 (= lt!297487 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!297473)) lt!297474))))

(assert (=> b!191233 e!131865))

(declare-fun res!159575 () Bool)

(assert (=> b!191233 (=> (not res!159575) (not e!131865))))

(assert (=> b!191233 (= res!159575 (and (= (size!4374 (buf!4851 (_2!8901 lt!296732))) (size!4374 (buf!4851 (_2!8901 lt!297473)))) (bvsge lt!297474 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191233 (= lt!297474 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!191233 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!191233 (= lt!297501 (reader!0 (_2!8901 lt!296732) (_2!8901 lt!297473)))))

(declare-fun b!191234 () Bool)

(assert (=> b!191234 (= e!131866 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!191235 () Bool)

(declare-fun res!159569 () Bool)

(assert (=> b!191235 (=> (not res!159569) (not e!131861))))

(declare-fun lt!297460 () (_ BitVec 64))

(declare-fun lt!297461 () (_ BitVec 64))

(assert (=> b!191235 (= res!159569 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297473))) (currentByte!9129 (_2!8901 lt!297473)) (currentBit!9124 (_2!8901 lt!297473))) (bvsub lt!297461 lt!297460)))))

(assert (=> b!191235 (or (= (bvand lt!297461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297461 lt!297460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191235 (= lt!297460 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!297483 () (_ BitVec 64))

(declare-fun lt!297489 () (_ BitVec 64))

(assert (=> b!191235 (= lt!297461 (bvadd lt!297483 lt!297489))))

(assert (=> b!191235 (or (not (= (bvand lt!297483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297489 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297483 lt!297489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191235 (= lt!297489 ((_ sign_extend 32) nBits!348))))

(assert (=> b!191235 (= lt!297483 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(declare-fun b!191236 () Bool)

(declare-fun res!159577 () Bool)

(assert (=> b!191236 (=> (not res!159577) (not e!131861))))

(assert (=> b!191236 (= res!159577 (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!297473)))))

(declare-fun b!191237 () Bool)

(declare-fun Unit!13614 () Unit!13586)

(assert (=> b!191237 (= e!131864 (tuple2!16513 Unit!13614 (_2!8901 lt!296732)))))

(declare-fun lt!297459 () Unit!13586)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7856) Unit!13586)

(assert (=> b!191237 (= lt!297459 (lemmaIsPrefixRefl!0 (_2!8901 lt!296732)))))

(assert (=> b!191237 call!3044))

(declare-fun lt!297482 () Unit!13586)

(assert (=> b!191237 (= lt!297482 lt!297459)))

(declare-fun b!191238 () Bool)

(assert (=> b!191238 (= e!131862 (= (_2!8904 lt!297463) (_2!8904 lt!297485)))))

(assert (= (and d!65581 c!9669) b!191237))

(assert (= (and d!65581 (not c!9669)) b!191223))

(assert (= (and b!191223 res!159576) b!191230))

(assert (= (and b!191230 res!159572) b!191225))

(assert (= (and b!191225 res!159578) b!191224))

(assert (= (and b!191224 res!159567) b!191226))

(assert (= (and b!191223 res!159570) b!191238))

(assert (= (and b!191223 c!9668) b!191234))

(assert (= (and b!191223 (not c!9668)) b!191231))

(assert (= (and b!191223 res!159573) b!191229))

(assert (= (or b!191237 b!191225) bm!3041))

(assert (= (and d!65581 res!159568) b!191228))

(assert (= (and b!191228 res!159571) b!191235))

(assert (= (and b!191235 res!159569) b!191236))

(assert (= (and b!191236 res!159577) b!191233))

(assert (= (and b!191233 res!159575) b!191227))

(assert (= (and b!191233 res!159574) b!191232))

(declare-fun m!297075 () Bool)

(assert (=> bm!3041 m!297075))

(declare-fun m!297077 () Bool)

(assert (=> b!191224 m!297077))

(assert (=> b!191224 m!297077))

(declare-fun m!297079 () Bool)

(assert (=> b!191224 m!297079))

(declare-fun m!297081 () Bool)

(assert (=> b!191233 m!297081))

(declare-fun m!297083 () Bool)

(assert (=> b!191233 m!297083))

(declare-fun m!297085 () Bool)

(assert (=> b!191233 m!297085))

(declare-fun m!297087 () Bool)

(assert (=> b!191233 m!297087))

(declare-fun m!297089 () Bool)

(assert (=> b!191233 m!297089))

(declare-fun m!297091 () Bool)

(assert (=> b!191233 m!297091))

(declare-fun m!297093 () Bool)

(assert (=> b!191226 m!297093))

(declare-fun m!297095 () Bool)

(assert (=> b!191226 m!297095))

(declare-fun m!297097 () Bool)

(assert (=> b!191236 m!297097))

(declare-fun m!297099 () Bool)

(assert (=> b!191237 m!297099))

(declare-fun m!297101 () Bool)

(assert (=> b!191223 m!297101))

(declare-fun m!297103 () Bool)

(assert (=> b!191223 m!297103))

(declare-fun m!297105 () Bool)

(assert (=> b!191223 m!297105))

(declare-fun m!297107 () Bool)

(assert (=> b!191223 m!297107))

(declare-fun m!297109 () Bool)

(assert (=> b!191223 m!297109))

(declare-fun m!297111 () Bool)

(assert (=> b!191223 m!297111))

(declare-fun m!297113 () Bool)

(assert (=> b!191223 m!297113))

(assert (=> b!191223 m!297091))

(declare-fun m!297115 () Bool)

(assert (=> b!191223 m!297115))

(declare-fun m!297117 () Bool)

(assert (=> b!191223 m!297117))

(declare-fun m!297119 () Bool)

(assert (=> b!191223 m!297119))

(declare-fun m!297121 () Bool)

(assert (=> b!191223 m!297121))

(declare-fun m!297123 () Bool)

(assert (=> b!191223 m!297123))

(declare-fun m!297125 () Bool)

(assert (=> b!191223 m!297125))

(declare-fun m!297127 () Bool)

(assert (=> b!191223 m!297127))

(declare-fun m!297129 () Bool)

(assert (=> b!191223 m!297129))

(declare-fun m!297131 () Bool)

(assert (=> b!191223 m!297131))

(declare-fun m!297133 () Bool)

(assert (=> b!191223 m!297133))

(declare-fun m!297135 () Bool)

(assert (=> b!191223 m!297135))

(declare-fun m!297137 () Bool)

(assert (=> b!191223 m!297137))

(declare-fun m!297139 () Bool)

(assert (=> b!191223 m!297139))

(declare-fun m!297141 () Bool)

(assert (=> b!191223 m!297141))

(declare-fun m!297143 () Bool)

(assert (=> b!191223 m!297143))

(declare-fun m!297145 () Bool)

(assert (=> b!191223 m!297145))

(declare-fun m!297147 () Bool)

(assert (=> b!191223 m!297147))

(assert (=> b!191223 m!297127))

(assert (=> b!191223 m!297087))

(declare-fun m!297149 () Bool)

(assert (=> b!191223 m!297149))

(declare-fun m!297151 () Bool)

(assert (=> b!191223 m!297151))

(assert (=> b!191223 m!296585))

(declare-fun m!297153 () Bool)

(assert (=> b!191223 m!297153))

(declare-fun m!297155 () Bool)

(assert (=> b!191223 m!297155))

(declare-fun m!297157 () Bool)

(assert (=> b!191223 m!297157))

(declare-fun m!297159 () Bool)

(assert (=> b!191223 m!297159))

(declare-fun m!297161 () Bool)

(assert (=> b!191223 m!297161))

(assert (=> b!191230 m!297095))

(assert (=> b!191230 m!296585))

(declare-fun m!297163 () Bool)

(assert (=> d!65581 m!297163))

(declare-fun m!297165 () Bool)

(assert (=> b!191235 m!297165))

(assert (=> b!191235 m!296585))

(declare-fun m!297167 () Bool)

(assert (=> b!191227 m!297167))

(assert (=> b!190953 d!65581))

(declare-fun d!65601 () Bool)

(declare-fun e!131869 () Bool)

(assert (=> d!65601 e!131869))

(declare-fun res!159580 () Bool)

(assert (=> d!65601 (=> (not res!159580) (not e!131869))))

(declare-fun lt!297518 () (_ BitVec 64))

(declare-fun lt!297515 () (_ BitVec 64))

(declare-fun lt!297516 () (_ BitVec 64))

(assert (=> d!65601 (= res!159580 (= lt!297518 (bvsub lt!297515 lt!297516)))))

(assert (=> d!65601 (or (= (bvand lt!297515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297515 lt!297516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65601 (= lt!297516 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8902 lt!296714)))) ((_ sign_extend 32) (currentByte!9129 (_1!8902 lt!296714))) ((_ sign_extend 32) (currentBit!9124 (_1!8902 lt!296714)))))))

(declare-fun lt!297517 () (_ BitVec 64))

(declare-fun lt!297514 () (_ BitVec 64))

(assert (=> d!65601 (= lt!297515 (bvmul lt!297517 lt!297514))))

(assert (=> d!65601 (or (= lt!297517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297514 (bvsdiv (bvmul lt!297517 lt!297514) lt!297517)))))

(assert (=> d!65601 (= lt!297514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65601 (= lt!297517 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8902 lt!296714)))))))

(assert (=> d!65601 (= lt!297518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_1!8902 lt!296714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_1!8902 lt!296714)))))))

(assert (=> d!65601 (invariant!0 (currentBit!9124 (_1!8902 lt!296714)) (currentByte!9129 (_1!8902 lt!296714)) (size!4374 (buf!4851 (_1!8902 lt!296714))))))

(assert (=> d!65601 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8902 lt!296714))) (currentByte!9129 (_1!8902 lt!296714)) (currentBit!9124 (_1!8902 lt!296714))) lt!297518)))

(declare-fun b!191239 () Bool)

(declare-fun res!159579 () Bool)

(assert (=> b!191239 (=> (not res!159579) (not e!131869))))

(assert (=> b!191239 (= res!159579 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297518))))

(declare-fun b!191240 () Bool)

(declare-fun lt!297513 () (_ BitVec 64))

(assert (=> b!191240 (= e!131869 (bvsle lt!297518 (bvmul lt!297513 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191240 (or (= lt!297513 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297513 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297513)))))

(assert (=> b!191240 (= lt!297513 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8902 lt!296714)))))))

(assert (= (and d!65601 res!159580) b!191239))

(assert (= (and b!191239 res!159579) b!191240))

(declare-fun m!297169 () Bool)

(assert (=> d!65601 m!297169))

(declare-fun m!297171 () Bool)

(assert (=> d!65601 m!297171))

(assert (=> b!190964 d!65601))

(declare-fun d!65603 () Bool)

(declare-fun e!131870 () Bool)

(assert (=> d!65603 e!131870))

(declare-fun res!159582 () Bool)

(assert (=> d!65603 (=> (not res!159582) (not e!131870))))

(declare-fun lt!297522 () (_ BitVec 64))

(declare-fun lt!297524 () (_ BitVec 64))

(declare-fun lt!297521 () (_ BitVec 64))

(assert (=> d!65603 (= res!159582 (= lt!297524 (bvsub lt!297521 lt!297522)))))

(assert (=> d!65603 (or (= (bvand lt!297521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297521 lt!297522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65603 (= lt!297522 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8903 lt!296712)))) ((_ sign_extend 32) (currentByte!9129 (_2!8903 lt!296712))) ((_ sign_extend 32) (currentBit!9124 (_2!8903 lt!296712)))))))

(declare-fun lt!297523 () (_ BitVec 64))

(declare-fun lt!297520 () (_ BitVec 64))

(assert (=> d!65603 (= lt!297521 (bvmul lt!297523 lt!297520))))

(assert (=> d!65603 (or (= lt!297523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297520 (bvsdiv (bvmul lt!297523 lt!297520) lt!297523)))))

(assert (=> d!65603 (= lt!297520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65603 (= lt!297523 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8903 lt!296712)))))))

(assert (=> d!65603 (= lt!297524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_2!8903 lt!296712))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_2!8903 lt!296712)))))))

(assert (=> d!65603 (invariant!0 (currentBit!9124 (_2!8903 lt!296712)) (currentByte!9129 (_2!8903 lt!296712)) (size!4374 (buf!4851 (_2!8903 lt!296712))))))

(assert (=> d!65603 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8903 lt!296712))) (currentByte!9129 (_2!8903 lt!296712)) (currentBit!9124 (_2!8903 lt!296712))) lt!297524)))

(declare-fun b!191241 () Bool)

(declare-fun res!159581 () Bool)

(assert (=> b!191241 (=> (not res!159581) (not e!131870))))

(assert (=> b!191241 (= res!159581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297524))))

(declare-fun b!191242 () Bool)

(declare-fun lt!297519 () (_ BitVec 64))

(assert (=> b!191242 (= e!131870 (bvsle lt!297524 (bvmul lt!297519 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191242 (or (= lt!297519 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297519 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297519)))))

(assert (=> b!191242 (= lt!297519 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8903 lt!296712)))))))

(assert (= (and d!65603 res!159582) b!191241))

(assert (= (and b!191241 res!159581) b!191242))

(declare-fun m!297173 () Bool)

(assert (=> d!65603 m!297173))

(declare-fun m!297175 () Bool)

(assert (=> d!65603 m!297175))

(assert (=> b!190964 d!65603))

(declare-fun d!65605 () Bool)

(declare-fun e!131871 () Bool)

(assert (=> d!65605 e!131871))

(declare-fun res!159583 () Bool)

(assert (=> d!65605 (=> (not res!159583) (not e!131871))))

(declare-fun lt!297526 () (_ BitVec 64))

(declare-fun lt!297525 () BitStream!7856)

(assert (=> d!65605 (= res!159583 (= (bvadd lt!297526 (bvsub lt!296725 lt!296706)) (bitIndex!0 (size!4374 (buf!4851 lt!297525)) (currentByte!9129 lt!297525) (currentBit!9124 lt!297525))))))

(assert (=> d!65605 (or (not (= (bvand lt!297526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296725 lt!296706) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297526 (bvsub lt!296725 lt!296706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65605 (= lt!297526 (bitIndex!0 (size!4374 (buf!4851 (_2!8903 lt!296712))) (currentByte!9129 (_2!8903 lt!296712)) (currentBit!9124 (_2!8903 lt!296712))))))

(assert (=> d!65605 (= lt!297525 (_2!8901 (moveBitIndex!0 (_2!8903 lt!296712) (bvsub lt!296725 lt!296706))))))

(assert (=> d!65605 (moveBitIndexPrecond!0 (_2!8903 lt!296712) (bvsub lt!296725 lt!296706))))

(assert (=> d!65605 (= (withMovedBitIndex!0 (_2!8903 lt!296712) (bvsub lt!296725 lt!296706)) lt!297525)))

(declare-fun b!191243 () Bool)

(assert (=> b!191243 (= e!131871 (= (size!4374 (buf!4851 (_2!8903 lt!296712))) (size!4374 (buf!4851 lt!297525))))))

(assert (= (and d!65605 res!159583) b!191243))

(declare-fun m!297177 () Bool)

(assert (=> d!65605 m!297177))

(assert (=> d!65605 m!296615))

(declare-fun m!297179 () Bool)

(assert (=> d!65605 m!297179))

(declare-fun m!297181 () Bool)

(assert (=> d!65605 m!297181))

(assert (=> b!190970 d!65605))

(declare-fun d!65607 () Bool)

(assert (=> d!65607 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)) lt!296719) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204))) lt!296719))))

(declare-fun bs!16298 () Bool)

(assert (= bs!16298 d!65607))

(assert (=> bs!16298 m!296945))

(assert (=> b!190960 d!65607))

(assert (=> b!190971 d!65505))

(declare-fun d!65609 () Bool)

(declare-fun e!131874 () Bool)

(assert (=> d!65609 e!131874))

(declare-fun res!159586 () Bool)

(assert (=> d!65609 (=> (not res!159586) (not e!131874))))

(declare-fun lt!297535 () tuple2!16518)

(declare-fun lt!297536 () tuple2!16518)

(assert (=> d!65609 (= res!159586 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297535))) (currentByte!9129 (_1!8904 lt!297535)) (currentBit!9124 (_1!8904 lt!297535))) (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297536))) (currentByte!9129 (_1!8904 lt!297536)) (currentBit!9124 (_1!8904 lt!297536)))))))

(declare-fun lt!297538 () BitStream!7856)

(declare-fun lt!297537 () Unit!13586)

(declare-fun choose!50 (BitStream!7856 BitStream!7856 BitStream!7856 tuple2!16518 tuple2!16518 BitStream!7856 Bool tuple2!16518 tuple2!16518 BitStream!7856 Bool) Unit!13586)

(assert (=> d!65609 (= lt!297537 (choose!50 lt!296723 (_2!8901 lt!296721) lt!297538 lt!297535 (tuple2!16519 (_1!8904 lt!297535) (_2!8904 lt!297535)) (_1!8904 lt!297535) (_2!8904 lt!297535) lt!297536 (tuple2!16519 (_1!8904 lt!297536) (_2!8904 lt!297536)) (_1!8904 lt!297536) (_2!8904 lt!297536)))))

(assert (=> d!65609 (= lt!297536 (readBitPure!0 lt!297538))))

(assert (=> d!65609 (= lt!297535 (readBitPure!0 lt!296723))))

(assert (=> d!65609 (= lt!297538 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 lt!296723) (currentBit!9124 lt!296723)))))

(assert (=> d!65609 (invariant!0 (currentBit!9124 lt!296723) (currentByte!9129 lt!296723) (size!4374 (buf!4851 (_2!8901 lt!296721))))))

(assert (=> d!65609 (= (readBitPrefixLemma!0 lt!296723 (_2!8901 lt!296721)) lt!297537)))

(declare-fun b!191246 () Bool)

(assert (=> b!191246 (= e!131874 (= (_2!8904 lt!297535) (_2!8904 lt!297536)))))

(assert (= (and d!65609 res!159586) b!191246))

(assert (=> d!65609 m!296635))

(declare-fun m!297183 () Bool)

(assert (=> d!65609 m!297183))

(declare-fun m!297185 () Bool)

(assert (=> d!65609 m!297185))

(declare-fun m!297187 () Bool)

(assert (=> d!65609 m!297187))

(declare-fun m!297189 () Bool)

(assert (=> d!65609 m!297189))

(declare-fun m!297191 () Bool)

(assert (=> d!65609 m!297191))

(assert (=> b!190950 d!65609))

(declare-fun d!65611 () Bool)

(assert (=> d!65611 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190950 d!65611))

(declare-fun d!65613 () Bool)

(declare-fun e!131875 () Bool)

(assert (=> d!65613 e!131875))

(declare-fun res!159588 () Bool)

(assert (=> d!65613 (=> (not res!159588) (not e!131875))))

(declare-fun lt!297541 () (_ BitVec 64))

(declare-fun lt!297544 () (_ BitVec 64))

(declare-fun lt!297542 () (_ BitVec 64))

(assert (=> d!65613 (= res!159588 (= lt!297544 (bvsub lt!297541 lt!297542)))))

(assert (=> d!65613 (or (= (bvand lt!297541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297541 lt!297542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65613 (= lt!297542 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296707)))) ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296707))) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296707)))))))

(declare-fun lt!297543 () (_ BitVec 64))

(declare-fun lt!297540 () (_ BitVec 64))

(assert (=> d!65613 (= lt!297541 (bvmul lt!297543 lt!297540))))

(assert (=> d!65613 (or (= lt!297543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297540 (bvsdiv (bvmul lt!297543 lt!297540) lt!297543)))))

(assert (=> d!65613 (= lt!297540 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65613 (= lt!297543 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296707)))))))

(assert (=> d!65613 (= lt!297544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296707))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296707)))))))

(assert (=> d!65613 (invariant!0 (currentBit!9124 (_1!8904 lt!296707)) (currentByte!9129 (_1!8904 lt!296707)) (size!4374 (buf!4851 (_1!8904 lt!296707))))))

(assert (=> d!65613 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296707))) (currentByte!9129 (_1!8904 lt!296707)) (currentBit!9124 (_1!8904 lt!296707))) lt!297544)))

(declare-fun b!191247 () Bool)

(declare-fun res!159587 () Bool)

(assert (=> b!191247 (=> (not res!159587) (not e!131875))))

(assert (=> b!191247 (= res!159587 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297544))))

(declare-fun b!191248 () Bool)

(declare-fun lt!297539 () (_ BitVec 64))

(assert (=> b!191248 (= e!131875 (bvsle lt!297544 (bvmul lt!297539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191248 (or (= lt!297539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297539)))))

(assert (=> b!191248 (= lt!297539 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296707)))))))

(assert (= (and d!65613 res!159588) b!191247))

(assert (= (and b!191247 res!159587) b!191248))

(declare-fun m!297193 () Bool)

(assert (=> d!65613 m!297193))

(declare-fun m!297195 () Bool)

(assert (=> d!65613 m!297195))

(assert (=> b!190950 d!65613))

(declare-fun b!191291 () Bool)

(declare-fun e!131899 () Unit!13586)

(declare-fun Unit!13625 () Unit!13586)

(assert (=> b!191291 (= e!131899 Unit!13625)))

(declare-fun b!191292 () Bool)

(declare-fun res!159621 () Bool)

(declare-fun e!131898 () Bool)

(assert (=> b!191292 (=> (not res!159621) (not e!131898))))

(declare-fun lt!297699 () tuple2!16516)

(assert (=> b!191292 (= res!159621 (isPrefixOf!0 (_1!8903 lt!297699) (_2!8901 lt!296732)))))

(declare-fun b!191293 () Bool)

(declare-fun lt!297701 () Unit!13586)

(assert (=> b!191293 (= e!131899 lt!297701)))

(declare-fun lt!297708 () (_ BitVec 64))

(assert (=> b!191293 (= lt!297708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!297710 () (_ BitVec 64))

(assert (=> b!191293 (= lt!297710 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9921 array!9921 (_ BitVec 64) (_ BitVec 64)) Unit!13586)

(assert (=> b!191293 (= lt!297701 (arrayBitRangesEqSymmetric!0 (buf!4851 (_2!8901 lt!296732)) (buf!4851 (_2!8901 lt!296721)) lt!297708 lt!297710))))

(assert (=> b!191293 (arrayBitRangesEq!0 (buf!4851 (_2!8901 lt!296721)) (buf!4851 (_2!8901 lt!296732)) lt!297708 lt!297710)))

(declare-fun b!191294 () Bool)

(declare-fun res!159619 () Bool)

(assert (=> b!191294 (=> (not res!159619) (not e!131898))))

(assert (=> b!191294 (= res!159619 (isPrefixOf!0 (_2!8903 lt!297699) (_2!8901 lt!296721)))))

(declare-fun d!65615 () Bool)

(assert (=> d!65615 e!131898))

(declare-fun res!159620 () Bool)

(assert (=> d!65615 (=> (not res!159620) (not e!131898))))

(assert (=> d!65615 (= res!159620 (isPrefixOf!0 (_1!8903 lt!297699) (_2!8903 lt!297699)))))

(declare-fun lt!297711 () BitStream!7856)

(assert (=> d!65615 (= lt!297699 (tuple2!16517 lt!297711 (_2!8901 lt!296721)))))

(declare-fun lt!297715 () Unit!13586)

(declare-fun lt!297713 () Unit!13586)

(assert (=> d!65615 (= lt!297715 lt!297713)))

(assert (=> d!65615 (isPrefixOf!0 lt!297711 (_2!8901 lt!296721))))

(assert (=> d!65615 (= lt!297713 (lemmaIsPrefixTransitive!0 lt!297711 (_2!8901 lt!296721) (_2!8901 lt!296721)))))

(declare-fun lt!297714 () Unit!13586)

(declare-fun lt!297698 () Unit!13586)

(assert (=> d!65615 (= lt!297714 lt!297698)))

(assert (=> d!65615 (isPrefixOf!0 lt!297711 (_2!8901 lt!296721))))

(assert (=> d!65615 (= lt!297698 (lemmaIsPrefixTransitive!0 lt!297711 (_2!8901 lt!296732) (_2!8901 lt!296721)))))

(declare-fun lt!297707 () Unit!13586)

(assert (=> d!65615 (= lt!297707 e!131899)))

(declare-fun c!9676 () Bool)

(assert (=> d!65615 (= c!9676 (not (= (size!4374 (buf!4851 (_2!8901 lt!296732))) #b00000000000000000000000000000000)))))

(declare-fun lt!297712 () Unit!13586)

(declare-fun lt!297700 () Unit!13586)

(assert (=> d!65615 (= lt!297712 lt!297700)))

(assert (=> d!65615 (isPrefixOf!0 (_2!8901 lt!296721) (_2!8901 lt!296721))))

(assert (=> d!65615 (= lt!297700 (lemmaIsPrefixRefl!0 (_2!8901 lt!296721)))))

(declare-fun lt!297706 () Unit!13586)

(declare-fun lt!297709 () Unit!13586)

(assert (=> d!65615 (= lt!297706 lt!297709)))

(assert (=> d!65615 (= lt!297709 (lemmaIsPrefixRefl!0 (_2!8901 lt!296721)))))

(declare-fun lt!297703 () Unit!13586)

(declare-fun lt!297702 () Unit!13586)

(assert (=> d!65615 (= lt!297703 lt!297702)))

(assert (=> d!65615 (isPrefixOf!0 lt!297711 lt!297711)))

(assert (=> d!65615 (= lt!297702 (lemmaIsPrefixRefl!0 lt!297711))))

(declare-fun lt!297704 () Unit!13586)

(declare-fun lt!297697 () Unit!13586)

(assert (=> d!65615 (= lt!297704 lt!297697)))

(assert (=> d!65615 (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!296732))))

(assert (=> d!65615 (= lt!297697 (lemmaIsPrefixRefl!0 (_2!8901 lt!296732)))))

(assert (=> d!65615 (= lt!297711 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(assert (=> d!65615 (isPrefixOf!0 (_2!8901 lt!296732) (_2!8901 lt!296721))))

(assert (=> d!65615 (= (reader!0 (_2!8901 lt!296732) (_2!8901 lt!296721)) lt!297699)))

(declare-fun lt!297716 () (_ BitVec 64))

(declare-fun lt!297705 () (_ BitVec 64))

(declare-fun b!191295 () Bool)

(assert (=> b!191295 (= e!131898 (= (_1!8903 lt!297699) (withMovedBitIndex!0 (_2!8903 lt!297699) (bvsub lt!297716 lt!297705))))))

(assert (=> b!191295 (or (= (bvand lt!297716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297716 lt!297705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191295 (= lt!297705 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721))))))

(assert (=> b!191295 (= lt!297716 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296732))) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732))))))

(assert (= (and d!65615 c!9676) b!191293))

(assert (= (and d!65615 (not c!9676)) b!191291))

(assert (= (and d!65615 res!159620) b!191292))

(assert (= (and b!191292 res!159621) b!191294))

(assert (= (and b!191294 res!159619) b!191295))

(declare-fun m!297197 () Bool)

(assert (=> b!191294 m!297197))

(declare-fun m!297199 () Bool)

(assert (=> b!191295 m!297199))

(assert (=> b!191295 m!296571))

(assert (=> b!191295 m!296585))

(declare-fun m!297201 () Bool)

(assert (=> b!191292 m!297201))

(declare-fun m!297203 () Bool)

(assert (=> d!65615 m!297203))

(declare-fun m!297205 () Bool)

(assert (=> d!65615 m!297205))

(declare-fun m!297207 () Bool)

(assert (=> d!65615 m!297207))

(declare-fun m!297209 () Bool)

(assert (=> d!65615 m!297209))

(declare-fun m!297211 () Bool)

(assert (=> d!65615 m!297211))

(assert (=> d!65615 m!297099))

(assert (=> d!65615 m!296591))

(declare-fun m!297213 () Bool)

(assert (=> d!65615 m!297213))

(declare-fun m!297215 () Bool)

(assert (=> d!65615 m!297215))

(declare-fun m!297217 () Bool)

(assert (=> d!65615 m!297217))

(declare-fun m!297219 () Bool)

(assert (=> d!65615 m!297219))

(assert (=> b!191293 m!296585))

(declare-fun m!297221 () Bool)

(assert (=> b!191293 m!297221))

(declare-fun m!297223 () Bool)

(assert (=> b!191293 m!297223))

(assert (=> b!190950 d!65615))

(declare-fun d!65617 () Bool)

(assert (=> d!65617 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!296718) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732)))) lt!296718))))

(declare-fun bs!16299 () Bool)

(assert (= bs!16299 d!65617))

(declare-fun m!297225 () Bool)

(assert (=> bs!16299 m!297225))

(assert (=> b!190950 d!65617))

(declare-fun d!65619 () Bool)

(declare-fun lt!297717 () tuple2!16524)

(assert (=> d!65619 (= lt!297717 (readNBitsLSBFirstsLoop!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710))))

(assert (=> d!65619 (= (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!296712) nBits!348 i!590 lt!296710) (tuple2!16515 (_2!8907 lt!297717) (_1!8907 lt!297717)))))

(declare-fun bs!16300 () Bool)

(assert (= bs!16300 d!65619))

(declare-fun m!297227 () Bool)

(assert (=> bs!16300 m!297227))

(assert (=> b!190950 d!65619))

(declare-fun d!65621 () Bool)

(assert (=> d!65621 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)) lt!296719)))

(declare-fun lt!297720 () Unit!13586)

(declare-fun choose!9 (BitStream!7856 array!9921 (_ BitVec 64) BitStream!7856) Unit!13586)

(assert (=> d!65621 (= lt!297720 (choose!9 thiss!1204 (buf!4851 (_2!8901 lt!296721)) lt!296719 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))))))

(assert (=> d!65621 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4851 (_2!8901 lt!296721)) lt!296719) lt!297720)))

(declare-fun bs!16301 () Bool)

(assert (= bs!16301 d!65621))

(assert (=> bs!16301 m!296643))

(declare-fun m!297229 () Bool)

(assert (=> bs!16301 m!297229))

(assert (=> b!190950 d!65621))

(declare-fun d!65623 () Bool)

(declare-fun lt!297721 () tuple2!16526)

(assert (=> d!65623 (= lt!297721 (readBit!0 lt!296723))))

(assert (=> d!65623 (= (readBitPure!0 lt!296723) (tuple2!16519 (_2!8908 lt!297721) (_1!8908 lt!297721)))))

(declare-fun bs!16302 () Bool)

(assert (= bs!16302 d!65623))

(declare-fun m!297231 () Bool)

(assert (=> bs!16302 m!297231))

(assert (=> b!190950 d!65623))

(declare-fun b!191296 () Bool)

(declare-fun e!131901 () Unit!13586)

(declare-fun Unit!13626 () Unit!13586)

(assert (=> b!191296 (= e!131901 Unit!13626)))

(declare-fun b!191297 () Bool)

(declare-fun res!159624 () Bool)

(declare-fun e!131900 () Bool)

(assert (=> b!191297 (=> (not res!159624) (not e!131900))))

(declare-fun lt!297724 () tuple2!16516)

(assert (=> b!191297 (= res!159624 (isPrefixOf!0 (_1!8903 lt!297724) thiss!1204))))

(declare-fun b!191298 () Bool)

(declare-fun lt!297726 () Unit!13586)

(assert (=> b!191298 (= e!131901 lt!297726)))

(declare-fun lt!297733 () (_ BitVec 64))

(assert (=> b!191298 (= lt!297733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!297735 () (_ BitVec 64))

(assert (=> b!191298 (= lt!297735 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(assert (=> b!191298 (= lt!297726 (arrayBitRangesEqSymmetric!0 (buf!4851 thiss!1204) (buf!4851 (_2!8901 lt!296721)) lt!297733 lt!297735))))

(assert (=> b!191298 (arrayBitRangesEq!0 (buf!4851 (_2!8901 lt!296721)) (buf!4851 thiss!1204) lt!297733 lt!297735)))

(declare-fun b!191299 () Bool)

(declare-fun res!159622 () Bool)

(assert (=> b!191299 (=> (not res!159622) (not e!131900))))

(assert (=> b!191299 (= res!159622 (isPrefixOf!0 (_2!8903 lt!297724) (_2!8901 lt!296721)))))

(declare-fun d!65625 () Bool)

(assert (=> d!65625 e!131900))

(declare-fun res!159623 () Bool)

(assert (=> d!65625 (=> (not res!159623) (not e!131900))))

(assert (=> d!65625 (= res!159623 (isPrefixOf!0 (_1!8903 lt!297724) (_2!8903 lt!297724)))))

(declare-fun lt!297736 () BitStream!7856)

(assert (=> d!65625 (= lt!297724 (tuple2!16517 lt!297736 (_2!8901 lt!296721)))))

(declare-fun lt!297740 () Unit!13586)

(declare-fun lt!297738 () Unit!13586)

(assert (=> d!65625 (= lt!297740 lt!297738)))

(assert (=> d!65625 (isPrefixOf!0 lt!297736 (_2!8901 lt!296721))))

(assert (=> d!65625 (= lt!297738 (lemmaIsPrefixTransitive!0 lt!297736 (_2!8901 lt!296721) (_2!8901 lt!296721)))))

(declare-fun lt!297739 () Unit!13586)

(declare-fun lt!297723 () Unit!13586)

(assert (=> d!65625 (= lt!297739 lt!297723)))

(assert (=> d!65625 (isPrefixOf!0 lt!297736 (_2!8901 lt!296721))))

(assert (=> d!65625 (= lt!297723 (lemmaIsPrefixTransitive!0 lt!297736 thiss!1204 (_2!8901 lt!296721)))))

(declare-fun lt!297732 () Unit!13586)

(assert (=> d!65625 (= lt!297732 e!131901)))

(declare-fun c!9677 () Bool)

(assert (=> d!65625 (= c!9677 (not (= (size!4374 (buf!4851 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!297737 () Unit!13586)

(declare-fun lt!297725 () Unit!13586)

(assert (=> d!65625 (= lt!297737 lt!297725)))

(assert (=> d!65625 (isPrefixOf!0 (_2!8901 lt!296721) (_2!8901 lt!296721))))

(assert (=> d!65625 (= lt!297725 (lemmaIsPrefixRefl!0 (_2!8901 lt!296721)))))

(declare-fun lt!297731 () Unit!13586)

(declare-fun lt!297734 () Unit!13586)

(assert (=> d!65625 (= lt!297731 lt!297734)))

(assert (=> d!65625 (= lt!297734 (lemmaIsPrefixRefl!0 (_2!8901 lt!296721)))))

(declare-fun lt!297728 () Unit!13586)

(declare-fun lt!297727 () Unit!13586)

(assert (=> d!65625 (= lt!297728 lt!297727)))

(assert (=> d!65625 (isPrefixOf!0 lt!297736 lt!297736)))

(assert (=> d!65625 (= lt!297727 (lemmaIsPrefixRefl!0 lt!297736))))

(declare-fun lt!297729 () Unit!13586)

(declare-fun lt!297722 () Unit!13586)

(assert (=> d!65625 (= lt!297729 lt!297722)))

(assert (=> d!65625 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65625 (= lt!297722 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65625 (= lt!297736 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(assert (=> d!65625 (isPrefixOf!0 thiss!1204 (_2!8901 lt!296721))))

(assert (=> d!65625 (= (reader!0 thiss!1204 (_2!8901 lt!296721)) lt!297724)))

(declare-fun lt!297730 () (_ BitVec 64))

(declare-fun b!191300 () Bool)

(declare-fun lt!297741 () (_ BitVec 64))

(assert (=> b!191300 (= e!131900 (= (_1!8903 lt!297724) (withMovedBitIndex!0 (_2!8903 lt!297724) (bvsub lt!297741 lt!297730))))))

(assert (=> b!191300 (or (= (bvand lt!297741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297741 lt!297730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191300 (= lt!297730 (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!296721))) (currentByte!9129 (_2!8901 lt!296721)) (currentBit!9124 (_2!8901 lt!296721))))))

(assert (=> b!191300 (= lt!297741 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(assert (= (and d!65625 c!9677) b!191298))

(assert (= (and d!65625 (not c!9677)) b!191296))

(assert (= (and d!65625 res!159623) b!191297))

(assert (= (and b!191297 res!159624) b!191299))

(assert (= (and b!191299 res!159622) b!191300))

(declare-fun m!297233 () Bool)

(assert (=> b!191299 m!297233))

(declare-fun m!297235 () Bool)

(assert (=> b!191300 m!297235))

(assert (=> b!191300 m!296571))

(assert (=> b!191300 m!296587))

(declare-fun m!297237 () Bool)

(assert (=> b!191297 m!297237))

(declare-fun m!297239 () Bool)

(assert (=> d!65625 m!297239))

(declare-fun m!297241 () Bool)

(assert (=> d!65625 m!297241))

(declare-fun m!297243 () Bool)

(assert (=> d!65625 m!297243))

(declare-fun m!297245 () Bool)

(assert (=> d!65625 m!297245))

(assert (=> d!65625 m!297211))

(declare-fun m!297247 () Bool)

(assert (=> d!65625 m!297247))

(assert (=> d!65625 m!296573))

(declare-fun m!297249 () Bool)

(assert (=> d!65625 m!297249))

(assert (=> d!65625 m!297215))

(declare-fun m!297251 () Bool)

(assert (=> d!65625 m!297251))

(declare-fun m!297253 () Bool)

(assert (=> d!65625 m!297253))

(assert (=> b!191298 m!296587))

(declare-fun m!297255 () Bool)

(assert (=> b!191298 m!297255))

(declare-fun m!297257 () Bool)

(assert (=> b!191298 m!297257))

(assert (=> b!190950 d!65625))

(declare-fun d!65627 () Bool)

(assert (=> d!65627 (= (invariant!0 (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296732)))) (and (bvsge (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9124 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9129 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296732)))) (and (= (currentBit!9124 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9129 thiss!1204) (size!4374 (buf!4851 (_2!8901 lt!296732))))))))))

(assert (=> b!190950 d!65627))

(declare-fun d!65629 () Bool)

(declare-fun lt!297742 () tuple2!16526)

(assert (=> d!65629 (= lt!297742 (readBit!0 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))))))

(assert (=> d!65629 (= (readBitPure!0 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204))) (tuple2!16519 (_2!8908 lt!297742) (_1!8908 lt!297742)))))

(declare-fun bs!16303 () Bool)

(assert (= bs!16303 d!65629))

(declare-fun m!297259 () Bool)

(assert (=> bs!16303 m!297259))

(assert (=> b!190950 d!65629))

(declare-fun lt!297743 () tuple2!16524)

(declare-fun d!65631 () Bool)

(assert (=> d!65631 (= lt!297743 (readNBitsLSBFirstsLoop!0 (_1!8903 lt!296728) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726))))

(assert (=> d!65631 (= (readNBitsLSBFirstsLoopPure!0 (_1!8903 lt!296728) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296726) (tuple2!16515 (_2!8907 lt!297743) (_1!8907 lt!297743)))))

(declare-fun bs!16304 () Bool)

(assert (= bs!16304 d!65631))

(declare-fun m!297261 () Bool)

(assert (=> bs!16304 m!297261))

(assert (=> b!190950 d!65631))

(declare-fun d!65633 () Bool)

(declare-fun lt!297744 () tuple2!16526)

(assert (=> d!65633 (= lt!297744 (readBit!0 (_1!8903 lt!296712)))))

(assert (=> d!65633 (= (readBitPure!0 (_1!8903 lt!296712)) (tuple2!16519 (_2!8908 lt!297744) (_1!8908 lt!297744)))))

(declare-fun bs!16305 () Bool)

(assert (= bs!16305 d!65633))

(declare-fun m!297263 () Bool)

(assert (=> bs!16305 m!297263))

(assert (=> b!190950 d!65633))

(declare-fun d!65635 () Bool)

(assert (=> d!65635 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)) lt!296719) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204))) lt!296719))))

(declare-fun bs!16306 () Bool)

(assert (= bs!16306 d!65635))

(declare-fun m!297265 () Bool)

(assert (=> bs!16306 m!297265))

(assert (=> b!190950 d!65635))

(declare-fun d!65637 () Bool)

(declare-fun e!131902 () Bool)

(assert (=> d!65637 e!131902))

(declare-fun res!159626 () Bool)

(assert (=> d!65637 (=> (not res!159626) (not e!131902))))

(declare-fun lt!297748 () (_ BitVec 64))

(declare-fun lt!297747 () (_ BitVec 64))

(declare-fun lt!297750 () (_ BitVec 64))

(assert (=> d!65637 (= res!159626 (= lt!297750 (bvsub lt!297747 lt!297748)))))

(assert (=> d!65637 (or (= (bvand lt!297747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297748 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297747 lt!297748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65637 (= lt!297748 (remainingBits!0 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296708)))) ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296708))) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296708)))))))

(declare-fun lt!297749 () (_ BitVec 64))

(declare-fun lt!297746 () (_ BitVec 64))

(assert (=> d!65637 (= lt!297747 (bvmul lt!297749 lt!297746))))

(assert (=> d!65637 (or (= lt!297749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297746 (bvsdiv (bvmul lt!297749 lt!297746) lt!297749)))))

(assert (=> d!65637 (= lt!297746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65637 (= lt!297749 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296708)))))))

(assert (=> d!65637 (= lt!297750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9129 (_1!8904 lt!296708))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9124 (_1!8904 lt!296708)))))))

(assert (=> d!65637 (invariant!0 (currentBit!9124 (_1!8904 lt!296708)) (currentByte!9129 (_1!8904 lt!296708)) (size!4374 (buf!4851 (_1!8904 lt!296708))))))

(assert (=> d!65637 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!296708))) (currentByte!9129 (_1!8904 lt!296708)) (currentBit!9124 (_1!8904 lt!296708))) lt!297750)))

(declare-fun b!191301 () Bool)

(declare-fun res!159625 () Bool)

(assert (=> b!191301 (=> (not res!159625) (not e!131902))))

(assert (=> b!191301 (= res!159625 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297750))))

(declare-fun b!191302 () Bool)

(declare-fun lt!297745 () (_ BitVec 64))

(assert (=> b!191302 (= e!131902 (bvsle lt!297750 (bvmul lt!297745 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191302 (or (= lt!297745 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297745 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297745)))))

(assert (=> b!191302 (= lt!297745 ((_ sign_extend 32) (size!4374 (buf!4851 (_1!8904 lt!296708)))))))

(assert (= (and d!65637 res!159626) b!191301))

(assert (= (and b!191301 res!159625) b!191302))

(declare-fun m!297267 () Bool)

(assert (=> d!65637 m!297267))

(declare-fun m!297269 () Bool)

(assert (=> d!65637 m!297269))

(assert (=> b!190950 d!65637))

(declare-fun d!65639 () Bool)

(assert (=> d!65639 (validate_offset_bits!1 ((_ sign_extend 32) (size!4374 (buf!4851 (_2!8901 lt!296721)))) ((_ sign_extend 32) (currentByte!9129 (_2!8901 lt!296732))) ((_ sign_extend 32) (currentBit!9124 (_2!8901 lt!296732))) lt!296718)))

(declare-fun lt!297751 () Unit!13586)

(assert (=> d!65639 (= lt!297751 (choose!9 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!296721)) lt!296718 (BitStream!7857 (buf!4851 (_2!8901 lt!296721)) (currentByte!9129 (_2!8901 lt!296732)) (currentBit!9124 (_2!8901 lt!296732)))))))

(assert (=> d!65639 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8901 lt!296732) (buf!4851 (_2!8901 lt!296721)) lt!296718) lt!297751)))

(declare-fun bs!16307 () Bool)

(assert (= bs!16307 d!65639))

(assert (=> bs!16307 m!296651))

(declare-fun m!297271 () Bool)

(assert (=> bs!16307 m!297271))

(assert (=> b!190950 d!65639))

(declare-fun d!65641 () Bool)

(declare-fun e!131903 () Bool)

(assert (=> d!65641 e!131903))

(declare-fun res!159627 () Bool)

(assert (=> d!65641 (=> (not res!159627) (not e!131903))))

(declare-fun lt!297752 () BitStream!7856)

(declare-fun lt!297753 () (_ BitVec 64))

(assert (=> d!65641 (= res!159627 (= (bvadd lt!297753 (bvsub lt!296733 lt!296706)) (bitIndex!0 (size!4374 (buf!4851 lt!297752)) (currentByte!9129 lt!297752) (currentBit!9124 lt!297752))))))

(assert (=> d!65641 (or (not (= (bvand lt!297753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296733 lt!296706) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297753 (bvsub lt!296733 lt!296706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65641 (= lt!297753 (bitIndex!0 (size!4374 (buf!4851 (_2!8903 lt!296728))) (currentByte!9129 (_2!8903 lt!296728)) (currentBit!9124 (_2!8903 lt!296728))))))

(assert (=> d!65641 (= lt!297752 (_2!8901 (moveBitIndex!0 (_2!8903 lt!296728) (bvsub lt!296733 lt!296706))))))

(assert (=> d!65641 (moveBitIndexPrecond!0 (_2!8903 lt!296728) (bvsub lt!296733 lt!296706))))

(assert (=> d!65641 (= (withMovedBitIndex!0 (_2!8903 lt!296728) (bvsub lt!296733 lt!296706)) lt!297752)))

(declare-fun b!191303 () Bool)

(assert (=> b!191303 (= e!131903 (= (size!4374 (buf!4851 (_2!8903 lt!296728))) (size!4374 (buf!4851 lt!297752))))))

(assert (= (and d!65641 res!159627) b!191303))

(declare-fun m!297273 () Bool)

(assert (=> d!65641 m!297273))

(declare-fun m!297275 () Bool)

(assert (=> d!65641 m!297275))

(declare-fun m!297277 () Bool)

(assert (=> d!65641 m!297277))

(declare-fun m!297279 () Bool)

(assert (=> d!65641 m!297279))

(assert (=> b!190961 d!65641))

(assert (=> b!190951 d!65541))

(assert (=> b!190951 d!65551))

(declare-fun d!65643 () Bool)

(declare-fun e!131923 () Bool)

(assert (=> d!65643 e!131923))

(declare-fun res!159659 () Bool)

(assert (=> d!65643 (=> (not res!159659) (not e!131923))))

(declare-fun lt!297835 () tuple2!16512)

(assert (=> d!65643 (= res!159659 (= (size!4374 (buf!4851 thiss!1204)) (size!4374 (buf!4851 (_2!8901 lt!297835)))))))

(declare-fun choose!16 (BitStream!7856 Bool) tuple2!16512)

(assert (=> d!65643 (= lt!297835 (choose!16 thiss!1204 lt!296716))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65643 (validate_offset_bit!0 ((_ sign_extend 32) (size!4374 (buf!4851 thiss!1204))) ((_ sign_extend 32) (currentByte!9129 thiss!1204)) ((_ sign_extend 32) (currentBit!9124 thiss!1204)))))

(assert (=> d!65643 (= (appendBit!0 thiss!1204 lt!296716) lt!297835)))

(declare-fun b!191337 () Bool)

(declare-fun res!159658 () Bool)

(assert (=> b!191337 (=> (not res!159658) (not e!131923))))

(declare-fun lt!297834 () (_ BitVec 64))

(declare-fun lt!297832 () (_ BitVec 64))

(assert (=> b!191337 (= res!159658 (= (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297835))) (currentByte!9129 (_2!8901 lt!297835)) (currentBit!9124 (_2!8901 lt!297835))) (bvadd lt!297834 lt!297832)))))

(assert (=> b!191337 (or (not (= (bvand lt!297834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297832 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297834 lt!297832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191337 (= lt!297832 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!191337 (= lt!297834 (bitIndex!0 (size!4374 (buf!4851 thiss!1204)) (currentByte!9129 thiss!1204) (currentBit!9124 thiss!1204)))))

(declare-fun b!191338 () Bool)

(declare-fun res!159657 () Bool)

(assert (=> b!191338 (=> (not res!159657) (not e!131923))))

(assert (=> b!191338 (= res!159657 (isPrefixOf!0 thiss!1204 (_2!8901 lt!297835)))))

(declare-fun b!191340 () Bool)

(declare-fun e!131922 () Bool)

(declare-fun lt!297833 () tuple2!16518)

(assert (=> b!191340 (= e!131922 (= (bitIndex!0 (size!4374 (buf!4851 (_1!8904 lt!297833))) (currentByte!9129 (_1!8904 lt!297833)) (currentBit!9124 (_1!8904 lt!297833))) (bitIndex!0 (size!4374 (buf!4851 (_2!8901 lt!297835))) (currentByte!9129 (_2!8901 lt!297835)) (currentBit!9124 (_2!8901 lt!297835)))))))

(declare-fun b!191339 () Bool)

(assert (=> b!191339 (= e!131923 e!131922)))

(declare-fun res!159656 () Bool)

(assert (=> b!191339 (=> (not res!159656) (not e!131922))))

(assert (=> b!191339 (= res!159656 (and (= (_2!8904 lt!297833) lt!296716) (= (_1!8904 lt!297833) (_2!8901 lt!297835))))))

(assert (=> b!191339 (= lt!297833 (readBitPure!0 (readerFrom!0 (_2!8901 lt!297835) (currentBit!9124 thiss!1204) (currentByte!9129 thiss!1204))))))

(assert (= (and d!65643 res!159659) b!191337))

(assert (= (and b!191337 res!159658) b!191338))

(assert (= (and b!191338 res!159657) b!191339))

(assert (= (and b!191339 res!159656) b!191340))

(declare-fun m!297389 () Bool)

(assert (=> b!191339 m!297389))

(assert (=> b!191339 m!297389))

(declare-fun m!297391 () Bool)

(assert (=> b!191339 m!297391))

(declare-fun m!297393 () Bool)

(assert (=> d!65643 m!297393))

(declare-fun m!297395 () Bool)

(assert (=> d!65643 m!297395))

(declare-fun m!297397 () Bool)

(assert (=> b!191338 m!297397))

(declare-fun m!297399 () Bool)

(assert (=> b!191337 m!297399))

(assert (=> b!191337 m!296587))

(declare-fun m!297401 () Bool)

(assert (=> b!191340 m!297401))

(assert (=> b!191340 m!297399))

(assert (=> b!190951 d!65643))

(push 1)

(assert (not d!65609))

(assert (not b!191337))

(assert (not b!191227))

(assert (not d!65607))

(assert (not d!65625))

(assert (not d!65551))

(assert (not d!65533))

(assert (not b!191134))

(assert (not d!65613))

(assert (not d!65581))

(assert (not b!191132))

(assert (not b!191300))

(assert (not b!191340))

(assert (not b!191298))

(assert (not d!65623))

(assert (not d!65603))

(assert (not b!191129))

(assert (not d!65565))

(assert (not b!191230))

(assert (not b!191099))

(assert (not d!65617))

(assert (not d!65575))

(assert (not b!191237))

(assert (not d!65569))

(assert (not d!65629))

(assert (not b!191127))

(assert (not b!191226))

(assert (not d!65621))

(assert (not d!65641))

(assert (not d!65601))

(assert (not d!65615))

(assert (not b!191235))

(assert (not b!191292))

(assert (not d!65631))

(assert (not d!65619))

(assert (not b!191299))

(assert (not d!65559))

(assert (not d!65633))

(assert (not b!191236))

(assert (not d!65561))

(assert (not b!191223))

(assert (not b!191124))

(assert (not b!191293))

(assert (not d!65639))

(assert (not d!65521))

(assert (not b!191097))

(assert (not d!65605))

(assert (not b!191233))

(assert (not d!65579))

(assert (not d!65517))

(assert (not d!65635))

(assert (not d!65643))

(assert (not d!65563))

(assert (not b!191224))

(assert (not d!65637))

(assert (not bm!3041))

(assert (not b!191294))

(assert (not d!65541))

(assert (not b!191338))

(assert (not b!191297))

(assert (not b!191339))

(assert (not b!191295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

