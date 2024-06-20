; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39738 () Bool)

(assert start!39738)

(declare-fun b!180212 () Bool)

(declare-fun e!125257 () Bool)

(declare-fun e!125254 () Bool)

(assert (=> b!180212 (= e!125257 (not e!125254))))

(declare-fun res!149621 () Bool)

(assert (=> b!180212 (=> res!149621 e!125254)))

(declare-fun lt!276333 () (_ BitVec 64))

(declare-fun lt!276320 () (_ BitVec 64))

(assert (=> b!180212 (= res!149621 (not (= lt!276333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276320))))))

(declare-datatypes ((array!9672 0))(
  ( (array!9673 (arr!5196 (Array (_ BitVec 32) (_ BitVec 8))) (size!4266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7640 0))(
  ( (BitStream!7641 (buf!4709 array!9672) (currentByte!8919 (_ BitVec 32)) (currentBit!8914 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12951 0))(
  ( (Unit!12952) )
))
(declare-datatypes ((tuple2!15542 0))(
  ( (tuple2!15543 (_1!8416 Unit!12951) (_2!8416 BitStream!7640)) )
))
(declare-fun lt!276334 () tuple2!15542)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180212 (= lt!276333 (bitIndex!0 (size!4266 (buf!4709 (_2!8416 lt!276334))) (currentByte!8919 (_2!8416 lt!276334)) (currentBit!8914 (_2!8416 lt!276334))))))

(declare-fun thiss!1204 () BitStream!7640)

(assert (=> b!180212 (= lt!276320 (bitIndex!0 (size!4266 (buf!4709 thiss!1204)) (currentByte!8919 thiss!1204) (currentBit!8914 thiss!1204)))))

(declare-fun e!125252 () Bool)

(assert (=> b!180212 e!125252))

(declare-fun res!149612 () Bool)

(assert (=> b!180212 (=> (not res!149612) (not e!125252))))

(assert (=> b!180212 (= res!149612 (= (size!4266 (buf!4709 thiss!1204)) (size!4266 (buf!4709 (_2!8416 lt!276334)))))))

(declare-fun lt!276335 () Bool)

(declare-fun appendBit!0 (BitStream!7640 Bool) tuple2!15542)

(assert (=> b!180212 (= lt!276334 (appendBit!0 thiss!1204 lt!276335))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!180212 (= lt!276335 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180213 () Bool)

(declare-fun res!149624 () Bool)

(assert (=> b!180213 (=> (not res!149624) (not e!125257))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180213 (= res!149624 (validate_offset_bits!1 ((_ sign_extend 32) (size!4266 (buf!4709 thiss!1204))) ((_ sign_extend 32) (currentByte!8919 thiss!1204)) ((_ sign_extend 32) (currentBit!8914 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!180214 () Bool)

(declare-fun res!149618 () Bool)

(declare-fun e!125259 () Bool)

(assert (=> b!180214 (=> res!149618 e!125259)))

(declare-fun lt!276325 () tuple2!15542)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180214 (= res!149618 (not (invariant!0 (currentBit!8914 (_2!8416 lt!276325)) (currentByte!8919 (_2!8416 lt!276325)) (size!4266 (buf!4709 (_2!8416 lt!276325))))))))

(declare-fun res!149616 () Bool)

(assert (=> start!39738 (=> (not res!149616) (not e!125257))))

(assert (=> start!39738 (= res!149616 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39738 e!125257))

(assert (=> start!39738 true))

(declare-fun e!125253 () Bool)

(declare-fun inv!12 (BitStream!7640) Bool)

(assert (=> start!39738 (and (inv!12 thiss!1204) e!125253)))

(declare-fun b!180215 () Bool)

(declare-fun res!149622 () Bool)

(assert (=> b!180215 (=> (not res!149622) (not e!125257))))

(assert (=> b!180215 (= res!149622 (invariant!0 (currentBit!8914 thiss!1204) (currentByte!8919 thiss!1204) (size!4266 (buf!4709 thiss!1204))))))

(declare-fun b!180216 () Bool)

(declare-fun res!149619 () Bool)

(assert (=> b!180216 (=> res!149619 e!125259)))

(declare-fun isPrefixOf!0 (BitStream!7640 BitStream!7640) Bool)

(assert (=> b!180216 (= res!149619 (not (isPrefixOf!0 thiss!1204 (_2!8416 lt!276334))))))

(declare-fun b!180217 () Bool)

(assert (=> b!180217 (= e!125259 true)))

(declare-datatypes ((tuple2!15544 0))(
  ( (tuple2!15545 (_1!8417 BitStream!7640) (_2!8417 BitStream!7640)) )
))
(declare-fun lt!276330 () tuple2!15544)

(declare-datatypes ((tuple2!15546 0))(
  ( (tuple2!15547 (_1!8418 BitStream!7640) (_2!8418 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7640) tuple2!15546)

(assert (=> b!180217 (= (_2!8418 (readBitPure!0 (_1!8417 lt!276330))) lt!276335)))

(declare-fun lt!276324 () tuple2!15544)

(declare-fun reader!0 (BitStream!7640 BitStream!7640) tuple2!15544)

(assert (=> b!180217 (= lt!276324 (reader!0 (_2!8416 lt!276334) (_2!8416 lt!276325)))))

(assert (=> b!180217 (= lt!276330 (reader!0 thiss!1204 (_2!8416 lt!276325)))))

(declare-fun e!125258 () Bool)

(assert (=> b!180217 e!125258))

(declare-fun res!149613 () Bool)

(assert (=> b!180217 (=> (not res!149613) (not e!125258))))

(declare-fun lt!276327 () tuple2!15546)

(declare-fun lt!276321 () tuple2!15546)

(assert (=> b!180217 (= res!149613 (= (bitIndex!0 (size!4266 (buf!4709 (_1!8418 lt!276327))) (currentByte!8919 (_1!8418 lt!276327)) (currentBit!8914 (_1!8418 lt!276327))) (bitIndex!0 (size!4266 (buf!4709 (_1!8418 lt!276321))) (currentByte!8919 (_1!8418 lt!276321)) (currentBit!8914 (_1!8418 lt!276321)))))))

(declare-fun lt!276331 () Unit!12951)

(declare-fun lt!276329 () BitStream!7640)

(declare-fun readBitPrefixLemma!0 (BitStream!7640 BitStream!7640) Unit!12951)

(assert (=> b!180217 (= lt!276331 (readBitPrefixLemma!0 lt!276329 (_2!8416 lt!276325)))))

(assert (=> b!180217 (= lt!276321 (readBitPure!0 (BitStream!7641 (buf!4709 (_2!8416 lt!276325)) (currentByte!8919 thiss!1204) (currentBit!8914 thiss!1204))))))

(assert (=> b!180217 (= lt!276327 (readBitPure!0 lt!276329))))

(declare-fun e!125251 () Bool)

(assert (=> b!180217 e!125251))

(declare-fun res!149620 () Bool)

(assert (=> b!180217 (=> (not res!149620) (not e!125251))))

(assert (=> b!180217 (= res!149620 (invariant!0 (currentBit!8914 thiss!1204) (currentByte!8919 thiss!1204) (size!4266 (buf!4709 (_2!8416 lt!276334)))))))

(assert (=> b!180217 (= lt!276329 (BitStream!7641 (buf!4709 (_2!8416 lt!276334)) (currentByte!8919 thiss!1204) (currentBit!8914 thiss!1204)))))

(declare-fun b!180218 () Bool)

(assert (=> b!180218 (= e!125254 e!125259)))

(declare-fun res!149615 () Bool)

(assert (=> b!180218 (=> res!149615 e!125259)))

(declare-fun lt!276332 () (_ BitVec 64))

(assert (=> b!180218 (= res!149615 (not (= lt!276332 (bvsub (bvsub (bvadd lt!276333 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180218 (= lt!276332 (bitIndex!0 (size!4266 (buf!4709 (_2!8416 lt!276325))) (currentByte!8919 (_2!8416 lt!276325)) (currentBit!8914 (_2!8416 lt!276325))))))

(assert (=> b!180218 (isPrefixOf!0 thiss!1204 (_2!8416 lt!276325))))

(declare-fun lt!276323 () Unit!12951)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7640 BitStream!7640 BitStream!7640) Unit!12951)

(assert (=> b!180218 (= lt!276323 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8416 lt!276334) (_2!8416 lt!276325)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15542)

(assert (=> b!180218 (= lt!276325 (appendBitsLSBFirstLoopTR!0 (_2!8416 lt!276334) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180219 () Bool)

(assert (=> b!180219 (= e!125251 (invariant!0 (currentBit!8914 thiss!1204) (currentByte!8919 thiss!1204) (size!4266 (buf!4709 (_2!8416 lt!276325)))))))

(declare-fun b!180220 () Bool)

(declare-fun res!149611 () Bool)

(declare-fun e!125256 () Bool)

(assert (=> b!180220 (=> (not res!149611) (not e!125256))))

(assert (=> b!180220 (= res!149611 (isPrefixOf!0 thiss!1204 (_2!8416 lt!276334)))))

(declare-fun b!180221 () Bool)

(declare-fun array_inv!4007 (array!9672) Bool)

(assert (=> b!180221 (= e!125253 (array_inv!4007 (buf!4709 thiss!1204)))))

(declare-fun b!180222 () Bool)

(assert (=> b!180222 (= e!125258 (= (_2!8418 lt!276327) (_2!8418 lt!276321)))))

(declare-fun b!180223 () Bool)

(declare-fun res!149623 () Bool)

(assert (=> b!180223 (=> res!149623 e!125259)))

(assert (=> b!180223 (= res!149623 (or (not (= (size!4266 (buf!4709 (_2!8416 lt!276325))) (size!4266 (buf!4709 thiss!1204)))) (not (= lt!276332 (bvsub (bvadd lt!276320 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180224 () Bool)

(assert (=> b!180224 (= e!125252 e!125256)))

(declare-fun res!149610 () Bool)

(assert (=> b!180224 (=> (not res!149610) (not e!125256))))

(declare-fun lt!276328 () (_ BitVec 64))

(declare-fun lt!276326 () (_ BitVec 64))

(assert (=> b!180224 (= res!149610 (= lt!276328 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276326)))))

(assert (=> b!180224 (= lt!276328 (bitIndex!0 (size!4266 (buf!4709 (_2!8416 lt!276334))) (currentByte!8919 (_2!8416 lt!276334)) (currentBit!8914 (_2!8416 lt!276334))))))

(assert (=> b!180224 (= lt!276326 (bitIndex!0 (size!4266 (buf!4709 thiss!1204)) (currentByte!8919 thiss!1204) (currentBit!8914 thiss!1204)))))

(declare-fun b!180225 () Bool)

(declare-fun e!125260 () Bool)

(declare-fun lt!276322 () tuple2!15546)

(assert (=> b!180225 (= e!125260 (= (bitIndex!0 (size!4266 (buf!4709 (_1!8418 lt!276322))) (currentByte!8919 (_1!8418 lt!276322)) (currentBit!8914 (_1!8418 lt!276322))) lt!276328))))

(declare-fun b!180226 () Bool)

(declare-fun res!149625 () Bool)

(assert (=> b!180226 (=> res!149625 e!125259)))

(assert (=> b!180226 (= res!149625 (not (isPrefixOf!0 (_2!8416 lt!276334) (_2!8416 lt!276325))))))

(declare-fun b!180227 () Bool)

(declare-fun res!149614 () Bool)

(assert (=> b!180227 (=> (not res!149614) (not e!125257))))

(assert (=> b!180227 (= res!149614 (not (= i!590 nBits!348)))))

(declare-fun b!180228 () Bool)

(assert (=> b!180228 (= e!125256 e!125260)))

(declare-fun res!149617 () Bool)

(assert (=> b!180228 (=> (not res!149617) (not e!125260))))

(assert (=> b!180228 (= res!149617 (and (= (_2!8418 lt!276322) lt!276335) (= (_1!8418 lt!276322) (_2!8416 lt!276334))))))

(declare-fun readerFrom!0 (BitStream!7640 (_ BitVec 32) (_ BitVec 32)) BitStream!7640)

(assert (=> b!180228 (= lt!276322 (readBitPure!0 (readerFrom!0 (_2!8416 lt!276334) (currentBit!8914 thiss!1204) (currentByte!8919 thiss!1204))))))

(assert (= (and start!39738 res!149616) b!180213))

(assert (= (and b!180213 res!149624) b!180215))

(assert (= (and b!180215 res!149622) b!180227))

(assert (= (and b!180227 res!149614) b!180212))

(assert (= (and b!180212 res!149612) b!180224))

(assert (= (and b!180224 res!149610) b!180220))

(assert (= (and b!180220 res!149611) b!180228))

(assert (= (and b!180228 res!149617) b!180225))

(assert (= (and b!180212 (not res!149621)) b!180218))

(assert (= (and b!180218 (not res!149615)) b!180214))

(assert (= (and b!180214 (not res!149618)) b!180223))

(assert (= (and b!180223 (not res!149623)) b!180226))

(assert (= (and b!180226 (not res!149625)) b!180216))

(assert (= (and b!180216 (not res!149619)) b!180217))

(assert (= (and b!180217 res!149620) b!180219))

(assert (= (and b!180217 res!149613) b!180222))

(assert (= start!39738 b!180221))

(declare-fun m!280597 () Bool)

(assert (=> b!180225 m!280597))

(declare-fun m!280599 () Bool)

(assert (=> b!180221 m!280599))

(declare-fun m!280601 () Bool)

(assert (=> b!180224 m!280601))

(declare-fun m!280603 () Bool)

(assert (=> b!180224 m!280603))

(declare-fun m!280605 () Bool)

(assert (=> b!180214 m!280605))

(declare-fun m!280607 () Bool)

(assert (=> b!180226 m!280607))

(declare-fun m!280609 () Bool)

(assert (=> b!180228 m!280609))

(assert (=> b!180228 m!280609))

(declare-fun m!280611 () Bool)

(assert (=> b!180228 m!280611))

(declare-fun m!280613 () Bool)

(assert (=> b!180216 m!280613))

(declare-fun m!280615 () Bool)

(assert (=> b!180218 m!280615))

(declare-fun m!280617 () Bool)

(assert (=> b!180218 m!280617))

(declare-fun m!280619 () Bool)

(assert (=> b!180218 m!280619))

(declare-fun m!280621 () Bool)

(assert (=> b!180218 m!280621))

(assert (=> b!180212 m!280601))

(assert (=> b!180212 m!280603))

(declare-fun m!280623 () Bool)

(assert (=> b!180212 m!280623))

(declare-fun m!280625 () Bool)

(assert (=> b!180213 m!280625))

(declare-fun m!280627 () Bool)

(assert (=> b!180217 m!280627))

(declare-fun m!280629 () Bool)

(assert (=> b!180217 m!280629))

(declare-fun m!280631 () Bool)

(assert (=> b!180217 m!280631))

(declare-fun m!280633 () Bool)

(assert (=> b!180217 m!280633))

(declare-fun m!280635 () Bool)

(assert (=> b!180217 m!280635))

(declare-fun m!280637 () Bool)

(assert (=> b!180217 m!280637))

(declare-fun m!280639 () Bool)

(assert (=> b!180217 m!280639))

(declare-fun m!280641 () Bool)

(assert (=> b!180217 m!280641))

(declare-fun m!280643 () Bool)

(assert (=> b!180217 m!280643))

(declare-fun m!280645 () Bool)

(assert (=> start!39738 m!280645))

(assert (=> b!180220 m!280613))

(declare-fun m!280647 () Bool)

(assert (=> b!180219 m!280647))

(declare-fun m!280649 () Bool)

(assert (=> b!180215 m!280649))

(push 1)

(assert (not b!180214))

(assert (not b!180217))

(assert (not b!180213))

(assert (not b!180220))

(assert (not b!180224))

(assert (not b!180215))

(assert (not b!180216))

(assert (not b!180212))

(assert (not b!180228))

(assert (not b!180221))

(assert (not b!180225))

(assert (not b!180226))

(assert (not b!180219))

(assert (not start!39738))

(assert (not b!180218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

