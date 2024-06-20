; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43610 () Bool)

(assert start!43610)

(declare-fun b!206543 () Bool)

(declare-fun res!173206 () Bool)

(declare-fun e!141219 () Bool)

(assert (=> b!206543 (=> (not res!173206) (not e!141219))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206543 (= res!173206 (not (= i!590 nBits!348)))))

(declare-fun b!206544 () Bool)

(declare-fun e!141220 () Bool)

(assert (=> b!206544 (= e!141220 true)))

(declare-datatypes ((array!10393 0))(
  ( (array!10394 (arr!5498 (Array (_ BitVec 32) (_ BitVec 8))) (size!4568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8244 0))(
  ( (BitStream!8245 (buf!5073 array!10393) (currentByte!9591 (_ BitVec 32)) (currentBit!9586 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17654 0))(
  ( (tuple2!17655 (_1!9482 BitStream!8244) (_2!9482 BitStream!8244)) )
))
(declare-fun lt!322729 () tuple2!17654)

(declare-fun lt!322733 () Bool)

(declare-datatypes ((tuple2!17656 0))(
  ( (tuple2!17657 (_1!9483 BitStream!8244) (_2!9483 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8244) tuple2!17656)

(assert (=> b!206544 (= (_2!9483 (readBitPure!0 (_1!9482 lt!322729))) lt!322733)))

(declare-fun lt!322732 () tuple2!17654)

(declare-datatypes ((Unit!14730 0))(
  ( (Unit!14731) )
))
(declare-datatypes ((tuple2!17658 0))(
  ( (tuple2!17659 (_1!9484 Unit!14730) (_2!9484 BitStream!8244)) )
))
(declare-fun lt!322724 () tuple2!17658)

(declare-fun lt!322728 () tuple2!17658)

(declare-fun reader!0 (BitStream!8244 BitStream!8244) tuple2!17654)

(assert (=> b!206544 (= lt!322732 (reader!0 (_2!9484 lt!322724) (_2!9484 lt!322728)))))

(declare-fun thiss!1204 () BitStream!8244)

(assert (=> b!206544 (= lt!322729 (reader!0 thiss!1204 (_2!9484 lt!322728)))))

(declare-fun e!141223 () Bool)

(assert (=> b!206544 e!141223))

(declare-fun res!173201 () Bool)

(assert (=> b!206544 (=> (not res!173201) (not e!141223))))

(declare-fun lt!322727 () tuple2!17656)

(declare-fun lt!322718 () tuple2!17656)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206544 (= res!173201 (= (bitIndex!0 (size!4568 (buf!5073 (_1!9483 lt!322727))) (currentByte!9591 (_1!9483 lt!322727)) (currentBit!9586 (_1!9483 lt!322727))) (bitIndex!0 (size!4568 (buf!5073 (_1!9483 lt!322718))) (currentByte!9591 (_1!9483 lt!322718)) (currentBit!9586 (_1!9483 lt!322718)))))))

(declare-fun lt!322731 () Unit!14730)

(declare-fun lt!322722 () BitStream!8244)

(declare-fun readBitPrefixLemma!0 (BitStream!8244 BitStream!8244) Unit!14730)

(assert (=> b!206544 (= lt!322731 (readBitPrefixLemma!0 lt!322722 (_2!9484 lt!322728)))))

(assert (=> b!206544 (= lt!322718 (readBitPure!0 (BitStream!8245 (buf!5073 (_2!9484 lt!322728)) (currentByte!9591 thiss!1204) (currentBit!9586 thiss!1204))))))

(assert (=> b!206544 (= lt!322727 (readBitPure!0 lt!322722))))

(declare-fun e!141216 () Bool)

(assert (=> b!206544 e!141216))

(declare-fun res!173205 () Bool)

(assert (=> b!206544 (=> (not res!173205) (not e!141216))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206544 (= res!173205 (invariant!0 (currentBit!9586 thiss!1204) (currentByte!9591 thiss!1204) (size!4568 (buf!5073 (_2!9484 lt!322724)))))))

(assert (=> b!206544 (= lt!322722 (BitStream!8245 (buf!5073 (_2!9484 lt!322724)) (currentByte!9591 thiss!1204) (currentBit!9586 thiss!1204)))))

(declare-fun b!206545 () Bool)

(declare-fun res!173210 () Bool)

(assert (=> b!206545 (=> (not res!173210) (not e!141219))))

(assert (=> b!206545 (= res!173210 (invariant!0 (currentBit!9586 thiss!1204) (currentByte!9591 thiss!1204) (size!4568 (buf!5073 thiss!1204))))))

(declare-fun b!206546 () Bool)

(declare-fun e!141225 () Bool)

(assert (=> b!206546 (= e!141219 (not e!141225))))

(declare-fun res!173208 () Bool)

(assert (=> b!206546 (=> res!173208 e!141225)))

(declare-fun lt!322723 () (_ BitVec 64))

(declare-fun lt!322730 () (_ BitVec 64))

(assert (=> b!206546 (= res!173208 (not (= lt!322723 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322730))))))

(assert (=> b!206546 (= lt!322723 (bitIndex!0 (size!4568 (buf!5073 (_2!9484 lt!322724))) (currentByte!9591 (_2!9484 lt!322724)) (currentBit!9586 (_2!9484 lt!322724))))))

(assert (=> b!206546 (= lt!322730 (bitIndex!0 (size!4568 (buf!5073 thiss!1204)) (currentByte!9591 thiss!1204) (currentBit!9586 thiss!1204)))))

(declare-fun e!141221 () Bool)

(assert (=> b!206546 e!141221))

(declare-fun res!173195 () Bool)

(assert (=> b!206546 (=> (not res!173195) (not e!141221))))

(assert (=> b!206546 (= res!173195 (= (size!4568 (buf!5073 thiss!1204)) (size!4568 (buf!5073 (_2!9484 lt!322724)))))))

(declare-fun appendBit!0 (BitStream!8244 Bool) tuple2!17658)

(assert (=> b!206546 (= lt!322724 (appendBit!0 thiss!1204 lt!322733))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206546 (= lt!322733 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!173196 () Bool)

(assert (=> start!43610 (=> (not res!173196) (not e!141219))))

(assert (=> start!43610 (= res!173196 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43610 e!141219))

(assert (=> start!43610 true))

(declare-fun e!141222 () Bool)

(declare-fun inv!12 (BitStream!8244) Bool)

(assert (=> start!43610 (and (inv!12 thiss!1204) e!141222)))

(declare-fun b!206547 () Bool)

(declare-fun res!173199 () Bool)

(assert (=> b!206547 (=> res!173199 e!141220)))

(declare-fun lt!322719 () (_ BitVec 64))

(assert (=> b!206547 (= res!173199 (or (not (= (size!4568 (buf!5073 (_2!9484 lt!322728))) (size!4568 (buf!5073 thiss!1204)))) (not (= lt!322719 (bvsub (bvadd lt!322730 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206548 () Bool)

(declare-fun e!141224 () Bool)

(assert (=> b!206548 (= e!141221 e!141224)))

(declare-fun res!173198 () Bool)

(assert (=> b!206548 (=> (not res!173198) (not e!141224))))

(declare-fun lt!322726 () (_ BitVec 64))

(declare-fun lt!322725 () (_ BitVec 64))

(assert (=> b!206548 (= res!173198 (= lt!322726 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322725)))))

(assert (=> b!206548 (= lt!322726 (bitIndex!0 (size!4568 (buf!5073 (_2!9484 lt!322724))) (currentByte!9591 (_2!9484 lt!322724)) (currentBit!9586 (_2!9484 lt!322724))))))

(assert (=> b!206548 (= lt!322725 (bitIndex!0 (size!4568 (buf!5073 thiss!1204)) (currentByte!9591 thiss!1204) (currentBit!9586 thiss!1204)))))

(declare-fun b!206549 () Bool)

(declare-fun e!141217 () Bool)

(assert (=> b!206549 (= e!141224 e!141217)))

(declare-fun res!173207 () Bool)

(assert (=> b!206549 (=> (not res!173207) (not e!141217))))

(declare-fun lt!322720 () tuple2!17656)

(assert (=> b!206549 (= res!173207 (and (= (_2!9483 lt!322720) lt!322733) (= (_1!9483 lt!322720) (_2!9484 lt!322724))))))

(declare-fun readerFrom!0 (BitStream!8244 (_ BitVec 32) (_ BitVec 32)) BitStream!8244)

(assert (=> b!206549 (= lt!322720 (readBitPure!0 (readerFrom!0 (_2!9484 lt!322724) (currentBit!9586 thiss!1204) (currentByte!9591 thiss!1204))))))

(declare-fun b!206550 () Bool)

(declare-fun res!173204 () Bool)

(assert (=> b!206550 (=> (not res!173204) (not e!141224))))

(declare-fun isPrefixOf!0 (BitStream!8244 BitStream!8244) Bool)

(assert (=> b!206550 (= res!173204 (isPrefixOf!0 thiss!1204 (_2!9484 lt!322724)))))

(declare-fun b!206551 () Bool)

(declare-fun res!173203 () Bool)

(assert (=> b!206551 (=> (not res!173203) (not e!141219))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206551 (= res!173203 (validate_offset_bits!1 ((_ sign_extend 32) (size!4568 (buf!5073 thiss!1204))) ((_ sign_extend 32) (currentByte!9591 thiss!1204)) ((_ sign_extend 32) (currentBit!9586 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206552 () Bool)

(declare-fun res!173202 () Bool)

(assert (=> b!206552 (=> res!173202 e!141220)))

(assert (=> b!206552 (= res!173202 (not (isPrefixOf!0 (_2!9484 lt!322724) (_2!9484 lt!322728))))))

(declare-fun b!206553 () Bool)

(assert (=> b!206553 (= e!141223 (= (_2!9483 lt!322727) (_2!9483 lt!322718)))))

(declare-fun b!206554 () Bool)

(declare-fun res!173197 () Bool)

(assert (=> b!206554 (=> res!173197 e!141220)))

(assert (=> b!206554 (= res!173197 (not (isPrefixOf!0 thiss!1204 (_2!9484 lt!322724))))))

(declare-fun b!206555 () Bool)

(assert (=> b!206555 (= e!141217 (= (bitIndex!0 (size!4568 (buf!5073 (_1!9483 lt!322720))) (currentByte!9591 (_1!9483 lt!322720)) (currentBit!9586 (_1!9483 lt!322720))) lt!322726))))

(declare-fun b!206556 () Bool)

(declare-fun array_inv!4309 (array!10393) Bool)

(assert (=> b!206556 (= e!141222 (array_inv!4309 (buf!5073 thiss!1204)))))

(declare-fun b!206557 () Bool)

(assert (=> b!206557 (= e!141225 e!141220)))

(declare-fun res!173209 () Bool)

(assert (=> b!206557 (=> res!173209 e!141220)))

(assert (=> b!206557 (= res!173209 (not (= lt!322719 (bvsub (bvsub (bvadd lt!322723 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206557 (= lt!322719 (bitIndex!0 (size!4568 (buf!5073 (_2!9484 lt!322728))) (currentByte!9591 (_2!9484 lt!322728)) (currentBit!9586 (_2!9484 lt!322728))))))

(assert (=> b!206557 (isPrefixOf!0 thiss!1204 (_2!9484 lt!322728))))

(declare-fun lt!322721 () Unit!14730)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8244 BitStream!8244 BitStream!8244) Unit!14730)

(assert (=> b!206557 (= lt!322721 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9484 lt!322724) (_2!9484 lt!322728)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17658)

(assert (=> b!206557 (= lt!322728 (appendBitsLSBFirstLoopTR!0 (_2!9484 lt!322724) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206558 () Bool)

(assert (=> b!206558 (= e!141216 (invariant!0 (currentBit!9586 thiss!1204) (currentByte!9591 thiss!1204) (size!4568 (buf!5073 (_2!9484 lt!322728)))))))

(declare-fun b!206559 () Bool)

(declare-fun res!173200 () Bool)

(assert (=> b!206559 (=> res!173200 e!141220)))

(assert (=> b!206559 (= res!173200 (not (invariant!0 (currentBit!9586 (_2!9484 lt!322728)) (currentByte!9591 (_2!9484 lt!322728)) (size!4568 (buf!5073 (_2!9484 lt!322728))))))))

(assert (= (and start!43610 res!173196) b!206551))

(assert (= (and b!206551 res!173203) b!206545))

(assert (= (and b!206545 res!173210) b!206543))

(assert (= (and b!206543 res!173206) b!206546))

(assert (= (and b!206546 res!173195) b!206548))

(assert (= (and b!206548 res!173198) b!206550))

(assert (= (and b!206550 res!173204) b!206549))

(assert (= (and b!206549 res!173207) b!206555))

(assert (= (and b!206546 (not res!173208)) b!206557))

(assert (= (and b!206557 (not res!173209)) b!206559))

(assert (= (and b!206559 (not res!173200)) b!206547))

(assert (= (and b!206547 (not res!173199)) b!206552))

(assert (= (and b!206552 (not res!173202)) b!206554))

(assert (= (and b!206554 (not res!173197)) b!206544))

(assert (= (and b!206544 res!173205) b!206558))

(assert (= (and b!206544 res!173201) b!206553))

(assert (= start!43610 b!206556))

(declare-fun m!318111 () Bool)

(assert (=> b!206548 m!318111))

(declare-fun m!318113 () Bool)

(assert (=> b!206548 m!318113))

(declare-fun m!318115 () Bool)

(assert (=> b!206551 m!318115))

(declare-fun m!318117 () Bool)

(assert (=> b!206556 m!318117))

(declare-fun m!318119 () Bool)

(assert (=> b!206545 m!318119))

(declare-fun m!318121 () Bool)

(assert (=> b!206552 m!318121))

(declare-fun m!318123 () Bool)

(assert (=> b!206550 m!318123))

(declare-fun m!318125 () Bool)

(assert (=> b!206544 m!318125))

(declare-fun m!318127 () Bool)

(assert (=> b!206544 m!318127))

(declare-fun m!318129 () Bool)

(assert (=> b!206544 m!318129))

(declare-fun m!318131 () Bool)

(assert (=> b!206544 m!318131))

(declare-fun m!318133 () Bool)

(assert (=> b!206544 m!318133))

(declare-fun m!318135 () Bool)

(assert (=> b!206544 m!318135))

(declare-fun m!318137 () Bool)

(assert (=> b!206544 m!318137))

(declare-fun m!318139 () Bool)

(assert (=> b!206544 m!318139))

(declare-fun m!318141 () Bool)

(assert (=> b!206544 m!318141))

(assert (=> b!206546 m!318111))

(assert (=> b!206546 m!318113))

(declare-fun m!318143 () Bool)

(assert (=> b!206546 m!318143))

(declare-fun m!318145 () Bool)

(assert (=> b!206555 m!318145))

(assert (=> b!206554 m!318123))

(declare-fun m!318147 () Bool)

(assert (=> b!206558 m!318147))

(declare-fun m!318149 () Bool)

(assert (=> b!206549 m!318149))

(assert (=> b!206549 m!318149))

(declare-fun m!318151 () Bool)

(assert (=> b!206549 m!318151))

(declare-fun m!318153 () Bool)

(assert (=> b!206557 m!318153))

(declare-fun m!318155 () Bool)

(assert (=> b!206557 m!318155))

(declare-fun m!318157 () Bool)

(assert (=> b!206557 m!318157))

(declare-fun m!318159 () Bool)

(assert (=> b!206557 m!318159))

(declare-fun m!318161 () Bool)

(assert (=> b!206559 m!318161))

(declare-fun m!318163 () Bool)

(assert (=> start!43610 m!318163))

(check-sat (not b!206552) (not b!206555) (not b!206546) (not b!206551) (not b!206550) (not b!206554) (not b!206549) (not b!206545) (not b!206548) (not b!206557) (not b!206544) (not start!43610) (not b!206556) (not b!206559) (not b!206558))
