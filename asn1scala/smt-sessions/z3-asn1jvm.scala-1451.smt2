; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39742 () Bool)

(assert start!39742)

(declare-fun b!180314 () Bool)

(declare-fun res!149716 () Bool)

(declare-fun e!125326 () Bool)

(assert (=> b!180314 (=> (not res!149716) (not e!125326))))

(declare-datatypes ((array!9676 0))(
  ( (array!9677 (arr!5198 (Array (_ BitVec 32) (_ BitVec 8))) (size!4268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7644 0))(
  ( (BitStream!7645 (buf!4711 array!9676) (currentByte!8921 (_ BitVec 32)) (currentBit!8916 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7644)

(declare-datatypes ((Unit!12955 0))(
  ( (Unit!12956) )
))
(declare-datatypes ((tuple2!15554 0))(
  ( (tuple2!15555 (_1!8422 Unit!12955) (_2!8422 BitStream!7644)) )
))
(declare-fun lt!276433 () tuple2!15554)

(declare-fun isPrefixOf!0 (BitStream!7644 BitStream!7644) Bool)

(assert (=> b!180314 (= res!149716 (isPrefixOf!0 thiss!1204 (_2!8422 lt!276433)))))

(declare-fun b!180315 () Bool)

(declare-fun e!125317 () Bool)

(declare-datatypes ((tuple2!15556 0))(
  ( (tuple2!15557 (_1!8423 BitStream!7644) (_2!8423 Bool)) )
))
(declare-fun lt!276426 () tuple2!15556)

(declare-fun lt!276436 () tuple2!15556)

(assert (=> b!180315 (= e!125317 (= (_2!8423 lt!276426) (_2!8423 lt!276436)))))

(declare-fun b!180316 () Bool)

(declare-fun e!125316 () Bool)

(declare-fun e!125319 () Bool)

(assert (=> b!180316 (= e!125316 e!125319)))

(declare-fun res!149715 () Bool)

(assert (=> b!180316 (=> (not res!149715) (not e!125319))))

(declare-fun lt!276435 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180316 (= res!149715 (validate_offset_bits!1 ((_ sign_extend 32) (size!4268 (buf!4711 thiss!1204))) ((_ sign_extend 32) (currentByte!8921 thiss!1204)) ((_ sign_extend 32) (currentBit!8916 thiss!1204)) lt!276435))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!180316 (= lt!276435 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180317 () Bool)

(declare-fun res!149711 () Bool)

(declare-fun e!125320 () Bool)

(assert (=> b!180317 (=> res!149711 e!125320)))

(assert (=> b!180317 (= res!149711 (not (isPrefixOf!0 thiss!1204 (_2!8422 lt!276433))))))

(declare-fun b!180318 () Bool)

(declare-fun res!149718 () Bool)

(assert (=> b!180318 (=> res!149718 e!125320)))

(declare-fun lt!276429 () (_ BitVec 64))

(declare-fun lt!276430 () (_ BitVec 64))

(declare-fun lt!276434 () tuple2!15554)

(assert (=> b!180318 (= res!149718 (or (not (= (size!4268 (buf!4711 (_2!8422 lt!276434))) (size!4268 (buf!4711 thiss!1204)))) (not (= lt!276429 (bvsub (bvadd lt!276430 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180320 () Bool)

(assert (=> b!180320 (= e!125320 true)))

(assert (=> b!180320 (validate_offset_bits!1 ((_ sign_extend 32) (size!4268 (buf!4711 (_2!8422 lt!276434)))) ((_ sign_extend 32) (currentByte!8921 thiss!1204)) ((_ sign_extend 32) (currentBit!8916 thiss!1204)) lt!276435)))

(declare-fun lt!276431 () Unit!12955)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7644 array!9676 (_ BitVec 64)) Unit!12955)

(assert (=> b!180320 (= lt!276431 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4711 (_2!8422 lt!276434)) lt!276435))))

(declare-datatypes ((tuple2!15558 0))(
  ( (tuple2!15559 (_1!8424 BitStream!7644) (_2!8424 BitStream!7644)) )
))
(declare-fun lt!276443 () tuple2!15558)

(declare-fun lt!276442 () Bool)

(declare-fun readBitPure!0 (BitStream!7644) tuple2!15556)

(assert (=> b!180320 (= (_2!8423 (readBitPure!0 (_1!8424 lt!276443))) lt!276442)))

(declare-fun lt!276437 () tuple2!15558)

(declare-fun reader!0 (BitStream!7644 BitStream!7644) tuple2!15558)

(assert (=> b!180320 (= lt!276437 (reader!0 (_2!8422 lt!276433) (_2!8422 lt!276434)))))

(assert (=> b!180320 (= lt!276443 (reader!0 thiss!1204 (_2!8422 lt!276434)))))

(assert (=> b!180320 e!125317))

(declare-fun res!149719 () Bool)

(assert (=> b!180320 (=> (not res!149719) (not e!125317))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180320 (= res!149719 (= (bitIndex!0 (size!4268 (buf!4711 (_1!8423 lt!276426))) (currentByte!8921 (_1!8423 lt!276426)) (currentBit!8916 (_1!8423 lt!276426))) (bitIndex!0 (size!4268 (buf!4711 (_1!8423 lt!276436))) (currentByte!8921 (_1!8423 lt!276436)) (currentBit!8916 (_1!8423 lt!276436)))))))

(declare-fun lt!276428 () Unit!12955)

(declare-fun lt!276427 () BitStream!7644)

(declare-fun readBitPrefixLemma!0 (BitStream!7644 BitStream!7644) Unit!12955)

(assert (=> b!180320 (= lt!276428 (readBitPrefixLemma!0 lt!276427 (_2!8422 lt!276434)))))

(assert (=> b!180320 (= lt!276436 (readBitPure!0 (BitStream!7645 (buf!4711 (_2!8422 lt!276434)) (currentByte!8921 thiss!1204) (currentBit!8916 thiss!1204))))))

(assert (=> b!180320 (= lt!276426 (readBitPure!0 lt!276427))))

(declare-fun e!125324 () Bool)

(assert (=> b!180320 e!125324))

(declare-fun res!149707 () Bool)

(assert (=> b!180320 (=> (not res!149707) (not e!125324))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180320 (= res!149707 (invariant!0 (currentBit!8916 thiss!1204) (currentByte!8921 thiss!1204) (size!4268 (buf!4711 (_2!8422 lt!276433)))))))

(assert (=> b!180320 (= lt!276427 (BitStream!7645 (buf!4711 (_2!8422 lt!276433)) (currentByte!8921 thiss!1204) (currentBit!8916 thiss!1204)))))

(declare-fun b!180321 () Bool)

(declare-fun e!125318 () Bool)

(assert (=> b!180321 (= e!125319 (not e!125318))))

(declare-fun res!149720 () Bool)

(assert (=> b!180321 (=> res!149720 e!125318)))

(declare-fun lt!276439 () (_ BitVec 64))

(assert (=> b!180321 (= res!149720 (not (= lt!276439 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276430))))))

(assert (=> b!180321 (= lt!276439 (bitIndex!0 (size!4268 (buf!4711 (_2!8422 lt!276433))) (currentByte!8921 (_2!8422 lt!276433)) (currentBit!8916 (_2!8422 lt!276433))))))

(assert (=> b!180321 (= lt!276430 (bitIndex!0 (size!4268 (buf!4711 thiss!1204)) (currentByte!8921 thiss!1204) (currentBit!8916 thiss!1204)))))

(declare-fun e!125321 () Bool)

(assert (=> b!180321 e!125321))

(declare-fun res!149710 () Bool)

(assert (=> b!180321 (=> (not res!149710) (not e!125321))))

(assert (=> b!180321 (= res!149710 (= (size!4268 (buf!4711 thiss!1204)) (size!4268 (buf!4711 (_2!8422 lt!276433)))))))

(declare-fun appendBit!0 (BitStream!7644 Bool) tuple2!15554)

(assert (=> b!180321 (= lt!276433 (appendBit!0 thiss!1204 lt!276442))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!180321 (= lt!276442 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180322 () Bool)

(assert (=> b!180322 (= e!125324 (invariant!0 (currentBit!8916 thiss!1204) (currentByte!8921 thiss!1204) (size!4268 (buf!4711 (_2!8422 lt!276434)))))))

(declare-fun b!180323 () Bool)

(declare-fun res!149709 () Bool)

(assert (=> b!180323 (=> res!149709 e!125320)))

(assert (=> b!180323 (= res!149709 (not (invariant!0 (currentBit!8916 (_2!8422 lt!276434)) (currentByte!8921 (_2!8422 lt!276434)) (size!4268 (buf!4711 (_2!8422 lt!276434))))))))

(declare-fun b!180324 () Bool)

(assert (=> b!180324 (= e!125321 e!125326)))

(declare-fun res!149721 () Bool)

(assert (=> b!180324 (=> (not res!149721) (not e!125326))))

(declare-fun lt!276440 () (_ BitVec 64))

(declare-fun lt!276438 () (_ BitVec 64))

(assert (=> b!180324 (= res!149721 (= lt!276440 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276438)))))

(assert (=> b!180324 (= lt!276440 (bitIndex!0 (size!4268 (buf!4711 (_2!8422 lt!276433))) (currentByte!8921 (_2!8422 lt!276433)) (currentBit!8916 (_2!8422 lt!276433))))))

(assert (=> b!180324 (= lt!276438 (bitIndex!0 (size!4268 (buf!4711 thiss!1204)) (currentByte!8921 thiss!1204) (currentBit!8916 thiss!1204)))))

(declare-fun b!180325 () Bool)

(declare-fun e!125323 () Bool)

(declare-fun array_inv!4009 (array!9676) Bool)

(assert (=> b!180325 (= e!125323 (array_inv!4009 (buf!4711 thiss!1204)))))

(declare-fun b!180326 () Bool)

(declare-fun res!149714 () Bool)

(assert (=> b!180326 (=> (not res!149714) (not e!125319))))

(assert (=> b!180326 (= res!149714 (invariant!0 (currentBit!8916 thiss!1204) (currentByte!8921 thiss!1204) (size!4268 (buf!4711 thiss!1204))))))

(declare-fun b!180327 () Bool)

(declare-fun e!125322 () Bool)

(declare-fun lt!276432 () tuple2!15556)

(assert (=> b!180327 (= e!125322 (= (bitIndex!0 (size!4268 (buf!4711 (_1!8423 lt!276432))) (currentByte!8921 (_1!8423 lt!276432)) (currentBit!8916 (_1!8423 lt!276432))) lt!276440))))

(declare-fun b!180328 () Bool)

(declare-fun res!149708 () Bool)

(assert (=> b!180328 (=> res!149708 e!125320)))

(assert (=> b!180328 (= res!149708 (not (isPrefixOf!0 (_2!8422 lt!276433) (_2!8422 lt!276434))))))

(declare-fun b!180319 () Bool)

(assert (=> b!180319 (= e!125318 e!125320)))

(declare-fun res!149706 () Bool)

(assert (=> b!180319 (=> res!149706 e!125320)))

(assert (=> b!180319 (= res!149706 (not (= lt!276429 (bvsub (bvsub (bvadd lt!276439 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180319 (= lt!276429 (bitIndex!0 (size!4268 (buf!4711 (_2!8422 lt!276434))) (currentByte!8921 (_2!8422 lt!276434)) (currentBit!8916 (_2!8422 lt!276434))))))

(assert (=> b!180319 (isPrefixOf!0 thiss!1204 (_2!8422 lt!276434))))

(declare-fun lt!276441 () Unit!12955)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7644 BitStream!7644 BitStream!7644) Unit!12955)

(assert (=> b!180319 (= lt!276441 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8422 lt!276433) (_2!8422 lt!276434)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15554)

(assert (=> b!180319 (= lt!276434 (appendBitsLSBFirstLoopTR!0 (_2!8422 lt!276433) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!149713 () Bool)

(assert (=> start!39742 (=> (not res!149713) (not e!125316))))

(assert (=> start!39742 (= res!149713 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39742 e!125316))

(assert (=> start!39742 true))

(declare-fun inv!12 (BitStream!7644) Bool)

(assert (=> start!39742 (and (inv!12 thiss!1204) e!125323)))

(declare-fun b!180329 () Bool)

(declare-fun res!149712 () Bool)

(assert (=> b!180329 (=> (not res!149712) (not e!125319))))

(assert (=> b!180329 (= res!149712 (not (= i!590 nBits!348)))))

(declare-fun b!180330 () Bool)

(assert (=> b!180330 (= e!125326 e!125322)))

(declare-fun res!149717 () Bool)

(assert (=> b!180330 (=> (not res!149717) (not e!125322))))

(assert (=> b!180330 (= res!149717 (and (= (_2!8423 lt!276432) lt!276442) (= (_1!8423 lt!276432) (_2!8422 lt!276433))))))

(declare-fun readerFrom!0 (BitStream!7644 (_ BitVec 32) (_ BitVec 32)) BitStream!7644)

(assert (=> b!180330 (= lt!276432 (readBitPure!0 (readerFrom!0 (_2!8422 lt!276433) (currentBit!8916 thiss!1204) (currentByte!8921 thiss!1204))))))

(assert (= (and start!39742 res!149713) b!180316))

(assert (= (and b!180316 res!149715) b!180326))

(assert (= (and b!180326 res!149714) b!180329))

(assert (= (and b!180329 res!149712) b!180321))

(assert (= (and b!180321 res!149710) b!180324))

(assert (= (and b!180324 res!149721) b!180314))

(assert (= (and b!180314 res!149716) b!180330))

(assert (= (and b!180330 res!149717) b!180327))

(assert (= (and b!180321 (not res!149720)) b!180319))

(assert (= (and b!180319 (not res!149706)) b!180323))

(assert (= (and b!180323 (not res!149709)) b!180318))

(assert (= (and b!180318 (not res!149718)) b!180328))

(assert (= (and b!180328 (not res!149708)) b!180317))

(assert (= (and b!180317 (not res!149711)) b!180320))

(assert (= (and b!180320 res!149707) b!180322))

(assert (= (and b!180320 res!149719) b!180315))

(assert (= start!39742 b!180325))

(declare-fun m!280709 () Bool)

(assert (=> b!180316 m!280709))

(declare-fun m!280711 () Bool)

(assert (=> start!39742 m!280711))

(declare-fun m!280713 () Bool)

(assert (=> b!180320 m!280713))

(declare-fun m!280715 () Bool)

(assert (=> b!180320 m!280715))

(declare-fun m!280717 () Bool)

(assert (=> b!180320 m!280717))

(declare-fun m!280719 () Bool)

(assert (=> b!180320 m!280719))

(declare-fun m!280721 () Bool)

(assert (=> b!180320 m!280721))

(declare-fun m!280723 () Bool)

(assert (=> b!180320 m!280723))

(declare-fun m!280725 () Bool)

(assert (=> b!180320 m!280725))

(declare-fun m!280727 () Bool)

(assert (=> b!180320 m!280727))

(declare-fun m!280729 () Bool)

(assert (=> b!180320 m!280729))

(declare-fun m!280731 () Bool)

(assert (=> b!180320 m!280731))

(declare-fun m!280733 () Bool)

(assert (=> b!180320 m!280733))

(declare-fun m!280735 () Bool)

(assert (=> b!180319 m!280735))

(declare-fun m!280737 () Bool)

(assert (=> b!180319 m!280737))

(declare-fun m!280739 () Bool)

(assert (=> b!180319 m!280739))

(declare-fun m!280741 () Bool)

(assert (=> b!180319 m!280741))

(declare-fun m!280743 () Bool)

(assert (=> b!180330 m!280743))

(assert (=> b!180330 m!280743))

(declare-fun m!280745 () Bool)

(assert (=> b!180330 m!280745))

(declare-fun m!280747 () Bool)

(assert (=> b!180321 m!280747))

(declare-fun m!280749 () Bool)

(assert (=> b!180321 m!280749))

(declare-fun m!280751 () Bool)

(assert (=> b!180321 m!280751))

(declare-fun m!280753 () Bool)

(assert (=> b!180317 m!280753))

(assert (=> b!180324 m!280747))

(assert (=> b!180324 m!280749))

(declare-fun m!280755 () Bool)

(assert (=> b!180322 m!280755))

(declare-fun m!280757 () Bool)

(assert (=> b!180326 m!280757))

(declare-fun m!280759 () Bool)

(assert (=> b!180328 m!280759))

(declare-fun m!280761 () Bool)

(assert (=> b!180325 m!280761))

(declare-fun m!280763 () Bool)

(assert (=> b!180323 m!280763))

(declare-fun m!280765 () Bool)

(assert (=> b!180327 m!280765))

(assert (=> b!180314 m!280753))

(check-sat (not start!39742) (not b!180322) (not b!180325) (not b!180326) (not b!180324) (not b!180314) (not b!180319) (not b!180317) (not b!180328) (not b!180330) (not b!180323) (not b!180327) (not b!180316) (not b!180320) (not b!180321))
