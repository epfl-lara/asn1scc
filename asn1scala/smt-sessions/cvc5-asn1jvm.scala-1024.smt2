; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29320 () Bool)

(assert start!29320)

(declare-fun b!151963 () Bool)

(declare-fun res!127425 () Bool)

(declare-fun e!101573 () Bool)

(assert (=> b!151963 (=> (not res!127425) (not e!101573))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151963 (= res!127425 (bvsge from!447 to!404))))

(declare-fun b!151964 () Bool)

(declare-fun e!101574 () Bool)

(declare-datatypes ((array!6779 0))(
  ( (array!6780 (arr!3884 (Array (_ BitVec 32) (_ BitVec 8))) (size!3067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5392 0))(
  ( (BitStream!5393 (buf!3564 array!6779) (currentByte!6496 (_ BitVec 32)) (currentBit!6491 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5392)

(declare-fun array_inv!2856 (array!6779) Bool)

(assert (=> b!151964 (= e!101574 (array_inv!2856 (buf!3564 thiss!1634)))))

(declare-fun res!127426 () Bool)

(assert (=> start!29320 (=> (not res!127426) (not e!101573))))

(declare-fun arr!237 () array!6779)

(assert (=> start!29320 (= res!127426 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3067 arr!237))))))

(assert (=> start!29320 e!101573))

(assert (=> start!29320 true))

(assert (=> start!29320 (array_inv!2856 arr!237)))

(declare-fun inv!12 (BitStream!5392) Bool)

(assert (=> start!29320 (and (inv!12 thiss!1634) e!101574)))

(declare-fun b!151965 () Bool)

(declare-fun e!101577 () Bool)

(declare-fun lt!237985 () (_ BitVec 64))

(assert (=> b!151965 (= e!101577 (bvsge lt!237985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!13528 0))(
  ( (tuple2!13529 (_1!7139 BitStream!5392) (_2!7139 BitStream!5392)) )
))
(declare-fun lt!237984 () tuple2!13528)

(declare-fun reader!0 (BitStream!5392 BitStream!5392) tuple2!13528)

(assert (=> b!151965 (= lt!237984 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!151966 () Bool)

(assert (=> b!151966 (= e!101573 (not e!101577))))

(declare-fun res!127428 () Bool)

(assert (=> b!151966 (=> res!127428 e!101577)))

(declare-fun lt!237983 () (_ BitVec 64))

(assert (=> b!151966 (= res!127428 (not (= lt!237983 (bvadd lt!237983 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!237985)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151966 (= lt!237983 (bitIndex!0 (size!3067 (buf!3564 thiss!1634)) (currentByte!6496 thiss!1634) (currentBit!6491 thiss!1634)))))

(assert (=> b!151966 (= lt!237985 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5392 BitStream!5392) Bool)

(assert (=> b!151966 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9646 0))(
  ( (Unit!9647) )
))
(declare-fun lt!237982 () Unit!9646)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5392) Unit!9646)

(assert (=> b!151966 (= lt!237982 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151967 () Bool)

(declare-fun res!127427 () Bool)

(assert (=> b!151967 (=> (not res!127427) (not e!101573))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151967 (= res!127427 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3067 (buf!3564 thiss!1634))) ((_ sign_extend 32) (currentByte!6496 thiss!1634)) ((_ sign_extend 32) (currentBit!6491 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29320 res!127426) b!151967))

(assert (= (and b!151967 res!127427) b!151963))

(assert (= (and b!151963 res!127425) b!151966))

(assert (= (and b!151966 (not res!127428)) b!151965))

(assert (= start!29320 b!151964))

(declare-fun m!237679 () Bool)

(assert (=> b!151964 m!237679))

(declare-fun m!237681 () Bool)

(assert (=> b!151965 m!237681))

(declare-fun m!237683 () Bool)

(assert (=> b!151966 m!237683))

(declare-fun m!237685 () Bool)

(assert (=> b!151966 m!237685))

(declare-fun m!237687 () Bool)

(assert (=> b!151966 m!237687))

(declare-fun m!237689 () Bool)

(assert (=> start!29320 m!237689))

(declare-fun m!237691 () Bool)

(assert (=> start!29320 m!237691))

(declare-fun m!237693 () Bool)

(assert (=> b!151967 m!237693))

(push 1)

(assert (not b!151967))

(assert (not b!151964))

(assert (not start!29320))

(assert (not b!151966))

(assert (not b!151965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

