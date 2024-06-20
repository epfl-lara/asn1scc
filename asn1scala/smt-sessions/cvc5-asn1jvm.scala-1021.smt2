; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29302 () Bool)

(assert start!29302)

(declare-fun b!151835 () Bool)

(declare-fun res!127324 () Bool)

(declare-fun e!101448 () Bool)

(assert (=> b!151835 (=> (not res!127324) (not e!101448))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6761 0))(
  ( (array!6762 (arr!3875 (Array (_ BitVec 32) (_ BitVec 8))) (size!3058 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5374 0))(
  ( (BitStream!5375 (buf!3555 array!6761) (currentByte!6487 (_ BitVec 32)) (currentBit!6482 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5374)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151835 (= res!127324 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3058 (buf!3555 thiss!1634))) ((_ sign_extend 32) (currentByte!6487 thiss!1634)) ((_ sign_extend 32) (currentBit!6482 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151838 () Bool)

(declare-fun e!101446 () Bool)

(declare-fun array_inv!2847 (array!6761) Bool)

(assert (=> b!151838 (= e!101446 (array_inv!2847 (buf!3555 thiss!1634)))))

(declare-fun b!151836 () Bool)

(declare-fun res!127325 () Bool)

(assert (=> b!151836 (=> (not res!127325) (not e!101448))))

(assert (=> b!151836 (= res!127325 (bvsge from!447 to!404))))

(declare-fun lt!237895 () (_ BitVec 64))

(declare-fun lt!237892 () (_ BitVec 64))

(declare-fun lt!237894 () (_ BitVec 64))

(declare-fun b!151837 () Bool)

(assert (=> b!151837 (= e!101448 (not (or (not (= lt!237894 (bvand lt!237895 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!237894 (bvand (bvadd lt!237892 lt!237895) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!151837 (= lt!237894 (bvand lt!237892 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!151837 (= lt!237895 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151837 (= lt!237892 (bitIndex!0 (size!3058 (buf!3555 thiss!1634)) (currentByte!6487 thiss!1634) (currentBit!6482 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5374 BitStream!5374) Bool)

(assert (=> b!151837 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9628 0))(
  ( (Unit!9629) )
))
(declare-fun lt!237893 () Unit!9628)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5374) Unit!9628)

(assert (=> b!151837 (= lt!237893 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!127326 () Bool)

(assert (=> start!29302 (=> (not res!127326) (not e!101448))))

(declare-fun arr!237 () array!6761)

(assert (=> start!29302 (= res!127326 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3058 arr!237))))))

(assert (=> start!29302 e!101448))

(assert (=> start!29302 true))

(assert (=> start!29302 (array_inv!2847 arr!237)))

(declare-fun inv!12 (BitStream!5374) Bool)

(assert (=> start!29302 (and (inv!12 thiss!1634) e!101446)))

(assert (= (and start!29302 res!127326) b!151835))

(assert (= (and b!151835 res!127324) b!151836))

(assert (= (and b!151836 res!127325) b!151837))

(assert (= start!29302 b!151838))

(declare-fun m!237541 () Bool)

(assert (=> b!151835 m!237541))

(declare-fun m!237543 () Bool)

(assert (=> b!151838 m!237543))

(declare-fun m!237545 () Bool)

(assert (=> b!151837 m!237545))

(declare-fun m!237547 () Bool)

(assert (=> b!151837 m!237547))

(declare-fun m!237549 () Bool)

(assert (=> b!151837 m!237549))

(declare-fun m!237551 () Bool)

(assert (=> start!29302 m!237551))

(declare-fun m!237553 () Bool)

(assert (=> start!29302 m!237553))

(push 1)

(assert (not b!151838))

(assert (not b!151837))

(assert (not start!29302))

(assert (not b!151835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

