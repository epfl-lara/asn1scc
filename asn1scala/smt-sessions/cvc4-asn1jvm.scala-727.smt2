; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20342 () Bool)

(assert start!20342)

(declare-fun b!102138 () Bool)

(declare-fun e!66805 () Bool)

(declare-datatypes ((array!4786 0))(
  ( (array!4787 (arr!2777 (Array (_ BitVec 32) (_ BitVec 8))) (size!2184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3842 0))(
  ( (BitStream!3843 (buf!2544 array!4786) (currentByte!5017 (_ BitVec 32)) (currentBit!5012 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3842)

(declare-datatypes ((Unit!6264 0))(
  ( (Unit!6265) )
))
(declare-datatypes ((tuple2!8296 0))(
  ( (tuple2!8297 (_1!4403 Unit!6264) (_2!4403 BitStream!3842)) )
))
(declare-fun lt!148610 () tuple2!8296)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102138 (= e!66805 (invariant!0 (currentBit!5012 thiss!1305) (currentByte!5017 thiss!1305) (size!2184 (buf!2544 (_2!4403 lt!148610)))))))

(declare-fun b!102139 () Bool)

(declare-fun res!83960 () Bool)

(assert (=> b!102139 (=> (not res!83960) (not e!66805))))

(declare-fun lt!148602 () tuple2!8296)

(assert (=> b!102139 (= res!83960 (invariant!0 (currentBit!5012 thiss!1305) (currentByte!5017 thiss!1305) (size!2184 (buf!2544 (_2!4403 lt!148602)))))))

(declare-fun b!102140 () Bool)

(declare-fun e!66813 () Bool)

(declare-fun e!66804 () Bool)

(assert (=> b!102140 (= e!66813 e!66804)))

(declare-fun res!83965 () Bool)

(assert (=> b!102140 (=> (not res!83965) (not e!66804))))

(declare-datatypes ((tuple2!8298 0))(
  ( (tuple2!8299 (_1!4404 BitStream!3842) (_2!4404 Bool)) )
))
(declare-fun lt!148599 () tuple2!8298)

(declare-fun lt!148601 () Bool)

(assert (=> b!102140 (= res!83965 (and (= (_2!4404 lt!148599) lt!148601) (= (_1!4404 lt!148599) (_2!4403 lt!148602))))))

(declare-fun readBitPure!0 (BitStream!3842) tuple2!8298)

(declare-fun readerFrom!0 (BitStream!3842 (_ BitVec 32) (_ BitVec 32)) BitStream!3842)

(assert (=> b!102140 (= lt!148599 (readBitPure!0 (readerFrom!0 (_2!4403 lt!148602) (currentBit!5012 thiss!1305) (currentByte!5017 thiss!1305))))))

(declare-fun res!83961 () Bool)

(declare-fun e!66803 () Bool)

(assert (=> start!20342 (=> (not res!83961) (not e!66803))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20342 (= res!83961 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20342 e!66803))

(assert (=> start!20342 true))

(declare-fun e!66809 () Bool)

(declare-fun inv!12 (BitStream!3842) Bool)

(assert (=> start!20342 (and (inv!12 thiss!1305) e!66809)))

(declare-fun b!102141 () Bool)

(declare-fun lt!148607 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102141 (= e!66804 (= (bitIndex!0 (size!2184 (buf!2544 (_1!4404 lt!148599))) (currentByte!5017 (_1!4404 lt!148599)) (currentBit!5012 (_1!4404 lt!148599))) lt!148607))))

(declare-fun b!102142 () Bool)

(declare-fun e!66807 () Bool)

(assert (=> b!102142 (= e!66807 e!66813)))

(declare-fun res!83957 () Bool)

(assert (=> b!102142 (=> (not res!83957) (not e!66813))))

(declare-fun lt!148600 () (_ BitVec 64))

(assert (=> b!102142 (= res!83957 (= lt!148607 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148600)))))

(assert (=> b!102142 (= lt!148607 (bitIndex!0 (size!2184 (buf!2544 (_2!4403 lt!148602))) (currentByte!5017 (_2!4403 lt!148602)) (currentBit!5012 (_2!4403 lt!148602))))))

(assert (=> b!102142 (= lt!148600 (bitIndex!0 (size!2184 (buf!2544 thiss!1305)) (currentByte!5017 thiss!1305) (currentBit!5012 thiss!1305)))))

(declare-fun b!102143 () Bool)

(declare-fun array_inv!1986 (array!4786) Bool)

(assert (=> b!102143 (= e!66809 (array_inv!1986 (buf!2544 thiss!1305)))))

(declare-fun lt!148605 () (_ BitVec 64))

(declare-fun lt!148597 () (_ BitVec 64))

(declare-fun b!102144 () Bool)

(declare-fun lt!148608 () (_ BitVec 64))

(declare-fun e!66812 () Bool)

(assert (=> b!102144 (= e!66812 (or (not (= (bvand lt!148597 lt!148605) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148597 lt!148608) lt!148597)))))

(declare-fun b!102145 () Bool)

(declare-fun e!66811 () Bool)

(assert (=> b!102145 (= e!66803 e!66811)))

(declare-fun res!83963 () Bool)

(assert (=> b!102145 (=> (not res!83963) (not e!66811))))

(declare-fun lt!148606 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102145 (= res!83963 (validate_offset_bits!1 ((_ sign_extend 32) (size!2184 (buf!2544 thiss!1305))) ((_ sign_extend 32) (currentByte!5017 thiss!1305)) ((_ sign_extend 32) (currentBit!5012 thiss!1305)) lt!148606))))

(assert (=> b!102145 (= lt!148606 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102146 () Bool)

(declare-fun res!83964 () Bool)

(assert (=> b!102146 (=> (not res!83964) (not e!66813))))

(declare-fun isPrefixOf!0 (BitStream!3842 BitStream!3842) Bool)

(assert (=> b!102146 (= res!83964 (isPrefixOf!0 thiss!1305 (_2!4403 lt!148602)))))

(declare-fun b!102147 () Bool)

(declare-fun e!66808 () Bool)

(assert (=> b!102147 (= e!66808 (not e!66812))))

(declare-fun res!83956 () Bool)

(assert (=> b!102147 (=> res!83956 e!66812)))

(declare-datatypes ((tuple2!8300 0))(
  ( (tuple2!8301 (_1!4405 BitStream!3842) (_2!4405 BitStream!3842)) )
))
(declare-fun lt!148596 () tuple2!8300)

(assert (=> b!102147 (= res!83956 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2184 (buf!2544 (_1!4405 lt!148596)))) ((_ sign_extend 32) (currentByte!5017 (_1!4405 lt!148596))) ((_ sign_extend 32) (currentBit!5012 (_1!4405 lt!148596))) lt!148606)))))

(assert (=> b!102147 (validate_offset_bits!1 ((_ sign_extend 32) (size!2184 (buf!2544 (_2!4403 lt!148610)))) ((_ sign_extend 32) (currentByte!5017 thiss!1305)) ((_ sign_extend 32) (currentBit!5012 thiss!1305)) lt!148606)))

(declare-fun lt!148603 () Unit!6264)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3842 array!4786 (_ BitVec 64)) Unit!6264)

(assert (=> b!102147 (= lt!148603 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2544 (_2!4403 lt!148610)) lt!148606))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!102147 (= lt!148597 (bvand v!199 (bvnot lt!148605)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102147 (= lt!148605 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!102147 (= (_2!4404 (readBitPure!0 (_1!4405 lt!148596))) lt!148601)))

(declare-fun lt!148612 () tuple2!8300)

(declare-fun reader!0 (BitStream!3842 BitStream!3842) tuple2!8300)

(assert (=> b!102147 (= lt!148612 (reader!0 (_2!4403 lt!148602) (_2!4403 lt!148610)))))

(assert (=> b!102147 (= lt!148596 (reader!0 thiss!1305 (_2!4403 lt!148610)))))

(declare-fun e!66810 () Bool)

(assert (=> b!102147 e!66810))

(declare-fun res!83962 () Bool)

(assert (=> b!102147 (=> (not res!83962) (not e!66810))))

(declare-fun lt!148609 () tuple2!8298)

(declare-fun lt!148604 () tuple2!8298)

(assert (=> b!102147 (= res!83962 (= (bitIndex!0 (size!2184 (buf!2544 (_1!4404 lt!148609))) (currentByte!5017 (_1!4404 lt!148609)) (currentBit!5012 (_1!4404 lt!148609))) (bitIndex!0 (size!2184 (buf!2544 (_1!4404 lt!148604))) (currentByte!5017 (_1!4404 lt!148604)) (currentBit!5012 (_1!4404 lt!148604)))))))

(declare-fun lt!148598 () Unit!6264)

(declare-fun lt!148611 () BitStream!3842)

(declare-fun readBitPrefixLemma!0 (BitStream!3842 BitStream!3842) Unit!6264)

(assert (=> b!102147 (= lt!148598 (readBitPrefixLemma!0 lt!148611 (_2!4403 lt!148610)))))

(assert (=> b!102147 (= lt!148604 (readBitPure!0 (BitStream!3843 (buf!2544 (_2!4403 lt!148610)) (currentByte!5017 thiss!1305) (currentBit!5012 thiss!1305))))))

(assert (=> b!102147 (= lt!148609 (readBitPure!0 lt!148611))))

(assert (=> b!102147 (= lt!148611 (BitStream!3843 (buf!2544 (_2!4403 lt!148602)) (currentByte!5017 thiss!1305) (currentBit!5012 thiss!1305)))))

(assert (=> b!102147 e!66805))

(declare-fun res!83958 () Bool)

(assert (=> b!102147 (=> (not res!83958) (not e!66805))))

(assert (=> b!102147 (= res!83958 (isPrefixOf!0 thiss!1305 (_2!4403 lt!148610)))))

(declare-fun lt!148595 () Unit!6264)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3842 BitStream!3842 BitStream!3842) Unit!6264)

(assert (=> b!102147 (= lt!148595 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4403 lt!148602) (_2!4403 lt!148610)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8296)

(assert (=> b!102147 (= lt!148610 (appendNLeastSignificantBitsLoop!0 (_2!4403 lt!148602) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102147 e!66807))

(declare-fun res!83959 () Bool)

(assert (=> b!102147 (=> (not res!83959) (not e!66807))))

(assert (=> b!102147 (= res!83959 (= (size!2184 (buf!2544 thiss!1305)) (size!2184 (buf!2544 (_2!4403 lt!148602)))))))

(declare-fun appendBit!0 (BitStream!3842 Bool) tuple2!8296)

(assert (=> b!102147 (= lt!148602 (appendBit!0 thiss!1305 lt!148601))))

(assert (=> b!102147 (= lt!148601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102148 () Bool)

(assert (=> b!102148 (= e!66810 (= (_2!4404 lt!148609) (_2!4404 lt!148604)))))

(declare-fun b!102149 () Bool)

(assert (=> b!102149 (= e!66811 e!66808)))

(declare-fun res!83966 () Bool)

(assert (=> b!102149 (=> (not res!83966) (not e!66808))))

(assert (=> b!102149 (= res!83966 (and (= (bvand v!199 lt!148608) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!102149 (= lt!148608 (onesLSBLong!0 nBits!396))))

(assert (= (and start!20342 res!83961) b!102145))

(assert (= (and b!102145 res!83963) b!102149))

(assert (= (and b!102149 res!83966) b!102147))

(assert (= (and b!102147 res!83959) b!102142))

(assert (= (and b!102142 res!83957) b!102146))

(assert (= (and b!102146 res!83964) b!102140))

(assert (= (and b!102140 res!83965) b!102141))

(assert (= (and b!102147 res!83958) b!102139))

(assert (= (and b!102139 res!83960) b!102138))

(assert (= (and b!102147 res!83962) b!102148))

(assert (= (and b!102147 (not res!83956)) b!102144))

(assert (= start!20342 b!102143))

(declare-fun m!148715 () Bool)

(assert (=> b!102147 m!148715))

(declare-fun m!148717 () Bool)

(assert (=> b!102147 m!148717))

(declare-fun m!148719 () Bool)

(assert (=> b!102147 m!148719))

(declare-fun m!148721 () Bool)

(assert (=> b!102147 m!148721))

(declare-fun m!148723 () Bool)

(assert (=> b!102147 m!148723))

(declare-fun m!148725 () Bool)

(assert (=> b!102147 m!148725))

(declare-fun m!148727 () Bool)

(assert (=> b!102147 m!148727))

(declare-fun m!148729 () Bool)

(assert (=> b!102147 m!148729))

(declare-fun m!148731 () Bool)

(assert (=> b!102147 m!148731))

(declare-fun m!148733 () Bool)

(assert (=> b!102147 m!148733))

(declare-fun m!148735 () Bool)

(assert (=> b!102147 m!148735))

(declare-fun m!148737 () Bool)

(assert (=> b!102147 m!148737))

(declare-fun m!148739 () Bool)

(assert (=> b!102147 m!148739))

(declare-fun m!148741 () Bool)

(assert (=> b!102147 m!148741))

(declare-fun m!148743 () Bool)

(assert (=> b!102147 m!148743))

(declare-fun m!148745 () Bool)

(assert (=> b!102147 m!148745))

(declare-fun m!148747 () Bool)

(assert (=> b!102145 m!148747))

(declare-fun m!148749 () Bool)

(assert (=> b!102141 m!148749))

(declare-fun m!148751 () Bool)

(assert (=> b!102138 m!148751))

(declare-fun m!148753 () Bool)

(assert (=> b!102142 m!148753))

(declare-fun m!148755 () Bool)

(assert (=> b!102142 m!148755))

(declare-fun m!148757 () Bool)

(assert (=> b!102146 m!148757))

(declare-fun m!148759 () Bool)

(assert (=> b!102143 m!148759))

(declare-fun m!148761 () Bool)

(assert (=> b!102140 m!148761))

(assert (=> b!102140 m!148761))

(declare-fun m!148763 () Bool)

(assert (=> b!102140 m!148763))

(declare-fun m!148765 () Bool)

(assert (=> b!102149 m!148765))

(declare-fun m!148767 () Bool)

(assert (=> b!102139 m!148767))

(declare-fun m!148769 () Bool)

(assert (=> start!20342 m!148769))

(push 1)

(assert (not b!102147))

(assert (not b!102146))

(assert (not b!102141))

(assert (not b!102139))

(assert (not b!102145))

(assert (not start!20342))

(assert (not b!102140))

(assert (not b!102143))

(assert (not b!102149))

(assert (not b!102142))

(assert (not b!102138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

