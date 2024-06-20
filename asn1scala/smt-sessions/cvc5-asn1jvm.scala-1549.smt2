; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43590 () Bool)

(assert start!43590)

(declare-fun b!206033 () Bool)

(declare-fun e!140912 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206033 (= e!140912 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((array!10373 0))(
  ( (array!10374 (arr!5488 (Array (_ BitVec 32) (_ BitVec 8))) (size!4558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8224 0))(
  ( (BitStream!8225 (buf!5063 array!10373) (currentByte!9581 (_ BitVec 32)) (currentBit!9576 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17594 0))(
  ( (tuple2!17595 (_1!9452 BitStream!8224) (_2!9452 BitStream!8224)) )
))
(declare-fun lt!322241 () tuple2!17594)

(declare-fun lt!322238 () Bool)

(declare-datatypes ((tuple2!17596 0))(
  ( (tuple2!17597 (_1!9453 BitStream!8224) (_2!9453 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8224) tuple2!17596)

(assert (=> b!206033 (= (_2!9453 (readBitPure!0 (_1!9452 lt!322241))) lt!322238)))

(declare-fun lt!322231 () tuple2!17594)

(declare-datatypes ((Unit!14710 0))(
  ( (Unit!14711) )
))
(declare-datatypes ((tuple2!17598 0))(
  ( (tuple2!17599 (_1!9454 Unit!14710) (_2!9454 BitStream!8224)) )
))
(declare-fun lt!322236 () tuple2!17598)

(declare-fun lt!322243 () tuple2!17598)

(declare-fun reader!0 (BitStream!8224 BitStream!8224) tuple2!17594)

(assert (=> b!206033 (= lt!322231 (reader!0 (_2!9454 lt!322236) (_2!9454 lt!322243)))))

(declare-fun thiss!1204 () BitStream!8224)

(assert (=> b!206033 (= lt!322241 (reader!0 thiss!1204 (_2!9454 lt!322243)))))

(declare-fun e!140911 () Bool)

(assert (=> b!206033 e!140911))

(declare-fun res!172717 () Bool)

(assert (=> b!206033 (=> (not res!172717) (not e!140911))))

(declare-fun lt!322229 () tuple2!17596)

(declare-fun lt!322239 () tuple2!17596)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206033 (= res!172717 (= (bitIndex!0 (size!4558 (buf!5063 (_1!9453 lt!322229))) (currentByte!9581 (_1!9453 lt!322229)) (currentBit!9576 (_1!9453 lt!322229))) (bitIndex!0 (size!4558 (buf!5063 (_1!9453 lt!322239))) (currentByte!9581 (_1!9453 lt!322239)) (currentBit!9576 (_1!9453 lt!322239)))))))

(declare-fun lt!322235 () Unit!14710)

(declare-fun lt!322240 () BitStream!8224)

(declare-fun readBitPrefixLemma!0 (BitStream!8224 BitStream!8224) Unit!14710)

(assert (=> b!206033 (= lt!322235 (readBitPrefixLemma!0 lt!322240 (_2!9454 lt!322243)))))

(assert (=> b!206033 (= lt!322239 (readBitPure!0 (BitStream!8225 (buf!5063 (_2!9454 lt!322243)) (currentByte!9581 thiss!1204) (currentBit!9576 thiss!1204))))))

(assert (=> b!206033 (= lt!322229 (readBitPure!0 lt!322240))))

(declare-fun e!140909 () Bool)

(assert (=> b!206033 e!140909))

(declare-fun res!172718 () Bool)

(assert (=> b!206033 (=> (not res!172718) (not e!140909))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206033 (= res!172718 (invariant!0 (currentBit!9576 thiss!1204) (currentByte!9581 thiss!1204) (size!4558 (buf!5063 (_2!9454 lt!322236)))))))

(assert (=> b!206033 (= lt!322240 (BitStream!8225 (buf!5063 (_2!9454 lt!322236)) (currentByte!9581 thiss!1204) (currentBit!9576 thiss!1204)))))

(declare-fun b!206034 () Bool)

(declare-fun res!172723 () Bool)

(declare-fun e!140907 () Bool)

(assert (=> b!206034 (=> (not res!172723) (not e!140907))))

(assert (=> b!206034 (= res!172723 (not (= i!590 nBits!348)))))

(declare-fun b!206035 () Bool)

(declare-fun res!172722 () Bool)

(assert (=> b!206035 (=> res!172722 e!140912)))

(declare-fun lt!322233 () (_ BitVec 64))

(declare-fun lt!322242 () (_ BitVec 64))

(assert (=> b!206035 (= res!172722 (or (not (= (size!4558 (buf!5063 (_2!9454 lt!322243))) (size!4558 (buf!5063 thiss!1204)))) (not (= lt!322242 (bvsub (bvadd lt!322233 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206036 () Bool)

(declare-fun res!172719 () Bool)

(assert (=> b!206036 (=> (not res!172719) (not e!140907))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206036 (= res!172719 (validate_offset_bits!1 ((_ sign_extend 32) (size!4558 (buf!5063 thiss!1204))) ((_ sign_extend 32) (currentByte!9581 thiss!1204)) ((_ sign_extend 32) (currentBit!9576 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206037 () Bool)

(declare-fun e!140915 () Bool)

(assert (=> b!206037 (= e!140915 e!140912)))

(declare-fun res!172724 () Bool)

(assert (=> b!206037 (=> res!172724 e!140912)))

(declare-fun lt!322230 () (_ BitVec 64))

(assert (=> b!206037 (= res!172724 (not (= lt!322242 (bvsub (bvsub (bvadd lt!322230 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206037 (= lt!322242 (bitIndex!0 (size!4558 (buf!5063 (_2!9454 lt!322243))) (currentByte!9581 (_2!9454 lt!322243)) (currentBit!9576 (_2!9454 lt!322243))))))

(declare-fun isPrefixOf!0 (BitStream!8224 BitStream!8224) Bool)

(assert (=> b!206037 (isPrefixOf!0 thiss!1204 (_2!9454 lt!322243))))

(declare-fun lt!322232 () Unit!14710)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8224 BitStream!8224 BitStream!8224) Unit!14710)

(assert (=> b!206037 (= lt!322232 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9454 lt!322236) (_2!9454 lt!322243)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17598)

(assert (=> b!206037 (= lt!322243 (appendBitsLSBFirstLoopTR!0 (_2!9454 lt!322236) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206039 () Bool)

(declare-fun res!172716 () Bool)

(assert (=> b!206039 (=> (not res!172716) (not e!140907))))

(assert (=> b!206039 (= res!172716 (invariant!0 (currentBit!9576 thiss!1204) (currentByte!9581 thiss!1204) (size!4558 (buf!5063 thiss!1204))))))

(declare-fun b!206040 () Bool)

(declare-fun e!140916 () Bool)

(declare-fun e!140908 () Bool)

(assert (=> b!206040 (= e!140916 e!140908)))

(declare-fun res!172730 () Bool)

(assert (=> b!206040 (=> (not res!172730) (not e!140908))))

(declare-fun lt!322237 () (_ BitVec 64))

(declare-fun lt!322234 () (_ BitVec 64))

(assert (=> b!206040 (= res!172730 (= lt!322237 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322234)))))

(assert (=> b!206040 (= lt!322237 (bitIndex!0 (size!4558 (buf!5063 (_2!9454 lt!322236))) (currentByte!9581 (_2!9454 lt!322236)) (currentBit!9576 (_2!9454 lt!322236))))))

(assert (=> b!206040 (= lt!322234 (bitIndex!0 (size!4558 (buf!5063 thiss!1204)) (currentByte!9581 thiss!1204) (currentBit!9576 thiss!1204)))))

(declare-fun b!206041 () Bool)

(assert (=> b!206041 (= e!140907 (not e!140915))))

(declare-fun res!172715 () Bool)

(assert (=> b!206041 (=> res!172715 e!140915)))

(assert (=> b!206041 (= res!172715 (not (= lt!322230 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322233))))))

(assert (=> b!206041 (= lt!322230 (bitIndex!0 (size!4558 (buf!5063 (_2!9454 lt!322236))) (currentByte!9581 (_2!9454 lt!322236)) (currentBit!9576 (_2!9454 lt!322236))))))

(assert (=> b!206041 (= lt!322233 (bitIndex!0 (size!4558 (buf!5063 thiss!1204)) (currentByte!9581 thiss!1204) (currentBit!9576 thiss!1204)))))

(assert (=> b!206041 e!140916))

(declare-fun res!172725 () Bool)

(assert (=> b!206041 (=> (not res!172725) (not e!140916))))

(assert (=> b!206041 (= res!172725 (= (size!4558 (buf!5063 thiss!1204)) (size!4558 (buf!5063 (_2!9454 lt!322236)))))))

(declare-fun appendBit!0 (BitStream!8224 Bool) tuple2!17598)

(assert (=> b!206041 (= lt!322236 (appendBit!0 thiss!1204 lt!322238))))

(assert (=> b!206041 (= lt!322238 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206042 () Bool)

(declare-fun e!140914 () Bool)

(declare-fun array_inv!4299 (array!10373) Bool)

(assert (=> b!206042 (= e!140914 (array_inv!4299 (buf!5063 thiss!1204)))))

(declare-fun b!206043 () Bool)

(declare-fun res!172726 () Bool)

(assert (=> b!206043 (=> res!172726 e!140912)))

(assert (=> b!206043 (= res!172726 (not (isPrefixOf!0 thiss!1204 (_2!9454 lt!322236))))))

(declare-fun b!206044 () Bool)

(declare-fun res!172729 () Bool)

(assert (=> b!206044 (=> res!172729 e!140912)))

(assert (=> b!206044 (= res!172729 (not (isPrefixOf!0 (_2!9454 lt!322236) (_2!9454 lt!322243))))))

(declare-fun b!206045 () Bool)

(declare-fun res!172721 () Bool)

(assert (=> b!206045 (=> res!172721 e!140912)))

(assert (=> b!206045 (= res!172721 (not (invariant!0 (currentBit!9576 (_2!9454 lt!322243)) (currentByte!9581 (_2!9454 lt!322243)) (size!4558 (buf!5063 (_2!9454 lt!322243))))))))

(declare-fun b!206046 () Bool)

(declare-fun e!140910 () Bool)

(declare-fun lt!322244 () tuple2!17596)

(assert (=> b!206046 (= e!140910 (= (bitIndex!0 (size!4558 (buf!5063 (_1!9453 lt!322244))) (currentByte!9581 (_1!9453 lt!322244)) (currentBit!9576 (_1!9453 lt!322244))) lt!322237))))

(declare-fun b!206047 () Bool)

(declare-fun res!172727 () Bool)

(assert (=> b!206047 (=> (not res!172727) (not e!140908))))

(assert (=> b!206047 (= res!172727 (isPrefixOf!0 thiss!1204 (_2!9454 lt!322236)))))

(declare-fun b!206048 () Bool)

(assert (=> b!206048 (= e!140908 e!140910)))

(declare-fun res!172720 () Bool)

(assert (=> b!206048 (=> (not res!172720) (not e!140910))))

(assert (=> b!206048 (= res!172720 (and (= (_2!9453 lt!322244) lt!322238) (= (_1!9453 lt!322244) (_2!9454 lt!322236))))))

(declare-fun readerFrom!0 (BitStream!8224 (_ BitVec 32) (_ BitVec 32)) BitStream!8224)

(assert (=> b!206048 (= lt!322244 (readBitPure!0 (readerFrom!0 (_2!9454 lt!322236) (currentBit!9576 thiss!1204) (currentByte!9581 thiss!1204))))))

(declare-fun b!206049 () Bool)

(assert (=> b!206049 (= e!140909 (invariant!0 (currentBit!9576 thiss!1204) (currentByte!9581 thiss!1204) (size!4558 (buf!5063 (_2!9454 lt!322243)))))))

(declare-fun res!172728 () Bool)

(assert (=> start!43590 (=> (not res!172728) (not e!140907))))

(assert (=> start!43590 (= res!172728 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43590 e!140907))

(assert (=> start!43590 true))

(declare-fun inv!12 (BitStream!8224) Bool)

(assert (=> start!43590 (and (inv!12 thiss!1204) e!140914)))

(declare-fun b!206038 () Bool)

(assert (=> b!206038 (= e!140911 (= (_2!9453 lt!322229) (_2!9453 lt!322239)))))

(assert (= (and start!43590 res!172728) b!206036))

(assert (= (and b!206036 res!172719) b!206039))

(assert (= (and b!206039 res!172716) b!206034))

(assert (= (and b!206034 res!172723) b!206041))

(assert (= (and b!206041 res!172725) b!206040))

(assert (= (and b!206040 res!172730) b!206047))

(assert (= (and b!206047 res!172727) b!206048))

(assert (= (and b!206048 res!172720) b!206046))

(assert (= (and b!206041 (not res!172715)) b!206037))

(assert (= (and b!206037 (not res!172724)) b!206045))

(assert (= (and b!206045 (not res!172721)) b!206035))

(assert (= (and b!206035 (not res!172722)) b!206044))

(assert (= (and b!206044 (not res!172729)) b!206043))

(assert (= (and b!206043 (not res!172726)) b!206033))

(assert (= (and b!206033 res!172718) b!206049))

(assert (= (and b!206033 res!172717) b!206038))

(assert (= start!43590 b!206042))

(declare-fun m!317571 () Bool)

(assert (=> b!206040 m!317571))

(declare-fun m!317573 () Bool)

(assert (=> b!206040 m!317573))

(declare-fun m!317575 () Bool)

(assert (=> b!206043 m!317575))

(declare-fun m!317577 () Bool)

(assert (=> b!206033 m!317577))

(declare-fun m!317579 () Bool)

(assert (=> b!206033 m!317579))

(declare-fun m!317581 () Bool)

(assert (=> b!206033 m!317581))

(declare-fun m!317583 () Bool)

(assert (=> b!206033 m!317583))

(declare-fun m!317585 () Bool)

(assert (=> b!206033 m!317585))

(declare-fun m!317587 () Bool)

(assert (=> b!206033 m!317587))

(declare-fun m!317589 () Bool)

(assert (=> b!206033 m!317589))

(declare-fun m!317591 () Bool)

(assert (=> b!206033 m!317591))

(declare-fun m!317593 () Bool)

(assert (=> b!206033 m!317593))

(declare-fun m!317595 () Bool)

(assert (=> b!206045 m!317595))

(declare-fun m!317597 () Bool)

(assert (=> start!43590 m!317597))

(declare-fun m!317599 () Bool)

(assert (=> b!206037 m!317599))

(declare-fun m!317601 () Bool)

(assert (=> b!206037 m!317601))

(declare-fun m!317603 () Bool)

(assert (=> b!206037 m!317603))

(declare-fun m!317605 () Bool)

(assert (=> b!206037 m!317605))

(declare-fun m!317607 () Bool)

(assert (=> b!206049 m!317607))

(declare-fun m!317609 () Bool)

(assert (=> b!206046 m!317609))

(declare-fun m!317611 () Bool)

(assert (=> b!206036 m!317611))

(declare-fun m!317613 () Bool)

(assert (=> b!206048 m!317613))

(assert (=> b!206048 m!317613))

(declare-fun m!317615 () Bool)

(assert (=> b!206048 m!317615))

(declare-fun m!317617 () Bool)

(assert (=> b!206042 m!317617))

(assert (=> b!206047 m!317575))

(assert (=> b!206041 m!317571))

(assert (=> b!206041 m!317573))

(declare-fun m!317619 () Bool)

(assert (=> b!206041 m!317619))

(declare-fun m!317621 () Bool)

(assert (=> b!206039 m!317621))

(declare-fun m!317623 () Bool)

(assert (=> b!206044 m!317623))

(push 1)

(assert (not b!206042))

(assert (not b!206039))

(assert (not b!206040))

(assert (not b!206041))

(assert (not b!206045))

(assert (not b!206037))

(assert (not b!206048))

(assert (not b!206044))

(assert (not start!43590))

(assert (not b!206033))

(assert (not b!206047))

(assert (not b!206036))

(assert (not b!206049))

(assert (not b!206043))

(assert (not b!206046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

