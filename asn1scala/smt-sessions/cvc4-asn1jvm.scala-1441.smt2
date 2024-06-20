; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39600 () Bool)

(assert start!39600)

(declare-fun b!178462 () Bool)

(declare-fun res!148011 () Bool)

(declare-fun e!124265 () Bool)

(assert (=> b!178462 (=> res!148011 e!124265)))

(declare-datatypes ((array!9615 0))(
  ( (array!9616 (arr!5169 (Array (_ BitVec 32) (_ BitVec 8))) (size!4239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7586 0))(
  ( (BitStream!7587 (buf!4682 array!9615) (currentByte!8880 (_ BitVec 32)) (currentBit!8875 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7586)

(declare-datatypes ((Unit!12858 0))(
  ( (Unit!12859) )
))
(declare-datatypes ((tuple2!15388 0))(
  ( (tuple2!15389 (_1!8339 Unit!12858) (_2!8339 BitStream!7586)) )
))
(declare-fun lt!274150 () tuple2!15388)

(declare-fun isPrefixOf!0 (BitStream!7586 BitStream!7586) Bool)

(assert (=> b!178462 (= res!148011 (not (isPrefixOf!0 thiss!1204 (_2!8339 lt!274150))))))

(declare-fun res!148001 () Bool)

(declare-fun e!124268 () Bool)

(assert (=> start!39600 (=> (not res!148001) (not e!124268))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39600 (= res!148001 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39600 e!124268))

(assert (=> start!39600 true))

(declare-fun e!124272 () Bool)

(declare-fun inv!12 (BitStream!7586) Bool)

(assert (=> start!39600 (and (inv!12 thiss!1204) e!124272)))

(declare-fun b!178463 () Bool)

(declare-fun res!148010 () Bool)

(assert (=> b!178463 (=> (not res!148010) (not e!124268))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178463 (= res!148010 (validate_offset_bits!1 ((_ sign_extend 32) (size!4239 (buf!4682 thiss!1204))) ((_ sign_extend 32) (currentByte!8880 thiss!1204)) ((_ sign_extend 32) (currentBit!8875 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178464 () Bool)

(declare-fun e!124273 () Bool)

(assert (=> b!178464 (= e!124273 e!124265)))

(declare-fun res!148007 () Bool)

(assert (=> b!178464 (=> res!148007 e!124265)))

(declare-fun lt!274148 () (_ BitVec 64))

(declare-fun lt!274144 () (_ BitVec 64))

(assert (=> b!178464 (= res!148007 (not (= lt!274144 (bvsub (bvsub (bvadd lt!274148 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!274146 () tuple2!15388)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178464 (= lt!274144 (bitIndex!0 (size!4239 (buf!4682 (_2!8339 lt!274146))) (currentByte!8880 (_2!8339 lt!274146)) (currentBit!8875 (_2!8339 lt!274146))))))

(assert (=> b!178464 (isPrefixOf!0 thiss!1204 (_2!8339 lt!274146))))

(declare-fun lt!274145 () Unit!12858)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7586 BitStream!7586 BitStream!7586) Unit!12858)

(assert (=> b!178464 (= lt!274145 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8339 lt!274150) (_2!8339 lt!274146)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15388)

(assert (=> b!178464 (= lt!274146 (appendBitsLSBFirstLoopTR!0 (_2!8339 lt!274150) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178465 () Bool)

(declare-fun e!124266 () Bool)

(assert (=> b!178465 (= e!124266 true)))

(declare-datatypes ((tuple2!15390 0))(
  ( (tuple2!15391 (_1!8340 BitStream!7586) (_2!8340 Bool)) )
))
(declare-fun lt!274143 () tuple2!15390)

(declare-fun readBitPure!0 (BitStream!7586) tuple2!15390)

(assert (=> b!178465 (= lt!274143 (readBitPure!0 (BitStream!7587 (buf!4682 (_2!8339 lt!274146)) (currentByte!8880 thiss!1204) (currentBit!8875 thiss!1204))))))

(declare-fun lt!274153 () tuple2!15390)

(assert (=> b!178465 (= lt!274153 (readBitPure!0 (BitStream!7587 (buf!4682 (_2!8339 lt!274150)) (currentByte!8880 thiss!1204) (currentBit!8875 thiss!1204))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178465 (invariant!0 (currentBit!8875 thiss!1204) (currentByte!8880 thiss!1204) (size!4239 (buf!4682 (_2!8339 lt!274146))))))

(declare-fun b!178466 () Bool)

(declare-fun res!148016 () Bool)

(assert (=> b!178466 (=> (not res!148016) (not e!124268))))

(assert (=> b!178466 (= res!148016 (not (= i!590 nBits!348)))))

(declare-fun b!178467 () Bool)

(declare-fun res!148003 () Bool)

(assert (=> b!178467 (=> (not res!148003) (not e!124268))))

(assert (=> b!178467 (= res!148003 (invariant!0 (currentBit!8875 thiss!1204) (currentByte!8880 thiss!1204) (size!4239 (buf!4682 thiss!1204))))))

(declare-fun b!178468 () Bool)

(declare-fun e!124271 () Bool)

(declare-fun e!124269 () Bool)

(assert (=> b!178468 (= e!124271 e!124269)))

(declare-fun res!148002 () Bool)

(assert (=> b!178468 (=> (not res!148002) (not e!124269))))

(declare-fun lt!274151 () Bool)

(declare-fun lt!274154 () tuple2!15390)

(assert (=> b!178468 (= res!148002 (and (= (_2!8340 lt!274154) lt!274151) (= (_1!8340 lt!274154) (_2!8339 lt!274150))))))

(declare-fun readerFrom!0 (BitStream!7586 (_ BitVec 32) (_ BitVec 32)) BitStream!7586)

(assert (=> b!178468 (= lt!274154 (readBitPure!0 (readerFrom!0 (_2!8339 lt!274150) (currentBit!8875 thiss!1204) (currentByte!8880 thiss!1204))))))

(declare-fun b!178469 () Bool)

(declare-fun res!148004 () Bool)

(assert (=> b!178469 (=> res!148004 e!124265)))

(assert (=> b!178469 (= res!148004 (not (isPrefixOf!0 (_2!8339 lt!274150) (_2!8339 lt!274146))))))

(declare-fun b!178470 () Bool)

(assert (=> b!178470 (= e!124265 e!124266)))

(declare-fun res!148012 () Bool)

(assert (=> b!178470 (=> res!148012 e!124266)))

(assert (=> b!178470 (= res!148012 (not (= (size!4239 (buf!4682 (_2!8339 lt!274150))) (size!4239 (buf!4682 (_2!8339 lt!274146))))))))

(assert (=> b!178470 (invariant!0 (currentBit!8875 thiss!1204) (currentByte!8880 thiss!1204) (size!4239 (buf!4682 (_2!8339 lt!274150))))))

(declare-fun b!178471 () Bool)

(declare-fun res!148015 () Bool)

(assert (=> b!178471 (=> res!148015 e!124266)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178471 (= res!148015 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4239 (buf!4682 (_2!8339 lt!274150)))) ((_ sign_extend 32) (currentByte!8880 thiss!1204)) ((_ sign_extend 32) (currentBit!8875 thiss!1204)))))))

(declare-fun b!178472 () Bool)

(assert (=> b!178472 (= e!124268 (not e!124273))))

(declare-fun res!148013 () Bool)

(assert (=> b!178472 (=> res!148013 e!124273)))

(declare-fun lt!274152 () (_ BitVec 64))

(assert (=> b!178472 (= res!148013 (not (= lt!274148 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274152))))))

(assert (=> b!178472 (= lt!274148 (bitIndex!0 (size!4239 (buf!4682 (_2!8339 lt!274150))) (currentByte!8880 (_2!8339 lt!274150)) (currentBit!8875 (_2!8339 lt!274150))))))

(assert (=> b!178472 (= lt!274152 (bitIndex!0 (size!4239 (buf!4682 thiss!1204)) (currentByte!8880 thiss!1204) (currentBit!8875 thiss!1204)))))

(declare-fun e!124270 () Bool)

(assert (=> b!178472 e!124270))

(declare-fun res!148009 () Bool)

(assert (=> b!178472 (=> (not res!148009) (not e!124270))))

(assert (=> b!178472 (= res!148009 (= (size!4239 (buf!4682 thiss!1204)) (size!4239 (buf!4682 (_2!8339 lt!274150)))))))

(declare-fun appendBit!0 (BitStream!7586 Bool) tuple2!15388)

(assert (=> b!178472 (= lt!274150 (appendBit!0 thiss!1204 lt!274151))))

(assert (=> b!178472 (= lt!274151 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178473 () Bool)

(declare-fun lt!274147 () (_ BitVec 64))

(assert (=> b!178473 (= e!124269 (= (bitIndex!0 (size!4239 (buf!4682 (_1!8340 lt!274154))) (currentByte!8880 (_1!8340 lt!274154)) (currentBit!8875 (_1!8340 lt!274154))) lt!274147))))

(declare-fun b!178474 () Bool)

(declare-fun res!148014 () Bool)

(assert (=> b!178474 (=> (not res!148014) (not e!124271))))

(assert (=> b!178474 (= res!148014 (isPrefixOf!0 thiss!1204 (_2!8339 lt!274150)))))

(declare-fun b!178475 () Bool)

(declare-fun res!148006 () Bool)

(assert (=> b!178475 (=> res!148006 e!124265)))

(assert (=> b!178475 (= res!148006 (not (invariant!0 (currentBit!8875 (_2!8339 lt!274146)) (currentByte!8880 (_2!8339 lt!274146)) (size!4239 (buf!4682 (_2!8339 lt!274146))))))))

(declare-fun b!178476 () Bool)

(declare-fun array_inv!3980 (array!9615) Bool)

(assert (=> b!178476 (= e!124272 (array_inv!3980 (buf!4682 thiss!1204)))))

(declare-fun b!178477 () Bool)

(declare-fun res!148005 () Bool)

(assert (=> b!178477 (=> res!148005 e!124265)))

(assert (=> b!178477 (= res!148005 (or (not (= (size!4239 (buf!4682 (_2!8339 lt!274146))) (size!4239 (buf!4682 thiss!1204)))) (not (= lt!274144 (bvsub (bvadd lt!274152 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178478 () Bool)

(assert (=> b!178478 (= e!124270 e!124271)))

(declare-fun res!148008 () Bool)

(assert (=> b!178478 (=> (not res!148008) (not e!124271))))

(declare-fun lt!274149 () (_ BitVec 64))

(assert (=> b!178478 (= res!148008 (= lt!274147 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274149)))))

(assert (=> b!178478 (= lt!274147 (bitIndex!0 (size!4239 (buf!4682 (_2!8339 lt!274150))) (currentByte!8880 (_2!8339 lt!274150)) (currentBit!8875 (_2!8339 lt!274150))))))

(assert (=> b!178478 (= lt!274149 (bitIndex!0 (size!4239 (buf!4682 thiss!1204)) (currentByte!8880 thiss!1204) (currentBit!8875 thiss!1204)))))

(declare-fun b!178479 () Bool)

(declare-fun res!148017 () Bool)

(assert (=> b!178479 (=> res!148017 e!124266)))

(declare-fun arrayBitRangesEq!0 (array!9615 array!9615 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178479 (= res!148017 (not (arrayBitRangesEq!0 (buf!4682 (_2!8339 lt!274150)) (buf!4682 (_2!8339 lt!274146)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4239 (buf!4682 (_2!8339 lt!274150))) (currentByte!8880 thiss!1204) (currentBit!8875 thiss!1204))))))))

(assert (= (and start!39600 res!148001) b!178463))

(assert (= (and b!178463 res!148010) b!178467))

(assert (= (and b!178467 res!148003) b!178466))

(assert (= (and b!178466 res!148016) b!178472))

(assert (= (and b!178472 res!148009) b!178478))

(assert (= (and b!178478 res!148008) b!178474))

(assert (= (and b!178474 res!148014) b!178468))

(assert (= (and b!178468 res!148002) b!178473))

(assert (= (and b!178472 (not res!148013)) b!178464))

(assert (= (and b!178464 (not res!148007)) b!178475))

(assert (= (and b!178475 (not res!148006)) b!178477))

(assert (= (and b!178477 (not res!148005)) b!178469))

(assert (= (and b!178469 (not res!148004)) b!178462))

(assert (= (and b!178462 (not res!148011)) b!178470))

(assert (= (and b!178470 (not res!148012)) b!178471))

(assert (= (and b!178471 (not res!148015)) b!178479))

(assert (= (and b!178479 (not res!148017)) b!178465))

(assert (= start!39600 b!178476))

(declare-fun m!278587 () Bool)

(assert (=> b!178475 m!278587))

(declare-fun m!278589 () Bool)

(assert (=> b!178464 m!278589))

(declare-fun m!278591 () Bool)

(assert (=> b!178464 m!278591))

(declare-fun m!278593 () Bool)

(assert (=> b!178464 m!278593))

(declare-fun m!278595 () Bool)

(assert (=> b!178464 m!278595))

(declare-fun m!278597 () Bool)

(assert (=> b!178469 m!278597))

(declare-fun m!278599 () Bool)

(assert (=> b!178468 m!278599))

(assert (=> b!178468 m!278599))

(declare-fun m!278601 () Bool)

(assert (=> b!178468 m!278601))

(declare-fun m!278603 () Bool)

(assert (=> b!178478 m!278603))

(declare-fun m!278605 () Bool)

(assert (=> b!178478 m!278605))

(declare-fun m!278607 () Bool)

(assert (=> b!178470 m!278607))

(declare-fun m!278609 () Bool)

(assert (=> b!178462 m!278609))

(declare-fun m!278611 () Bool)

(assert (=> b!178467 m!278611))

(declare-fun m!278613 () Bool)

(assert (=> b!178463 m!278613))

(declare-fun m!278615 () Bool)

(assert (=> b!178473 m!278615))

(declare-fun m!278617 () Bool)

(assert (=> b!178479 m!278617))

(declare-fun m!278619 () Bool)

(assert (=> b!178479 m!278619))

(declare-fun m!278621 () Bool)

(assert (=> b!178471 m!278621))

(assert (=> b!178474 m!278609))

(declare-fun m!278623 () Bool)

(assert (=> start!39600 m!278623))

(assert (=> b!178472 m!278603))

(assert (=> b!178472 m!278605))

(declare-fun m!278625 () Bool)

(assert (=> b!178472 m!278625))

(declare-fun m!278627 () Bool)

(assert (=> b!178465 m!278627))

(declare-fun m!278629 () Bool)

(assert (=> b!178465 m!278629))

(declare-fun m!278631 () Bool)

(assert (=> b!178465 m!278631))

(declare-fun m!278633 () Bool)

(assert (=> b!178476 m!278633))

(push 1)

