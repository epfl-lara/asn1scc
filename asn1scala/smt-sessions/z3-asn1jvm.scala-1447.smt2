; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39718 () Bool)

(assert start!39718)

(declare-fun b!179702 () Bool)

(declare-fun e!124954 () Bool)

(declare-datatypes ((array!9652 0))(
  ( (array!9653 (arr!5186 (Array (_ BitVec 32) (_ BitVec 8))) (size!4256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7620 0))(
  ( (BitStream!7621 (buf!4699 array!9652) (currentByte!8909 (_ BitVec 32)) (currentBit!8904 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7620)

(declare-datatypes ((Unit!12931 0))(
  ( (Unit!12932) )
))
(declare-datatypes ((tuple2!15482 0))(
  ( (tuple2!15483 (_1!8386 Unit!12931) (_2!8386 BitStream!7620)) )
))
(declare-fun lt!275850 () tuple2!15482)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179702 (= e!124954 (invariant!0 (currentBit!8904 thiss!1204) (currentByte!8909 thiss!1204) (size!4256 (buf!4699 (_2!8386 lt!275850)))))))

(declare-fun b!179703 () Bool)

(declare-fun e!124959 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!179703 (= e!124959 (bvsle i!590 #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!15484 0))(
  ( (tuple2!15485 (_1!8387 BitStream!7620) (_2!8387 BitStream!7620)) )
))
(declare-fun lt!275841 () tuple2!15484)

(declare-fun lt!275844 () Bool)

(declare-datatypes ((tuple2!15486 0))(
  ( (tuple2!15487 (_1!8388 BitStream!7620) (_2!8388 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7620) tuple2!15486)

(assert (=> b!179703 (= (_2!8388 (readBitPure!0 (_1!8387 lt!275841))) lt!275844)))

(declare-fun lt!275847 () tuple2!15484)

(declare-fun lt!275851 () tuple2!15482)

(declare-fun reader!0 (BitStream!7620 BitStream!7620) tuple2!15484)

(assert (=> b!179703 (= lt!275847 (reader!0 (_2!8386 lt!275851) (_2!8386 lt!275850)))))

(assert (=> b!179703 (= lt!275841 (reader!0 thiss!1204 (_2!8386 lt!275850)))))

(declare-fun e!124951 () Bool)

(assert (=> b!179703 e!124951))

(declare-fun res!149142 () Bool)

(assert (=> b!179703 (=> (not res!149142) (not e!124951))))

(declare-fun lt!275848 () tuple2!15486)

(declare-fun lt!275843 () tuple2!15486)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179703 (= res!149142 (= (bitIndex!0 (size!4256 (buf!4699 (_1!8388 lt!275848))) (currentByte!8909 (_1!8388 lt!275848)) (currentBit!8904 (_1!8388 lt!275848))) (bitIndex!0 (size!4256 (buf!4699 (_1!8388 lt!275843))) (currentByte!8909 (_1!8388 lt!275843)) (currentBit!8904 (_1!8388 lt!275843)))))))

(declare-fun lt!275842 () Unit!12931)

(declare-fun lt!275845 () BitStream!7620)

(declare-fun readBitPrefixLemma!0 (BitStream!7620 BitStream!7620) Unit!12931)

(assert (=> b!179703 (= lt!275842 (readBitPrefixLemma!0 lt!275845 (_2!8386 lt!275850)))))

(assert (=> b!179703 (= lt!275843 (readBitPure!0 (BitStream!7621 (buf!4699 (_2!8386 lt!275850)) (currentByte!8909 thiss!1204) (currentBit!8904 thiss!1204))))))

(assert (=> b!179703 (= lt!275848 (readBitPure!0 lt!275845))))

(assert (=> b!179703 e!124954))

(declare-fun res!149134 () Bool)

(assert (=> b!179703 (=> (not res!149134) (not e!124954))))

(assert (=> b!179703 (= res!149134 (invariant!0 (currentBit!8904 thiss!1204) (currentByte!8909 thiss!1204) (size!4256 (buf!4699 (_2!8386 lt!275851)))))))

(assert (=> b!179703 (= lt!275845 (BitStream!7621 (buf!4699 (_2!8386 lt!275851)) (currentByte!8909 thiss!1204) (currentBit!8904 thiss!1204)))))

(declare-fun res!149130 () Bool)

(declare-fun e!124956 () Bool)

(assert (=> start!39718 (=> (not res!149130) (not e!124956))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39718 (= res!149130 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39718 e!124956))

(assert (=> start!39718 true))

(declare-fun e!124958 () Bool)

(declare-fun inv!12 (BitStream!7620) Bool)

(assert (=> start!39718 (and (inv!12 thiss!1204) e!124958)))

(declare-fun b!179704 () Bool)

(declare-fun e!124952 () Bool)

(declare-fun e!124960 () Bool)

(assert (=> b!179704 (= e!124952 e!124960)))

(declare-fun res!149143 () Bool)

(assert (=> b!179704 (=> (not res!149143) (not e!124960))))

(declare-fun lt!275846 () tuple2!15486)

(assert (=> b!179704 (= res!149143 (and (= (_2!8388 lt!275846) lt!275844) (= (_1!8388 lt!275846) (_2!8386 lt!275851))))))

(declare-fun readerFrom!0 (BitStream!7620 (_ BitVec 32) (_ BitVec 32)) BitStream!7620)

(assert (=> b!179704 (= lt!275846 (readBitPure!0 (readerFrom!0 (_2!8386 lt!275851) (currentBit!8904 thiss!1204) (currentByte!8909 thiss!1204))))))

(declare-fun b!179705 () Bool)

(declare-fun res!149132 () Bool)

(assert (=> b!179705 (=> res!149132 e!124959)))

(declare-fun isPrefixOf!0 (BitStream!7620 BitStream!7620) Bool)

(assert (=> b!179705 (= res!149132 (not (isPrefixOf!0 thiss!1204 (_2!8386 lt!275851))))))

(declare-fun b!179706 () Bool)

(declare-fun res!149136 () Bool)

(assert (=> b!179706 (=> res!149136 e!124959)))

(assert (=> b!179706 (= res!149136 (not (invariant!0 (currentBit!8904 (_2!8386 lt!275850)) (currentByte!8909 (_2!8386 lt!275850)) (size!4256 (buf!4699 (_2!8386 lt!275850))))))))

(declare-fun b!179707 () Bool)

(declare-fun res!149137 () Bool)

(assert (=> b!179707 (=> (not res!149137) (not e!124952))))

(assert (=> b!179707 (= res!149137 (isPrefixOf!0 thiss!1204 (_2!8386 lt!275851)))))

(declare-fun b!179708 () Bool)

(declare-fun e!124953 () Bool)

(assert (=> b!179708 (= e!124953 e!124959)))

(declare-fun res!149139 () Bool)

(assert (=> b!179708 (=> res!149139 e!124959)))

(declare-fun lt!275855 () (_ BitVec 64))

(declare-fun lt!275849 () (_ BitVec 64))

(assert (=> b!179708 (= res!149139 (not (= lt!275849 (bvsub (bvsub (bvadd lt!275855 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179708 (= lt!275849 (bitIndex!0 (size!4256 (buf!4699 (_2!8386 lt!275850))) (currentByte!8909 (_2!8386 lt!275850)) (currentBit!8904 (_2!8386 lt!275850))))))

(assert (=> b!179708 (isPrefixOf!0 thiss!1204 (_2!8386 lt!275850))))

(declare-fun lt!275852 () Unit!12931)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7620 BitStream!7620 BitStream!7620) Unit!12931)

(assert (=> b!179708 (= lt!275852 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8386 lt!275851) (_2!8386 lt!275850)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15482)

(assert (=> b!179708 (= lt!275850 (appendBitsLSBFirstLoopTR!0 (_2!8386 lt!275851) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179709 () Bool)

(declare-fun res!149145 () Bool)

(assert (=> b!179709 (=> (not res!149145) (not e!124956))))

(assert (=> b!179709 (= res!149145 (invariant!0 (currentBit!8904 thiss!1204) (currentByte!8909 thiss!1204) (size!4256 (buf!4699 thiss!1204))))))

(declare-fun b!179710 () Bool)

(declare-fun res!149138 () Bool)

(assert (=> b!179710 (=> (not res!149138) (not e!124956))))

(assert (=> b!179710 (= res!149138 (not (= i!590 nBits!348)))))

(declare-fun b!179711 () Bool)

(declare-fun res!149144 () Bool)

(assert (=> b!179711 (=> res!149144 e!124959)))

(declare-fun lt!275854 () (_ BitVec 64))

(assert (=> b!179711 (= res!149144 (or (not (= (size!4256 (buf!4699 (_2!8386 lt!275850))) (size!4256 (buf!4699 thiss!1204)))) (not (= lt!275849 (bvsub (bvadd lt!275854 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179712 () Bool)

(declare-fun res!149140 () Bool)

(assert (=> b!179712 (=> (not res!149140) (not e!124956))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179712 (= res!149140 (validate_offset_bits!1 ((_ sign_extend 32) (size!4256 (buf!4699 thiss!1204))) ((_ sign_extend 32) (currentByte!8909 thiss!1204)) ((_ sign_extend 32) (currentBit!8904 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179713 () Bool)

(declare-fun e!124955 () Bool)

(assert (=> b!179713 (= e!124955 e!124952)))

(declare-fun res!149141 () Bool)

(assert (=> b!179713 (=> (not res!149141) (not e!124952))))

(declare-fun lt!275840 () (_ BitVec 64))

(declare-fun lt!275853 () (_ BitVec 64))

(assert (=> b!179713 (= res!149141 (= lt!275840 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275853)))))

(assert (=> b!179713 (= lt!275840 (bitIndex!0 (size!4256 (buf!4699 (_2!8386 lt!275851))) (currentByte!8909 (_2!8386 lt!275851)) (currentBit!8904 (_2!8386 lt!275851))))))

(assert (=> b!179713 (= lt!275853 (bitIndex!0 (size!4256 (buf!4699 thiss!1204)) (currentByte!8909 thiss!1204) (currentBit!8904 thiss!1204)))))

(declare-fun b!179714 () Bool)

(declare-fun res!149131 () Bool)

(assert (=> b!179714 (=> res!149131 e!124959)))

(assert (=> b!179714 (= res!149131 (not (isPrefixOf!0 (_2!8386 lt!275851) (_2!8386 lt!275850))))))

(declare-fun b!179715 () Bool)

(assert (=> b!179715 (= e!124956 (not e!124953))))

(declare-fun res!149135 () Bool)

(assert (=> b!179715 (=> res!149135 e!124953)))

(assert (=> b!179715 (= res!149135 (not (= lt!275855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275854))))))

(assert (=> b!179715 (= lt!275855 (bitIndex!0 (size!4256 (buf!4699 (_2!8386 lt!275851))) (currentByte!8909 (_2!8386 lt!275851)) (currentBit!8904 (_2!8386 lt!275851))))))

(assert (=> b!179715 (= lt!275854 (bitIndex!0 (size!4256 (buf!4699 thiss!1204)) (currentByte!8909 thiss!1204) (currentBit!8904 thiss!1204)))))

(assert (=> b!179715 e!124955))

(declare-fun res!149133 () Bool)

(assert (=> b!179715 (=> (not res!149133) (not e!124955))))

(assert (=> b!179715 (= res!149133 (= (size!4256 (buf!4699 thiss!1204)) (size!4256 (buf!4699 (_2!8386 lt!275851)))))))

(declare-fun appendBit!0 (BitStream!7620 Bool) tuple2!15482)

(assert (=> b!179715 (= lt!275851 (appendBit!0 thiss!1204 lt!275844))))

(assert (=> b!179715 (= lt!275844 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179716 () Bool)

(assert (=> b!179716 (= e!124951 (= (_2!8388 lt!275848) (_2!8388 lt!275843)))))

(declare-fun b!179717 () Bool)

(assert (=> b!179717 (= e!124960 (= (bitIndex!0 (size!4256 (buf!4699 (_1!8388 lt!275846))) (currentByte!8909 (_1!8388 lt!275846)) (currentBit!8904 (_1!8388 lt!275846))) lt!275840))))

(declare-fun b!179718 () Bool)

(declare-fun array_inv!3997 (array!9652) Bool)

(assert (=> b!179718 (= e!124958 (array_inv!3997 (buf!4699 thiss!1204)))))

(assert (= (and start!39718 res!149130) b!179712))

(assert (= (and b!179712 res!149140) b!179709))

(assert (= (and b!179709 res!149145) b!179710))

(assert (= (and b!179710 res!149138) b!179715))

(assert (= (and b!179715 res!149133) b!179713))

(assert (= (and b!179713 res!149141) b!179707))

(assert (= (and b!179707 res!149137) b!179704))

(assert (= (and b!179704 res!149143) b!179717))

(assert (= (and b!179715 (not res!149135)) b!179708))

(assert (= (and b!179708 (not res!149139)) b!179706))

(assert (= (and b!179706 (not res!149136)) b!179711))

(assert (= (and b!179711 (not res!149144)) b!179714))

(assert (= (and b!179714 (not res!149131)) b!179705))

(assert (= (and b!179705 (not res!149132)) b!179703))

(assert (= (and b!179703 res!149134) b!179702))

(assert (= (and b!179703 res!149142) b!179716))

(assert (= start!39718 b!179718))

(declare-fun m!280057 () Bool)

(assert (=> b!179707 m!280057))

(declare-fun m!280059 () Bool)

(assert (=> b!179712 m!280059))

(declare-fun m!280061 () Bool)

(assert (=> b!179709 m!280061))

(declare-fun m!280063 () Bool)

(assert (=> b!179718 m!280063))

(assert (=> b!179705 m!280057))

(declare-fun m!280065 () Bool)

(assert (=> b!179706 m!280065))

(declare-fun m!280067 () Bool)

(assert (=> b!179715 m!280067))

(declare-fun m!280069 () Bool)

(assert (=> b!179715 m!280069))

(declare-fun m!280071 () Bool)

(assert (=> b!179715 m!280071))

(declare-fun m!280073 () Bool)

(assert (=> b!179717 m!280073))

(declare-fun m!280075 () Bool)

(assert (=> b!179714 m!280075))

(assert (=> b!179713 m!280067))

(assert (=> b!179713 m!280069))

(declare-fun m!280077 () Bool)

(assert (=> b!179704 m!280077))

(assert (=> b!179704 m!280077))

(declare-fun m!280079 () Bool)

(assert (=> b!179704 m!280079))

(declare-fun m!280081 () Bool)

(assert (=> start!39718 m!280081))

(declare-fun m!280083 () Bool)

(assert (=> b!179703 m!280083))

(declare-fun m!280085 () Bool)

(assert (=> b!179703 m!280085))

(declare-fun m!280087 () Bool)

(assert (=> b!179703 m!280087))

(declare-fun m!280089 () Bool)

(assert (=> b!179703 m!280089))

(declare-fun m!280091 () Bool)

(assert (=> b!179703 m!280091))

(declare-fun m!280093 () Bool)

(assert (=> b!179703 m!280093))

(declare-fun m!280095 () Bool)

(assert (=> b!179703 m!280095))

(declare-fun m!280097 () Bool)

(assert (=> b!179703 m!280097))

(declare-fun m!280099 () Bool)

(assert (=> b!179703 m!280099))

(declare-fun m!280101 () Bool)

(assert (=> b!179708 m!280101))

(declare-fun m!280103 () Bool)

(assert (=> b!179708 m!280103))

(declare-fun m!280105 () Bool)

(assert (=> b!179708 m!280105))

(declare-fun m!280107 () Bool)

(assert (=> b!179708 m!280107))

(declare-fun m!280109 () Bool)

(assert (=> b!179702 m!280109))

(check-sat (not b!179713) (not start!39718) (not b!179714) (not b!179702) (not b!179709) (not b!179706) (not b!179717) (not b!179705) (not b!179715) (not b!179712) (not b!179704) (not b!179718) (not b!179703) (not b!179707) (not b!179708))
(check-sat)
