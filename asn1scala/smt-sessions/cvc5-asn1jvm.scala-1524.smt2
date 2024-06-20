; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42602 () Bool)

(assert start!42602)

(declare-fun b!200910 () Bool)

(declare-fun res!168218 () Bool)

(declare-fun e!137798 () Bool)

(assert (=> b!200910 (=> (not res!168218) (not e!137798))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200910 (= res!168218 (= i!590 nBits!348))))

(declare-fun res!168215 () Bool)

(declare-fun e!137797 () Bool)

(assert (=> start!42602 (=> (not res!168215) (not e!137797))))

(assert (=> start!42602 (= res!168215 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42602 e!137797))

(assert (=> start!42602 true))

(declare-datatypes ((array!10184 0))(
  ( (array!10185 (arr!5413 (Array (_ BitVec 32) (_ BitVec 8))) (size!4483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8074 0))(
  ( (BitStream!8075 (buf!4984 array!10184) (currentByte!9382 (_ BitVec 32)) (currentBit!9377 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8074)

(declare-fun e!137794 () Bool)

(declare-fun inv!12 (BitStream!8074) Bool)

(assert (=> start!42602 (and (inv!12 thiss!1204) e!137794)))

(declare-fun b!200911 () Bool)

(declare-fun e!137795 () Bool)

(declare-fun lt!313870 () (_ BitVec 64))

(assert (=> b!200911 (= e!137795 (not (bvsge lt!313870 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17192 0))(
  ( (tuple2!17193 (_1!9247 BitStream!8074) (_2!9247 BitStream!8074)) )
))
(declare-fun lt!313867 () tuple2!17192)

(declare-fun reader!0 (BitStream!8074 BitStream!8074) tuple2!17192)

(assert (=> b!200911 (= lt!313867 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8074 BitStream!8074) Bool)

(assert (=> b!200911 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14268 0))(
  ( (Unit!14269) )
))
(declare-fun lt!313868 () Unit!14268)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8074) Unit!14268)

(assert (=> b!200911 (= lt!313868 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200912 () Bool)

(declare-fun array_inv!4224 (array!10184) Bool)

(assert (=> b!200912 (= e!137794 (array_inv!4224 (buf!4984 thiss!1204)))))

(declare-fun b!200913 () Bool)

(assert (=> b!200913 (= e!137798 e!137795)))

(declare-fun res!168219 () Bool)

(assert (=> b!200913 (=> (not res!168219) (not e!137795))))

(declare-fun lt!313869 () (_ BitVec 64))

(assert (=> b!200913 (= res!168219 (= lt!313869 (bvsub (bvadd lt!313869 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200913 (= lt!313869 (bitIndex!0 (size!4483 (buf!4984 thiss!1204)) (currentByte!9382 thiss!1204) (currentBit!9377 thiss!1204)))))

(declare-fun b!200914 () Bool)

(declare-fun res!168217 () Bool)

(assert (=> b!200914 (=> (not res!168217) (not e!137798))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200914 (= res!168217 (invariant!0 (currentBit!9377 thiss!1204) (currentByte!9382 thiss!1204) (size!4483 (buf!4984 thiss!1204))))))

(declare-fun b!200915 () Bool)

(assert (=> b!200915 (= e!137797 e!137798)))

(declare-fun res!168216 () Bool)

(assert (=> b!200915 (=> (not res!168216) (not e!137798))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200915 (= res!168216 (validate_offset_bits!1 ((_ sign_extend 32) (size!4483 (buf!4984 thiss!1204))) ((_ sign_extend 32) (currentByte!9382 thiss!1204)) ((_ sign_extend 32) (currentBit!9377 thiss!1204)) lt!313870))))

(assert (=> b!200915 (= lt!313870 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!42602 res!168215) b!200915))

(assert (= (and b!200915 res!168216) b!200914))

(assert (= (and b!200914 res!168217) b!200910))

(assert (= (and b!200910 res!168218) b!200913))

(assert (= (and b!200913 res!168219) b!200911))

(assert (= start!42602 b!200912))

(declare-fun m!311575 () Bool)

(assert (=> b!200911 m!311575))

(declare-fun m!311577 () Bool)

(assert (=> b!200911 m!311577))

(declare-fun m!311579 () Bool)

(assert (=> b!200911 m!311579))

(declare-fun m!311581 () Bool)

(assert (=> b!200912 m!311581))

(declare-fun m!311583 () Bool)

(assert (=> start!42602 m!311583))

(declare-fun m!311585 () Bool)

(assert (=> b!200915 m!311585))

(declare-fun m!311587 () Bool)

(assert (=> b!200913 m!311587))

(declare-fun m!311589 () Bool)

(assert (=> b!200914 m!311589))

(push 1)

(assert (not b!200914))

(assert (not start!42602))

(assert (not b!200915))

(assert (not b!200911))

(assert (not b!200912))

(assert (not b!200913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

