; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42608 () Bool)

(assert start!42608)

(declare-fun res!168260 () Bool)

(declare-fun e!137839 () Bool)

(assert (=> start!42608 (=> (not res!168260) (not e!137839))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42608 (= res!168260 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42608 e!137839))

(assert (=> start!42608 true))

(declare-datatypes ((array!10190 0))(
  ( (array!10191 (arr!5416 (Array (_ BitVec 32) (_ BitVec 8))) (size!4486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8080 0))(
  ( (BitStream!8081 (buf!4987 array!10190) (currentByte!9385 (_ BitVec 32)) (currentBit!9380 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8080)

(declare-fun e!137837 () Bool)

(declare-fun inv!12 (BitStream!8080) Bool)

(assert (=> start!42608 (and (inv!12 thiss!1204) e!137837)))

(declare-fun b!200964 () Bool)

(declare-fun array_inv!4227 (array!10190) Bool)

(assert (=> b!200964 (= e!137837 (array_inv!4227 (buf!4987 thiss!1204)))))

(declare-fun b!200965 () Bool)

(declare-fun e!137838 () Bool)

(assert (=> b!200965 (= e!137838 (not true))))

(declare-datatypes ((tuple2!17198 0))(
  ( (tuple2!17199 (_1!9250 BitStream!8080) (_2!9250 BitStream!8080)) )
))
(declare-fun lt!313901 () tuple2!17198)

(declare-fun reader!0 (BitStream!8080 BitStream!8080) tuple2!17198)

(assert (=> b!200965 (= lt!313901 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8080 BitStream!8080) Bool)

(assert (=> b!200965 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14274 0))(
  ( (Unit!14275) )
))
(declare-fun lt!313902 () Unit!14274)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8080) Unit!14274)

(assert (=> b!200965 (= lt!313902 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200966 () Bool)

(assert (=> b!200966 (= e!137839 e!137838)))

(declare-fun res!168262 () Bool)

(assert (=> b!200966 (=> (not res!168262) (not e!137838))))

(declare-fun lt!313903 () (_ BitVec 64))

(assert (=> b!200966 (= res!168262 (= lt!313903 (bvsub (bvadd lt!313903 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200966 (= lt!313903 (bitIndex!0 (size!4486 (buf!4987 thiss!1204)) (currentByte!9385 thiss!1204) (currentBit!9380 thiss!1204)))))

(declare-fun b!200967 () Bool)

(declare-fun res!168264 () Bool)

(assert (=> b!200967 (=> (not res!168264) (not e!137839))))

(assert (=> b!200967 (= res!168264 (= i!590 nBits!348))))

(declare-fun b!200968 () Bool)

(declare-fun res!168263 () Bool)

(assert (=> b!200968 (=> (not res!168263) (not e!137839))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200968 (= res!168263 (invariant!0 (currentBit!9380 thiss!1204) (currentByte!9385 thiss!1204) (size!4486 (buf!4987 thiss!1204))))))

(declare-fun b!200969 () Bool)

(declare-fun res!168261 () Bool)

(assert (=> b!200969 (=> (not res!168261) (not e!137839))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200969 (= res!168261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4486 (buf!4987 thiss!1204))) ((_ sign_extend 32) (currentByte!9385 thiss!1204)) ((_ sign_extend 32) (currentBit!9380 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42608 res!168260) b!200969))

(assert (= (and b!200969 res!168261) b!200968))

(assert (= (and b!200968 res!168263) b!200967))

(assert (= (and b!200967 res!168264) b!200966))

(assert (= (and b!200966 res!168262) b!200965))

(assert (= start!42608 b!200964))

(declare-fun m!311623 () Bool)

(assert (=> b!200966 m!311623))

(declare-fun m!311625 () Bool)

(assert (=> start!42608 m!311625))

(declare-fun m!311627 () Bool)

(assert (=> b!200964 m!311627))

(declare-fun m!311629 () Bool)

(assert (=> b!200969 m!311629))

(declare-fun m!311631 () Bool)

(assert (=> b!200965 m!311631))

(declare-fun m!311633 () Bool)

(assert (=> b!200965 m!311633))

(declare-fun m!311635 () Bool)

(assert (=> b!200965 m!311635))

(declare-fun m!311637 () Bool)

(assert (=> b!200968 m!311637))

(push 1)

(assert (not b!200968))

(assert (not start!42608))

(assert (not b!200966))

(assert (not b!200965))

(assert (not b!200964))

(assert (not b!200969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

