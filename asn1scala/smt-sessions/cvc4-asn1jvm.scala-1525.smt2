; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42612 () Bool)

(assert start!42612)

(declare-fun res!168294 () Bool)

(declare-fun e!137864 () Bool)

(assert (=> start!42612 (=> (not res!168294) (not e!137864))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42612 (= res!168294 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42612 e!137864))

(assert (=> start!42612 true))

(declare-datatypes ((array!10194 0))(
  ( (array!10195 (arr!5418 (Array (_ BitVec 32) (_ BitVec 8))) (size!4488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8084 0))(
  ( (BitStream!8085 (buf!4989 array!10194) (currentByte!9387 (_ BitVec 32)) (currentBit!9382 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8084)

(declare-fun e!137861 () Bool)

(declare-fun inv!12 (BitStream!8084) Bool)

(assert (=> start!42612 (and (inv!12 thiss!1204) e!137861)))

(declare-fun b!201000 () Bool)

(declare-fun e!137863 () Bool)

(assert (=> b!201000 (= e!137864 e!137863)))

(declare-fun res!168292 () Bool)

(assert (=> b!201000 (=> (not res!168292) (not e!137863))))

(declare-fun lt!313921 () (_ BitVec 64))

(assert (=> b!201000 (= res!168292 (= lt!313921 (bvsub (bvadd lt!313921 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201000 (= lt!313921 (bitIndex!0 (size!4488 (buf!4989 thiss!1204)) (currentByte!9387 thiss!1204) (currentBit!9382 thiss!1204)))))

(declare-fun b!201001 () Bool)

(declare-fun res!168293 () Bool)

(assert (=> b!201001 (=> (not res!168293) (not e!137864))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201001 (= res!168293 (invariant!0 (currentBit!9382 thiss!1204) (currentByte!9387 thiss!1204) (size!4488 (buf!4989 thiss!1204))))))

(declare-fun b!201002 () Bool)

(assert (=> b!201002 (= e!137863 (not true))))

(declare-datatypes ((tuple2!17202 0))(
  ( (tuple2!17203 (_1!9252 BitStream!8084) (_2!9252 BitStream!8084)) )
))
(declare-fun lt!313920 () tuple2!17202)

(declare-fun reader!0 (BitStream!8084 BitStream!8084) tuple2!17202)

(assert (=> b!201002 (= lt!313920 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8084 BitStream!8084) Bool)

(assert (=> b!201002 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14278 0))(
  ( (Unit!14279) )
))
(declare-fun lt!313919 () Unit!14278)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8084) Unit!14278)

(assert (=> b!201002 (= lt!313919 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201003 () Bool)

(declare-fun res!168291 () Bool)

(assert (=> b!201003 (=> (not res!168291) (not e!137864))))

(assert (=> b!201003 (= res!168291 (= i!590 nBits!348))))

(declare-fun b!201004 () Bool)

(declare-fun array_inv!4229 (array!10194) Bool)

(assert (=> b!201004 (= e!137861 (array_inv!4229 (buf!4989 thiss!1204)))))

(declare-fun b!201005 () Bool)

(declare-fun res!168290 () Bool)

(assert (=> b!201005 (=> (not res!168290) (not e!137864))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201005 (= res!168290 (validate_offset_bits!1 ((_ sign_extend 32) (size!4488 (buf!4989 thiss!1204))) ((_ sign_extend 32) (currentByte!9387 thiss!1204)) ((_ sign_extend 32) (currentBit!9382 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42612 res!168294) b!201005))

(assert (= (and b!201005 res!168290) b!201001))

(assert (= (and b!201001 res!168293) b!201003))

(assert (= (and b!201003 res!168291) b!201000))

(assert (= (and b!201000 res!168292) b!201002))

(assert (= start!42612 b!201004))

(declare-fun m!311655 () Bool)

(assert (=> b!201005 m!311655))

(declare-fun m!311657 () Bool)

(assert (=> b!201004 m!311657))

(declare-fun m!311659 () Bool)

(assert (=> b!201001 m!311659))

(declare-fun m!311661 () Bool)

(assert (=> b!201002 m!311661))

(declare-fun m!311663 () Bool)

(assert (=> b!201002 m!311663))

(declare-fun m!311665 () Bool)

(assert (=> b!201002 m!311665))

(declare-fun m!311667 () Bool)

(assert (=> start!42612 m!311667))

(declare-fun m!311669 () Bool)

(assert (=> b!201000 m!311669))

(push 1)

(assert (not b!201000))

