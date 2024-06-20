; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43612 () Bool)

(assert start!43612)

(declare-fun b!206594 () Bool)

(declare-fun res!173244 () Bool)

(declare-fun e!141253 () Bool)

(assert (=> b!206594 (=> (not res!173244) (not e!141253))))

(declare-datatypes ((array!10395 0))(
  ( (array!10396 (arr!5499 (Array (_ BitVec 32) (_ BitVec 8))) (size!4569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8246 0))(
  ( (BitStream!8247 (buf!5074 array!10395) (currentByte!9592 (_ BitVec 32)) (currentBit!9587 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8246)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206594 (= res!173244 (invariant!0 (currentBit!9587 thiss!1204) (currentByte!9592 thiss!1204) (size!4569 (buf!5074 thiss!1204))))))

(declare-fun b!206595 () Bool)

(declare-fun e!141254 () Bool)

(assert (=> b!206595 (= e!141253 (not e!141254))))

(declare-fun res!173243 () Bool)

(assert (=> b!206595 (=> res!173243 e!141254)))

(declare-fun lt!322773 () (_ BitVec 64))

(declare-fun lt!322768 () (_ BitVec 64))

(assert (=> b!206595 (= res!173243 (not (= lt!322773 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322768))))))

(declare-datatypes ((Unit!14732 0))(
  ( (Unit!14733) )
))
(declare-datatypes ((tuple2!17660 0))(
  ( (tuple2!17661 (_1!9485 Unit!14732) (_2!9485 BitStream!8246)) )
))
(declare-fun lt!322777 () tuple2!17660)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206595 (= lt!322773 (bitIndex!0 (size!4569 (buf!5074 (_2!9485 lt!322777))) (currentByte!9592 (_2!9485 lt!322777)) (currentBit!9587 (_2!9485 lt!322777))))))

(assert (=> b!206595 (= lt!322768 (bitIndex!0 (size!4569 (buf!5074 thiss!1204)) (currentByte!9592 thiss!1204) (currentBit!9587 thiss!1204)))))

(declare-fun e!141251 () Bool)

(assert (=> b!206595 e!141251))

(declare-fun res!173254 () Bool)

(assert (=> b!206595 (=> (not res!173254) (not e!141251))))

(assert (=> b!206595 (= res!173254 (= (size!4569 (buf!5074 thiss!1204)) (size!4569 (buf!5074 (_2!9485 lt!322777)))))))

(declare-fun lt!322781 () Bool)

(declare-fun appendBit!0 (BitStream!8246 Bool) tuple2!17660)

(assert (=> b!206595 (= lt!322777 (appendBit!0 thiss!1204 lt!322781))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206595 (= lt!322781 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206596 () Bool)

(declare-fun e!141250 () Bool)

(assert (=> b!206596 (= e!141250 true)))

(declare-datatypes ((tuple2!17662 0))(
  ( (tuple2!17663 (_1!9486 BitStream!8246) (_2!9486 BitStream!8246)) )
))
(declare-fun lt!322769 () tuple2!17662)

(declare-datatypes ((tuple2!17664 0))(
  ( (tuple2!17665 (_1!9487 BitStream!8246) (_2!9487 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8246) tuple2!17664)

(assert (=> b!206596 (= (_2!9487 (readBitPure!0 (_1!9486 lt!322769))) lt!322781)))

(declare-fun lt!322779 () tuple2!17662)

(declare-fun lt!322767 () tuple2!17660)

(declare-fun reader!0 (BitStream!8246 BitStream!8246) tuple2!17662)

(assert (=> b!206596 (= lt!322779 (reader!0 (_2!9485 lt!322777) (_2!9485 lt!322767)))))

(assert (=> b!206596 (= lt!322769 (reader!0 thiss!1204 (_2!9485 lt!322767)))))

(declare-fun e!141249 () Bool)

(assert (=> b!206596 e!141249))

(declare-fun res!173251 () Bool)

(assert (=> b!206596 (=> (not res!173251) (not e!141249))))

(declare-fun lt!322770 () tuple2!17664)

(declare-fun lt!322775 () tuple2!17664)

(assert (=> b!206596 (= res!173251 (= (bitIndex!0 (size!4569 (buf!5074 (_1!9487 lt!322770))) (currentByte!9592 (_1!9487 lt!322770)) (currentBit!9587 (_1!9487 lt!322770))) (bitIndex!0 (size!4569 (buf!5074 (_1!9487 lt!322775))) (currentByte!9592 (_1!9487 lt!322775)) (currentBit!9587 (_1!9487 lt!322775)))))))

(declare-fun lt!322771 () Unit!14732)

(declare-fun lt!322778 () BitStream!8246)

(declare-fun readBitPrefixLemma!0 (BitStream!8246 BitStream!8246) Unit!14732)

(assert (=> b!206596 (= lt!322771 (readBitPrefixLemma!0 lt!322778 (_2!9485 lt!322767)))))

(assert (=> b!206596 (= lt!322775 (readBitPure!0 (BitStream!8247 (buf!5074 (_2!9485 lt!322767)) (currentByte!9592 thiss!1204) (currentBit!9587 thiss!1204))))))

(assert (=> b!206596 (= lt!322770 (readBitPure!0 lt!322778))))

(declare-fun e!141252 () Bool)

(assert (=> b!206596 e!141252))

(declare-fun res!173248 () Bool)

(assert (=> b!206596 (=> (not res!173248) (not e!141252))))

(assert (=> b!206596 (= res!173248 (invariant!0 (currentBit!9587 thiss!1204) (currentByte!9592 thiss!1204) (size!4569 (buf!5074 (_2!9485 lt!322777)))))))

(assert (=> b!206596 (= lt!322778 (BitStream!8247 (buf!5074 (_2!9485 lt!322777)) (currentByte!9592 thiss!1204) (currentBit!9587 thiss!1204)))))

(declare-fun b!206597 () Bool)

(declare-fun e!141255 () Bool)

(declare-fun e!141248 () Bool)

(assert (=> b!206597 (= e!141255 e!141248)))

(declare-fun res!173245 () Bool)

(assert (=> b!206597 (=> (not res!173245) (not e!141248))))

(declare-fun lt!322772 () tuple2!17664)

(assert (=> b!206597 (= res!173245 (and (= (_2!9487 lt!322772) lt!322781) (= (_1!9487 lt!322772) (_2!9485 lt!322777))))))

(declare-fun readerFrom!0 (BitStream!8246 (_ BitVec 32) (_ BitVec 32)) BitStream!8246)

(assert (=> b!206597 (= lt!322772 (readBitPure!0 (readerFrom!0 (_2!9485 lt!322777) (currentBit!9587 thiss!1204) (currentByte!9592 thiss!1204))))))

(declare-fun b!206598 () Bool)

(declare-fun res!173247 () Bool)

(assert (=> b!206598 (=> res!173247 e!141250)))

(assert (=> b!206598 (= res!173247 (not (invariant!0 (currentBit!9587 (_2!9485 lt!322767)) (currentByte!9592 (_2!9485 lt!322767)) (size!4569 (buf!5074 (_2!9485 lt!322767))))))))

(declare-fun b!206599 () Bool)

(declare-fun res!173257 () Bool)

(assert (=> b!206599 (=> res!173257 e!141250)))

(declare-fun isPrefixOf!0 (BitStream!8246 BitStream!8246) Bool)

(assert (=> b!206599 (= res!173257 (not (isPrefixOf!0 (_2!9485 lt!322777) (_2!9485 lt!322767))))))

(declare-fun b!206600 () Bool)

(assert (=> b!206600 (= e!141249 (= (_2!9487 lt!322770) (_2!9487 lt!322775)))))

(declare-fun b!206601 () Bool)

(declare-fun res!173246 () Bool)

(assert (=> b!206601 (=> res!173246 e!141250)))

(assert (=> b!206601 (= res!173246 (not (isPrefixOf!0 thiss!1204 (_2!9485 lt!322777))))))

(declare-fun b!206602 () Bool)

(declare-fun res!173250 () Bool)

(assert (=> b!206602 (=> (not res!173250) (not e!141253))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206602 (= res!173250 (not (= i!590 nBits!348)))))

(declare-fun res!173252 () Bool)

(assert (=> start!43612 (=> (not res!173252) (not e!141253))))

(assert (=> start!43612 (= res!173252 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43612 e!141253))

(assert (=> start!43612 true))

(declare-fun e!141247 () Bool)

(declare-fun inv!12 (BitStream!8246) Bool)

(assert (=> start!43612 (and (inv!12 thiss!1204) e!141247)))

(declare-fun b!206603 () Bool)

(assert (=> b!206603 (= e!141251 e!141255)))

(declare-fun res!173249 () Bool)

(assert (=> b!206603 (=> (not res!173249) (not e!141255))))

(declare-fun lt!322766 () (_ BitVec 64))

(declare-fun lt!322774 () (_ BitVec 64))

(assert (=> b!206603 (= res!173249 (= lt!322766 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322774)))))

(assert (=> b!206603 (= lt!322766 (bitIndex!0 (size!4569 (buf!5074 (_2!9485 lt!322777))) (currentByte!9592 (_2!9485 lt!322777)) (currentBit!9587 (_2!9485 lt!322777))))))

(assert (=> b!206603 (= lt!322774 (bitIndex!0 (size!4569 (buf!5074 thiss!1204)) (currentByte!9592 thiss!1204) (currentBit!9587 thiss!1204)))))

(declare-fun b!206604 () Bool)

(declare-fun res!173253 () Bool)

(assert (=> b!206604 (=> res!173253 e!141250)))

(declare-fun lt!322780 () (_ BitVec 64))

(assert (=> b!206604 (= res!173253 (or (not (= (size!4569 (buf!5074 (_2!9485 lt!322767))) (size!4569 (buf!5074 thiss!1204)))) (not (= lt!322780 (bvsub (bvadd lt!322768 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206605 () Bool)

(assert (=> b!206605 (= e!141248 (= (bitIndex!0 (size!4569 (buf!5074 (_1!9487 lt!322772))) (currentByte!9592 (_1!9487 lt!322772)) (currentBit!9587 (_1!9487 lt!322772))) lt!322766))))

(declare-fun b!206606 () Bool)

(declare-fun res!173255 () Bool)

(assert (=> b!206606 (=> (not res!173255) (not e!141253))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206606 (= res!173255 (validate_offset_bits!1 ((_ sign_extend 32) (size!4569 (buf!5074 thiss!1204))) ((_ sign_extend 32) (currentByte!9592 thiss!1204)) ((_ sign_extend 32) (currentBit!9587 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206607 () Bool)

(assert (=> b!206607 (= e!141252 (invariant!0 (currentBit!9587 thiss!1204) (currentByte!9592 thiss!1204) (size!4569 (buf!5074 (_2!9485 lt!322767)))))))

(declare-fun b!206608 () Bool)

(declare-fun array_inv!4310 (array!10395) Bool)

(assert (=> b!206608 (= e!141247 (array_inv!4310 (buf!5074 thiss!1204)))))

(declare-fun b!206609 () Bool)

(assert (=> b!206609 (= e!141254 e!141250)))

(declare-fun res!173256 () Bool)

(assert (=> b!206609 (=> res!173256 e!141250)))

(assert (=> b!206609 (= res!173256 (not (= lt!322780 (bvsub (bvsub (bvadd lt!322773 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206609 (= lt!322780 (bitIndex!0 (size!4569 (buf!5074 (_2!9485 lt!322767))) (currentByte!9592 (_2!9485 lt!322767)) (currentBit!9587 (_2!9485 lt!322767))))))

(assert (=> b!206609 (isPrefixOf!0 thiss!1204 (_2!9485 lt!322767))))

(declare-fun lt!322776 () Unit!14732)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8246 BitStream!8246 BitStream!8246) Unit!14732)

(assert (=> b!206609 (= lt!322776 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9485 lt!322777) (_2!9485 lt!322767)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17660)

(assert (=> b!206609 (= lt!322767 (appendBitsLSBFirstLoopTR!0 (_2!9485 lt!322777) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206610 () Bool)

(declare-fun res!173258 () Bool)

(assert (=> b!206610 (=> (not res!173258) (not e!141255))))

(assert (=> b!206610 (= res!173258 (isPrefixOf!0 thiss!1204 (_2!9485 lt!322777)))))

(assert (= (and start!43612 res!173252) b!206606))

(assert (= (and b!206606 res!173255) b!206594))

(assert (= (and b!206594 res!173244) b!206602))

(assert (= (and b!206602 res!173250) b!206595))

(assert (= (and b!206595 res!173254) b!206603))

(assert (= (and b!206603 res!173249) b!206610))

(assert (= (and b!206610 res!173258) b!206597))

(assert (= (and b!206597 res!173245) b!206605))

(assert (= (and b!206595 (not res!173243)) b!206609))

(assert (= (and b!206609 (not res!173256)) b!206598))

(assert (= (and b!206598 (not res!173247)) b!206604))

(assert (= (and b!206604 (not res!173253)) b!206599))

(assert (= (and b!206599 (not res!173257)) b!206601))

(assert (= (and b!206601 (not res!173246)) b!206596))

(assert (= (and b!206596 res!173248) b!206607))

(assert (= (and b!206596 res!173251) b!206600))

(assert (= start!43612 b!206608))

(declare-fun m!318165 () Bool)

(assert (=> b!206598 m!318165))

(declare-fun m!318167 () Bool)

(assert (=> b!206601 m!318167))

(declare-fun m!318169 () Bool)

(assert (=> b!206603 m!318169))

(declare-fun m!318171 () Bool)

(assert (=> b!206603 m!318171))

(declare-fun m!318173 () Bool)

(assert (=> b!206606 m!318173))

(declare-fun m!318175 () Bool)

(assert (=> start!43612 m!318175))

(declare-fun m!318177 () Bool)

(assert (=> b!206599 m!318177))

(declare-fun m!318179 () Bool)

(assert (=> b!206594 m!318179))

(assert (=> b!206595 m!318169))

(assert (=> b!206595 m!318171))

(declare-fun m!318181 () Bool)

(assert (=> b!206595 m!318181))

(declare-fun m!318183 () Bool)

(assert (=> b!206597 m!318183))

(assert (=> b!206597 m!318183))

(declare-fun m!318185 () Bool)

(assert (=> b!206597 m!318185))

(declare-fun m!318187 () Bool)

(assert (=> b!206609 m!318187))

(declare-fun m!318189 () Bool)

(assert (=> b!206609 m!318189))

(declare-fun m!318191 () Bool)

(assert (=> b!206609 m!318191))

(declare-fun m!318193 () Bool)

(assert (=> b!206609 m!318193))

(declare-fun m!318195 () Bool)

(assert (=> b!206608 m!318195))

(declare-fun m!318197 () Bool)

(assert (=> b!206596 m!318197))

(declare-fun m!318199 () Bool)

(assert (=> b!206596 m!318199))

(declare-fun m!318201 () Bool)

(assert (=> b!206596 m!318201))

(declare-fun m!318203 () Bool)

(assert (=> b!206596 m!318203))

(declare-fun m!318205 () Bool)

(assert (=> b!206596 m!318205))

(declare-fun m!318207 () Bool)

(assert (=> b!206596 m!318207))

(declare-fun m!318209 () Bool)

(assert (=> b!206596 m!318209))

(declare-fun m!318211 () Bool)

(assert (=> b!206596 m!318211))

(declare-fun m!318213 () Bool)

(assert (=> b!206596 m!318213))

(declare-fun m!318215 () Bool)

(assert (=> b!206607 m!318215))

(declare-fun m!318217 () Bool)

(assert (=> b!206605 m!318217))

(assert (=> b!206610 m!318167))

(push 1)

(assert (not b!206610))

(assert (not b!206606))

(assert (not b!206608))

(assert (not b!206603))

(assert (not b!206596))

(assert (not b!206601))

(assert (not start!43612))

(assert (not b!206595))

(assert (not b!206607))

(assert (not b!206609))

(assert (not b!206598))

(assert (not b!206597))

(assert (not b!206594))

(assert (not b!206599))

(assert (not b!206605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

