; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29300 () Bool)

(assert start!29300)

(declare-fun b!151823 () Bool)

(declare-fun res!127315 () Bool)

(declare-fun e!101433 () Bool)

(assert (=> b!151823 (=> (not res!127315) (not e!101433))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6759 0))(
  ( (array!6760 (arr!3874 (Array (_ BitVec 32) (_ BitVec 8))) (size!3057 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5372 0))(
  ( (BitStream!5373 (buf!3554 array!6759) (currentByte!6486 (_ BitVec 32)) (currentBit!6481 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5372)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151823 (= res!127315 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3057 (buf!3554 thiss!1634))) ((_ sign_extend 32) (currentByte!6486 thiss!1634)) ((_ sign_extend 32) (currentBit!6481 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151826 () Bool)

(declare-fun e!101434 () Bool)

(declare-fun array_inv!2846 (array!6759) Bool)

(assert (=> b!151826 (= e!101434 (array_inv!2846 (buf!3554 thiss!1634)))))

(declare-fun b!151824 () Bool)

(declare-fun res!127317 () Bool)

(assert (=> b!151824 (=> (not res!127317) (not e!101433))))

(assert (=> b!151824 (= res!127317 (bvsge from!447 to!404))))

(declare-fun b!151825 () Bool)

(declare-fun lt!237882 () (_ BitVec 64))

(assert (=> b!151825 (= e!101433 (not (or (= lt!237882 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!237882) lt!237882)))))))

(assert (=> b!151825 (= lt!237882 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!237881 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151825 (= lt!237881 (bitIndex!0 (size!3057 (buf!3554 thiss!1634)) (currentByte!6486 thiss!1634) (currentBit!6481 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5372 BitStream!5372) Bool)

(assert (=> b!151825 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9626 0))(
  ( (Unit!9627) )
))
(declare-fun lt!237883 () Unit!9626)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5372) Unit!9626)

(assert (=> b!151825 (= lt!237883 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!127316 () Bool)

(assert (=> start!29300 (=> (not res!127316) (not e!101433))))

(declare-fun arr!237 () array!6759)

(assert (=> start!29300 (= res!127316 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3057 arr!237))))))

(assert (=> start!29300 e!101433))

(assert (=> start!29300 true))

(assert (=> start!29300 (array_inv!2846 arr!237)))

(declare-fun inv!12 (BitStream!5372) Bool)

(assert (=> start!29300 (and (inv!12 thiss!1634) e!101434)))

(assert (= (and start!29300 res!127316) b!151823))

(assert (= (and b!151823 res!127315) b!151824))

(assert (= (and b!151824 res!127317) b!151825))

(assert (= start!29300 b!151826))

(declare-fun m!237527 () Bool)

(assert (=> b!151823 m!237527))

(declare-fun m!237529 () Bool)

(assert (=> b!151826 m!237529))

(declare-fun m!237531 () Bool)

(assert (=> b!151825 m!237531))

(declare-fun m!237533 () Bool)

(assert (=> b!151825 m!237533))

(declare-fun m!237535 () Bool)

(assert (=> b!151825 m!237535))

(declare-fun m!237537 () Bool)

(assert (=> start!29300 m!237537))

(declare-fun m!237539 () Bool)

(assert (=> start!29300 m!237539))

(push 1)

(assert (not b!151823))

(assert (not start!29300))

(assert (not b!151826))

(assert (not b!151825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

