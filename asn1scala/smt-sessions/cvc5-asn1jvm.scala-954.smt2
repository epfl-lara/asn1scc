; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26996 () Bool)

(assert start!26996)

(declare-fun b!139013 () Bool)

(declare-fun res!115888 () Bool)

(declare-fun e!92532 () Bool)

(assert (=> b!139013 (=> (not res!115888) (not e!92532))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6312 0))(
  ( (array!6313 (arr!3552 (Array (_ BitVec 32) (_ BitVec 8))) (size!2857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4978 0))(
  ( (BitStream!4979 (buf!3270 array!6312) (currentByte!6094 (_ BitVec 32)) (currentBit!6089 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4978)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139013 (= res!115888 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2857 (buf!3270 thiss!1634))) ((_ sign_extend 32) (currentByte!6094 thiss!1634)) ((_ sign_extend 32) (currentBit!6089 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139014 () Bool)

(declare-fun res!115887 () Bool)

(assert (=> b!139014 (=> (not res!115887) (not e!92532))))

(assert (=> b!139014 (= res!115887 (bvsge from!447 to!404))))

(declare-fun b!139015 () Bool)

(declare-fun e!92529 () Bool)

(declare-fun array_inv!2646 (array!6312) Bool)

(assert (=> b!139015 (= e!92529 (array_inv!2646 (buf!3270 thiss!1634)))))

(declare-fun res!115890 () Bool)

(assert (=> start!26996 (=> (not res!115890) (not e!92532))))

(declare-fun arr!237 () array!6312)

(assert (=> start!26996 (= res!115890 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2857 arr!237))))))

(assert (=> start!26996 e!92532))

(assert (=> start!26996 true))

(assert (=> start!26996 (array_inv!2646 arr!237)))

(declare-fun inv!12 (BitStream!4978) Bool)

(assert (=> start!26996 (and (inv!12 thiss!1634) e!92529)))

(declare-fun b!139016 () Bool)

(declare-fun e!92528 () Bool)

(assert (=> b!139016 (= e!92532 (not e!92528))))

(declare-fun res!115889 () Bool)

(assert (=> b!139016 (=> res!115889 e!92528)))

(declare-fun lt!216763 () (_ BitVec 64))

(assert (=> b!139016 (= res!115889 (not (= lt!216763 (bvadd lt!216763 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139016 (= lt!216763 (bitIndex!0 (size!2857 (buf!3270 thiss!1634)) (currentByte!6094 thiss!1634) (currentBit!6089 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4978 BitStream!4978) Bool)

(assert (=> b!139016 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8670 0))(
  ( (Unit!8671) )
))
(declare-fun lt!216765 () Unit!8670)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4978) Unit!8670)

(assert (=> b!139016 (= lt!216765 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139017 () Bool)

(assert (=> b!139017 (= e!92528 true)))

(declare-datatypes ((tuple2!12164 0))(
  ( (tuple2!12165 (_1!6408 BitStream!4978) (_2!6408 BitStream!4978)) )
))
(declare-fun lt!216764 () tuple2!12164)

(declare-fun reader!0 (BitStream!4978 BitStream!4978) tuple2!12164)

(assert (=> b!139017 (= lt!216764 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!26996 res!115890) b!139013))

(assert (= (and b!139013 res!115888) b!139014))

(assert (= (and b!139014 res!115887) b!139016))

(assert (= (and b!139016 (not res!115889)) b!139017))

(assert (= start!26996 b!139015))

(declare-fun m!213937 () Bool)

(assert (=> start!26996 m!213937))

(declare-fun m!213939 () Bool)

(assert (=> start!26996 m!213939))

(declare-fun m!213941 () Bool)

(assert (=> b!139013 m!213941))

(declare-fun m!213943 () Bool)

(assert (=> b!139015 m!213943))

(declare-fun m!213945 () Bool)

(assert (=> b!139017 m!213945))

(declare-fun m!213947 () Bool)

(assert (=> b!139016 m!213947))

(declare-fun m!213949 () Bool)

(assert (=> b!139016 m!213949))

(declare-fun m!213951 () Bool)

(assert (=> b!139016 m!213951))

(push 1)

(assert (not b!139017))

(assert (not b!139016))

(assert (not b!139015))

(assert (not b!139013))

(assert (not start!26996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

